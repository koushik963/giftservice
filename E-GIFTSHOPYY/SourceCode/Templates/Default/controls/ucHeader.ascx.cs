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
using EGiftShopee.BL;

public partial class Templates_Default_controls_ucHeader : System.Web.UI.UserControl
{
    int i = 0;
    string SessionId;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCartCount.Visible = false;
        int i = 0;
        //string a;
        SessionId = Session["sessionId"].ToString();
        if (Session.SessionID != null)
        {
            i = int.Parse(ProductController.shoppingcartitems(SessionId).ToString());
        }
        lblCartCount.Text = String.Format("Cart: ({0})", i);
        
        if (Session["UserName"] == null || Session["UserName"].ToString().Trim() == "")
            lnkLogin.Text = "Login";
        else
            lnkLogin.Text = "Logout";

        //if (lnkLogin.Text == "Login")
        //{
        //    if (Session["UserName"] != null)
        //    {
        //        lnkMyaccount.Visible = true;
        //        lnkLogin.Text = "Logout";
        //    }
        //}
    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        if (lnkLogin.Text == "Login")
        {
            Response.Redirect("~/Registration/frmLogin.aspx");
        }
        else
            if (lnkLogin.Text == "Logout")
            {
                lnkMyaccount.Visible = false;
                Session.Remove("UserName");
                ProductController.Deletecartlogout(Session["sessionId"].ToString());
                Session["sessionId"] = "";
                Session.Abandon();
                Response.Redirect("~/Default.aspx");

            }
    }
    protected void lnkMyaccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/MyAccount/frmMyAccount.aspx");
    }
    protected void lnkAdminLogin_Click_Click(object sender, EventArgs e)
    {
        if (lnkLogin.Text == "Login")
        {
            Response.Redirect("~/Registration/frmLogin.aspx");
        }
        else
            if (lnkLogin.Text == "Logout")
            {
                lnkMyaccount.Visible = false;
                Session.Remove("UserName");
                ProductController.Deletecartlogout(Session["sessionId"].ToString());
                Session["sessionId"] = "";
                Session.Abandon();
                Response.Redirect("~/Default.aspx");

            }
    }
}
