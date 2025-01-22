using DemoExamen.Insfrastructures.Commands.Base;
using DemoExamen.Insfrastructures.DatabaseFolder;
using DemoExamen.Models;
using DemoExamen.Tools;
using DemoExamen.Views.Pages;
using DemoExamen.VMs.Base;

namespace DemoExamen.VMs
{
    internal class AdminVM : BaseVM
    {
        private List<User> listUsers;

        public List<User> ListUsers { get => listUsers; 
            set { listUsers = value; 
                Signal(); } }

        public User SelectedUser { get; set; }

        public BaseCommand CreateUser {  get; set; }
        public BaseCommand EditUser { get; set; }




        public AdminVM()
        {
            ListUsers  = Database.Instance.Users.ToList();

            CreateUser = new BaseCommand(() => {
                Navigation.CurrentPage = new EditUserPage(new());
            });
            EditUser = new BaseCommand(() =>
            {
                Navigation.CurrentPage = new EditUserPage(SelectedUser);
            }, () => SelectedUser != null);


        }
    }
}