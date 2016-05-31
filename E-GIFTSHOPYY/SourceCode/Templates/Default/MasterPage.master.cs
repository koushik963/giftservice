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

public partial class Templates_Default_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblt.Text = DateTime.Now.ToLongDateString().ToString();
        if (Session["UserName"] != null)
        {
            lblUser.Text = "Welcome  " + Session["UserName"].ToString();

        }
        else
            lblUser.Text = "Welcome Guest";

    }

   
}
