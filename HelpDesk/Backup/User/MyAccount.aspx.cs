using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HelpDesk.User
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                My_Account();
               if (Session["UserEmail"] != null)
                {
                    txtEmailAdd.Text = Session["UserEmail"].ToString();

                }
               if (Session["UserId"] != null)
               {
                   txtUserId.Text = Session["UserId"].ToString();

               }
                
            }

        }
        
       protected void lbChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        public void My_Account() 
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                string selectedAccount = @"SELECT FirstName,LastName, Password,RoleId 
                                            FROM tblUser 
                                            where EmailAddress = '" + Session["UserEmail"].ToString() + "'";

                SqlCommand cmdIns = new SqlCommand(selectedAccount, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                while (rdr.Read())
                {

                    txtFname.Text = rdr["FirstName"].ToString();
                    txtLName.Text = rdr["LastName"].ToString();
                    txtPassword.Text = rdr["Password"].ToString();
                    ddlRole.SelectedValue = rdr["RoleId"].ToString();

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString(), ex);
            }
            finally
            {
                dbConn.Close();
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateMyAccount();
        }


        public void UpdateMyAccount() 
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {

                string updateTicket = @"Update tblUser Set FirstName= @FirstName,LastName= @LastName, EmailAddress= @EmailAddress
                                        where Userid = '" + Session["UserId"].ToString() + "'";


                SqlCommand cmdIns = new SqlCommand(updateTicket, dbConn);

                cmdIns.Parameters.AddWithValue("@FirstName", txtFname.Text.Trim());
                cmdIns.Parameters.AddWithValue("@LastName", txtLName.Text.Trim());
                cmdIns.Parameters.AddWithValue("@EmailAddress", txtEmailAdd.Text.Trim());

                cmdIns.ExecuteNonQuery();

                lblMsg.Text = "User Updated Successfully.";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString(), ex);
            }
            finally
            {
                dbConn.Close();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
          //  Response.Redirect("");
        }

       
    }
}