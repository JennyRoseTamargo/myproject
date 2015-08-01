using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDesk.logon
{
    public partial class Default2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string emailadd = (string)(Session["UserAuthentication"]);
            if (Session["UserAuthentication"] != null)
            {
                Label1.Text = emailadd;
            } 
        }
    }
}