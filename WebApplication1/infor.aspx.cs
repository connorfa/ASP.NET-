using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class infor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
       
        public static string xinxichaxun(string user)
        {
            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            command.CommandText = "select id,title,content,time,aname,column_name from information a,Admin b,column1 c where a.aid=b.aid and a.column_id=c.column_id and c.column_name='" + user + "'";
            string a = null;
            SqlDataReader reader = command.ExecuteReader();
            //if (reader.Read())
           // {
             //   a = reader[0].ToString();

          //  }
          //  Console.Write(a);
          //  string b = null;
           // b = a;
            string oo = "";
            while (reader.Read())
            {

                //result = result + reader.GetInt32(0) + "###" + reader.GetString(1) + "###" + reader.GetString(2)+ "###" + reader.GetDateTime(3).ToLongDateString() + "###" + reader.GetString(4) + "###" + reader.GetString(5) + "&&&";
                oo = oo + reader.GetInt32(0).ToString(); ;
                oo = oo + "&&&";
                oo = oo + reader.GetString(1);
                oo = oo + "&&&";
                oo = oo + reader.GetString(2);
                oo = oo + "&&&";
                oo = oo + reader.GetDateTime(3).ToString();
                oo = oo + "&&&";
                oo = oo + reader.GetString(4);
                oo = oo + "&&&";
                oo = oo + reader.GetString(5);
                oo = oo + "&&&";

            }
            reader.Close();
            conn.Close();
            return oo;
        }
        [WebMethod]
        public static string xinxishanchu(string user)
        {
            string result = "0";
            try
            {
                String str = "data source=(local);database=information;Integrated Security=true";
                SqlConnection conn = new SqlConnection(str);
                conn.Open();
                SqlCommand command = conn.CreateCommand();
                //int a = int.Parse(user);
                string a = user;
                command.CommandText = "delete from information where id=" + a;
                if (command.ExecuteNonQuery() == 1)
                {
                    result = "1";
                }
                else
                {
                    result = "2";
                }
                conn.Close();
            }
            catch (Exception)
            {
                result = "0";
                return result;
            }

            return result;
        }
    }
}
