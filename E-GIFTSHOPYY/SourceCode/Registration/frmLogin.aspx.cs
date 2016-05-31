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
using System.Data.SqlClient;

public partial class Registration_frmLogin : System.Web.UI.Page
{
    //ServiceReference1.WebServiceSoapClient obj = new ServiceReference1.WebServiceSoapClient();
   // localhost.WebService obj = new localhost.WebService();
    ServiceReference1.WebServiceSoapClient obj = new ServiceReference1.WebServiceSoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignin_Click(object sender, EventArgs e)
    {
        try
        {
            int IdRole = 0;
            DataSet d1 = obj.GetLogin(txtUserName.Text, txtPwd.Text);
            string id = d1.Tables[0].Rows[0][0].ToString();
            IdRole = Convert.ToInt32(id);
            if (IdRole >= 0)
            {
                lblError.Text = "valid user";
                string time = System.DateTime.Today.ToShortDateString();
                string loginuser = txtUserName.Text;
                Session["Username"] = txtUserName.Text;
                obj.logintime(loginuser,time);
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Text.Trim(), false);
                if (IdRole == 8)
                    Response.Redirect("~/Admin/frmAdmin.aspx");
                else
                    Response.Redirect("~/MyAccount/frmMyAccount.aspx?u=" + Session["Username"]);
            }
            else
            {
               // lblError.Text = "not a valid user";
                Response.Write("<script>alert('Invalid User Name/Password')</script>");


            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}