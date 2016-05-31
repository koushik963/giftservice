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

public partial class Browse_Controls_ucCategoryProducts : System.Web.UI.UserControl
{
    int CategoryID;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet dsProducts;
        
        if (!IsPostBack)
        {
            lblMsg.Text = "";
            if (Request["CID"] != null)
            {
                CategoryID = Int32.Parse(Request["CID"].ToString());
                dsProducts = ProductController.GetAllProductsByCategoryID(CategoryID);
                if (dsProducts.Tables[0].Rows.Count > 0)
                {
                    BindDataList(dlCatProducts, dsProducts);
                }
                else
                {
                    lblMsg.Text = "No Products available for this Category";
                }
            }
            else
            {
                lblMsg.Text = "Not a valid Category";
            }
        }
    }
    private void BindDataList(DataList dl, DataSet ds)
    {
        dl.DataSource = ds;
        dl.DataBind();
    }


    
    protected void dlCatProducts_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Detail")
        {
            Response.Redirect("~/Browse/frmProductDetails.aspx?PID=" + e.CommandArgument.ToString());
        }
        else
        {
            if (e.CommandName == "Buy Now")
            {
                int p;
                p= int.Parse(e.CommandArgument.ToString());
                float price=float.Parse(ProductController.getProductPrice(p));

                AddProductToCart(Session.SessionID,p,price,1);
                Response.Redirect("~/Cart/frmShoppingCart.aspx?=" + e.CommandArgument.ToString());
            }
        }

    }
    private void AddProductToCart(string s,int Pid,float p,int Qty)
    {
        ProductController.GetQuantity(Pid, s, Qty, p);
    }
}
