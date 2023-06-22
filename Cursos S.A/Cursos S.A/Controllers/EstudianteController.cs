using Cursos_S.A_.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Cursos_S.A_.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstudianteController : ControllerBase
    {

        public readonly CursosSaContext db_context;

        public EstudianteController(CursosSaContext context)
        {
            db_context = context;

        }

        [HttpGet]
        [Route("lista-estudiantes")]
        public IActionResult getAllEstudiantes()
        {

            List<Estudiante> lista = new List<Estudiante>();


            try
            {

                lista = db_context.Estudiantes.Include(c => c.Cursos).ToList(); 
                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", response = lista });

            }
            catch(Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex, response = lista });
            } 
            

        }

    }
}
