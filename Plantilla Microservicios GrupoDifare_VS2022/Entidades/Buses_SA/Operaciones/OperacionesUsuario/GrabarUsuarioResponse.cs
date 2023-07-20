using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Servicios;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace MicroserviciosGD1.Entidades.Buses_SA.Operaciones.OperacionesUsuario
{
    public class GrabarUsuarioResponse : DifareBaseResponse
   
    {

         [JsonPropertyName("id")]
        public int id { get; set; }

         [JsonPropertyName("nombre")]
        public string nombre { get; set; }

         [JsonPropertyName("apellido")]
        public string apellido { get; set; }

         [JsonPropertyName("clave")]
        public string clave { get; set; }


         [JsonPropertyName("username")]
        public string username { get; set; }


         [JsonPropertyName("cedula")]
        public string cedula { get; set; }

         [JsonPropertyName("estado")]
        public string estado { get; set; }



        internal GrabarUsuarioResponse()
           : base(true, ApiCodes.CODE_ERROR_API_00, ApiCodes.ERROR_API_00) { }

        internal GrabarUsuarioResponse(string codigo, string mensaje)
            : base(false, codigo, mensaje) { }


    }
}
