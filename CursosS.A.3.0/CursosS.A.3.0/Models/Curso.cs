using System;
using System.Collections.Generic;

namespace CursosS.A._3._0.Models;

public partial class Curso
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public string Descripcion { get; set; } = null!;

    public int? IdProfesor { get; set; }

    public virtual ICollection<Estudiante> Estudiantes { get; set; } = new List<Estudiante>();

    public virtual Profesore? oProfesor { get; set; }
}
