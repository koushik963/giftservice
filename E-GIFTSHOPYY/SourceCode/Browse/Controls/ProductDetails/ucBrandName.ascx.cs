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


public partial class Browse_Controls_ProductDetails_ucBrandName : System.Web.UI.UserControl
{
     protected void Page_Load(object sender, EventArgs e)
    {
        Session["pid"] = Request["PID"];
         int ProductId;

        if (!IsPostBack)
        {
            if (Request["PID"] != null)
            {
                ProductId = Int32.Parse(Request["PID"].ToString());
                lblBrandName.Text = ProductController.getBrandName(ProductId);
                lblPrice.Text = ProductController.getProductPrice(ProductId);
            }
        }
    }
   
}

    

