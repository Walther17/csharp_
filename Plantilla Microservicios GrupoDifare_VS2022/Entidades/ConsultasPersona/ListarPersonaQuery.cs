using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Comun.Exceptions;
using safeprojectname.Utils;
using System.Text.Json.Serialization;

namespace safeprojectname.Entidades.ConsultasPersona
{
    public class ListarPersonaQuery : PagedViewRequest
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
