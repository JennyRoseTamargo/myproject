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
    public partial class Responses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["Tid"]);
                if (Session["UserFirstName"] != null)
                {
                    txtPersonPost.Text = Session["UserFirstName"].ToString();

                }

                GetTicketPost(id);
                SelectTicket(id);
                //TicketFileAttach(id);
               // PostFileAttach("");

              
            }
        }                      

        public void GetTicketPost(int gid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                string selectedTicket = @"SELECT TP.UserPost,TP.Post, tblUser.EmailAddress, TP.PostDateTime
                                            FROM tblTicket AS T 
                                            INNER JOIN tblTicketPost AS TP ON T.TicketId = TP.TicketId
                                            INNER JOIN tblUser ON T.Assignee = tblUser.UserId
                                             WHERE T.TicketId = " + gid.ToString();
                      
 

//                string selectedTicket = @"SELECT TP.UserPost, TP.Post, tblUser.EmailAddress, PA.PostAttachName, PA.PostPathName 
//                                            FROM tblTicket AS T 
//                                            INNER JOIN tblTicketPost AS TP ON T.TicketId = TP.TicketId 
//                                            INNER JOIN tblUser ON T.Assignee = tblUser.UserId 
//                                            INNER JOIN tblPostAttach as PA ON TP.TicketPostId = PA.TicketPostId
//                                            WHERE TP.TicketPostId = " + gid.ToString();
                SqlCommand cmdIns = new SqlCommand(selectedTicket, dbConn);
                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader();

                while (rdr.Read())
                {


                  
                    lblEmailAssign.Text = rdr["EmailAddress"].ToString();
                    string post = "<table>" + "<tr>" + "<td>" + "<b>" + rdr["UserPost"] + "</b>" + " ( " + rdr["PostDateTime"] + " )" + "</td>" + "</tr>" + "<tr>" + "<td>" + rdr["Post"] + "</td>" + "</tr>" +"</table>"+ "<br>" + "<br>";
                    txtPost.Text += post;


                    //txtPFName.Text += rdr["PostAttachName"].ToString() + ";";
                    //txtPFPath.Text = rdr["PostPathName"].ToString();

                    //string[] fileNames = txtPFName.Text.Trim(';').Split(';');

                    //List<ListItem> files = new List<ListItem>();
                    //foreach (string fileName in fileNames)
                    //{
                    //    files.Add(new ListItem(Path.GetFileName(fileName), fileName));


                    //}


                    //gvPostFile.DataSource = files;
                    //gvPostFile.DataBind();

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


        public void SelectTicket(int sid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {

//                string selectedTicket = @"Select Subject,Desription, Requester, StatusId, PriorityId, TypeId,Assignee,ProjectId
//                                          from tblTicket where TicketId= " + sid.ToString();
                string selectedTicket = @"SELECT tblTicket.TicketId, tblTicket.Subject, tblTicket.Desription,
                                            (SELECT FirstName FROM tblUser AS u WHERE(UserId = tblTicket.Requester)) AS Requester,
                                             (SELECT FirstName FROM tblUser AS u WHERE(UserId = tblTicket.Assignee)) AS Assignee, 
                                             tblPriority.PriorityName AS Priority, 
                                             tblStatus.StatusName AS Status, 
                                             tblGroupProjectName.ProjectName AS Project,
                                              tblType.TypeName as Type
                                            FROM tblTicket 
                                            INNER JOIN tblStatus ON tblTicket.StatusId = tblStatus.StatusId
                                             INNER JOIN tblPriority ON tblTicket.PriorityId = tblPriority.PriorityId
                                              INNER JOIN tblType ON tblTicket.TypeId = tblType.TypeId 
	                                            CROSS JOIN tblGroupProjectName
                                            WHERE tblTicket.TicketId = " + sid.ToString();

                SqlCommand cmdIns = new SqlCommand(selectedTicket, dbConn);
                SqlDataReader rdr = null;
                rdr = cmdIns.ExecuteReader(); 
           
                while (rdr.Read())
                {

                    
                    txtSubject.Text = rdr["Subject"].ToString();
                    txtDescription.Text = rdr["Desription"].ToString();
                    lblAssignee.Text = rdr["Assignee"].ToString();
                    lblPriority.Text = rdr["Priority"].ToString();
                    lblProject.Text = rdr["Project"].ToString();
                    lblRequester.Text = rdr["Requester"].ToString();
                    lblStatus.Text = rdr["Status"].ToString();
                    lblType.Text = rdr["Type"].ToString();
                    
                   
                    
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

        protected void PostDownloadFile_Click(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.Clear();
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "Attachment; filename=" + Path.GetFileName(filePath));
            Response.TransmitFile(Server.MapPath("~/MyFiles/" + filePath));



            Response.End();
        }
//        public void PostFileAttach()
//        {
//            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
//            SqlConnection dbConn = new SqlConnection(connStr);
//            dbConn.Open();

//            try
//            {

//                string selectedPost = @"SELECT PostAttachName, PostPathName 
//                                                        FROM tblPostAttach 
//                                                        WHERE TicketPostId = 80";
//                SqlCommand cmd = new SqlCommand(selectedPost, dbConn);

//                //SqlCommand cmd = new SqlCommand("[dbo].[SelectPostAttachFile]", dbConn);
//                //cmd.CommandType = CommandType.StoredProcedure;


//                SqlDataReader rdr = null;
//                rdr = cmd.ExecuteReader();

//                while (rdr.Read())
//                {

//                    txtPFName.Text += rdr["PostAttachName"].ToString() + ";";
//                    txtPFPath.Text = rdr["PostPathName"].ToString();
                    


//                    string[] fileNames = txtPFName.Text.Trim(';').Split(';');

//                    List<ListItem> files = new List<ListItem>();
//                    foreach (string fileName in fileNames)
//                    {
//                        files.Add(new ListItem(Path.GetFileName(fileName), fileName));


//                    }


//                    gvPostFile.DataSource = files;
//                    gvPostFile.DataBind();




//                }
//                rdr.Close();
//            }
//            catch (Exception ex)
//            {
//                throw new Exception(ex.ToString(), ex);
//            }
//            finally
//            {
//                dbConn.Close();
//            }
//        }
        protected void TicketDownloadFile_Click(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.Clear();
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "Attachment; filename=" + Path.GetFileName(filePath));
            Response.TransmitFile(Server.MapPath("~/MyFiles/" + filePath));
           
            
            Response.End();
        }
//        public void TicketFileAttach(int fid)
//        {
//            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
//            SqlConnection dbConn = new SqlConnection(connStr);
//            dbConn.Open();

//            try
//            {

//                string selectedTicket = @"SELECT tblTicketAttachFile.AttachName, tblTicketAttachFile.PathName
//                                        FROM tblTicketAttachFile INNER JOIN
//                                        tblTicket ON tblTicketAttachFile.TicketId = tblTicket.TicketId
//                                        where tblTicket.TicketId = " + fid.ToString();
//                SqlCommand cmdIns = new SqlCommand(selectedTicket, dbConn);
//                SqlDataReader rdr = null;
//                rdr = cmdIns.ExecuteReader();

//                while (rdr.Read())
//                {

//                    txtdlFileName.Text += rdr["AttachName"].ToString() + ";";
//                    txtdlPath.Text = rdr["PathName"].ToString();


//                    string[] fileNames = txtdlFileName.Text.Trim(';').Split(';');
                     
//                    List<ListItem> files = new List<ListItem>();
//                    foreach (string fileName in fileNames)
//                    {
//                        files.Add(new ListItem(Path.GetFileName(fileName), fileName));


//                    }

                    
//                    gvFileAttach.DataSource = files;
//                    gvFileAttach.DataBind();


                    

//                }
//                rdr.Close();
//            }
//            catch (Exception ex)
//            {
//                throw new Exception(ex.ToString(), ex);
//            }
//            finally
//            {
//                dbConn.Close();
//            }
//        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(Request.QueryString["Tid"]);
            SubmitPost(ID);
            Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);

        }

        public void SubmitPost(int pid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {
                 SqlCommand cmdIns = new SqlCommand("[dbo].[InsertPost]", dbConn);
                cmdIns.CommandType = CommandType.StoredProcedure;

                cmdIns.Parameters.AddWithValue("@TicketId", pid);
                cmdIns.Parameters.AddWithValue("@Post", txtTicketPost.Text.Trim().ToString());
                cmdIns.Parameters.AddWithValue("@UserPost",  txtPersonPost.Text.Trim().ToString());
                //String.Format("ddd dd MMM yyyy hh:mm", DateTime.Now);
                //cmdIns.Parameters.AddWithValue("@PostDateTime", DateTime.Now);

                SqlParameter date = new SqlParameter("@PostDateTime", SqlDbType.DateTime);
                DateTime.Now.ToString("ddd dd MMM yyyy hh:mm");
                date.Value = DateTime.Now;
                cmdIns.Parameters.Add(date);

                


                SqlParameter ParameterAID = new SqlParameter("@TicketPostId", SqlDbType.Int);
                ParameterAID.Direction = ParameterDirection.Output;
                cmdIns.Parameters.Add(ParameterAID);

                cmdIns.ExecuteNonQuery();

                int AID = (int)cmdIns.Parameters["@TicketPostId"].Value;

                string[] ArrayOfFile = txtFileName.Text.Trim(';').Split(';');
                foreach(string file in ArrayOfFile)
                   {

                        string insertAttach = "Insert into tblPostAttach (TicketPostId,PostAttachName,PostPathName) Values (@TicketPostId,@PostAttachName,@PostPathName)";

                        SqlCommand cmd = new SqlCommand(insertAttach, dbConn);

                        cmd.Parameters.AddWithValue("@TicketPostId", AID);
                        cmd.Parameters.AddWithValue("@PostAttachName", file);
                        cmd.Parameters.AddWithValue("@PostPathName", txtPath.Text);
                        cmd.ExecuteNonQuery();
                
                    }
                        

                
                // MailMessage mail = new MailMessage();
                //SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                //mail.From = new MailAddress("Jimitron Support <rose.tamargo@gmail.com>");
                //mail.To.Add(lblEmailAssign.Text);
                //mail.Subject = txtSubject.Text;
                //mail.Body = ("Description:" + "" + txtDescription.Text + "\n" + "Person Post:" + "" + "txtPersonPost.Text" + "\n" + " Post:" + txtTicketPost.Text);

                //SmtpServer.Port = 587;
                //SmtpServer.Credentials = new System.Net.NetworkCredential("rose.tamargo@gmail.com", "jiniko121");
                //SmtpServer.EnableSsl = true;
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

       // private CacheItemRemovedCallback callBack;

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



         //   AddDeleteDependencyForFile(RadUpload.UploadedFiles);
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
                counter ++;
                targetFileName = Path.Combine(targetFolder, 
                    file.GetNameWithoutExtension() + counter.ToString() + file.GetExtension());
            }

            file.SaveAs(targetFileName);
        }

           
    }

     
}
