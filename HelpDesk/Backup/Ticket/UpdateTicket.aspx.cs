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
using System.Net.Mail;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Web.SessionState;
using System.Web.Caching;

namespace HelpDesk.Ticket
{
    public partial class UpdateTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
             {
               int id = Convert.ToInt32(Request.QueryString["id"]);
              
               GetAssignee();
               GetRequester();
               GetProject();
               GetTickets(id);
               TicketFileAttach(id);
               
            }
       }
        public void GetTickets(int gid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {

                string selectedTicket = @"SELECT     Subject, Desription, Requester, StatusId, PriorityId, TypeId,Assignee,CcEmails,ProjectId
                                        FROM         tblTicket
                                        WHERE        TicketId = " + gid.ToString();
                SqlCommand cmdIns = new SqlCommand(selectedTicket, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();


                while (rdr.Read())
                {
                    ddlRequester.SelectedValue = rdr["Requester"].ToString();
                    ddlAssignee.SelectedValue = rdr["Assignee"].ToString();
                    ddlProject.SelectedValue = rdr["ProjectId"].ToString();
                    ddlType.SelectedValue = rdr["TypeId"].ToString();
                    ddlPriority.SelectedValue = rdr["PriorityId"].ToString();
                    ddlStatus.SelectedValue = rdr["StatusId"].ToString();
                    txtSubject.Text = rdr["Subject"].ToString();
                    txtDescription.Text = rdr["Desription"].ToString();
                    txtCCEmails.Text = rdr["CcEmails"].ToString();
                   
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




        public void GetAssignee() //get list of Assignee 
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                string selectedAssignee = "Select UserId,FirstName from tblUser";

                SqlCommand cmdIns = new SqlCommand(selectedAssignee, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                while (rdr.Read())
                {

                  
                    ListItem item = new ListItem(rdr["FirstName"].ToString(), rdr["UserId"].ToString());
                    ddlAssignee.Items.Add(item);



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

        public void GetProject() //get list of Project
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                string selectedAssignee = "Select ProjectId,Projectname from tblGroupProjectName";

                SqlCommand cmdIns = new SqlCommand(selectedAssignee, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                while (rdr.Read())
                {


                    ListItem item = new ListItem(rdr["Projectname"].ToString(), rdr["ProjectId"].ToString());
                    ddlProject.Items.Add(item);



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
        public void GetRequester() //get list of Requester
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                string selectedAssignee = "SELECT  Distinct FirstName FROM tbluser";

                SqlCommand cmdIns = new SqlCommand(selectedAssignee, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                while (rdr.Read())
                {


                    ListItem item = new ListItem(rdr["FirstName"].ToString());
                    ddlRequester.Items.Add(item);



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

        protected void btnUpdate_Click(object sender, EventArgs e) //button click event for update tickets
        {
            int ID = Convert.ToInt32(Request.QueryString["id"]);
            UpdateTickets(ID);
           
        }
        public void UpdateTickets(int uId) // function for update tickets
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                
                string updateTicket = @"Update tblTicket Set Subject = @Subject ,Desription = @Desription, Requester = @Requester,
                                        StatusId = @StatusId,PriorityId = @PriorityId, TypeId = @TypeId, Assignee = @Assignee, CcEmails = @CcEmails,ProjectId = @ProjectId
                                        WHERE TicketId = " + uId.ToString();


                SqlCommand cmdIns = new SqlCommand(updateTicket, dbConn);

                cmdIns.Parameters.AddWithValue("@Requester", ddlRequester.Text.Trim());
                cmdIns.Parameters.AddWithValue("@Assignee", ddlAssignee.Text.Trim());
                cmdIns.Parameters.AddWithValue("@TypeId", ddlType.Text.Trim());
                cmdIns.Parameters.AddWithValue("@PriorityId", ddlPriority.Text.Trim());
                cmdIns.Parameters.AddWithValue("@StatusId", ddlStatus.Text.Trim());
                cmdIns.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                cmdIns.Parameters.AddWithValue("@Desription", txtDescription.Text.Trim());
                cmdIns.Parameters.AddWithValue("@CcEmails", txtCCEmails.Text.Trim());
                cmdIns.Parameters.AddWithValue("@ProjectId", ddlProject.Text.Trim());
                cmdIns.ExecuteNonQuery();

                lblMsg.Text = "Ticket Updated Successfully.";
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
            Response.Redirect("Tickets.aspx");
        }

        public void TicketFileAttach(int fid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {

                string selectedTicket = @"SELECT tblTicketAttachFile.AttachName, tblTicketAttachFile.PathName
                                        FROM tblTicketAttachFile INNER JOIN
                                        tblTicket ON tblTicketAttachFile.TicketId = tblTicket.TicketId
                                        where tblTicket.TicketId = " + fid.ToString();
                SqlCommand cmdIns = new SqlCommand(selectedTicket, dbConn);
                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                while (rdr.Read())
                {

                    txtdlFileName.Text += rdr["AttachName"].ToString() + ";";
                    txtdlPath.Text = rdr["PathName"].ToString();


                    string[] fileNames = txtdlFileName.Text.Trim(';').Split(';');

                    List<ListItem> files = new List<ListItem>();
                    foreach (string fileName in fileNames)
                    {
                        files.Add(new ListItem(Path.GetFileName(fileName), fileName));


                    }


                    gvAttachFile.DataSource = files;
                    gvAttachFile.DataBind();




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
        protected void TicketDownloadFile_Click(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.Clear();
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "Attachment; filename=" + Path.GetFileName(filePath));
            Response.TransmitFile(Server.MapPath("~/MyFiles/" + filePath));


            Response.End();
        }

        // delete all attach need to correct
        protected void DeleteFile_Click(object sender, EventArgs e) 
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            DeleteAttach(id);

            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(Server.MapPath("~/MyFiles/" + filePath));
            if (File.Exists(filePath))
            {
                File.Delete(filePath);

            }
           
           
        }


        public void DeleteAttach(int did)
         {
            


           string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
                SqlConnection dbConn = new SqlConnection(connStr);
                dbConn.Open();

                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "Delete from tblTicketAttachFile where TicketId = " + did.ToString();

                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = dbConn;
                    cmd.ExecuteNonQuery();

                    lblMsg.Text = "Attach File Deleted Successfully.";
             
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




        //{
           




        //    string filePath = (sender as LinkButton).CommandArgument;
        //    File.Delete(Server.MapPath("~/MyFiles/" + filePath));
        //    //Response.Redirect(Request.Url.AbsoluteUri);

        //    if (File.Exists(filePath))
        //    {
        //        File.Delete(filePath);

        //    }
        //}

    }
}