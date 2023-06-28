using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Servicios;
using System.Text.Json.Serialization;

namespace safeprojectname.Entidades.Operaciones
{
    public class GrabarEjemploResponse : DifareBaseResponse
    {
        [JsonPropertyName("idEjemplo")]
        public int IdEjemplo { get; set; }

        [JsonPropertyName("campoRequerimiento")]
        public string CampoRequerimiento { get; set; }

        internal GrabarEjemploResponse()
            : base(true, ApiCodes.CODE_ERROR_API_00, ApiCodes.ERROR_API_00) { }

        internal GrabarEjemploResponse(string codigo, string mensaje)
            : base(false, codigo, mensaje) { }
    }
}