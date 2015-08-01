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

namespace HelpDesk.Dashboard
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Tickets_Click(object sender, EventArgs e)
        {
            LinkButton lnkBtn = (LinkButton)sender;

            string selectQueryTickets = @"SELECT tblTicket.Subject, tblTicket.Requester, tblPriority.PriorityName AS Priority, tblStatus.StatusName as Status, tblTicket.TicketId
                                        FROM tblTicket INNER JOIN
                                                      tblStatus ON tblTicket.StatusId = tblStatus.StatusId INNER JOIN
                                                      tblPriority ON tblTicket.PriorityId = tblPriority.PriorityId INNER JOIN
                                                      tblType ON tblTicket.TypeId = tblType.TypeId ";
            if (lnkBtn == lbAllTickets)
            {
                //default
            }

            else if (lnkBtn == lbOpen)
            {
                selectQueryTickets += "where tblStatus.StatusId = 2";
            }
            else if (lnkBtn == lbPending)
            {
                selectQueryTickets += "where tblStatus.StatusId = 3";
            }
            else if (lnkBtn == lbSolved)
            {
                selectQueryTickets += "where tblStatus.StatusId = 4";
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

                rg_tickets.DataSource = dt;
                rg_tickets.DataBind();

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

        protected void ToggleRowSelection(object sender, EventArgs e)
        {
            GridItem gItem = (sender as CheckBox).NamingContainer as GridItem;

            gItem.Selected = (sender as CheckBox).Checked;

            GridDataItem dataItem = rg_tickets.MasterTableView.Items[gItem.ItemIndex];
            string itemidSelected = dataItem["TicketId"].Text;
            
          
            if (gItem.Selected)
            {
                ShowPost(itemidSelected);
               
                    HiddenField.Value = itemidSelected;
              
            }
        }
       public void ShowPost(string tid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                string selectedRowPost = @"SELECT tblTicket.TicketId, tblTicket.Requester, tblTicketPost.Post
                                         FROM tblTicket INNER JOIN
                                         tblTicketPost ON tblTicket.TicketId = tblTicketPost.TicketId
                                         Where tblTicket.TicketId = " + tid +
                                         "order by tblTicketPost.TicketPostId";
                 
                SqlCommand cmd = new SqlCommand(selectedRowPost, dbConn);
                SqlDataReader rdr = null;
                rdr = cmd.ExecuteReader();


                while (rdr.Read())
                {

                    lblTicketId.Text += rdr["TicketId"].ToString() + "\n<span style='font-weight:bold; color:red;'>test</span>";
                    lblPersonPost.Text += rdr["Requester"].ToString() + "\n";
                    lblPost.Text += rdr["Post"].ToString() + "\n";
                   
                    
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

        protected void SubmitPostClick(object sender, EventArgs e)
        {
            if (HiddenField.Value != "")
            {
                AddPost(HiddenField.Value); 
            }
        } 

        protected void AddPost(string pid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {

                string insertPost = @"Insert into tblTicketPost(Post) Values (@Post) 
                                        Select * from tblTicket
                                     where TicketId = " + pid;

                SqlCommand cmd = new SqlCommand(insertPost, dbConn);

               // cmd.Parameters.AddWithValue("@TicketId", lblTicket.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@Post", txtpost.Text.Trim().ToString());
              



                cmd.ExecuteNonQuery();

               
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

    }
}