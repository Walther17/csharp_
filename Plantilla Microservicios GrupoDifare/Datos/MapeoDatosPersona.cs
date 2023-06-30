 
using safeprojectname.Utils;
using GDifare.Utilitario.BaseDatos;
using GDifare.Utilitario.Comun;
using System;
using System.Data;
using safeprojectname.Entidades.ConsultasPersona;
using safeprojectname.Entidades.OperacionesPersona;

namespace safeprojectname.Datos
{
    public interface IMapeoDatosPersona
    {

        Persona Obtener(int id);
        PagedCollection<Persona> ObtenerListado(ListarPersonaQuery query);
        public GrabarPersonaResponse Grabar(GrabarPersonaRequest request);
        GrabarPersonaResponse Grabar2(GrabarPersonaRequest request);
    }

    public class MapeoDatosPersona : MapeoDatosBase, IMapeoDatosPersona
    {
        public MapeoDatosPersona(ISqlServer _sqlServer)
          : base(_sqlServer) { }


        public GrabarPersonaResponse Grabar(GrabarPersonaRequest request)
        {
            if (request.id > 0)
            {
                var ejemplo = ObtenerPersona(request.id);

                // Si no existe se genera una respuesta de operación no exitosa.
                if (ejemplo == null)
                {
                    return new GrabarPersonaResponse(
                        MensajesEjemplos.CODE_ERROR_VAL_01,
                        MensajesEjemplos.ERROR_VAL_01);
                }
            }

            // Se graba el registro
            var id = GrabarPersona(request);

            return new GrabarPersonaResponse()
            {
                id = id
            };
        }

        GrabarPersonaResponse IMapeoDatosPersona.Grabar2(GrabarPersonaRequest request)
        {
            if (request.id > 0)
            {
                var ejemplo = ObtenerPersona(request.id);

                // Si no existe se genera una respuesta de operación no exitosa.
                if (ejemplo != null)
                {
                    return new GrabarPersonaResponse(
                        MensajesEjemplos.CODE_ERROR_VAL_01,
                        MensajesEjemplos.ERROR_VAL_01);
                }
            }

            // Se graba el registro
            var id = GrabarPersona2(request);

            return new GrabarPersonaResponse()
            {
                id = id
            };
        }

        Persona IMapeoDatosPersona.Obtener(int id)
        {
            return ObtenerPersona(id);
        }

        PagedCollection<Persona> IMapeoDatosPersona.ObtenerListado(ListarPersonaQuery query)
        {
            return ObtenerListadoPersonas(query);
        }




        private Persona ObtenerPersona(int id)
        {
            try
            {
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "C");
                SqlServer.AddParameter("@i_id", SqlDbType.Int, id);



                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExampleP);

                if (dataSet.Tables.Count == 0) return null;
                if (dataSet.Tables[0].Rows.Count == 0) return null;

                var ejemplo = ConvertTo<Persona>(dataSet.Tables[0]);

                return ejemplo;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Ocurrió un error al obtener el ejemplo: " + ex.Message);
                return null;
            }
        }

        private PagedCollection<Persona> ObtenerListadoPersonas(ListarPersonaQuery query)
        {
            try
            {
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "G");
                SqlServer.AddParameter("@i_nombre", SqlDbType.VarChar, query.CampoConsulta);
                SqlServer.AddParameter("@i_offset", SqlDbType.Int, query.Offset);
                SqlServer.AddParameter("@i_limit", SqlDbType.Int, query.Limit);

                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExampleP);

                // Se genera la consulta paginada
                var totalRegistros = Convert.ToInt32(dataSet.Tables[0].Rows[0]["total_registros"]);
                var ejemplos = ConvertToList<Persona>(dataSet.Tables[1]);

                // Se devuelve el objeto
                return new PagedCollection<Persona>(ejemplos, totalRegistros, query.Limit);
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); return null; }
        }

        private int GrabarPersona(GrabarPersonaRequest request)
        {
            try
            {

                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, request.id.Equals(0) ? "I" : "M");
                SqlServer.AddParameter("@i_id", SqlDbType.Int, request.id);
                SqlServer.AddParameter("@i_nombre", SqlDbType.VarChar, request.nombre );
                SqlServer.AddParameter("@i_apellido", SqlDbType.VarChar, request.apellido);
                SqlServer.AddParameter("@i_domicilio", SqlDbType.VarChar, request.domicilio);
                SqlServer.AddParameter("@i_edad", SqlDbType.Int, request.edad);

                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExampleP);

                var response = int.Parse(dataSet.Tables[0].Rows[0]["id"].ToString());

                return response;

            }
            catch (Exception ex)
            {
                Console.WriteLine("Ocurrió un error al CREAR el ejemplo: " + ex.Message);
                return 7;
            }
        }

        private int GrabarPersona2(GrabarPersonaRequest request)
        {
            try
            {

                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char,  "I" );
                SqlServer.AddParameter("@i_id", SqlDbType.Int, request.id);
                SqlServer.AddParameter("@i_nombre", SqlDbType.VarChar, request.nombre);
                SqlServer.AddParameter("@i_apellido", SqlDbType.VarChar, request.apellido);
                SqlServer.AddParameter("@i_domicilio", SqlDbType.VarChar, request.domicilio);
                SqlServer.AddParameter("@i_edad", SqlDbType.Int, request.edad);

                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExampleP);

                var response = int.Parse(dataSet.Tables[0].Rows[0]["id"].ToString());

                return response;

            }
            catch (Exception ex)
            {
                Console.WriteLine("Ocurrió un error al CREAR el ejemplo: " + ex.Message);
                return 7;
            }
        }

      
    }
}
