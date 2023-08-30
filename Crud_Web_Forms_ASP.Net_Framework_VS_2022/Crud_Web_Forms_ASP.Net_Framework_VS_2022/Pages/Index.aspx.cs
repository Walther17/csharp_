using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crud_Web_Forms_ASP.Net_Framework_VS_2022.Pages
{
    public partial class Index : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        public static string sID = "-1";

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarTabla();
        }

        void CargarTabla()
        {
            SqlCommand cmd = new SqlCommand("sp_Load", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvusuarios.DataSource = dt;
            gvusuarios.DataBind();
            con.Close();
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/CRUD.aspx?op=C");
        }

        protected void BtnRead_Click(object sender, EventArgs e)
        {
            string id;
            Button BtnConsultar = (Button)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            id = selectedrow.Cells[1].Text;
            Response.Redirect("~/Pages/CRUD.aspx?id=" + id + "&op=R");
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            string id;
            Button BtnConsultar = (Button)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            id = selectedrow.Cells[1].Text;
            Response.Redirect("~/Pages/CRUD.aspx?id=" + id + "&op=U");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {


            try {
                int id;
                Button BtnConsultar = (Button)sender;
                GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
                id = Convert.ToInt32(selectedrow.Cells[1].Text);


                SqlCommand cmd = new SqlCommand("sp_delete", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
                cmd.ExecuteNonQuery();
                con.Close();
             }
            catch (Exception ex) {
                Console.WriteLine($"Error: {ex.Message}");
            }
        }
    }
}