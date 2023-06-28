using GDifare.Utilitario.Comun;
using System.Text.Json.Serialization;
using GDifare.Utilitario.Servicios;

namespace safeprojectname.Entidades.OperacionesPersona
{
    public class GrabarPersonaResponse : DifareBaseResponse
    {


        [JsonPropertyName("id")]
        public int id { get; set; }

        [JsonPropertyName("nombre")]
        public string nombre { get; set; }


        [JsonPropertyName("apellido")]
        public string apellido { get; set; }


        [JsonPropertyName("domicilio")]
        public string domicilio { get; set; }

        [JsonPropertyName("edad")]
        public int edad { get; set; }


         internal GrabarPersonaResponse()
            : base(true, ApiCodes.CODE_ERROR_API_00, ApiCodes.ERROR_API_00) { }

        internal GrabarPersonaResponse(string codigo, string mensaje)
            : base(false, codigo, mensaje) { }

         
    }
}
