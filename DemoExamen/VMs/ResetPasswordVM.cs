using DemoExamen.Insfrastructures.Commands.Base;
using DemoExamen.Insfrastructures.DatabaseFolder;
using DemoExamen.Insfrastructures.StaticStorage;
using System;
using System.Collections.Generic;
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
        private PasswordBox confirmPasssword;
        private PasswordBox newPassword;
        private PasswordBox currentPassword;

        public BaseCommand ChangePassword { get;set;}

        int counter = 0;

        public ResetPasswordVM(PasswordBox confirmPasssword, PasswordBox newPassword, PasswordBox currentPassword)
        {
            this.confirmPasssword = confirmPasssword;
            this.newPassword = newPassword;
            this.currentPassword = currentPassword;


            ChangePassword = new BaseCommand(() => {

                var userWithOldPassword = Database.Instance.Users.Find(UserStaticStorage.UserId);
                if (userWithOldPassword is null)
                    MessageBox.Show("Пользователь не найден!");

                if (userWithOldPassword!.Password != currentPassword.Password)
                    MessageBox.Show("Неверный пароль!");
                
                    

                userWithOldPassword!.Password = newPassword.Password;
                
                Database.Instance.Users.Update(userWithOldPassword);
                Database.Instance.SaveChanges();

                MessageBox.Show("Пароль успешно изменен");

            }, () => !IsNullOrEmpty(currentPassword.Password) && !IsNullOrEmpty(newPassword.Password) && newPassword.Password == confirmPasssword.Password);
        }


    }
}
