using System;
using System.Collections.Generic;

namespace Cursos_S.A_.Models;

public partial class Curso
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public int IdEstudiante { get; set; }

    public int IdProfesor { get; set; }

    public virtual Estudiante oEstudiante { get; set; } = null!;

    public virtual Profesor oProfesor { get; set; } = null!;
}
