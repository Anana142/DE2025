using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace DemoExamen.Insfrastructures.Commands.Base
{
    internal class BaseCommandWithParameter<T>(Action<T> action, Func<T, bool> func) : ICommand
    {
        private readonly Action<T> _action = action;
        private readonly Func<T, bool> _func = func == null ? t => true : func;

        public event EventHandler? CanExecuteChanged
        {
            add { CommandManager.RequerySuggested += value; }
            remove { CommandManager.RequerySuggested -= value; }
        }

        public bool CanExecute(object? parameter) => _func((T)parameter);

        public void Execute(object? parameter) => _action((T)parameter);
    }
}
