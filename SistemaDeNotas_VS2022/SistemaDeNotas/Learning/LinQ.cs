using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeNotas.Learning
{
    internal class LinQ
    {

        /*
         * LINQ (Language Integrated Query) es una característica de C# que proporciona un conjunto de operaciones
         * de consulta unificado para trabajar con diferentes fuentes de datos, como colecciones de objetos, bases de
         * datos, servicios web, archivos XML, entre otros. LINQ permite escribir consultas de datos de una manera más
         * legible y productiva, integrándolas directamente en el lenguaje C#.
         * 
         */


        public LinQ() { }

     /*   public void funciones()
        {
            // Where: Se utiliza para filtrar elementos de una secuencia basándose en una condición.
            int[] numeros = { 1, 2, 3, 4, 5, 8, 29, 28, 18 };
            var numerosPares = numeros.Where(numwhere => numwhere % 2 == 0);
            Console.WriteLine("Where: " + string.Join(", ", numerosPares));

            // All: Verifica si todos los elementos de la secuencia cumplen una condición.
            bool todosPares = numeros.All(numAll => numAll % 2 == 0);
            Console.WriteLine("Todos los números son pares: " + todosPares);

            // Skip: Omite los primeros n elementos de la secuencia.
            var numerosSinPrimeros2 = numeros.Skip(2);
            Console.WriteLine("Números sin los primeros 2 elementos: " + string.Join(", ", numerosSinPrimeros2));


            // SkipWhile: Omite los elementos de la secuencia mientras se cumple una condición.
            int[] num = { 1, 2, 3, 4, 5 };
            var numerosDespuesDel3 = num.SkipWhile(nu => nu <= 3);
            Console.WriteLine("Números después de que se cumple la condición: " + string.Join(", ", numerosDespuesDel3));


            // Min: Obtiene el valor mínimo de la secuencia.
            int[] numeros5 = { 3, 7, 1, 5, 2 };
            int minimoNumero = numeros5.Min();
            Console.WriteLine("Mínimo número: " + minimoNumero);


            // Average: Calcula el promedio de los valores en la secuencia.
            int[] numeros8 = { 1, 2, 3, 4, 5 };
            double promedioNumeros = numeros8.Average();
            Console.WriteLine("Promedio de números: " + promedioNumeros);

            // Aggregate: Realiza una operación de agregación personalizada en la secuencia.
            int[] numeros9 = { 1, 2, 3, 4, 5 };
            int resultado = numeros9.Aggregate((acc, numAggregate) => acc + numAggregate);
            Console.WriteLine("Resultado de la operación de agregación: " + resultado);
        

            // Max: Obtiene el valor máximo de la secuencia.
            int[] numeros6 = { 3, 7, 1, 5, 2 };
            int maximoNumero = numeros6.Max();
            Console.WriteLine("Máximo número: " + maximoNumero);

          
            // Count: Cuenta el número de elementos en la secuencia.
            int cantidadNumeros = numeros.Count();
            Console.WriteLine("Cantidad de números: " + cantidadNumeros);

            // LongCount: Cuenta el número de elementos en la secuencia (retorna un valor de tipo long).
            int[] numeros4 = { 1, 2, 3, 4, 5 };
            long cantidadNumeros2 = numeros4.LongCount();
            Console.WriteLine("Cantidad de números (long): " + cantidadNumeros2);

            // Select: Se utiliza para proyectar y transformar elementos de una secuencia.
            string[] nombres = { "Juan", "María", "Pedro", "Walther" };
            var saludos = nombres.Select(nombre => "Hola, " + nombre);
            Console.WriteLine("Saludos: " + string.Join(", ", saludos));


            // Any: Verifica si al menos un elemento de la secuencia cumple una condición.

            bool algunoEmpiezaConM = nombres.Any(nombre => nombre.StartsWith("M"));
            Console.WriteLine("Alguno de los nombres empieza con 'M': " + algunoEmpiezaConM);


            // Contains: Verifica si la secuencia contiene un elemento específico.
            string[] colores = { "rojo", "verde", "azul" };
            bool contieneRojo = colores.Contains("rojo");
            Console.WriteLine("La secuencia contiene el color 'rojo': " + contieneRojo);


            // Take: Obtiene los primeros n elementos de la secuencia.
            int[] numeros2 = { 1, 2, 3, 4, 5 };
            var primeros3Numeros = numeros2.Take(3);
            Console.WriteLine("Los primeros 3 números son: " + string.Join(", ", primeros3Numeros));

            // TakeWhile: Obtiene los elementos de la secuencia mientras se cumple una condición.
            int[] numeros3 = { 1, 2, 3, 4, 5 };
            var numerosHasta3 = numeros3.TakeWhile(num => num <= 3);
            Console.WriteLine("Los números hasta que se cumple la condición son: " + string.Join(", ", numerosHasta3));

            // OrderBy / OrderByDescending: Se utilizan para ordenar los elementos de una secuencia en orden ascendente o descendente.
            string[] names = { "Juan", "María", "Pedro" };
            var nombresOrdenados = names.OrderBy(name => name.Length);

            Console.WriteLine("OrderBy: " + string.Join(", ", nombresOrdenados));


            // GroupBy: Se utiliza para agrupar elementos de una secuencia basándose en una clave común.
            var gruposPorLongitud = nombres.GroupBy(nombre => nombre.Length);
            foreach (var grupo in gruposPorLongitud)
            {
                Console.WriteLine($"GroupBy: Key={grupo.Key}, Elementos=[{string.Join(", ", grupo)}]");
            }
        }

        */

    }
}
