using System;
using System.Collections.Generic;

namespace Cursos_S.A_.Models;

public partial class Profesor
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public string Apellido { get; set; } = null!;

    public virtual ICollection<Curso> Cursos { get; set; } = new List<Curso>();
}
