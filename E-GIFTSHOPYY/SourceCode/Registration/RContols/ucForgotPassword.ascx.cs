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
using System.Net.Mail;
using System.Net.Security;

public partial class Browse_Controls_ucForgotPassword : System.Web.UI.UserControl
{public SqlConnection con = new SqlConnection("server=.;user id=sa;password=admin123;database=EGiftShopee");
    public SqlCommand cmd;
    public SqlDataReader dr;
    string str = "";
    string str1 = "";
    
   ServiceReference1.WebServiceSoapClient obj = new ServiceReference1.WebServiceSoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
       
       // cmd=new SqlCommand("select HintQuestion from tblUserAccount where UserName='"+txtUser1.Text,con);
        //SqlDataReader dr=cmd.ExecuteScalar();

        //DataSet ds = obj.getQuestion(txtUser1.Text);
        //if (ds != null)
        //{
   
                //txtUser1.Text = s;
                // Panel1.Visible = false;
                //Panel2.Visible = true;
            //lblQuestion.Text = ds.Tables[0].Rows[0][3].ToString();
                //lblQuestion.Visible = true;
       // }
        // else
                //lbler.Text = "Invalid Username!!!";
           // txtUser.Focus();
        }
    
         protected void btnSubmit_Click(object sender, EventArgs e)
         {
             string s = txtUser1.Text;
             con.Open();
             cmd = new SqlCommand("select * from tblUserAccount where UserName='" + txtUser1.Text + "'", con);
             dr = cmd.ExecuteReader();
        //SqlDataReader dr = ProductController.getQuestion(txtUser1.Text);
        if (dr != null)
        {
            if (dr.Read())
            {
                DropDownList1.Visible = true;
                lblQ.Visible = true;
                txtAnswer.Visible = true;
                lblAnswer.Visible = true;
               /* txtUser1.Text = s;
               Panel1.Visible = false;
                Panel2.Visible = true;
                lblQuestion.Text = dr["HintQuestion"].ToString();*/
            }
            else
                lbler.Text = "Invalid Username!!!";
            txtUser.Focus();
        }
        }
    
    protected void btnPwd_Click(object sender, EventArgs e)
    {
        con.Open();
        cmd = new SqlCommand("select Password from tblUserAccount where UserName='" + txtUser1.Text+"'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr != null)
        {
            if (dr.Read())
            {

                string s =  ConfigurationManager.AppSettings["SendPwd"]+dr["Password"].ToString();
                //string From = ConfigurationManager.AppSettings["From"];
                //string subject = ConfigurationManager.AppSettings["Subject"];
                //sendmail(From, txtUser1.Text, subject, s);
                string from = " egiftshoppeestore@gmail.com";
                string password = "shopee981";
                //   string from = " m.pavan599@gmail.com";
                // string password = "anveshraju";
                string to = txtUser1.Text;
                string sub = "your password:";
                
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(from);
                mail.To.Add(to);
                mail.Subject = sub;
                mail.Body =dr[0].ToString(); ;
                SmtpClient smtp =new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential(from, password);
                smtp.EnableSsl = true;
                smtp.Send(mail);
                Response.Write("<script>alert('Mail Sent Successfully');</script>");
                con.Close();
            }
            else
                lblans.Text = "Invalid Answer!!! Try Again";
            con.Close();
        }

    }
    private void sendmail(string from, string to, string sub, string body)
    {
        try
        {

            string from1 = "egiftshoppeestore@gmail.com";
            string password1 = "shopee981";
            string to1 = txtUser1.Text;
            string sub1 = "Ur Password";
            string body1 = body;
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(from1);
            mail.To.Add(to1);
            mail.Subject = sub1;
            mail.Body = body1;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential(from1, password1);
            smtp.EnableSsl = true;
            smtp.Send(mail);
            Response.Write("<script>alert('Mail Sent Successfully');</script>");
        }
        catch (Exception ex)
        {
            lbl.Text = ex.Message;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        
    }
    
    protected void txtAnswer_TextChanged(object sender, EventArgs e)
    {   
        con.Open();

        cmd = new SqlCommand("select Answer,HintQuestion from tblUserAccount where UserName='" + txtUser1.Text + "'", con);
     
        dr = cmd.ExecuteReader();
       
        if (dr.Read())
        {    
            str = dr[0].ToString();
            str1 = dr[1].ToString();
        }
        con.Close();
        if ((str == txtAnswer.Text)&&(str1==DropDownList1.Text))
        {
            btnPwd.Visible = true;
        }
        else
            Response.Write("<script>alert('choose correct question and answer');</script>");

    }

    protected void txtUser1_TextChanged(object sender, EventArgs e)
    {

    }
}