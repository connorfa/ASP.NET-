using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string GetColumn()
        {
            var oo = "";
            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            command.CommandText = "select title,content from information  where id in(select max(id) from information )";
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                oo = oo + reader.GetString(0);
                oo = oo + "&&&";
                oo = oo + reader.GetString(1);
                oo = oo + "&&&";
            }
            conn.Close();
            return oo;
        }
        [WebMethod]
        public static string Getyule(string user)
        {
            var oo = "";
            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            command.CommandText = "select top (2) title from information a where a.column_id in(select column_id from column1 c where c.column_name='娱乐') ";
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                oo = oo + reader.GetString(0);
                oo = oo + "&&&";
                
            }
            conn.Close();
            return oo;
        }
        [WebMethod]
        public static string Gettiyu(string user)
        {
            var oo = "";
            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            command.CommandText = "select top (2) title from information a where a.column_id in(select column_id from column1 c where c.column_name='" + user + "') ";
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                oo = oo + reader.GetString(0);
                oo = oo + "&&&";

            }
            conn.Close();
            return oo;
        }
    }

}