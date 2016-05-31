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
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net.Security;
using System.Data.SqlClient;


public partial class Payment_UcPayment : System.Web.UI.UserControl
{
    int OrderNo;
    public SqlConnection con = new SqlConnection("server=.;user id=sa;password=admin123;database=EGiftShopee");
    public SqlCommand cmd;
    ServiceReference1.WebServiceSoapClient obj = new ServiceReference1.WebServiceSoapClient();
    double carttotal, taxamt;
    AES_Algorithim.CreditCard aes = new AES_Algorithim.CreditCard();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            disply();
        }
    }
    public void disply()
    {
        panel2.Visible = false;
        panel1.Visible = true;
        string SessionId;
        SessionId = Session["sessionId"].ToString();
        for (int i = 1; i <= 12; i++)
        {
            ddlMonth.Items.Add(i.ToString());
        }
        for (int j = 2007; j <= 2099; j++)
        {
            ddlyear.Items.Add(j.ToString());
        }
        carttotal = Int32.Parse(ProductController.GetCartTotal(SessionId).ToString());
        taxamt = ((.085) * ProductController.GetCartTotal(SessionId));

        txtcamount.Text = ProductController.GetCartTotal(SessionId).ToString();
        txttamount.Text = "Rs" + (0.085 * Int32.Parse(ProductController.GetCartTotal(SessionId).ToString()));
        txtnamount.Text = "Rs" + (carttotal + taxamt + 10).ToString();

    }
    protected void btnpay_Click(object sender, EventArgs e)
    {
        int i;
        string a;
        // string session = "";
        if (TextBox1.Text != " " && txtcode.Text != " " && ddlyear.SelectedItem.Text != " " && ddlMonth.SelectedItem.Text != " ")
        {

            SqlDataReader dr;
            //string str;
            //str = Session["UserName"].ToString();
            cmd = new SqlCommand("select * from tblBankAccount where AccName='" + Session["UserName"] + "'", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr[1].ToString() == TextBox1.Text && dr[4].ToString() == txtcode.Text)
                {
                    a = Session["sessionid"].ToString();
                    if (Session["UserName"] != null)
                    {
                       // string from = " egiftshoppeestore@gmail.com";
                       // string password = "shopee981";
                        string from = " m.pavan599@gmail.com";
                        string password = "anveshraju";
                        string to = Session["Username"].ToString();
                        string sub = "Order details";
                        string body = "Your Order has been Placed Successfully!!!";
                        MailMessage mail = new MailMessage();
                        mail.From = new MailAddress(from);
                        mail.To.Add(to);
                        mail.Subject = sub;
                        mail.Body = body;
                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.Credentials = new System.Net.NetworkCredential(from, password);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                        Response.Write("<script>alert('Mail Sent Successfully');</script>");
                        con.Close();
                        i = ProductController.GetIdFromtblUserAccount(Session["UserName"].ToString());
                        OrderNo = ProductController.insertorder(i, float.Parse(carttotal.ToString()), float.Parse(taxamt.ToString()), float.Parse((carttotal + taxamt + 10).ToString()), Int32.Parse(Session["shipid"].ToString()), Int32.Parse(Session["billid"].ToString()), a, Request["Billfname"].ToString());
                        con.Open();
                        int mm = int.Parse(txtcamount.Text);
                        cmd = new SqlCommand("update tblOrder set OrderAmount=" + mm + "where OrderId=" + OrderNo, con);
                        cmd.ExecuteNonQuery();
                        string s = txttamount.Text.Substring(2);
                        double dd = Convert.ToDouble(s);
                        int mn = Convert.ToInt32(dd);
                        cmd = new SqlCommand("update tblOrder set TaxAmount=" + mn + "where OrderId=" + OrderNo, con);
                        cmd.ExecuteNonQuery();
                        string ss = txtnamount.Text.Substring(2);
                        double ddd = Convert.ToDouble(ss);
                        int mmmm = Convert.ToInt32(ddd);

                        cmd = new SqlCommand("update tblOrder set NetAmount=" + mmmm + "where OrderId=" + OrderNo, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        btnpay.Enabled = false;


                        Response.Redirect("~/Thanks page/frmThanks.aspx?orderno=" + OrderNo);


                    }
                    else
                    {

                        OrderNo = ProductController.insertorder(int.Parse(Request["Custid"].ToString()), float.Parse(carttotal.ToString()), float.Parse(taxamt.ToString()), float.Parse((carttotal + taxamt + 10).ToString()), Int32.Parse(Session["shipid"].ToString()), Int32.Parse(Session["billid"].ToString()), a, Request["Billfname"].ToString());
                        con.Open();
                        int mm = int.Parse(txtcamount.Text);
                        cmd = new SqlCommand("update tblOrder set OrderAmount=" + mm + "where OrderId=" + OrderNo, con);
                        cmd.ExecuteNonQuery();

                        string s = txttamount.Text.Substring(2);
                        double dd = Convert.ToDouble(s);
                        int mn = Convert.ToInt32(dd);
                        cmd = new SqlCommand("update stblOrder set TaxAmount=" + mn + "where OrderId=" + OrderNo, con);
                        cmd.ExecuteNonQuery();
                        string ss = txtnamount.Text.Substring(2);
                        double ddd = Convert.ToDouble(ss);
                        int mmmm = Convert.ToInt32(ddd);
                        cmd = new SqlCommand("update tblOrder set NetAmount=" + mmmm + "where OrderId=" + OrderNo, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("~/Thanks page/frmThanks.aspx?orderno=" + OrderNo);
                    }

                }
            }

        }
        else
        {
            Response.Write("<script>alert('Enter card number , pin & date of expiry')</script>");
        }
    }
    public int orderno
    {
        get
        {
            return OrderNo;
        }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlDataReader dr;
        cmd = new SqlCommand("select * from tblBankAccount where AccName='" + Session["UserName"] + "'", con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr[1].ToString() == TextBox1.Text)
            {
                con.Close();
                Response.Write("<script>alert('Proceed')</script>");
                //  TextBox1.Text = AES_Algorithim.CreditCard.Main1(TextBox1.Text);
                Literal1.Text = AES_Algorithim.CreditCard.Main1(TextBox1.Text);
                Literal1.Visible = true;
            }
            else
            {
                con.Close();
                Response.Write("<script>alert('invalid card number')</script>");

            }
        }
        else
        {
            con.Close();
            Response.Write("<script>alert('Enter Valid Card Number')</script>");
            Response.Redirect("~/Payment/frmPayment.aspx");
        }
        //bool v = AES_Algorithim.CreditCard.IsValid(TextBox1.Text);
        //if (v == true)
        //{
        //    Response.Write("<script>alert('Enter 11 Digit and Valid Credit No')</script>");
        //}

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        decimal p2p = Convert.ToDecimal(TextBox2.Text);
        decimal p3, p4;
        p3 = Convert.ToDecimal(txtnamount.Text);


        if (p2p <= 10)
        {
            p3 = Convert.ToDecimal(txtnamount.Text);
            p4 = 50;
            txtnamount.Text = (p3 - p4).ToString();
        }
        else if (p2p <= 50)
        {
            p3 = Convert.ToDecimal(txtnamount.Text);
            p4 = 100;
            txtnamount.Text = (p3 - p4).ToString();
        }
        else
        {
            p3 = Convert.ToDecimal(txtnamount.Text);
            p4 = 150;
            txtnamount.Text = (p3 - p4).ToString();
        }
        //obj.pointupdate(TextBox1.Text);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        bool one = obj.validonetime(TextBox3.Text, TextBox4.Text);
        if (one == true)
        {
            Random ran = new Random();
            string transactid = ran.Next(9999999).ToString();
            string paymentmode = "credit card";
            string point = "";
            string status = "";
            decimal netamount = Convert.ToDecimal(txtnamount.Text);
            if (netamount <= 200)
            {
                status = "pending";
            }
            else
            {
                status = "Sucessed";
            }
            decimal amount1 = Convert.ToDecimal(txtnamount.Text);
            if (amount1 <= 1000)
            {
                point = "10";
            }
            else if (amount1 <= 5000)
            {
                point = "50";
            }
            else
            {
                point = "100";
            }

            obj.payment(transactid, TextBox1.Text, paymentmode, txtnamount.Text, point, status);
            obj.amountdeduct(TextBox1.Text, txtnamount.Text);

            panel1.Visible = true;
            panel2.Visible = false;
        }
        else
        {
            Response.Write("<script>alert('Wrong Password')</script>");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection("server=.;user id=sa;password=admin123;database=EGiftShopee");
        con.Open();

        SqlDataAdapter adp = new SqlDataAdapter("select sum(cast(point as int)) from payment where accno='" + TextBox1.Text + "'", con);

        System.Data.DataSet ds22 = new DataSet();
        adp.Fill(ds22);
        for (int a = 0; a < ds22.Tables[0].Rows.Count; a++)
        {
            TextBox2.Text = ds22.Tables[0].Rows[a][0].ToString();
        }

    }




    protected void txtcode_TextChanged1(object sender, EventArgs e)
    {
        con.Open();
        SqlDataReader dr;
        cmd = new SqlCommand("select * from tblBankAccount where AccName='" + Session["UserName"] + "'", con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr[4].ToString() == txtcode.Text)
            {
                con.Close();
                Response.Write("<script>alert('Proceed')</script>");
                //  TextBox1.Text = AES_Algorithim.CreditCard.Main1(TextBox1.Text);
                //Literal1.Text = AES_Algorithim.CreditCard.Main1(TextBox1.Text);
                //Literal1.Visible = true;
            }
            else
            {
                con.Close();
                Response.Write("<script>alert('invalid pin number')</script>");

            }
        }
        else
        {
            con.Close();
            Response.Write("<script>alert('Enter Valid pin Number')</script>");
            //Response.Redirect("~/Payment/frmPayment.aspx");
        }
    }
}