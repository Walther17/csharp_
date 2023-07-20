using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace MicroserviciosGD1.Entidades.Buses_SA.Consultas.ConsultasUsuario
{
    public class Usuario
    {

        [Column("id")]
        [JsonPropertyName("id")]
        public int id { get; set; }

        [Column("nombre")]
        [JsonPropertyName("nombre")]
        public string nombre { get; set; }

        [Column("apellido")]
        [JsonPropertyName("apellido")]
        public string apellido { get; set; }
        
        [Column("clave")]
        [JsonPropertyName("clave")]
        public string clave { get; set; }


        [Column("username")]
        [JsonPropertyName("username")]
        public string username { get; set; }


        [Column("cedula")]
        [JsonPropertyName("cedula")]
        public string cedula { get; set; }

        [Column("estado")]
        [JsonPropertyName("estado")]
        public string estado { get; set; }

    }
}
