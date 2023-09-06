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

        OracleConnection con;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit(object sender, EventArgs e)

        {

            string connectionString = "Data Source=localhost; User Id=SYSTEM;Password=sys;";
            con = new OracleConnection(connectionString);
            try { 
                con.Open(); 
                OracleCommand oc = new OracleCommand("oc_create", con);
                oc.CommandType = CommandType.StoredProcedure;

                // Agregar parámetros al procedimiento almacenado
                oc.Parameters.Add("u_email", OracleDbType.Varchar2).Value = exampleInputEmail1.Text;
                oc.Parameters.Add("u_password", OracleDbType.Varchar2).Value = exampleInputPassword1.Text;
                exampleInputEmail1.Text = "";
                exampleInputPassword1.Text = "";
                // Ejecutar el procedimiento almacenado
                oc.ExecuteNonQuery();
                lblError.Text = "Usuario registrado correctamente.";
                // Cerrar la conexión
                con.Close();
            } catch (Exception ex)
            {
                lblError.Text = $"Error: {ex.Message}";
                Console.WriteLine($"Error: {ex.Message}");
            }


        }
    }
}