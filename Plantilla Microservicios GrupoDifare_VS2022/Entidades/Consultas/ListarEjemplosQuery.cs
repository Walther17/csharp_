using safeprojectname.Utils;
using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Comun.Exceptions;
using System.Text.Json.Serialization;

namespace safeprojectname.Entidades.Consultas
{
    public class ListarEjemplosQuery : PagedViewRequest
    {
        [JsonPropertyName("campoConsulta")]
        public string CampoConsulta { get; set; }

        public override void IsValid()
        {
            if (string.IsNullOrWhiteSpace(CampoConsulta))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }

            base.IsValid();
        }
    }
}