using safeprojectname.Entidades.Consultas;
using safeprojectname.Entidades.Operaciones;
using safeprojectname.Utils;
using GDifare.Utilitario.BaseDatos;
using GDifare.Utilitario.Comun;
using System;
using System.Data;


namespace safeprojectname.Datos
{
    public interface IMapeoDatosEjemplo
    {
        Ejemplo Obtener(int idEjemplo);
        PagedCollection<Ejemplo> ObtenerListado(ListarEjemplosQuery query);
        GrabarEjemploResponse Grabar(GrabarEjemploRequest request);
        GrabarEjemploResponse Grabar2(GrabarEjemploRequest request);

    }

    public class MapeoDatosEjemplo : MapeoDatosBase, IMapeoDatosEjemplo
    {
        #region Constructores de la clase

        public MapeoDatosEjemplo(ISqlServer _sqlServer)
            : base(_sqlServer) { }

        #endregion

        #region Implementación de la interface

        GrabarEjemploResponse IMapeoDatosEjemplo.Grabar(GrabarEjemploRequest request)
        {
            // Ejemplo: Se valida si existe el registro
            if (request.IdEjemplo > 0)
            {
                var ejemplo = ObtenerEjemplo(request.IdEjemplo);

                // Si no existe se genera una respuesta de operación no exitosa.
                if (ejemplo == null)
                {
                    return new GrabarEjemploResponse(
                        MensajesEjemplos.CODE_ERROR_VAL_01,
                        MensajesEjemplos.ERROR_VAL_01);
                }
            }

            // Se graba el registro
            var idEjemplo = GrabarEjemplo(request);

            return new GrabarEjemploResponse()
            {
                IdEjemplo = idEjemplo
            };
        }

        GrabarEjemploResponse IMapeoDatosEjemplo.Grabar2(GrabarEjemploRequest request)
        {

            // Ejemplo: Se valida si existe el registro
            if (request.IdEjemplo > 0)
            {
                var ejemplo = ObtenerEjemplo(request.IdEjemplo);

                // Si no existe se genera una respuesta de operación no exitosa.
                if (ejemplo != null)
                {
                    return new GrabarEjemploResponse(
                        MensajesEjemplos.CODE_ERROR_VAL_01,
                        MensajesEjemplos.ERROR_VAL_01);
                }
            }

            // Se graba el registro
            var idEjemplo = GrabarEjemplo2(request);

            return new GrabarEjemploResponse()
            {
                IdEjemplo = idEjemplo
            };
        }

        Ejemplo IMapeoDatosEjemplo.Obtener(int idEjemplo)
        {
            return ObtenerEjemplo(idEjemplo);
        }

        PagedCollection<Ejemplo> IMapeoDatosEjemplo.ObtenerListado(ListarEjemplosQuery query)
        {
            return ObtenerListadoEjemplos(query);
        }

        #endregion

        #region Métodos de consulta de la clase

        /**    private Ejemplo ObtenerEjemplo(int idEjemplo) 
            {
                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "C");
                SqlServer.AddParameter("@i_id_ejemplo", SqlDbType.Int, idEjemplo);

                
                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExample);

                if (dataSet.Tables.Count == 0) return null;
                if (dataSet.Tables[0].Rows.Count == 0) return null;

                var ejemplo = ConvertTo<Ejemplo>(dataSet.Tables[0]);

                // Se devuelve el objeto
                return ejemplo;
            }
        **/

        private Ejemplo ObtenerEjemplo(int idEjemplo)
        {
            try
            {
                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "C");
                SqlServer.AddParameter("@i_id_ejemplo", SqlDbType.Int, idEjemplo);

                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExample);

                if (dataSet.Tables.Count == 0) return null;
                if (dataSet.Tables[0].Rows.Count == 0) return null;

                var ejemplo = ConvertTo<Ejemplo>(dataSet.Tables[0]);

                return ejemplo;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Ocurrió un error al obtener el ejemplo: " + ex.Message);
                return null;
            }
        }
        private PagedCollection<Ejemplo> ObtenerListadoEjemplos(ListarEjemplosQuery query)
        {
            // Se establecen los parámetros del procedimiento a ejecutar
            SqlServer.AddParameter("@i_accion", SqlDbType.Char, "G");
            SqlServer.AddParameter("@i_campo_uno", SqlDbType.VarChar, query.CampoConsulta);
            SqlServer.AddParameter("@i_offset", SqlDbType.Int, query.Offset);
            SqlServer.AddParameter("@i_limit", SqlDbType.Int, query.Limit);

            // Se realiza la consulta a la base de datos
            var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExample);

            // Se genera la consulta paginada
            var totalRegistros = Convert.ToInt32(dataSet.Tables[0].Rows[0]["total_registros"]);
            var ejemplos = ConvertToList<Ejemplo>(dataSet.Tables[1]);

            // Se devuelve el objeto
            return new PagedCollection<Ejemplo>(ejemplos, totalRegistros, query.Limit);
        }
        /*    private PagedCollection<Ejemplo> ObtenerListadoEjemplos(ListarEjemplosQuery query)
             {

                 try
                 {
                     // Se establecen los parámetros del procedimiento a ejecutar
                     SqlServer.AddParameter("@i_accion", SqlDbType.Char, "G");
                     SqlServer.AddParameter("@i_campo_uno", SqlDbType.VarChar, query.CampoConsulta);
                     SqlServer.AddParameter("@i_offset", SqlDbType.Int, query.Offset);
                     SqlServer.AddParameter("@i_limit", SqlDbType.Int, query.Limit);

                     // Se realiza la consulta a la base de datos
                     var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExample);
                     Console.WriteLine("Ocurrió un error al CONSULTAR el ejemplo: " + dataSet);
                     // Se genera la consulta paginada



                     var totalRegistros = Convert.ToInt32(dataSet.Tables[0].Rows[0]["total_registros"]);
                     string jsonString = JsonConvert.SerializeObject(dataSet.Tables[1]);
                     List<Ejemplo> ejemplos = JsonConvert.DeserializeObject<List<Ejemplo>>(jsonString);

                   //  int NewtotalRegistros = int.Parse(totalRegistros.ToString());
                     // Se devuelve el objeto
                     return new PagedCollection<Ejemplo>(ejemplos, totalRegistros, query.Limit);

                 }
                 catch(SqlException e)
                 {
                     Console.WriteLine("Ocurrió un error al CONSULTAR el ejemplo: " + e.Message);
                     return null;
                 }

             } */

        /*    private PagedCollection<Ejemplo> ObtenerListadoEjemplos(ListarEjemplosQuery query)
            {
                try
                {
                    // Se establecen los parámetros del procedimiento a ejecutar
                    SqlServer.AddParameter("@i_accion", SqlDbType.Char, "G");
                    SqlServer.AddParameter("@i_campo_uno", SqlDbType.VarChar, query.CampoConsulta);
                    SqlServer.AddParameter("@i_offset", SqlDbType.Int, query.Offset);
                    SqlServer.AddParameter("@i_limit", SqlDbType.Int, query.Limit);

                    // Se realiza la consulta a la base de datos
                    var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExample);

                    // Se genera la consulta paginada
                    var totalRegistros = JsonSerializer.Serialize(dataSet.Tables[0].Rows[0]["total_registros"]);
                    var ejemplosJson = JsonSerializer.Serialize(dataSet.Tables[1]);

                    // Deserializar el JSON a una lista de objetos Ejemplo
                    var ejemplosList = JsonSerializer.Deserialize<List<Ejemplo>>(ejemplosJson);

                    int newTotalRegistros = int.Parse(totalRegistros.ToString());

                    // Se devuelve el objeto
                    return new PagedCollection<Ejemplo>(ejemplosList, newTotalRegistros, query.Limit);
                }
                catch (SqlException e)
                {
                    Console.WriteLine("Ocurrió un error al CONSULTAR el ejemplo: " + e.Message);
                    return null;
                }
            }

            */
        #endregion

        #region Métodos de operaciones de la clase

        private int GrabarEjemplo(GrabarEjemploRequest request)
        {

            try
            {
                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, request.IdEjemplo.Equals(0) ? "I" : "M");
                SqlServer.AddParameter("@i_id_ejemplo", SqlDbType.Int, request.IdEjemplo);
                SqlServer.AddParameter("@i_campo_uno", SqlDbType.VarChar, request.CampoRequerimiento);

                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExample);

                var response = int.Parse(dataSet.Tables[0].Rows[0]["id_ejemplo"].ToString());

                return response;


            }catch (Exception ex) {
                Console.WriteLine("Ocurrió un error al CREAR el ejemplo: " + ex.Message);
                return 7;
            }
           
        }
        private int GrabarEjemplo2(GrabarEjemploRequest request)
        {

            try
            {
                // Se establecen los parámetros del procedimiento a ejecutar
                SqlServer.AddParameter("@i_accion", SqlDbType.Char, "I"  );
            SqlServer.AddParameter("@i_id_ejemplo", SqlDbType.Int, request.IdEjemplo);
                SqlServer.AddParameter("@i_campo_uno", SqlDbType.VarChar, request.CampoRequerimiento);

                // Se realiza la consulta a la base de datos
                var dataSet = SqlServer.ExecuteProcedure(StringHandler.ProcedureExample);


                return int.Parse(dataSet.Tables[0].Rows[0]["id_ejemplo"].ToString());


            }
            catch (Exception ex)
            {
                Console.WriteLine("Ocurrió un error al CREAR el ejemplo: " + ex.Message);
                return 0;
            }

        }

        #endregion
    }
}