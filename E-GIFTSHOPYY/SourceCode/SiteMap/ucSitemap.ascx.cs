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

public partial class SiteMap_ucSitemap : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            pnlaccount.Visible = true;
            pnlOrder.Visible = true;
            pnlWish.Visible = true;
        }
    }
    protected void btnAboutus_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/About Us/frmAboutus.aspx");   
    }
    protected void btnContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/Contact Us/frmContactUs.aspx");
    }
    protected void btnAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/MyAccount/frmMyAccount.aspx");
    }
    protected void btnchangeaccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/MyAccount/frmChangeAccountDetails.aspx");
    }
    protected void btnodetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/OrderDetails/frmOrderDetails.aspx");
    }
    protected void btnostatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/OrderDetails/frmSubmitOrderno.aspx");
    }
    protected void btnnewuser_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/Registration/frmNewUser.aspx");
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/Registration/frmLogin.aspx");
    }
    protected void btnforgotpwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/Registration/frmForgotPassword.aspx");
    }
    protected void btnchangepwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/Registration/frmChangePassword.aspx");
    }
    protected void btnwish_Click(object sender, EventArgs e)
    {
        Response.Redirect("/EGiftShopee/WishList/frmWishList.aspx");
    }
}
