using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace CursosS.A._1._1.Models;

public partial class Estudiante
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public string Apellido { get; set; } = null!;

    public int Edad { get; set; }

    [JsonIgnore]
    public virtual ICollection<Curso> Cursos { get; set; } = new List<Curso>();
}
