using DemoExamen.Insfrastructures.Commands.Base;
using DemoExamen.Insfrastructures.DatabaseFolder;
using DemoExamen.Insfrastructures.StaticStorage;
using DemoExamen.Models;
using DemoExamen.Views.Windows;
using DemoExamen.VMs.Base;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace DemoExamen.VMs
{
    internal class AuthorizationVM : BaseVM
    {
        private readonly PasswordBox passwordBox;
        private Window window;

        public string Login { get; set; }

        public BaseCommand Enter { get; set; }

        Dictionary<string, int> BlockList = new Dictionary<string, int>();


        public AuthorizationVM(PasswordBox passwordBox, Window window)
        {
            this.window = window;
            this.passwordBox = passwordBox;

            Database.Instance.Users
                                    .Where(s => s.LastAuthorization <= DateOnly.FromDateTime(DateTime.Now).AddMonths(-1))
                                    .ExecuteUpdate(s => s.SetProperty(
                                        p => p.IsLocked, true
                                        ));

            Enter = new BaseCommand( () =>
            {
                User? user =  Database.Instance.Users.FirstOrDefault(s => s.Login == Login && s.Password == passwordBox.Password);

                if (user == null)
                {

                    MessageBox.Show("\"Вы\r\nввели неверный логин или пароль. Пожалуйста проверьте ещё раз введенные\r\nданные\".");

                    if (BlockList.TryGetValue(Login!, out int count))
                    {
                        if (count >= 3)
                        {
                            Database.Instance.Users
                                                    .Where(s => s.Login == Login)
                                                    .ExecuteUpdate(s => s.SetProperty(
                                                        p => p.IsLocked, true
                                                        ));
                            MessageBox.Show("Вы заблокированы. Обратитесь к администратору");
                        }

                        BlockList[Login] = ++count;
                    }
                    else
                        BlockList.Add(Login, 1);

                    return;

                }
                if (user.IsLocked)
                {
                    MessageBox.Show("Вы заблокированы. Обратитесь к администратору");
                    return;
                }

                MessageBox.Show("\"Вы успешно авторизовались\".");

                UserStaticStorage.UserId = user.Id;

                Database.Instance.Users
                    .Where(s => s.Id == UserStaticStorage.UserId)
                    .ExecuteUpdate(s =>
                    s.SetProperty(u =>
                        u.LastAuthorization,
                        DateOnly.FromDateTime(DateTime.Now)
                        ));

                Window newWindow = new Window();
                if (user.LastAuthorization == null)
                    newWindow = new ResetPasswordView();
                else
                    newWindow = new MainWindow();

                newWindow.Show();

                this.window.Close();

            }, () => !string.IsNullOrWhiteSpace(Login) && !string.IsNullOrWhiteSpace(passwordBox.Password));

        }


    }
}
