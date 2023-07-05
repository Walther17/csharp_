using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace CrudAsp.NetCoreMvc2._0.Datos
{
    public class Conexion
    {

        private string cadenaSQL = string.Empty;


        public Conexion()
        {

            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();

            cadenaSQL = builder.GetSection("ConnectionStrings:CadenaSQL").Value;

        }

        public string getCadenaSql()
        {
            return cadenaSQL;
        }
    }
}
