using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_LoginHistory : System.Web.UI.Page
{
    ServiceReference1.WebServiceSoapClient obj = new ServiceReference1.WebServiceSoapClient();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        string from = TextBox1.Text;
        string to = TextBox2.Text;
        ds = obj.loginhistory(from,to);
        GridView1.DataSource = ds;
        GridView1.DataBind();

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}