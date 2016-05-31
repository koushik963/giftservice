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

public partial class Browse_Controls_ucBrandProducts : System.Web.UI.UserControl
{
    int PID;
    DataSet dsProducts;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        int BrandID;
        if (!IsPostBack)
        {
            lblMsg.Text = "";
            if (Request["BID"] != null)
            { 
                BrandID=Int32.Parse(Request["BID"].ToString());
                lblHeader.Text = ProductController.GetBrandName(BrandID);
                
                dsProducts = ProductController.GetAllProductsBYBrandID(BrandID);
                if (dsProducts.Tables[0].Rows.Count > 0)
                {
                    BindDataList(dlProducts, dsProducts);
                   //Response.Write(dsProducts.Tables[0].Rows[0][1]).ToString();
                }
                else
                {
                    lblMsg.Text = "No Products available for this brand";
                }
            }
            else
            {
                lblMsg.Text = "Not a valid Brand";
            }
        }
    }
    private void BindDataList(DataList dl, DataSet ds)
    {
        dl.DataSource = ds;
        dl.DataBind();
    }
    protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
    {
        float Price;
        if (e.CommandName == "Detail")
        {
            Response.Redirect("~/Browse/frmProductDetails.aspx?PID=" + e.CommandArgument.ToString());
        }
        else 
        {
            if (e.CommandName == "Buy")
            {
                PID =int.Parse(e.CommandArgument.ToString());
                Price = float.Parse(ProductController.getProductPrice(PID));
                AddProductToCart(Session["sessionId"].ToString(), PID, Price, 1);
                Response.Redirect("~/Cart/frmShoppingCart.aspx?PID=" + e.CommandArgument.ToString());
            }    
        }
    }
    private void AddProductToCart(string SID,int PID,float Price,int Qty)
    {
        ProductController.GetQuantity(PID, SID, Qty, Price);
    }
}
