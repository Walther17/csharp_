using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Comun.Exceptions;
using safeprojectname.Utils;
using System.Text.Json.Serialization;

namespace safeprojectname.Entidades.OperacionesPersona
{
    public class GrabarPersonaRequest : DifareBaseRequest
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

      

        public override void IsValid()
        {
      //      if (id <= 0)
      //      {
      //          throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
      //      }

            if (string.IsNullOrWhiteSpace(nombre))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
            if (string.IsNullOrWhiteSpace(apellido))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
            if (string.IsNullOrWhiteSpace(domicilio))
            { 
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }
            if (edad <=  0 )
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }

            base.IsValid();
        }
    }
}
