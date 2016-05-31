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

public partial class OrderDetails_ucOrderStatus : System.Web.UI.UserControl
{
    int On;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            string s = Session["UserName"].ToString();
            On = Int16.Parse(Request["Orderno"].ToString());
            Response.Write(On);
            DataSet dsRetrieveOrders = ProductController.RetrieveOrderStatus(s, On);
            dlOrders.DataSource = dsRetrieveOrders;
            dlOrders.DataBind();

        }
    }
    protected void btnCancelOrder_Click(object sender, EventArgs e)
    {
        On = Int16.Parse(Request["Orderno"].ToString());
        ProductController.DeleteOrderDetails(On);
    }
}
    
