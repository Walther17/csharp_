using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Comun.Exceptions;
using safeprojectname.Utils;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace MicroserviciosGD1.Entidades.Buses_SA.Operaciones.OperacionesUsuario
{
    public class GrabarUsuarioRequest : DifareBaseRequest
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

        public override void IsValid()
        {
            if (string.IsNullOrWhiteSpace(nombre))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
            if (string.IsNullOrWhiteSpace(apellido))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
            if (string.IsNullOrWhiteSpace(clave))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
            if (string.IsNullOrWhiteSpace(username))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
            if (string.IsNullOrWhiteSpace(cedula))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
            if (string.IsNullOrWhiteSpace(estado))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }

            base.IsValid();
        }

    }
}
