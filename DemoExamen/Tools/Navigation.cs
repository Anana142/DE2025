using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace DemoExamen.Tools
{
    internal class Navigation
    {
        public static EventHandler? EventHandler;
        private static Page currentPage;

        public static Page CurrentPage
        {
            get => currentPage; set
            {
                EventHandler?.Invoke(CurrentPage, null);
                currentPage = value;
            }
        }
    }
}
