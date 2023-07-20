using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeNotas.LinQ
{
    internal class LinQQQ
    {

        public void LinqPractice()
        {
            int[] numeros = { 1, 2, 34, 54, 5, 6, 6, 6, 6, 61, 6, 6, 6 };

            IEnumerable<int> nume = from num in numeros
                                    orderby num
                                    select num;

            foreach(var a in nume)
            {
            Console.WriteLine(a);

            }
        }
    }
}
