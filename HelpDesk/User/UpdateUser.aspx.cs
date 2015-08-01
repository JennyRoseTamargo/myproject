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
using Telerik.Web.UI;

namespace HelpDesk.User
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                GetUser(id);
            }
        }
        public void GetUser(int guid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {

                string selectedTicket = @"SELECT FirstName, LastName, EmailAddress, RoleId
                                          FROM tblUser
                                            where UserId = " + guid.ToString();
                SqlCommand cmdIns = new SqlCommand(selectedTicket, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();


                while (rdr.Read())
                {

                    txtFname.Text = rdr["FirstName"].ToString();
                    txtLName.Text = rdr["LastName"].ToString();
                    txtEmailAdd.Text = rdr["EmailAddress"].ToString();
                    //ddlProject.SelectedValue = rdr["ProjectId"].ToString();
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

        public void GetRole() //get list of Role
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                string selectedRole = "Select RoleId,UserRole from tblUserRole";

                SqlCommand cmdIns = new SqlCommand(selectedRole, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                while (rdr.Read())
                {


                    ListItem item = new ListItem(rdr["UserRole"].ToString(), rdr["RoleId"].ToString());
                    ddlRole.Items.Add(item);



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
 

        protected void btnUpdate_Click(object sender, EventArgs e) //button click event for update user
        {
            int ID = Convert.ToInt32(Request.QueryString["id"]);
            UpdateUsers(ID);

        }
        public void UpdateUsers(int uId) // function for update user
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
              
                string updateTicket = @"Update tblUser Set FirstName = @FirstName ,LastName = @LastName, EmailAddress = @EmailAddress,
                                        RoleId = @RoleId
                                        WHERE UserId = " + uId.ToString();


                SqlCommand cmdIns = new SqlCommand(updateTicket, dbConn);



              

                cmdIns.Parameters.AddWithValue("@FirstName", txtFname.Text.Trim());
                cmdIns.Parameters.AddWithValue("@LastName", txtLName.Text.Trim());
                cmdIns.Parameters.AddWithValue("@EmailAddress", txtEmailAdd.Text.Trim());
                //scmdIns.Parameters.AddWithValue("@ProjectId", ddlProject.Text.Trim());
                cmdIns.Parameters.AddWithValue("@RoleId", ddlRole.Text.Trim());
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
            Response.Redirect("ManageUser2.aspx");
        }


    }
}