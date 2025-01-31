using DemoExamen.Insfrastructures.StaticStorage;
using DemoExamen.Tools;
using DemoExamen.Views.Pages;
using DemoExamen.VMs.Base;
using System.Windows;
using System.Windows.Controls;

namespace DemoExamen.VMs
{
    internal class MainVM : BaseVM
    {
        private Window _window;

        public Page CurrentPage => Navigation.CurrentPage;


        public MainVM(Window window)
        {
            this._window = window;
            this._window.Closed += (o, e) => {

                Navigation.CurrentPageChanged -= CurrentPageChanged;
                Navigation.CurrentPage = null;
                _window = null;
            };

            if(UserStaticStorage.Role == "Администратор")
                Navigation.SetPage(new AdminPage());
            else
                Navigation.SetPage(new Page());

            Navigation.CurrentPageChanged += CurrentPageChanged;
        }

        private void CurrentPageChanged(object? sender, Page e)
        {
            Signal(nameof(CurrentPage));
        }
    }
}