using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace DemoExamen.Insfrastructures.Commands.Base
{
    internal class BaseCommand(Action action, Func<bool>? func = null) : ICommand
    {
        private readonly Action _action = action;
        private readonly Func<bool> _func = func == null ? () => true : func;

        public event EventHandler? CanExecuteChanged
        {
            add { CommandManager.RequerySuggested += value; }
            remove { CommandManager.RequerySuggested -= value; }
        }

        public bool CanExecute(object? parameter) => _func();

        public void Execute(object? parameter) => _action();
    }
}
