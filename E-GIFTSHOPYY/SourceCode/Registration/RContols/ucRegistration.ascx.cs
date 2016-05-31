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
using System.Net.Mail;
using System.Net.Security;
using EGiftShopee.BL;

public partial class Browse_Controls_ucRegistration : System.Web.UI.UserControl
{
    ServiceReference1.WebServiceSoapClient obj = new ServiceReference1.WebServiceSoapClient();
    AES_Algorithim.CreditCard aes = new AES_Algorithim.CreditCard();

    protected void Page_Load(object sender, EventArgs e)
    {
       // int i;
        if (!IsPostBack)
        {
            country();
            state();
            city();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
           // DateTime dob = new DateTime(Int32.Parse(ddlyear.Text), Int32.Parse(ddlmonth.Text), Int32.Parse(ddldate.Text));
              ProductController.GetLoginDetails(txtuser.Text, txtfname.Text, txtlname.Text,
              txtpswd.Text, ddlQuestion.Text, txtAnswer.Text,
              GMDatePicker1.Date, txtcontact.Text, rdSex.SelectedValue,
              txtmail.Text, txtaddr.Text, int.Parse(ddlcountry.SelectedValue), int.Parse(ddlstate.SelectedValue), int.Parse(ddlcity.SelectedValue), txtZipCode.Text);
              lblres.Text = "Done!!!";

          
         //   DateTime currentDate = DateTime.Now;
         //   DateTime nextYearDate = currentDate.AddYears(4);
         //   Random ob1 = new Random();
         //   string AccId = ob1.Next(10000, 99999).ToString();
         //   Random ob2 = new Random();
         //   string t1 = ob2.Next(400000, 999999).ToString();
         //   Random obj4 = new Random();
         //   string t2 = obj4.Next(10000, 99999).ToString();
         //   string AccNo = t1 + t2;

         //   Random ob3 = new Random();
         //   string pin = ob3.Next(1000, 9999).ToString();
         //   string cardtype = "Credit Card";
         //   string balance="25000";
         ////   obj.BankAcc(AccId,AccNo,txtuser.Text,balance,pin,cardtype,nextYearDate);
            //string from = " m.pavan599@gmail.com";
            //string password = "anveshraju";
            //string to = txtuser.Text;
            //string sub = "Account details";
            //string body = "AccId :" +AccNo+ "     " + "Pin No :" +pin + "       ";
            //MailMessage mail = new MailMessage();
            //mail.From = new MailAddress(from);
            //mail.To.Add(to);
            //mail.Subject = sub;
            //mail.Body = body;
            //SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            //smtp.Credentials = new System.Net.NetworkCredential(from, password);
            //smtp.EnableSsl = true;
            //smtp.Send(mail);
        }
        catch (Exception ex)
        {
            lblUser.Text = "UserName already exists";
        }
    }
    
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dsState = ProductController.getAllStatesByCountryID(int.Parse(ddlcountry.SelectedValue));
        BindDDL(ddlstate, dsState, "Name", "ID");
        DataSet dscity = ProductController.getCitydetailsByStateID(int.Parse(ddlstate.SelectedValue));
        BindDDL(ddlcity, dscity, "Name", "ID");
        
    }

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ddlcity.Items.Clear();
        DataSet dscity = ProductController.getCitydetailsByStateID(int.Parse(ddlstate.SelectedValue));
        BindDDL(ddlcity, dscity, "Name", "ID");
    }
    private void state()
    {
        DataSet dsState = ProductController.getAllStatedetails();
        BindDDL(ddlstate, dsState, "Name", "ID");
    }   
    private void country()
    {
        DataSet dsCountry = ProductController.getCountrydetails();
        BindDDL(ddlcountry, dsCountry, "Name", "ID");
    }
    private void BindDDL(DropDownList ddl, DataSet ds, string txtField, string valField)
    {
        ddl.DataSource = ds;
        ddl.DataTextField = txtField;
        ddl.DataValueField = valField;
        ddl.DataBind();
    }
    private void city()
    {
        DataSet dscity=ProductController.getCitydetails();
        BindDDL(ddlcity, dscity, "Name", "ID");
    }
    protected void txtuser_TextChanged(object sender, EventArgs e)
    {

    }
}

