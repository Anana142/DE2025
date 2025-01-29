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
        public static EventHandler<Page> CurrentPageChanged;
        private static Page currentPage;

        public static Page CurrentPage
        {
            get => currentPage; set
            {
                currentPage = value;
                CurrentPageChanged?.Invoke(null, CurrentPage);
            }
        }

        public static void SetPage(Page page) => CurrentPage = page;
    }
}
