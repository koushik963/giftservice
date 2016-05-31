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

public partial class WishList_ucWishList : System.Web.UI.UserControl
{
    string s;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindWishList();
        }

    }

    private void BindWishList()
    {
        s = Session["Username"].ToString();
        DataSet ds = ProductController.GetWishListDetails(s);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlWishList.DataSource = ds;
            dlWishList.DataBind();
        }
        else
        {
            dlWishList.Visible = false;
            btnAddToCart.Visible = false;
            btnSelectAll.Visible = false;
            btnRemove.Visible = false;
            lblMsg.Text = "No items available in wishlist";
        }
    }

    protected void btnSelectAll_Click(object sender, EventArgs e)
    {
        CheckBox chk;
        if (btnSelectAll.Text == "Select All")
        {
            foreach (DataListItem li in dlWishList.Items)
            {
                chk = (CheckBox)(li.FindControl("chkSelect"));
                if (chk != null)
                {
                    chk.Checked = true;
                    btnSelectAll.Text = "Deselect All";
                }
            }
        }

        else

            if (btnSelectAll.Text == "Deselect All")
            {
                foreach (DataListItem li in dlWishList.Items)
                {
                    chk = (CheckBox)(li.FindControl("chkSelect"));
                    if (chk != null)
                    {
                        btnSelectAll.Text = "Select All";

                        chk.Checked = false;
                    }
                }

            }
    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {

        CheckBox chk;
        int ProductId = 0;
        string SessionId;
        Label lblProduct, lblprice;

        float Price = 0;

        foreach (DataListItem li in dlWishList.Items)
        {
            chk = (CheckBox)(li.FindControl("chkSelect"));
            if (chk != null)
            {
                if (chk.Checked == true)
                {
                    lblProduct = (Label)(li.FindControl("lblProductID"));

                    if (lblProduct != null)
                    {

                        ProductId = int.Parse(lblProduct.Text);

                    }

                    lblprice = (Label)(li.FindControl("lblPrice"));
                    if (lblprice != null)
                    {
                        Price = float.Parse(lblprice.Text);

                    }

                    if (Session["SessionId"] != null)
                    {
                        SessionId = (Session["SessionId"]).ToString();
                        ProductController.GetQuantity(ProductId, SessionId, 1, Price);
                        ProductController.DeleteWishList(ProductId);
                    }
                }
            }
        }
        BindWishList();
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        CheckBox chk;
        Label lblProduct;
        int ProductId = 0;
        foreach (DataListItem li in dlWishList.Items)
        {

            chk = (CheckBox)(li.FindControl("chkSelect"));
            if (chk != null)
            {
                if (chk.Checked == true)
                {
                    lblProduct = (Label)(li.FindControl("lblProductID"));

                    if (lblProduct != null)
                    {

                        ProductId = int.Parse(lblProduct.Text);

                    }
                    ProductController.DeleteWishList(ProductId);
                    
                }
            }
        }
        BindWishList();

           
    }

    
}