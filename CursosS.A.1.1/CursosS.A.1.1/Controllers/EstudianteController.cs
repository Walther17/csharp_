using CursosS.A._1._1.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EstudiantesS.A._1._1.Controllers
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

                lista = db_context.Estudiantes.ToList();
                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", response = lista });

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex, response = lista });
            }


        }


        [HttpGet]
        [Route("getEstudianteById/{idEstudiante:int}")]
        public IActionResult ObtenerEstudianteByID(int idEstudiante)
        {
            Estudiante oEstudiante = db_context.Estudiantes.Find(idEstudiante);

            if (oEstudiante == null)
            {
                return BadRequest("Estudiante no encontrado");

            }

            try
            {

                oEstudiante = db_context.Estudiantes

                    .Where(e => e.Id == idEstudiante).FirstOrDefault();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", response = oEstudiante });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message, response = oEstudiante });


            }
        
        
        
        }


        [HttpPost]
        [Route("guardarEstudiante")]
        public IActionResult Guardar([FromBody] Estudiante objeto)
        {


            try
            {
                db_context.Estudiantes.Add(objeto);
                db_context.SaveChanges();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok" });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }




        }





        [HttpPut]
        [Route("editarEstudiante")]
        public IActionResult Editar([FromBody] Estudiante objeto)
        {
            Estudiante oEstudiante = db_context.Estudiantes.Find(objeto.Id);

            if (oEstudiante == null)
            {
                return BadRequest("Estudiante no encontrado");

            }

            try
            {
                oEstudiante.Nombre = objeto.Nombre is null ? oEstudiante.Nombre : objeto.Nombre;
                oEstudiante.Apellido = objeto.Apellido is null ? oEstudiante.Apellido : objeto.Apellido;
                oEstudiante.Edad = objeto.Edad is EmptyResult ? oEstudiante.Edad : objeto.Edad;



                db_context.Estudiantes.Update(oEstudiante);
                db_context.SaveChanges();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok" });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }

        }

        [HttpDelete]
        [Route("eliminarEstudiante/{idEstudiante:int}")]
        public IActionResult EliminarEstudiante(int idEstudiante)
        {

            Estudiante oEstudiante = db_context.Estudiantes.Find(idEstudiante);

            if (oEstudiante == null)
            {
                return BadRequest("Estudiante no encontrado");

            }

            try
            {

                db_context.Estudiantes.Remove(oEstudiante);
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
