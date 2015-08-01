using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Web.Caching;
using Telerik.Web.UI;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Web.SessionState;




namespace HelpDesk.Ticket
{
    public partial class AddTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
                
            {
                if (Session["UserFirstName"] != null)
                {
                    lblRequester.Text = Session["UserFirstName"].ToString();

                }
                if (Session["Userid"] != null)
                {
                    lblUserId.Text = Session["Userid"].ToString();

                }
                //if (Session["SessionTicketId"] != null)
                //{
                //    lblTicketid.Text = Session["SessionTicketId"].ToString();

                //}
               
                GetUser();
                GetProject();

               
            }
        }


        public void GetUser() //get list of Assignee 
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                string selectProject = "Select UserId,FirstName from tblUser";
               
                SqlCommand cmdIns = new SqlCommand(selectProject, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                ddlAssignee.Items.Clear();

                ddlAssignee.Items.Add(new ListItem("", "-1"));

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
                string selectProject = "Select ProjectId,ProjectName from tblGroupProjectName";

                SqlCommand cmdIns = new SqlCommand(selectProject, dbConn);


                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                ddlProject.Items.Clear();

                ddlProject.Items.Add(new ListItem("", "-1"));

                while (rdr.Read())
                {


                    ListItem item = new ListItem(rdr["ProjectName"].ToString(), rdr["ProjectId"].ToString());
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


     
        protected void btnAddTicket_Click(object sender, EventArgs e)
        {

            AddNewTicket();

        }
        public void AddNewTicket()// function to add new ticket 
        {
           
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                
               SqlCommand cmdIns = new SqlCommand("[dbo].[InsertTicket]", dbConn);
                cmdIns.CommandType = CommandType.StoredProcedure;
               

                cmdIns.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim().ToString());
                cmdIns.Parameters.AddWithValue("@Desription", txtDescription.Text.Trim().ToString());
                cmdIns.Parameters.AddWithValue("@Assignee", ddlAssignee.SelectedValue);
                cmdIns.Parameters.AddWithValue("@TypeId", ddlType.SelectedValue);
                cmdIns.Parameters.AddWithValue("@PriorityId", ddlPriority.SelectedValue);
                cmdIns.Parameters.AddWithValue("@StatusId", ddlStatus.SelectedValue);
                cmdIns.Parameters.AddWithValue("@Requester", lblUserId.Text.Trim());
                cmdIns.Parameters.AddWithValue("@CcEmails", txtCCs.Text.Trim().ToString());
                cmdIns.Parameters.AddWithValue("@ProjectId", ddlProject.SelectedValue);
                cmdIns.Parameters.AddWithValue("@DateAndTime", DateTime.Now);


                //SqlParameter date = new SqlParameter("@DateAndTime", SqlDbType.DateTime);
                //DateTime.Now.ToString("dd/MM/yyyy hh:mm");
                //date.Value = DateTime.Now;
                //cmdIns.Parameters.Add(date);

     

                SqlParameter ParameterTID = new SqlParameter("@TicketId", SqlDbType.Int);
                ParameterTID.Direction = ParameterDirection.Output;
                cmdIns.Parameters.Add(ParameterTID);

                cmdIns.ExecuteNonQuery();

                int TID = (int)cmdIns.Parameters["@TicketId"].Value;

                 string[] ArrayOfFile = txtFileName.Text.Trim(';').Split(';');
                 foreach (string file in ArrayOfFile)
                 {

                     string insertAttach = "Insert into tblTicketAttachFile (TicketId,AttachName,PathName) Values (@TicketId,@AttachName,@PathName)";

                     SqlCommand cmd = new SqlCommand(insertAttach, dbConn);

                     cmd.Parameters.AddWithValue("@TicketId", TID);
                     cmd.Parameters.AddWithValue("@AttachName", file);
                     cmd.Parameters.AddWithValue("@PathName", txtPath.Text);


                     cmd.ExecuteNonQuery();
                 }

             
               lblMsg.Text = "Ticket added successfully.";

                //MailMessage mail = new MailMessage();
                //SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                //mail.From = new MailAddress("Jimitron Support <rose.tamargo@gmail.com>");
                //mail.To.Add(txtCCs.Text);
                //mail.Subject = txtSubject.Text;
                //mail.Body = txtDescription.Text;



                //SmtpServer.Port = 587;
                //SmtpServer.Credentials = new System.Net.NetworkCredential("rose.tamargo@gmail.com", "jiniko121");
                //SmtpServer.EnableSsl = true;

                //SmtpServer.Send(mail);
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


        private CacheItemRemovedCallback callBack;

        protected void btnSubmitAttach_Click(object sender, System.EventArgs e)
        {
            if (RadUpload.UploadedFiles.Count > 0)
            {
                repeaterResults.DataSource = RadUpload.UploadedFiles;
                repeaterResults.DataBind();
              
                repeaterResults.Visible = true;
            }
            else
            {
              
                repeaterResults.Visible = false;
            }



            foreach (UploadedFile file in RadUpload.UploadedFiles)
            {
                byte[] bytes = new byte[file.ContentLength];
                file.InputStream.Read(bytes, 0, file.ContentLength);
                string fullPath = Server.MapPath(RadUpload.TargetFolder);
               
                txtFileName.Text += file.GetName() + ";";
                txtPath.Text = fullPath;
                
             }


          //  AddDeleteDependencyForFile(RadUpload.UploadedFiles);
        }

        //private void AddDeleteDependencyForFile(UploadedFileCollection uploadedFileCollection)
        //{
        //    foreach (UploadedFile uploadedFile in uploadedFileCollection)
        //    {
        //        TimeSpan timeOut = TimeSpan.FromMinutes(5);

        //        callBack = new CacheItemRemovedCallback(delegate(string key, object path, CacheItemRemovedReason reason)
        //        {
        //            File.Delete((string)path);
        //        });

        //        string fullPath = Path.Combine(Server.MapPath(RadUpload.TargetFolder), uploadedFile.GetName());

        //        Context.Cache.Insert(uploadedFile.FileName, fullPath, null, DateTime.Now.Add(timeOut), TimeSpan.Zero,
        //        CacheItemPriority.Default, callBack);
        //    }
        //}

        protected void RadUpload_FileExists(object sender, Telerik.Web.UI.Upload.UploadedFileEventArgs e)
        {
            int counter = 1;

            UploadedFile file = e.UploadedFile;

            string targetFolder = Server.MapPath(RadUpload.TargetFolder);

            string targetFileName = Path.Combine(targetFolder,
                file.GetNameWithoutExtension() + counter.ToString() + file.GetExtension());

            while (System.IO.File.Exists(targetFileName))
            {
                counter++;
                targetFileName = Path.Combine(targetFolder,
                    file.GetNameWithoutExtension() + counter.ToString() + file.GetExtension());
            }
            
             file.SaveAs(targetFileName);
        }
       
        
    }
}