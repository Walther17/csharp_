using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace SistemaDeNotas.Model
{
    internal class Sistema
    {
        static SqlCommand sqlCommand = new SqlCommand();
        static SqlDataReader sqlDataReader = null;

        List<Nota> notas = new List<Nota>();
        List<Materia > categorias = new List<Materia>();

        public void sistemaDeNotas()
        {
            bool salir = false;
            while (!salir)
            {
                Console.WriteLine("************ Sistema de Notas ************");
                Console.WriteLine("1. Crear nota");
                Console.WriteLine("2. Modificar nota");
                Console.WriteLine("3. Eliminar nota");
                Console.WriteLine("4. Clasificar notas por categoría");
                Console.WriteLine("5. Mostrar Notas");
                Console.WriteLine("6. Salir");

                Console.Write("Selecciona una opción: ");
                string opcion = Console.ReadLine();

                switch (opcion)
                {
                    case "1":
                        AddNota();
                        break;
                    case "2":
                        ActualizarNota();
                        break;
                    case "3":
                        eliminarNota();
                        break;
                    case "4":
                        break;
                    case "5":
                        GetAll();
                        break;
                    case "6":
                        salir = true;
                        break;
                    default:
                        Console.WriteLine("Opción inválida. Por favor, selecciona una opción válida.");
                        break;
                }

                Console.WriteLine();
            }
        }

        public void GetAll()
        {
            Conexion miConexion = Conexion.ObtenerInstancia();
            SqlConnection sqlConn = miConexion.EstablecerConexion();
            // Usar la conexión para operaciones de base de datos


            try
            {
                Console.WriteLine("************ Todas las Notas ************");

                string query = "select n.id, n.nota, m.nombre as materia  from nota n  inner join materia m on n.id_materia = m.id";
                sqlCommand = new SqlCommand(query, sqlConn);
                sqlDataReader = sqlCommand.ExecuteReader();
                Console.WriteLine("Notas id\t Nota\t Materia");
                Console.WriteLine("----------------------------------");

                while (sqlDataReader.Read())
                {
                    Console.WriteLine($"{sqlDataReader["id"]}\t {sqlDataReader["nota"]}\t { sqlDataReader["materia"]}\t");
                }
                sqlDataReader.Close();

               

            }
            catch (Exception ex) {
                Console.WriteLine(ex.ToString());
            }
        }

        /*
        public void ClasificarNotasPorCategoria()
        {
            var notasPorCategoria = notas
                .GroupBy(nota => nota.Materia)
                .Select(group => new
                {
                    Categoria = group.Key,
                    Notas = group.ToList()
                });

            Console.WriteLine("************ Clasificación de Notas por Categoría ************");

            foreach (var categoria in notasPorCategoria)
            {
                Console.WriteLine($"Categoría: {categoria.Categoria}");
                Console.WriteLine("Notas id\t Nota\t Materia");
                Console.WriteLine("----------------------------------");

                foreach (var nota in categoria.Notas)
                {
                    Console.WriteLine($"{nota.Id}\t {nota.Valor}\t {nota.Materia}");
                }

                Console.WriteLine();
            }
        }
        */

        public void AddNota()
        {
            Conexion miConexion = Conexion.ObtenerInstancia();
            SqlConnection sqlConn = miConexion.EstablecerConexion();
                // Usar la conexión para operaciones de base de datos
            try
            {
               

                Console.WriteLine("************ Agregar Nota ************");

                Console.Write("Introduce la nota: ");
                decimal nota;
                if (!Decimal.TryParse(Console.ReadLine(), out nota))
                {
                    Console.WriteLine("Entrada inválida. La nota debe ser un valor numérico.");
                    return;
                }

                Console.Write("Introduce el ID de la materia: ");
                int id_materia;
                if (!Int32.TryParse(Console.ReadLine(), out id_materia))
                {
                    Console.WriteLine("Entrada inválida. El ID de la materia debe ser un valor numérico.");
                    return;
                }

                string query = "INSERT INTO nota (nota, id_materia) VALUES (@nota, @id_materia)";

                sqlCommand = new SqlCommand(query, sqlConn);
                sqlCommand.Parameters.AddWithValue("@nota", nota);
                sqlCommand.Parameters.AddWithValue("@id_materia", id_materia);

                int r = sqlCommand.ExecuteNonQuery();
                Console.WriteLine($"{r} Nota agregada correctamente");
                Console.WriteLine("--Mostrando Notas--");
                GetAll();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 547) // Código de error específico para conflicto de clave externa
                {
                    Console.WriteLine("Error: No existe una materia con ese ID.");
                }
                else
                {
                    Console.WriteLine(ex.ToString());
                }
            }
        }

        public void ActualizarNota()
        {
            Conexion miConexion = Conexion.ObtenerInstancia();
            SqlConnection sqlConn = miConexion.EstablecerConexion();

            try
            {
                Console.WriteLine("************ Actualizar Nota ************");

                Console.Write("Introduce el ID de la nota a actualizar: ");
                int id;
                if (!Int32.TryParse(Console.ReadLine(), out id))
                {
                    Console.WriteLine("Entrada inválida. El ID de la nota debe ser un valor numérico.");
                    return;
                }

                Console.Write("Introduce la nueva nota: ");
                decimal nota;
                if (!Decimal.TryParse(Console.ReadLine(), out nota))
                {
                    Console.WriteLine("Entrada inválida. La nota debe ser un valor numérico.");
                    return;
                }

                string query = "UPDATE nota SET nota = @nota WHERE id = @id";

                sqlCommand = new SqlCommand(query, sqlConn);
                sqlCommand.Parameters.AddWithValue("@nota", nota);
                sqlCommand.Parameters.AddWithValue("@id", id);

                int r = sqlCommand.ExecuteNonQuery();
                Console.WriteLine($"{r} Nota actualizada correctamente");
                Console.WriteLine("--Mostrando Notas--");
                GetAll();
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }

        public void eliminarNota()
        {

            Conexion miConexion = Conexion.ObtenerInstancia();
            SqlConnection sqlConn = miConexion.EstablecerConexion();

            try
            {
                Console.WriteLine("************ Eliminar Nota ************");

                Console.Write("Introduce el ID de la nota a eliminar. ");
                int id;
                if (!Int32.TryParse(Console.ReadLine(), out id))
                {
                    Console.WriteLine("Entrada inválida. El ID de la nota debe ser un valor numérico.");
                    return;
                }


                string query = "DELETE FROM nota where id = @id";

                sqlCommand = new SqlCommand(query, sqlConn);
                sqlCommand.Parameters.AddWithValue("@id", id);

                int r = sqlCommand.ExecuteNonQuery();

                Console.WriteLine($"{r} Nota eliminada correctamente");
                Console.WriteLine("--Mostrando Notas--");
                GetAll();

            }
            catch (SqlException ex) {

                if (ex.Number == 547) // Código de error específico para conflicto de clave externa
                {
                    Console.WriteLine("Error: No existe una nota con ese ID.");
                }
                else
                {
                    Console.WriteLine(ex.ToString());
                }

            }
        }




    }
}
