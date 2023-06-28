using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Log;
using GDifare.Utilitario.Servicios;
using safeprojectname.Entidades.ConsultasPersona;
using safeprojectname.Entidades.OperacionesPersona;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using safeprojectname.Datos;
using System;
using System.Threading.Tasks;

namespace safeprojectname.Controllers
{
    [Route("gdifare/api/modulo/persona/v1")]
    [ApiController]
    public class PersonaController : DifareApiController
    {
        

        private readonly IMapeoDatosPersona mapeoDatosPersona;

        public PersonaController(
            IMapeoDatosPersona _mapeoDatosPersona,
            ILogHandler _logHandler)
            : base(_logHandler)
        {
            mapeoDatosPersona = _mapeoDatosPersona;
        }



        [HttpGet("consultar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<Persona>> Consultar(
            [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
            [FromQuery] ConsultarPersonaQuery query)
        {
            try
            {
                // Inicialización de registro en Elasticsearch
                InitLog(CONSUMER, REFERENCE_ID, query.id.ToString());

                // Validaciones de parámetros de entrada
                query.IsValid();

                // Ejecución de la operación de datos
                var persona = new Persona();
                await Task.Factory.StartNew(() =>
                {
                    persona = mapeoDatosPersona.Obtener(query.id);
                });


                return Ok(persona);
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }


        //
        [HttpGet("listar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<PagedCollection<Persona>>> Listar(
          [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
          [FromQuery] ListarPersonaQuery query)
        {
            try
            {
                // Inicialización de registro en ElasticSearch
                InitLog(CONSUMER, REFERENCE_ID, string.Empty);

                // Validaciones de parámetros de entrada
                query.IsValid();

                // Ejecución de la operación de datos
                var p = new PagedCollection<Persona>(null, 0, 0);
                await Task.Factory.StartNew(() =>
                {
                    p = mapeoDatosPersona.ObtenerListado(query);
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
        public async Task<ActionResult<GrabarPersonaResponse>> Grabar(
          [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
          [FromBody] GrabarPersonaRequest request)
        {
            try
            {
                // Inicialización de registro en ElasticSearch
                InitLog(CONSUMER, REFERENCE_ID, string.Empty);

                // Validaciones de parámetros de entrada
                request.IsValid();

                // Ejecución de la operación de datos
                var response = new GrabarPersonaResponse();

                await Task.Factory.StartNew(() =>
                {
                    response = mapeoDatosPersona.Grabar2(request);
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
        public async Task<ActionResult<GrabarPersonaResponse>> Modificar(
         [FromHeader] string REFERENCE_ID, [FromHeader] string CONSUMER,
         [FromBody] GrabarPersonaRequest request)
        {
            try
            {
                // Inicialización de registro en ElasticSearch
                InitLog(CONSUMER, REFERENCE_ID, string.Empty);

                // Validaciones de parámetros de entrada
                request.IsValid();

                // Ejecución de la operación de datos
                var response = new GrabarPersonaResponse();
                await Task.Factory.StartNew(() =>
                {
                    response = mapeoDatosPersona.Grabar(request);
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
