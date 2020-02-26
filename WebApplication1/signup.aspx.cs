using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace WebApplication1
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Zhuce(string uid, string uname, string password)
        {
            string result = null;
            

            String str = "data source=(local);database=Information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            command.CommandText = "Select  uid From yonghu where uid= @uid";
            command.Parameters.Add("@uid", SqlDbType.NChar);
            
            command.Parameters["@uid"].Value = uid;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                result = "0";//数据库中已有该账号

            }
            reader.Close();
            if (result != "0")
            {
                SqlCommand command1 = new SqlCommand("insert into yonghu values('" + uid + "','" + uname + "','" + password + "')", conn);
                try
                {
                    if (command1.ExecuteNonQuery() > 0)
                    {
                        result = "1";//1表示添加数据到表中
                    }
                }
                catch (Exception ex)
                {
                    result = "2";
                }
            }
            conn.Close();
            return result;

        }

        /*public static string Zhuce(string uid, string uname, string password)
        {
            String str = "server=localhost;Integrated Security=True;database=Information";
            
            string result = null;
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select *  From yonghu where uid= @uid ";
            cmd.Parameters.Add("@uid", SqlDbType.NChar);
            cmd.Parameters["@uid"].Value = uid;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result = "0";//该账号在表中已存在
            }
            reader.Close();

            if (result != "0")
            {

                SqlCommand cmd1 = conn.CreateCommand();
                cmd1.CommandText = "insert into user(uid,uname,password) values('" + uid + "','" + uname + "','" + password + "')";
                try
                {
                    if (cmd1.ExecuteNonQuery() > 0)
                    {
                        result = "1";
                    }

                }

                catch (Exception ee)
                {
                    result = "2";
                }
            }

            conn.Close();
            return result;

        }*/
    }
}