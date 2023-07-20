using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Log;
using GDifare.Utilitario.Servicios;
using MicroserviciosGD1.Datos.Buses;
using MicroserviciosGD1.Entidades.Buses_SA.Consultas.ConsultasUsuario;
using MicroserviciosGD1.Entidades.Buses_SA.Operaciones.OperacionesUsuario;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
   using System;
using System.Threading.Tasks;

namespace MicroserviciosGD1.Controllers.Buses_SA
{
    public class UsuarioController :  DifareApiController
    {

        private readonly IMapeoDatosUsuario mapeoDatosUsuario;

        public UsuarioController(ILogHandler _logHandler, IMapeoDatosUsuario _mapeoDatosUsuario) : base(_logHandler)
        {
            mapeoDatosUsuario = _mapeoDatosUsuario;
        }


        [HttpGet("consultar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<Usuario>> Consultar(
           [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
           [FromQuery] ConsultarUsuarioQuery query)
        {
            try
            {
                InitLog(CONSUMER, REFERENCE_ID, query.id.ToString());

                query.IsValid();

                var Usuario = new Usuario();
                await Task.Factory.StartNew(() =>
                {
                    Usuario = mapeoDatosUsuario.Obtener(query.id);
                });


                return Ok(Usuario);
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }

        [HttpGet("listar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<PagedCollection<Usuario>>> Listar(
      [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
      [FromQuery] ListarUsuarioQuery query)
        {
            try
            {
                // Inicialización de registro en ElasticSearch
                InitLog(CONSUMER, REFERENCE_ID, string.Empty);

                // Validaciones de parámetros de entrada
                query.IsValid();

                // Ejecución de la operación de datos
                var p = new PagedCollection<Usuario>(null, 0, 0);
                await Task.Factory.StartNew(() =>
                {
                    p = mapeoDatosUsuario.ObtenerListado(query);
                });

                return Ok(p);
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }


        [HttpPost("grabar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<GrabarUsuarioResponse>> Grabar(
        [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
      [FromBody] GrabarUsuarioRequest request)
        {
            try
            {
                // Inicialización de registro en ElasticSearch
                InitLog(CONSUMER, REFERENCE_ID, string.Empty);

                // Validaciones de parámetros de entrada
                request.IsValid();

                // Ejecución de la operación de datos
                var response = new GrabarUsuarioResponse();

                await Task.Factory.StartNew(() =>
                {
                    response = mapeoDatosUsuario.Grabar(request);
                });
                 
                return response;
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }


        [HttpPut("modificar")]
        [ProducesResponseType(StatusCodes.Status202Accepted)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<GrabarUsuarioResponse>> Modificar(
      [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
      [FromBody] GrabarUsuarioRequest request)
        {
            try
            {
                // Inicialización de registro en ElasticSearch
                InitLog(CONSUMER, REFERENCE_ID, string.Empty);

                // Validaciones de parámetros de entrada
                request.IsValid();

                // Ejecución de la operación de datos
                var response = new GrabarUsuarioResponse();
                await Task.Factory.StartNew(() =>
                {
                    response = mapeoDatosUsuario.Actualizar(request);
                });

                return Accepted(response);
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }



        [HttpDelete("eliminar")]
        [ProducesResponseType(StatusCodes.Status202Accepted)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<GrabarUsuarioResponse>> Eliminar(
      [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
      [FromBody] GrabarUsuarioRequest request)
        {
            try
            {
                // Inicialización de registro en ElasticSearch
                InitLog(CONSUMER, REFERENCE_ID, string.Empty);

                // Validaciones de parámetros de entrada
                request.IsValid();

                // Ejecución de la operación de datos
                var response = new GrabarUsuarioResponse();
                await Task.Factory.StartNew(() =>
                {
                    response = mapeoDatosUsuario.Eliminar(request);
                });

                return Accepted(response);
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }


    }
}
