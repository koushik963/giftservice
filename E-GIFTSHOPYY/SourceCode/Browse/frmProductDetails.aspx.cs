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

public partial class Browse_frmProductDetails : System.Web.UI.Page
{
    string User;
    string ProductId;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnWish.Attributes.Add("onclick", "return alert('Your Product added to Wishlist');");
        if (Session["Username"] != null)
        {
            btnWish.Visible = true;
        }
    }
    protected void btnBuy_Click1(object sender, EventArgs e)
    {
        int PID;
        string SID;
        int Qty = 1;
        float Price;
        SID = Session.SessionID;
        PID =Int32.Parse(Request["PID"].ToString());
        Price = float.Parse(ProductController.getProductPrice(PID));
        ProductController.GetQuantity(PID, SID, Qty, Price);
        Response.Redirect("~/Cart/frmShoppingCart.aspx");
    }
   
    
    protected void btnRefer_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Browse/frmrefertofriend.aspx");
    }
    protected void btnRating_Click(object sender, EventArgs e)
    {

    }
    protected void btnRating_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Browse/frmRating.aspx?PID=" + Request["PID"].ToString());
    }
    protected void btnWish_Click(object sender, EventArgs e)
    { 
        
        if (Session["Username"] != null)
        {
            User = Session["Username"].ToString();
        }

        if (Request["PID"] != null)
        {
            ProductId = Request["PID"].ToString();
        }

        ProductController.InsertWishlist(User, ProductId);
        
      }
   
}
