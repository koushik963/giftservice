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

public partial class ucContactUs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }
      
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string from = TextBox1.Text;
        string password = TextBox2.Text;
        string to = TextBox3.Text;
        string sub = TextBox4.Text;
        string body = TextBox5.Text;
        MailMessage mail = new MailMessage();
        mail.From = new MailAddress(from);
        mail.To.Add(to);
        mail.Subject = sub;
        mail.Body = body;
        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.Credentials = new System.Net.NetworkCredential(from,password);
        smtp.EnableSsl = true;
        smtp.Send(mail);
        Response.Write("<script>alert('Mail Sent Successfully');</script>");

    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
}
