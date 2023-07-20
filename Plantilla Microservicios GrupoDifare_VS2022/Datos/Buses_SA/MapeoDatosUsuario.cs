using GDifare.Utilitario.BaseDatos;
using GDifare.Utilitario.Comun;
using MicroserviciosGD1.Entidades.Buses_SA.Consultas.ConsultasUsuario;
using MicroserviciosGD1.Entidades.Buses_SA.Operaciones.OperacionesUsuario;
   using safeprojectname.Utils;
using System;
using System.Data;

namespace MicroserviciosGD1.Datos.Buses
{
    public interface IMapeoDatosUsuario
    {
        Usuario Obtener(int id);
        PagedCollection<Usuario> ObtenerListado(ListarUsuarioQuery query);
        public GrabarUsuarioResponse Actualizar(GrabarUsuarioRequest request);
        public GrabarUsuarioResponse Eliminar(GrabarUsuarioRequest request);

        GrabarUsuarioResponse Grabar(GrabarUsuarioRequest request);
    }
    public class MapeoDatosUsuario : MapeoDatosBase, IMapeoDatosUsuario
    {
        public MapeoDatosUsuario(ISqlServer _sqlServer) : base(_sqlServer)
        {
        }

        public GrabarUsuarioResponse Actualizar(GrabarUsuarioRequest request)
        {
            if (request.id > 0)
            {
                var ejemplo = ObtenerUsuario(request.id);

                // Si no existe se genera una respuesta de operación no exitosa.
                if (ejemplo == null)
                {
                    return new GrabarUsuarioResponse(
                        MensajesEjemplos.CODE_ERROR_VAL_01,
                        MensajesEjemplos.ERROR_VAL_01);
                }
            }

            // Se graba el registro 
            var id = ActualizarUsuario(request);

            return new GrabarUsuarioResponse()
            {
                id = id
            };
        }

        public GrabarUsuarioResponse Eliminar(GrabarUsuarioRequest request)
        {
            if (request.id > 0)
            {
                var ejemplo = ObtenerUsuario(request.id);

                // Si no existe se genera una respuesta de operación no exitosa.
                if (ejemplo == null)
                {
                    return new GrabarUsuarioResponse(
                        MensajesEjemplos.CODE_ERROR_VAL_01,
                        MensajesEjemplos.ERROR_VAL_01);
                }
            }

            // Se graba el registro
            var id = EliminarUsuario(request);

            return new GrabarUsuarioResponse()
            {
                id = id
            };
        }

        public GrabarUsuarioResponse Grabar(GrabarUsuarioRequest request)
        {
            if (request.id > 0)
            {
                var ejemplo = ObtenerUsuario(request.id);

                // Si no existe se genera una respuesta de operación no exitosa.
                if (ejemplo == null)
                {
                    return new GrabarUsuarioResponse(
                        MensajesEjemplos.CODE_ERROR_VAL_01,
                        MensajesEjemplos.ERROR_VAL_01);
                }
            }

            // Se graba el registro
            var id = GuardarUsuario(request);

            return new GrabarUsuarioResponse()
            {
                id = id
            };
        }

        public Usuario Obtener(int id)
        {
            return ObtenerUsuario(id);
        }

        public PagedCollection<Usuario> ObtenerListado(ListarUsuarioQuery query)
        {
            return ObtenerListadoUsuarios(query);
        }

        // Métodos
        private Usuario ObtenerUsuario(int id)
        {
            try
            {

                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "C");
                SqlServer.AddParameter("@i_id", SqlDbType.Int, id);



                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureBU_Usuario);

                if (dataSet.Tables.Count == 0) return null;
                if (dataSet.Tables[0].Rows.Count == 0) return null;

                var ejemplo = ConvertTo<Usuario>(dataSet.Tables[0]);

                return ejemplo;

            }
            catch (Exception ex)
            {
                Console.WriteLine("Ocurrió un error al obtener el ejemplo: " + ex.Message);
                return null;
            }
        }

        private PagedCollection<Usuario> ObtenerListadoUsuarios(ListarUsuarioQuery query)
        {
            try
            {
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "G");
                SqlServer.AddParameter("@i_apellido", SqlDbType.VarChar, query.CampoConsulta);
                SqlServer.AddParameter("@i_offset", SqlDbType.Int, query.Offset);
                SqlServer.AddParameter("@i_limit", SqlDbType.Int, query.Limit);

                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureBU_Usuario);

                // Se genera la consulta paginada
                var totalRegistros = Convert.ToInt32(dataSet.Tables[0].Rows[0]["total_registros"]);
                var ejemplos = ConvertToList<Usuario>(dataSet.Tables[1]);

                // Se devuelve el objeto
                return new PagedCollection<Usuario>(ejemplos, totalRegistros, query.Limit);
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); return null; }
        }

        private int ActualizarUsuario(GrabarUsuarioRequest request)
        {
            try
            {

                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char,   "U");
                SqlServer.AddParameter("@i_id", SqlDbType.Int, request.id);
                SqlServer.AddParameter("@i_nombre", SqlDbType.VarChar, request.nombre);
                SqlServer.AddParameter("@i_apellido", SqlDbType.VarChar, request.apellido);
                SqlServer.AddParameter("@i_clave", SqlDbType.VarChar, request.clave);
                SqlServer.AddParameter("@i_username", SqlDbType.VarChar, request.username);
                SqlServer.AddParameter("@i_cedula", SqlDbType.VarChar, request.cedula);
                SqlServer.AddParameter("@i_estado", SqlDbType.VarChar, request.estado);


                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureBU_Usuario);

                var response = int.Parse(dataSet.Tables[0].Rows[0]["id"].ToString());

                return response;

            }
            catch (Exception ex)
            {
                Console.WriteLine("Ocurrió un error al CREAR el ejemplo: " + ex.Message);
                return 7;
            }
        }


        private int EliminarUsuario(GrabarUsuarioRequest request)
        {
            try
            {

                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "D");
                SqlServer.AddParameter("@i_id", SqlDbType.Int, request.id);
                SqlServer.AddParameter("@i_nombre", SqlDbType.VarChar, request.nombre);
                SqlServer.AddParameter("@i_apellido", SqlDbType.VarChar, request.apellido);
                SqlServer.AddParameter("@i_clave", SqlDbType.VarChar, request.clave);
                SqlServer.AddParameter("@i_username", SqlDbType.VarChar, request.username);
                SqlServer.AddParameter("@i_cedula", SqlDbType.VarChar, request.cedula);
                SqlServer.AddParameter("@i_estado", SqlDbType.VarChar, request.estado);



                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureBU_Usuario);

                var response = int.Parse(dataSet.Tables[0].Rows[0]["id"].ToString());

                return response;

            }
            catch (Exception ex)
            {
                Console.WriteLine("Ocurrió un error al CREAR el ejemplo: " + ex.Message);
                return 7;
            }
        }

        private int GuardarUsuario(GrabarUsuarioRequest request)
        {
            try
            {

                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "I");
                SqlServer.AddParameter("@i_id", SqlDbType.Int, request.id);
                SqlServer.AddParameter("@i_nombre", SqlDbType.VarChar, request.nombre);
                SqlServer.AddParameter("@i_apellido", SqlDbType.VarChar, request.apellido);
                SqlServer.AddParameter("@i_clave", SqlDbType.VarChar, request.clave);
                SqlServer.AddParameter("@i_username", SqlDbType.VarChar, request.username);
                SqlServer.AddParameter("@i_cedula", SqlDbType.VarChar, request.cedula);
                SqlServer.AddParameter("@i_estado", SqlDbType.VarChar, request.estado);


                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureBU_Usuario);

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
