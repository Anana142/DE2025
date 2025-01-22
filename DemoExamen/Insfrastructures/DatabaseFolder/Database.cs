using DemoExamen.Insfrastructures.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoExamen.Insfrastructures.DatabaseFolder
{
    internal class Database
    {
        private static User49Context instance;

        private Database()
        {

        }

        public static User49Context Instance
        {
            get
            {

                if (instance == null)
                    instance = new User49Context();
                return instance;

            }
        }
    }
}
