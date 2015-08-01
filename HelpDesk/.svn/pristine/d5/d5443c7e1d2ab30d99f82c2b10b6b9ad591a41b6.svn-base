using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using Telerik.Web.UI;

namespace HelpDesk.ProjectName
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProjectEvents();
        }
        protected void ProjectEvents()
        {
            SqlDataSource gridsource = new SqlDataSource();
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();

            gridsource.ConnectionString = connStr;

            gridsource.SelectCommand = "SELECT * FROM [tblGroupProjectName]";
            gridsource.UpdateCommand = "Update [tblGroupProjectName] Set [ProjectName] = @ProjectName  WHERE [ProjectId] = @ProjectId";
            gridsource.DeleteCommand = "DELETE FROM [tblGroupProjectName] WHERE [ProjectId] = @ProjectId";
            gridsource.InsertCommand = "Insert into [tblGroupProjectName] ([ProjectName]) VALUES (@ProjectName)";

            //delete parameters
            Parameter Deletepm = new Parameter();
            Deletepm.Name = "ProjectId";
            Deletepm.DbType = DbType.Int32;
            gridsource.DeleteParameters.Add(Deletepm);

            //update paramaters
            Parameter Updatepm = new Parameter();
            Updatepm.Name = "ProjectName";
            Updatepm.DbType = DbType.String;

            Updatepm.Name = "ProjectId";
            Updatepm.DbType = DbType.String;
            gridsource.UpdateParameters.Add(Updatepm);

            //insert parameters
            Parameter insertpm = new Parameter();
            insertpm.Name = "ProjectName";
            insertpm.DbType = DbType.String;
            gridsource.UpdateParameters.Add(insertpm);

            rg_Projects.DataSource = gridsource;
        }

        protected void rg_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
        {
            GridEditableItem item = (GridEditableItem)e.Item;
            String id = item.GetDataKeyValue("ProjectId").ToString();

            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                SetMessage("Project with ID " + id + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("Project with ID " + id + " is updated!");
            }
        }

        protected void rg_ItemInserted(object source, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                SetMessage("Project cannot be inserted. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("New Project is inserted!");
            }
        }

        protected void rg_ItemDeleted(object source, GridDeletedEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.Item;
            String id = dataItem.GetDataKeyValue("ProjectId").ToString();

            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                SetMessage("Project with ID " + id + " cannot be deleted. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("Project with ID " + id + " is deleted!");
            }
        }

        private void DisplayMessage(string text)
        {
            rg_Projects.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
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


    }
}