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
    public partial class addcolumn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Setcolumn(string column_id, string column_name)
        {
            string result = "";

            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
          
        
            
            command.CommandText = "insert into column1(column_id, column_name) values('" + column_id + "','" + column_name + "')";
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
        [WebMethod]
        public static string Getpinglun()
        {
            var oo = "";
            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            command.CommandText = "select comment_id,column_name,title,comment,b.uname,comment_time from information a,yonghu b, column1 c ,comment d  where a.id = d.id and c.column_id = d.column_id and b.uid = d.uid and d.flag = 0";
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                //oo = oo + reader.GetString(0) + "###" + reader.GetString(1) + "###" + reader.GetString(2) + "###" + reader.GetString(3) + "...###" + reader.GetDateTime(4).ToLongDateString() + "###"  + reader.GetInt32(5) + "&&&"; ;
                // a = a + "&&&";
                //将数据分割可将其放入表格中
                oo = oo + reader.GetInt32(0).ToString(); ;
                oo = oo + "&&&";
                oo = oo + reader.GetString(1);
                oo = oo + "&&&";
                oo = oo + reader.GetString(2);
                oo = oo + "&&&";
                oo = oo + reader.GetString(3);
                oo = oo + "&&&";
                oo = oo + reader.GetString(4);
                oo = oo + "&&&";
                oo = oo + reader.GetDateTime(5).ToString(); 
                oo = oo + "&&&";
               

            }
            conn.Close();
            return oo;

          
        }
        [WebMethod]
        public static string tongguo(string bianhao)
        {
            string a = "0";
            int u = int.Parse(bianhao);
            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = new SqlCommand("update comment set flag=2 where comment_id=" + u, conn);
            if (command.ExecuteNonQuery() > 0)
            {
                a = "1";

            }
            conn.Close();
            return a;

        }

        [WebMethod]
        public static string bu(string bianhao)
        {
            string a = "0";
            int u = int.Parse(bianhao);
            String str = "data source=(local);database=information;Integrated Security=true";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand command = new SqlCommand("update comment set flag=1 where comment_id=" + u, conn);
            if (command.ExecuteNonQuery() > 0)
            {
                a = "1";

            }
            conn.Close();
            return a;

        }
    }
}