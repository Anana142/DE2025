using DemoExamen.Insfrastructures.Commands.Base;
using DemoExamen.Insfrastructures.DatabaseFolder;
using DemoExamen.Models;
using DemoExamen.Tools;
using DemoExamen.Views.Pages;
using DemoExamen.VMs.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using static System.String;

namespace DemoExamen.VMs
{

    internal class EditUserVM : BaseVM
    {
        private User user = new User();
        private List<Role> roles;

        public User EditUser { get => user;
            set { 
                user = value; 
                Signal(); 
            } 
        }

        public List<Role> Roles { get => roles; 
            set { 
                roles = value;
                Signal();
            } 
        }

        public BaseCommand SaveUser {  get; set; }
        public BaseCommand Cancel { get; set; }

        public EditUserVM(User user)
        {
            EditUser = user;
            LoadRoles();

            Cancel = new BaseCommand(() =>
            {
                Navigation.SetPage(new AdminPage());
            });

            SaveUser = new BaseCommand(() =>
            {
                if (IsNullOrWhiteSpace(EditUser.Login) || IsNullOrWhiteSpace(EditUser.Password))
                {
                    MessageBox.Show("Заполните поля Логин и Пароль!");
                    return;
                }

                if (IsNullOrWhiteSpace(EditUser.Name) || IsNullOrWhiteSpace(EditUser.LastName))
                {
                    MessageBox.Show("Заполните поля Имя и Фамилия");
                    return;
                }

                if (EditUser.IdRoleNavigation == null)
                {
                    MessageBox.Show("Поле Роль обязательное!");
                    return;
                }
                
                if(EditUser.Id == 0)
                    Database.Instance.Users.Add(EditUser);
                else
                    Database.Instance.Users.Update(EditUser);

                Database.Instance.SaveChanges();

                Navigation.SetPage(new AdminPage());
            }, () => EditUser != null);
        }

        private void LoadRoles()
        {
            Roles = Database.Instance.Roles.ToList();
        }
       
    }
}
