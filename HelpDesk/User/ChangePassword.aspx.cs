using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace HelpDesk.User
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyAccount.aspx");
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            Change_Password();
        }

        byte up;
        public void Change_Password()
        {
             string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

          
            {
                string selectUser = "select EmailAddress, Password from tblUser";
                SqlCommand cmd = new SqlCommand(selectUser, dbConn);

                SqlDataReader reader = cmd.ExecuteReader();

                 while (reader.Read())
                 {
                    
                     if (txtCurrpass.Text == reader["Password"].ToString())
                     {
                        
                         up = 1;
                     }
                 }
                  reader.Close();
            dbConn.Close();

            if (up == 1)
            {
                string strConnString = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ConnectionString;
                
                SqlCommand com;
                dbConn.Open();

                string  updatepass="Update tblUser set Password = @Password where EmailAddress = '" + Session["UserEmail"].ToString()+ "'";
                com = new SqlCommand(updatepass, dbConn);
                com.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar, 50));
                com.Parameters["@Password"].Value = txtNewPass.Text;
                com.ExecuteNonQuery();
                dbConn.Close();
                lbl_msg.Text = "Password Changed Successfully.";
            }
                else
                {
                    lbl_msg.Text = "Please enter correct Current Password";
                }

            }
          

         }

       
    }
}