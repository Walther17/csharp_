using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace MicroserviciosGD1.Entidades.Buses_SA.Consultas.ConsultasBuses
{
    public class Buses
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

    }
}
