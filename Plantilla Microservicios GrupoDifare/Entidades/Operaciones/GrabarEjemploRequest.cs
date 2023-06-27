using safeprojectname.Utils;
using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Comun.Exceptions;
using Newtonsoft.Json;
using System.Text.Json.Serialization;

namespace safeprojectname.Entidades.Operaciones
{
    public class GrabarEjemploRequest: DifareBaseRequest
    {
        [JsonPropertyName("idEjemplo")]
        public int IdEjemplo { get; set; }

        [JsonPropertyName("campoRequerimiento")]
        public string CampoRequerimiento { get; set; }

        public override void IsValid()
        {
        /*    if (IdEjemplo <= 0)
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
        */
            if (string.IsNullOrWhiteSpace(CampoRequerimiento))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }

            base.IsValid();
        }
    }
}