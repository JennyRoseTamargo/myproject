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
    public partial class SelectedUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["Uid"]);
                AssignedTicketEvents(id);
                GetUserInfo(id);

            }
        }
        protected void AssignedTicketEvents(int aid)
        {

            SqlDataSource gridsource = new SqlDataSource();
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();

            gridsource.ConnectionString = connStr;

            gridsource.SelectCommand = @"SELECT TicketId ,Subject, DateAndTime,UserId,
                                        (select u.FirstName from tblUser as u where u.UserId = tblTicket.Requester) as Requester
                                        FROM tblTicket , tblUser 
                                        where tblTicket.Assignee = tblUser.UserId and tblUser.UserId = " + aid;
            gridsource.DeleteCommand = "DELETE FROM [tblTicket] WHERE [TicketId] = @TicketId";

           
            //delete parameters
            Parameter Deletepm = new Parameter();
            Deletepm.Name = "TicketId";
            Deletepm.DbType = DbType.Int32;
            gridsource.DeleteParameters.Add(Deletepm);

            rg_AssignedTickets.DataSource = gridsource;

        }

        protected void rg_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
        {
            GridEditableItem item = (GridEditableItem)e.Item;
            String id = item.GetDataKeyValue("TicketId").ToString();

            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                SetMessage("Ticket with ID " + id + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("Ticket with ID " + id + " is updated!");
            }
        }

       

        protected void rg_ItemDeleted(object source, GridDeletedEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.Item;
            String id = dataItem.GetDataKeyValue("TicketId").ToString();

            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                SetMessage("TicketId with ID " + id + " cannot be deleted. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("Ticket with ID " + id + " is deleted!");
            }
        }

        private void DisplayMessage(string text)
        {
            rg_AssignedTickets.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
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

        public void GetUserInfo(int guid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {


                string selectedTicket = @"SELECT    tblUser.UserId, tblUser.FirstName, tblUser.LastName, tblUser.EmailAddress, tblUserRole.UserRole
                                        FROM         tblUser INNER JOIN
                                                              tblUserRole ON tblUser.RoleId = tblUserRole.RoleId where tblUser.UserId= " + guid;
                SqlCommand cmdIns = new SqlCommand(selectedTicket, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();


                while (rdr.Read())
                {

                    txtEmailAdd.Text = rdr["EmailAddress"].ToString();
                    txtRole.Text = rdr["UserRole"].ToString();
                    txtFName.Text = rdr["FirstName"].ToString();
                    txtLName.Text = rdr["LastName"].ToString();
                    //txtProject.Text = rdr["ProjectName"].ToString();


                 


                }
                rdr.Close();
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


        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUser2.aspx");
        }






    }

}