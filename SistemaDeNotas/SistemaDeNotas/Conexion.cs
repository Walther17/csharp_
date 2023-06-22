using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeNotas
{
    internal class Conexion
    {
        private static Conexion instancia; // Instancia única de la clase Conexion
        private SqlConnection conexion = new SqlConnection();
        private string cadena = "Data Source=localhost; Initial Catalog=practicas_safs;User=sa;Password=12345";

        private Conexion()
        {
            this.conexion.ConnectionString = cadena; 
            this.conexion.Open();
        }

        public static Conexion ObtenerInstancia()
        {
            if (instancia == null)
            {
                instancia = new Conexion();
            }
            return instancia;
        }

        public SqlConnection EstablecerConexion()
        {
            try
            {
            
                Console.WriteLine("Conexion establecida");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Conexión no establecida, " + ex.ToString());
            }

           // conexion.Close();

            return conexion;
        }
    }

}
