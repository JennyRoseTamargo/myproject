using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;


namespace HelpDesk.User
   
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
           
                AddNewUser();
            
        }


        public void AddNewUser()// function to add new user
        {

            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
        SqlConnection dbConn = new SqlConnection(connStr);
        dbConn.Open();

        try
        {
            string genPassword = PasswordGenerated.Generate();
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("Jimitron Support <rose.tamargo@gmail.com>");
            mail.To.Add(txtEmailAdd.Text);
            mail.Subject = ("Jimitron User Access Verification ");
            mail.Body = ("Your Jimitron Help Desk Account! "+ "\n" + "Username:"+ " " + txtEmailAdd.Text + "\n" + "Password:" + " " +  genPassword);



            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("rose.tamargo@gmail.com", "jiniko121 ");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
           
            string insertUser = "Insert into tblUser(FirstName,LastName,EmailAddress,Password,RoleId) Values (@FirstName,@LastName,@EmailAddress,@genPassword,@RoleId)";

            SqlCommand cmdIns = new SqlCommand(insertUser, dbConn);


            cmdIns.Parameters.AddWithValue("@FirstName", txtFirstname.Text.Trim());
            cmdIns.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
            cmdIns.Parameters.AddWithValue("@EmailAddress", txtEmailAdd.Text.Trim());
            cmdIns.Parameters.AddWithValue("@genPassword", genPassword.Trim());
    
            

            cmdIns.Parameters.AddWithValue("@RoleId", ddlRole.SelectedValue);
            cmdIns.ExecuteNonQuery();

            lblMsg.Text = "User added successfully.";
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
            Response.Redirect("ManageUser.aspx");



        }
    }

}