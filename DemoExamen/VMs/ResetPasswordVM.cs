using DemoExamen.Insfrastructures.Commands.Base;
using DemoExamen.Insfrastructures.DatabaseFolder;
using DemoExamen.Insfrastructures.StaticStorage;
using DemoExamen.Views.Windows;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using static System.String;

namespace DemoExamen.VMs
{
    internal class ResetPasswordVM
    {
        private Window window;

        private PasswordBox confirmPasssword;
        private PasswordBox newPassword;
        private PasswordBox currentPassword;

        public BaseCommand ChangePassword { get;set;}

        private bool passwordChanged = false;

        int counter = 0;

        public ResetPasswordVM(PasswordBox confirmPasssword, PasswordBox newPassword, PasswordBox currentPassword, Window window)
        {
            this.window = window;

            this.confirmPasssword = confirmPasssword;
            this.newPassword = newPassword;
            this.currentPassword = currentPassword;

            

            this.window.Closed += (o, e) =>
            {
                DateOnly? date = null;

                if (!passwordChanged)
                {
                    Database.Instance.Users.Where(s => s.Id == UserStaticStorage.UserId)
                        .ExecuteUpdate(u => u.SetProperty(s => s.LastAuthorization, date
                    ));
                    Application.Current.Shutdown();
                }
            };

            ChangePassword = new BaseCommand(() => {

                var userWithOldPassword = Database.Instance.Users.Find(UserStaticStorage.UserId);
                if (userWithOldPassword is null)
                    MessageBox.Show("Пользователь не найден!");

                if (userWithOldPassword!.Password != currentPassword.Password)
                    MessageBox.Show("Неверный пароль!");
                
                userWithOldPassword!.Password = newPassword.Password;
                
                Database.Instance.Users.Where(s => s.Id == UserStaticStorage.UserId)
                    .ExecuteUpdate(u => u.SetProperty(s => s.Password, currentPassword.Password));

                passwordChanged = true;

                MessageBox.Show("Пароль успешно изменен");

                Database.Instance.Users
                    .Where(s => s.Id == UserStaticStorage.UserId)
                    .ExecuteUpdate(s =>
                    s.SetProperty(u =>
                        u.LastAuthorization,
                        DateOnly.FromDateTime(DateTime.Now)
                        ));

                Window window = new MainWindow();
                window.Show();

                this.window.Close();

            }, () => !IsNullOrEmpty(currentPassword.Password) && !IsNullOrEmpty(newPassword.Password) && newPassword.Password == confirmPasssword.Password);
        }
    }
}
