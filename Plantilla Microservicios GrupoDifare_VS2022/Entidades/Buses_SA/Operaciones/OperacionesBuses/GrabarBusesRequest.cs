using GDifare.Utilitario.Comun.Exceptions;
using safeprojectname.Utils;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace MicroserviciosGD1.Entidades.Buses_SA.Operaciones.OperacionesBuses
{
    public class GrabarBusesRequest: DifareBaseRequest
    {


        [Column("id")]
        [JsonPropertyName("id")]
        public int id { get; set; }

        [Column("capacidad")]
        [JsonPropertyName("capacidad")]
        public int capacidad { get; set; }

        [Column("placa")]
        [JsonPropertyName("placa")]
        public string placa { get; set; }

        [Column("estado")]
        [JsonPropertyName("estado")]
        public string estado { get; set; }

        public override void IsValid()
        {
            if (capacidad )
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




            base.IsValid();
        }


    }
}
