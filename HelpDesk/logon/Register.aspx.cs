using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace HelpDesk.logon
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string emailadd = Login1.UserName;
            string password = Login1.Password;
            string connString;
            connString = WebConfigurationManager.ConnectionStrings["HelpDeskConnString"].ConnectionString;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
           // string selectUser = "Select EmailAddress, Password from tblUser where EmailAddress = '" + emailadd + "' AND Password = '" + password + "'" ;
            string selectUser = "Select EmailAddress, Password from tblUser where EmailAddress = '" + emailadd + "'  AND Password = '" + password + "'";
            SqlCommand cmd = new SqlCommand(selectUser, con);
            string CurrentName;
            CurrentName = (string)cmd.ExecuteScalar();
            if (CurrentName != null)
            {
                
                Session["UserAuthentication"] = emailadd;
                Session.Timeout = 1;
                Response.Redirect("Default2.aspx");
            }
         
            else
            {
                Session["UserAuthentication"] = "";
            }
        }




    }
}