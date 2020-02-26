using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Login(string uid,string password)
        {
            string result = null;
            string a = null;

            String str = "data source=(local);database=Information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            command.CommandText = "Select  uid ,password From yonghu where uid= @uid and password=@password  ";
            command.Parameters.Add("@uid", SqlDbType.NChar);
            command.Parameters.Add("@password",SqlDbType.NVarChar);
            command.Parameters["@uid"].Value = uid;
            command.Parameters["@password"].Value = password;
            SqlDataReader reader = command.ExecuteReader();
            
            if (reader.Read())
            {
                result = "1";

            }
            
            reader.Close();

            //conn.Close();
            if (result != "1") {
               
            
                  SqlCommand command1 = conn.CreateCommand();
                  command1.CommandText = "Select  aid ,password From Admin where aid= @uid and password=@password  ";
                  command1.Parameters.Add("@uid", SqlDbType.NChar);
                  command1.Parameters.Add("@password", SqlDbType.NVarChar);
                  command1.Parameters["@uid"].Value = uid;
                  command1.Parameters["@password"].Value = password;
                  SqlDataReader reader1 = command1.ExecuteReader();
                  if (reader1.Read()){
                        result = "2";
                    }
                else
                {
                    result = "0";
                }


               
            }
            
            conn.Close();
            return result;

            
        }
    }
}