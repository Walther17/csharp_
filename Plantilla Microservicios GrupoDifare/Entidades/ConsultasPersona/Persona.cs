using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace safeprojectname.Entidades.ConsultasPersona
{
    public class Persona
    {

        [Column("id")]
        [JsonPropertyName("id")]
        public int id { get; set; }

        [Column("nombre")]
        [JsonPropertyName("nombre")]
        public string nombre { get; set; }


        [Column("(apellido")]
        [JsonPropertyName("apellido")]
        public string apellido { get; set; }

        [Column("domicilio")]
        [JsonPropertyName("domicilio")]
        public string domicilio { get; set; }

        [Column("edad")]
        [JsonPropertyName("edad")]
        public int edad { get; set; }

     
    }
}
