using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class LogoutHistory : System.Web.UI.Page
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
        ds = obj.logouthistory(from, to);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}