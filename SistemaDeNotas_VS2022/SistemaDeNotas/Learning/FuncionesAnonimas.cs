using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeNotas.Learning
{
    internal class FuncionesAnonimas
    {
        /*
         *  En C#, las funciones anónimas y las expresiones lambda son características que permiten definir y utilizar
         *  funciones de forma concisa y flexible. Estas funciones se pueden usar como argumentos de otras funciones, 
         *  asignarlas a variables o usarlas en cualquier contexto donde se requiera una función. 
         * 
         */

        public void FuncionAnonima()
        {
            Func<int, int> m = (x) =>   x * 2;
            Console.WriteLine( "multiplicar " + m(38));

            Func<int, int, int> s = (x, y) =>  x + y;
            Console.WriteLine("sumar " + s(38, 9));


            // Definición de una función anónima utilizando la sintaxis delegate
            // Una función anónima es una función sin nombre que se define utilizando la sintaxis delegate o lambda.
            Func<int, int, int> suma = delegate (int a, int b)
            {
                return a + b;
            };

            // Uso de la función anónima
            int resultado = suma(5, 3); 

            Console.WriteLine(resultado);  


        }

        public void ExpresionLambda()
        {
            var n = new List<int> { 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };
            Func<int, bool> GetPares = (x) => x % 2 == 0;

            var pares = n.Where(GetPares);
            Console.WriteLine("Los pares del arreglo son: " + string.Join(", ", pares));

            // Definición de una expresión lambda
            // Una expresión lambda es una forma más concisa de definir una función anónima utilizando la sintaxis =>
            Func<int, int, int> suma = (a, b) => a + b;

            // Uso de la expresión lambda
            int resultado = suma(5, 3); 
        }





    }
}
