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

public partial class Browse_MasterPage1 : System.Web.UI.MasterPage
{
    ServiceReference1.WebServiceSoapClient obj = new ServiceReference1.WebServiceSoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] == null)
        {
            lblUser.Text = "Welcome Guest";
        }
        else
        {
            lblUser.Text = "Welcome  " + " " + Session["UserName"].ToString();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string userid = Session["Username"].ToString();
        string time1 = System.DateTime.Now.ToString();
        obj.logout(userid, time1);
        Response.Redirect("~/Registration/frmLogin.aspx");
      
       
    }
}
