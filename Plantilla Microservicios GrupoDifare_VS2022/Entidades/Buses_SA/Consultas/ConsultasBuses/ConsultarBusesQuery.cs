using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Comun.Exceptions;
using safeprojectname.Utils;
using System.Text.Json.Serialization;

namespace MicroserviciosGD1.Entidades.Buses_SA.Consultas.ConsultasBuses
{
    public class ConsultarBusesQuery : DifareBaseRequest
    {
        [JsonPropertyName("id")]
        public int id { get; set; }

        public override void IsValid()
        {
            if (id <= 0)
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }

            base.IsValid();
        }

    }
}
