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
    public partial class article : System.Web.UI.Page
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

        [WebMethod]
        public static string fabuxinxi(string title, string content, string columns,  string produceman)
        {
            string result = "";
            
            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            command.CommandText = "select column_id from column1 where column_name='" + columns + "'";
            SqlDataReader reader = command.ExecuteReader();
            string a = null;
            if (reader.Read())
            {
                a = reader[0].ToString();

            }
            Console.Write(a);
            string b = null;
            b = a;
            //if (reader.Read())
            // {
            //a = reader.GetInt32(0);//将column_id 变为int类型
            // }
            reader.Close();
            
                command.CommandText = "insert into information(title,[content],column_id,aid,time) values('" + title + "','" + content + "'," + a + ",'" + produceman + "','" + DateTime.Now.ToString() + "')";
                if (command.ExecuteNonQuery() == 1)
                {
                    result = "1";//插入成功
                }
                else
                {
                    result = "2";
                }
            return result;
        }
        




       /* public static string Setdata(string name, string Select1)
                {
                    string result = null;


                    String str = "data source=(local);database=Information;Integrated Security=true";
                    SqlConnection conn = new SqlConnection(str);
                    conn.Open();
                    SqlCommand command = conn.CreateCommand();
                    command.CommandText = "Select  uid ,password From yonghu where uid= @uid and password=@password  ";
                    command.Parameters.Add("@uid", SqlDbType.NChar);
                    command.Parameters.Add("@password", SqlDbType.NVarChar);

                    command.Parameters["@uid"].Value = name ;
                    command.Parameters["@Select1"].Value = Select1;

                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        result = "1";


                    }
                    else
                    {
                        result = "0";
                    }

                    conn.Close();
                    return result;


                }*/
  
    }
}