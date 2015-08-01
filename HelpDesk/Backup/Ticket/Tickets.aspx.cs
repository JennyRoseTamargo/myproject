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
using System.Data.SqlClient;

namespace HelpDesk.Ticket
{
    public partial class Tickets : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           // rcbTitles();
            TicketEvents();

           
            //RadGrid grid = rcb_SubjectTitle.Items[0].FindControl("rg_tickets") as RadGrid;
            //RadAjaxManager1.AjaxSettings.AddAjaxSetting(RadAjaxManager1, grid, RadAjaxLoadingPanel1);
        }
        
        protected void TicketEvents()
        {

            SqlDataSource gridsource = new SqlDataSource();
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();

            gridsource.ConnectionString = connStr;

            gridsource.SelectCommand = @"SELECT TicketId ,Subject, 
                                        (select u.FirstName from tblUser as u where u.UserId = tblTicket.Requester) as Requester, 
                                         tblTicket.DateAndTime,tblPriority.PriorityName AS Priority, tblStatus.StatusName as Status
                                         FROM tblTicket, tblStatus, tblPriority 
                                         where tblTicket.StatusId = tblStatus.StatusId 
                                         and tblTicket.PriorityId = tblPriority.PriorityId";
            gridsource.DeleteCommand = "DELETE FROM [tblTicket] WHERE [TicketId] = @TicketId";


            //ControlParameter cp = new ControlParameter();
            //cp.ControlID = "rcb_SubjectTitle";
            //cp.PropertyName = "SelectedValue";
            //cp.Name = "TicketId";
            //cp.Type = TypeCode.Int32;
            //cp.DefaultValue = "";




            //gridsource.SelectParameters.Add(cp);

            //delete parameters
            Parameter Deletepm = new Parameter();
            Deletepm.Name = "TicketId";
            Deletepm.DbType = DbType.Int32;
            gridsource.DeleteParameters.Add(Deletepm);

            //Page.Controls.Add(gridsource);

            rg_Tickets.DataSource = gridsource;
           // rg_Tickets.DataBind();
            
            }

        //protected void sqldsRequestsFiltered_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        //{
        //    RadComboBox selectionComboBox = rcb_SubjectTitle.Items[0].FindControl("rcb_SubjectTitle") as RadComboBox;
        //    e.Command.Parameters["@Subject"].Value = selectionComboBox.SelectedValue;
        //}


        //public static string connectionString = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ConnectionString;
        //public static DataTable GetDataTable(string query)
        //{
        //    SqlConnection connection = new SqlConnection(connectionString);
        //    SqlDataAdapter adapter = new SqlDataAdapter();
        //    adapter.SelectCommand = new SqlCommand(query, connection);
        //    DataTable tblFilterSubject = new DataTable();
        //    connection.Open();
        //    try
        //    {
        //        adapter.Fill(tblFilterSubject);
        //    }
        //    finally
        //    {
        //        connection.Close();
        //    }
        //    return tblFilterSubject;
        //}

        //protected void rg_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        //{
        //    RadGrid grid = source as RadGrid;
        //    if (rcb_SubjectTitle.Text != "")
        //    {
        //        //split the combobox text and filter the records  in the grid based on the first value in the array, i.e. OrderID
        //        String[] vals = rcb_SubjectTitle.Text.Split(',');
        //        if (vals.Length > 0)
        //        {
        //            rcb_SubjectTitle.Text = vals[0];
        //        }
              
        //         grid.DataSource = GetDataTable("SELECT TicketId ,Subject, "+
        //                               " (select u.FirstName from tblUser as u where u.UserId = tblTicket.Requester) as Requsteer, "+
        //                                " tblTicket.DateAndTime,tblPriority.PriorityName AS Priority, tblStatus.StatusName as Status "+
        //                                 "FROM tblTicket, tblStatus, tblPriority "+
        //                                " where tblTicket.StatusId = tblStatus.StatusId"+ 
        //                                 "and tblTicket.PriorityId = tblPriority.PriorityId"+
        //                                 "and TicketId LIKE '" + rcb_SubjectTitle.Text + "%'");
        //    }
        //    else
        //    {
        //        DataTable dt = new DataTable();
        //        dt.Columns.Add("TicketId");
        //        dt.Columns.Add("Subject");
        //        dt.Columns.Add("Requester");
        //        dt.Columns.Add("Priority");
        //        dt.Columns.Add("Status");
        //        dt.Columns.Add("DateAndTime");
             
        //        grid.DataSource = dt;
        //    }
            

        //}
        //protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
        //{
        //    RadGrid grid = rcb_SubjectTitle.Items[0].FindControl("rg_Tickets") as RadGrid;
        //    //detect the filter action
        //    if (e.Argument.IndexOf("LoadFilteredData") != -1)
        //    {
        //        grid.Rebind();
        //    }
        //}

        //protected void rcbTitles()
        //{

        //    SqlDataSource rcbsource = new SqlDataSource();
        //    string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();

        //    rcbsource.ConnectionString = connStr;

        //    rcbsource.SelectCommand = "Select TicketId, Subject from tblTicket";

        //    rcb_SubjectTitle.DataSource = rcbsource;
        //    rcb_SubjectTitle.DataBind();

        //}

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

        protected void rg_ItemInserted(object source, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                SetMessage("Ticket cannot be inserted. Reason: " + e.Exception.Message);
            }
            else
            {
                SetMessage("New User is inserted!");
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
            rg_Tickets.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }

        private void SetMessage(string message )
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
        protected void Tickets_Click(object sender, EventArgs e)
        {
            LinkButton lnkBtn = (LinkButton)sender;

            string selectQueryTickets = @"SELECT TicketId ,Subject, 
                                        (select u.FirstName from tblUser as u where u.UserId = tblTicket.Requester) as Requester, 
                                        tblTicket.DateAndTime,tblPriority.PriorityName AS Priority, tblStatus.StatusName as Status
                                        FROM tblTicket, tblStatus, tblPriority 
                                        where tblTicket.StatusId = tblStatus.StatusId 
                                        and tblTicket.PriorityId = tblPriority.PriorityId  ";
            if (lnkBtn == lbAllTickets)
            {
                //default
            }

            else if (lnkBtn == lbOpen)
            {
                selectQueryTickets += " and tblStatus.StatusId = 2";
            }
            else if (lnkBtn == lbPending)
            {
                selectQueryTickets += " and tblStatus.StatusId = 3";
            }
            else if (lnkBtn == lbSolved)
            {
                selectQueryTickets += "and tblStatus.StatusId = 4";
            }

            ShowAllTickets(selectQueryTickets);

        }

     public void ShowAllTickets(string query)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(query, dbConn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rg_Tickets.DataSource = dt;
                rg_Tickets.DataBind();

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
        protected void rg_ItemCommand(object source, GridCommandEventArgs e)
        {
            if (e.CommandName == "Redirect")
            {
                GridDataItem item = (GridDataItem)e.Item;
                string value = item.GetDataKeyValue("TicketId").ToString(); // Get the value in clicked row 
                // Save the required  value in session 
                string url = "UpdateTicket.aspx?id=" + value;
                Response.Redirect(url);
                
            }   
        }

        protected void NavigationMenu_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

    }
}