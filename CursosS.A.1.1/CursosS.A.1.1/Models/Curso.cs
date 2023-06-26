using System;
using System.Collections.Generic;

namespace CursosS.A._1._1.Models;

public partial class Curso
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public int IdProfesor { get; set; }

    public int IdEstudiante { get; set; }

    public virtual Estudiante oEstudiante { get; set; } = null!;

    public virtual Profesor oProfesor {  get; set; } = null!;
}
