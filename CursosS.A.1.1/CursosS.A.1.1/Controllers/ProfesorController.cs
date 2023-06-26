using CursosS.A._1._1.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CursosS.A._1._1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProfesorController : ControllerBase
    {

        public readonly CursosSaContext db_context;

        public ProfesorController(CursosSaContext context)
        {
            db_context = context;

        }

        [HttpGet]
        [Route("Lista")]
        public IActionResult Lista()
        {
            List<Profesor> lista = new List<Profesor>();


            try
            {

                lista = db_context.Profesors.ToList();
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
            Profesor oProfesor = db_context.Profesors.Find(idProfesor);

            if (oProfesor == null)
            {
                return BadRequest("Profesor no encontrado");

            }

            try
            {

                oProfesor = db_context.Profesors.Where(p => p.Id == idProfesor).FirstOrDefault();

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", response = oProfesor });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message, response = oProfesor });


            }
        }




        [HttpPost]
        [Route("Guardar")]
        public IActionResult Guardar([FromBody] Profesor objeto)
        {


            try
            {
                db_context.Profesors.Add(objeto);
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
        public IActionResult Editar([FromBody] Profesor objeto)
        {
            Profesor oProfesor = db_context.Profesors.Find(objeto.Id);

            if (oProfesor == null)
            {
                return BadRequest("Profesor no encontrado");

            }

            try
            {
                oProfesor.Nombre = objeto.Nombre is null ? oProfesor.Nombre : objeto.Nombre;
                oProfesor.Apellido = objeto.Apellido  is null ? oProfesor.Apellido : objeto.Apellido;




                db_context.Profesors.Update(oProfesor);
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

            Profesor oProfesor = db_context.Profesors.Find(idProfesor);

            if (oProfesor == null)
            {
                return BadRequest("Profesor no encontrado");

            }

            try
            {

                db_context.Profesors.Remove(oProfesor);
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
