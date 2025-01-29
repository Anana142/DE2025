using DemoExamen.VMs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DemoExamen.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для ResetPasswordView.xaml
    /// </summary>
    public partial class ResetPasswordView : Window
    {
        public ResetPasswordView()
        {
            InitializeComponent();
            DataContext = new ResetPasswordVM(ConfirmPasssword, NewPassword, CurrentPassword, this);
        }
    }
}
