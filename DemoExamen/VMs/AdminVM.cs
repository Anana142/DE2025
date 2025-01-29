using DemoExamen.Insfrastructures.Commands.Base;
using DemoExamen.Insfrastructures.DatabaseFolder;
using DemoExamen.Models;
using DemoExamen.Tools;
using DemoExamen.Views.Pages;
using DemoExamen.VMs.Base;
using Microsoft.EntityFrameworkCore;

namespace DemoExamen.VMs
{
    internal class AdminVM : BaseVM
    {
        private List<User> listUsers;

        public List<User> ListUsers { get => listUsers; 
            set { listUsers = value; 
                Signal(nameof(ListUsers)); } }

        public User SelectedUser { get; set; }

        public BaseCommand CreateUser {  get; set; }
        public BaseCommand EditUser { get; set; }
        public BaseCommand UnblockedUser { get; set; }

        public AdminVM()
        {
            LoadListUsers();

            CreateUser = new BaseCommand(() => {
                Navigation.SetPage(new EditUserPage(new()));
            });
            EditUser = new BaseCommand(() =>
            {
                Navigation.CurrentPage = new EditUserPage(SelectedUser);
            }, () => SelectedUser != null);
            UnblockedUser = new BaseCommand(() =>
            {
                SelectedUser.IsLocked = false;

                Database.Instance.Users.Update(SelectedUser);
                Database.Instance.SaveChanges();
                LoadListUsers();
            }, () => SelectedUser != null && SelectedUser.IsLocked);

        }

        private void LoadListUsers() => ListUsers = Database.Instance.Users.ToList();
        
    }
}