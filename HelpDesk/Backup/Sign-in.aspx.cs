using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Specialized;
using System.Text;
using System.Web.Security;

namespace HelpDesk
{
    public partial class Sign_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        public bool ValidUser(string emailadd, string password)
        {
            bool valid;
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();
            string loginquery = @"SELECT     tblUser.UserId, tblUser.FirstName, tblUser.LastName, tblUser.EmailAddress, tblUser.Password, tblUserRole.UserRole
                                FROM         tblUser INNER JOIN
                                             tblUserRole ON tblUser.RoleId = tblUserRole.RoleId
                                    where  tblUser.EmailAddress = '" + emailadd + "' AND tblUser.Password = '" + password + "'";

            SqlCommand cmd = new SqlCommand(loginquery, dbConn);
            SqlDataReader Dr;

            Dr = cmd.ExecuteReader();

            if (Dr.Read())
            {


                Session["SessionHolder"] = txtEmail.Text;
                Session["UserFirstName"] = Dr["FirstName"].ToString();
                Session["UserLastName"] = Dr["LastName"].ToString();
                Session["UserEmail"] = Dr["EmailAddress"].ToString();
                Session["UserPassword"] = Dr["Password"].ToString();
               // Session["UserProject"] = Dr["ProjectName"].ToString();
                Session["UserRole"] = Dr["UserRole"].ToString();
                Session["Userid"] = Dr["UserId"].ToString();
         
         
                valid = true;

            }
            else
            {
                valid = false;
            }
            Dr.Close();
            dbConn.Close();
            dbConn.Dispose();

            return valid;


        }
     

        protected void Login_Click(object sender, EventArgs e)
        {
            if (!validAccount())
            {
               // Sign_in users = new Sign_in();

                bool auth;
                auth = ValidUser(txtEmail.Text, txtPassword.Text);

                if (auth)
                {

                    FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, false);
                    Response.Redirect("~/Ticket/Tickets.aspx");

                }
                else
                {

                    lblMsg.Text = "Login failed. Please check your username and password and try again.";
                }

             
            }
         

        }

        

    
        public bool validAccount()
        {
            bool account = false;

            if (txtEmail.Text.Trim() == "")
            {
                lblMsg.Text = "Username is required";
                account = true;
            }
            else if (txtPassword.Text.Trim() == "")
            {
                lblMsg.Text = "Password is required";
                account = true;
            }
            return account;

        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {

        }
    }
}