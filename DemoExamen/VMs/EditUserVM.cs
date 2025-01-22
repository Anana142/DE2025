using DemoExamen.Insfrastructures.Commands.Base;
using DemoExamen.Models;
using DemoExamen.VMs.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoExamen.VMs
{

    internal class EditUserVM : BaseVM
    {
        private User user = new User();

        public User User { get => user;
            set { user = value; 
                Signal(); } }

        public BaseCommand Save {  get; set; }

        public EditUserVM(User user)
        {
            User = user;
        }

       
    }
}
