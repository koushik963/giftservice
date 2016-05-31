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


public partial class Browse_Controls_ProductDetails_ucProddesc : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ProductId;
        SqlDataReader dr;
        if (!IsPostBack)
        {
            if (Request["PID"] != null)
            {
                ProductId = (Request["PID"]).ToString();

                dr= ProductController.GetProductDesc(ProductId);
                if (dr.HasRows)
                {
                    if (dr.Read())
                    { 

                        lblDesc.Text = dr["desc"].ToString();
                        lblimgrating.Text = dr["img"].ToString();
                        
                    }
                }


            }
        }

    }
}