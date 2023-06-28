using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace safeprojectname.Entidades.Consultas
{
    public class Ejemplo
    {
        [Column("id_ejemplo")]
        [JsonPropertyName("idEjemplo")]
        public int IdEjemplo { get; set; }

        [Column("campo_uno")]
        [JsonPropertyName("campoUno")]
        public string CampoUno { get; set; }
    }
}