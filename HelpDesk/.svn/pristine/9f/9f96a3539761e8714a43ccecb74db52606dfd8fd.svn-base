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


namespace HelpDesk.User
{
    public partial class AssignedTicketsDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["UATid"]);
                if (Session["UserFirstName"] != null)
                {

                    txtPersonPost.Text = Session["UserFirstName"].ToString();


                }
                GetUserAssignedTicket(id);
                GetTicketPost(id);

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


                    string post = "<table>" + "<tr>" + "<td>" + "<b>" + rdr["UserPost"] + "</b>" + " ( " + rdr["PostDateTime"] + " )" + "</td>" + "</tr>" + "<tr>" + "<td>" + rdr["Post"] + "</td>" + "</tr>" + "</table>" + "<br>" + "<br>";
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

        public void GetUserAssignedTicket(int gid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["HelpDeskConnString"].ToString();
            SqlConnection dbConn = new SqlConnection(connStr);
            dbConn.Open();

            try
            {


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
                                         WHERE tblTicket.TicketId = " + gid.ToString();
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


                    //txtPost.Text = rdr["Post"].ToString();
                    //txtPersonPost.Text = rdr["Requester"].ToString();


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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            int ID = Convert.ToInt32(Request.QueryString["UATid"]);
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

                string insertPost = "Insert into tblTicketPost(TicketId,Post,UserPost) Values (@TicketId, @Post,@UserPost)";

                SqlCommand cmdIns = new SqlCommand(insertPost, dbConn);

                cmdIns.Parameters.AddWithValue("@TicketId", pid);
                cmdIns.Parameters.AddWithValue("@Post", txtTicketPost.Text.Trim().ToString());
                cmdIns.Parameters.AddWithValue("@UserPost", txtPersonPost.Text.Trim().ToString());


                SqlParameter ParameterTID = new SqlParameter("@TicketId", SqlDbType.Int);
                ParameterTID.Direction = ParameterDirection.Output;
                cmdIns.Parameters.Add(ParameterTID);

                cmdIns.ExecuteNonQuery();

                int TID = (int)cmdIns.Parameters["@TicketId"].Value;

                string[] ArrayOfFile = txtFileName.Text.Trim(';').Split(';');
                foreach (string file in ArrayOfFile)
                {

                    string insertAttach = "Insert into tblPostAttach (TicketPostId,PostAttachName,PostPathName) Values (@TicketPostId,@PostAttachName,@PostPathName)";

                    SqlCommand cmd = new SqlCommand(insertAttach, dbConn);

                    cmd.Parameters.AddWithValue("@TicketPostId", TID);
                    cmd.Parameters.AddWithValue("@PostAttachName", file);
                    cmd.Parameters.AddWithValue("@PostPathName", txtPath.Text);


                    cmd.ExecuteNonQuery();
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


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUser2.aspx");
        }


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



        }



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