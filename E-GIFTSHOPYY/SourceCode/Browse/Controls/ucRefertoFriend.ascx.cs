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
using System.Web.Mail;
//using System.Net.Mail;
public partial class Browse_Controls_ucRefertoFriend : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string subject = ConfigurationManager.AppSettings["ReferToFriendSubject"];
        string body = ConfigurationManager.AppSettings["ReferToFriendBody"];
        string[] email = txtrEmail.Text.Split(',');
        for (int i = 0; i < email.Length; i++)
        {
            body = String.Format(body,email[i], txtName.Text);
            SendMail(lblfemail.Text, email[i], subject, body);
        }

    }
    private void SendMail(string From, string To, string Subject, string Body)
    {
        MailMessage mail = new MailMessage();
        mail.From = From;
        mail.To =  To;
        mail.Subject = Subject;
        mail.Body = Body;
        SmtpMail.SmtpServer = "localhost";
        SmtpMail.Send(mail);
        Response.Write("<script>alert('Mail Sent Successfully');</script>");
    }
}
