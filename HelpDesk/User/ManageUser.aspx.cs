using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;



namespace HelpDesk
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            UsersEvents();

        }


        protected void UsersEvents()
        {

            SqlDataSource gridsource = new SqlDataSource();
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();

            gridsource.ConnectionString = connStr;

            gridsource.SelectCommand = "SELECT * FROM [tblUser]";
            gridsource.UpdateCommand = "Update [tblUser] Set [FirstName] = @FirstName , [Lastname]= @LastName , [EmailAddress] = @EmailAddress , [RoleId] = @RoleId  WHERE [UserId] = @UserId";
            gridsource.DeleteCommand = "DELETE FROM [tblUser] WHERE [UserId] = @UserId";

            //delete parameters 
            Parameter Deletepm = new Parameter();
            Deletepm.Name = "UserId";
            Deletepm.DbType = DbType.Int32;
            gridsource.DeleteParameters.Add(Deletepm);

            // update parameters
            Parameter Updatepm = new Parameter();

            Updatepm.Name = "UserId";
            Updatepm.DbType = DbType.Int32;

            Updatepm.Name = "FirstName";
            Updatepm.DbType = DbType.String;

            Updatepm.Name = "Lastname";
            Updatepm.DbType = DbType.String;

            Updatepm.Name = "EmailAddress";
            Updatepm.DbType = DbType.String;

            //Updatepm.Name = "Password";
            //Updatepm.DbType = DbType.String;

            //Updatepm.Name = "ProjectId";
            //Updatepm.DbType = DbType.Int32;

            Updatepm.Name = "RoleId";
            Updatepm.DbType = DbType.Int32;
            gridsource.UpdateParameters.Add(Updatepm);


            rg_Users.DataSource = gridsource;

            bool isRoleAdded = false;
            // bool isProjectAdded =  false;

            foreach (GridColumn col in rg_Users.MasterTableView.Columns)
            {
                //if(col.UniqueName == "ProjectId")
                //    isProjectAdded = true;
                if (col.UniqueName == "RoleId")
                    isRoleAdded = true;
            }

            //Projects
            //sourceproj.ConnectionString = connStr;
            //sourceproj.SelectCommand = "SELECT * FROM [tblGroupProjectName]";
            //GridDropDownColumn ddlProject = new GridDropDownColumn();

            //if (!isProjectAdded)
            //    rg_Users.MasterTableView.Columns.Add(ddlProject);


            //ddlProject.UniqueName = "ProjectId";
            //ddlProject.HeaderText = "Project Name";
            //ddlProject.DataSourceID = "sourceproj";
            //ddlProject.DataField = "ProjectId";
            //ddlProject.ListTextField = "ProjectName";
            //ddlProject.ListValueField = "ProjectId";


            // roles
            GridDropDownColumn ddlRole = new GridDropDownColumn();
            sourceRole.ConnectionString = connStr;
            sourceRole.SelectCommand = "SELECT * FROM [tblUserRole]";

            if (!isRoleAdded)
                rg_Users.MasterTableView.Columns.Add(ddlRole);

            ddlRole.UniqueName = "RoleId";
            ddlRole.HeaderText = "Role";
            ddlRole.DataSourceID = "sourceRole";
            ddlRole.DataField = "RoleId";
            ddlRole.ListTextField = "UserRole";
            ddlRole.ListValueField = "RoleId";


        }


        protected void rg_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
        {
            GridEditableItem item = (GridEditableItem)e.Item;
            String id = item.GetDataKeyValue("UserId").ToString();

            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                SetMessage("User with ID " + id + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("User with ID " + id + " is updated!");
            }
        }

        protected void rg_ItemInserted(object source, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                SetMessage("User cannot be inserted. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("New User is inserted!");
            }
        }

        protected void rg_ItemDeleted(object source, GridDeletedEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.Item;
            String id = dataItem.GetDataKeyValue("UserId").ToString();

            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                SetMessage("UserId with ID " + id + " cannot be deleted. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("User with ID " + id + " is deleted!");
            }
        }

        private void DisplayMessage(string text)
        {
            rg_Users.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }

        private void SetMessage(string message)
        {
            gridMessage = message;
        }

        private string gridMessage = null;
        protected void rg_DataBound(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(gridMessage))
            {
                DisplayMessage(gridMessage);
            }
        }
        protected void rg_ItemCommand(object source, GridCommandEventArgs e)
        {
            if (e.CommandName == "Redirect")
            {
                GridDataItem item = (GridDataItem)e.Item;
                string value = item.GetDataKeyValue("UserId").ToString(); // Get the value in clicked row 
                // Save the required  value in session 
                string url = "UpdateUser.aspx?id=" + value;
                Response.Redirect(url);

            }


        }
    }
}