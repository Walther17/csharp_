using Microsoft.AspNetCore.Mvc;
using WebApplication11231212.Models;

namespace WebApplication11231212.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProfesorController : ControllerBase
    {


        public readonly CursosSa2Context db_context;

        public ProfesorController(CursosSa2Context context)
        {
            db_context = context;

        }

        [HttpGet]
        [Route("Lista")]
        public IActionResult Lista()
        {
            List<Profesore> lista = new List<Profesore>();


            try
            {

                lista = db_context.Profesores.ToList();
                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", response = lista });

            }
            catch (Exception ex)
            {

                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex, response = lista });

            }


        }


        [HttpGet]
        [Route("Obtener/{idProfesor:int}")]
        public IActionResult Obtener(int idProfesor)
        {
            Profesore oProfesor = db_context.Profesores.Find(idProfesor);

            if (oProfesor == null)
            {
                return BadRequest("Profesor no encontrado");

            }

            try
            {

                oProfesor = db_context.Profesores.Where(p => p.Id == idProfesor).FirstOrDefault();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", response = oProfesor });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message, response = oProfesor });


            }
        }




        [HttpPost]
        [Route("Guardar")]
        public IActionResult Guardar([FromBody] Profesore objeto)
        {


            try
            {
                db_context.Profesores.Add(objeto);
                db_context.SaveChanges();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok" });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }




        }



        [HttpPut]
        [Route("Editar")]
        public IActionResult Editar([FromBody] Profesore objeto)
        {
            Profesore oProfesor = db_context.Profesores.Find(objeto.Id);

            if (oProfesor == null)
            {
                return BadRequest("Profesor no encontrado");

            }

            try
            {
                oProfesor.Nombre = objeto.Nombre is null ? oProfesor.Nombre : objeto.Nombre;
                oProfesor.Apellido = objeto.Apellido is null ? oProfesor.Apellido : objeto.Apellido;




                db_context.Profesores.Update(oProfesor);
                db_context.SaveChanges();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok" });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }

        }



        [HttpDelete]
        [Route("Eliminar/{idProfesor:int}")]
        public IActionResult Eliminar(int idProfesor)
        {

            Profesore oProfesor = db_context.Profesores.Find(idProfesor);

            if (oProfesor == null)
            {
                return BadRequest("Profesor no encontrado");

            }

            try
            {

                db_context.Profesores.Remove(oProfesor);
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
