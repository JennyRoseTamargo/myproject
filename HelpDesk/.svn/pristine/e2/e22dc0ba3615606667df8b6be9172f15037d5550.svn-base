using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace HelpDesk.ProjectName
{
    public partial class AddProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }


        protected void btnAddProject_Click(object sender, EventArgs e)
        {
            if (!HasError())
            {
                AddNewProject();
            }
        }
        public void AddNewProject()
        {

            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {

                string sqlInsert = "Insert into tblGroupProjectName(ProjectName) Values (@ProjectName)";

                SqlCommand cmd = new SqlCommand(sqlInsert, dbConn);


                cmd.Parameters.AddWithValue("@ProjectName", txtAddProjectName.Text.Trim());
                cmd.ExecuteNonQuery();

                lblMsg.Text = "Project added successfully.";
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


        public bool HasError()
        {

            bool error = false;

            if (txtAddProjectName.Text.Trim() == "")
            {
                lblMsg.Text = "Project name is required";
                error = true;
            }

            return error;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtAddProjectName.Text = "";

            
            
        }
    }
}



