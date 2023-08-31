using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crud_Web_Forms_ASP.Net_Framework_VS_2022_ORACLE
{
    public partial class Crud_Oracle : System.Web.UI.Page
    {


        OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["connection_"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit(object sender, EventArgs e)

        {
            try { 
                con.Open(); 
                OracleCommand oc = new OracleCommand("oc_create", con);
                oc.CommandType = CommandType.StoredProcedure;

                // Agregar parámetros al procedimiento almacenado
                oc.Parameters.Add("u_email", OracleDbType.Varchar2).Value = exampleInputEmail1.Text;
                oc.Parameters.Add("u_password", OracleDbType.Varchar2).Value = exampleInputPassword1.Text;

                // Ejecutar el procedimiento almacenado
                oc.ExecuteNonQuery();

                // Cerrar la conexión
                con.Close();
            } catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }


        }
    }
}