using CursosS.A._1._1.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CursosS.A._1._1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CursoController : ControllerBase
    {

        public readonly CursosSaContext db_context;

        public CursoController(CursosSaContext context)
        {
            db_context = context;

        }

        [HttpGet]
        [Route("lista-cursos")]
        public IActionResult GetAllCursos()
        {

            List<Curso> lista = new List<Curso>();


            try
            {

                lista = db_context.Cursos
                    .Include(c => c.oEstudiante)
                    .Include(c => c.oProfesor)
                    .ToList();
                    
                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", response = lista });

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex, response = lista });
            }


        }

        [HttpGet]
        [Route("getById/{idCurso:int}")]
        public IActionResult ObtenerCursoByID(int idCurso)
        {
            Curso oCurso = db_context.Cursos.Find(idCurso);

            if (oCurso == null)
            {
                return BadRequest("Curso no encontrado");

            }

            try
            {

                oCurso = db_context.Cursos
                   .Include(c => c.oEstudiante)
                    .Include(c => c.oProfesor)
                    .Where(c => c.Id == idCurso).FirstOrDefault();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", response = oCurso });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message, response = oCurso });


            }
        }

        [HttpPost]
        [Route("saveCurso")]
        public IActionResult GuardarCurso([FromBody] Curso objeto)
        {


            try
            {
                db_context.Cursos.Add(objeto);
                db_context.SaveChanges();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok" });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }




        }

        [HttpPut]
        [Route("editCurso")]
        public IActionResult EditarCurso([FromBody] Curso objeto)
        {
            Curso oCurso = db_context.Cursos.Find(objeto.Id);

            if (oCurso == null)
            {
                return BadRequest("Curso no encontrado");

            }

            try
            {
                oCurso.Nombre = objeto.Nombre is null ? oCurso.Nombre : objeto.Nombre;
              



                db_context.Cursos.Update(oCurso);
                db_context.SaveChanges();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok" });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }

        }

        [HttpDelete]
        [Route("eliminarCurso/{idCurso:int}")]
        public IActionResult Eliminar(int idCurso)
        {

            Curso oCurso = db_context.Cursos.Find(idCurso);

            if (oCurso == null)
            {
                return BadRequest("Curso no encontrado");

            }

            try
            {

                db_context.Cursos.Remove(oCurso);
                db_context.SaveChanges();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok" });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }


        }




    }
}
