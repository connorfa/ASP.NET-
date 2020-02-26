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
    public partial class AdminMenu : System.Web.UI.Page
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
            command.CommandText = "Select column_name From Column1 order by column_id";
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