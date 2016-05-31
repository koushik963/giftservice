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


public partial class Browse_Controls_ucShopping : System.Web.UI.UserControl
{
    int cartcount;
    protected void Page_Load(object sender, EventArgs e)
    {
        cartcount = dlCart.Items.Count;
        if (!IsPostBack)
        {
            BindCart();
        }       
    }

    private void BindCart()
    {        
        string SessionId;
        try 
        { 
            SessionId = Session["sessionId"].ToString();
            DataSet ds=ProductController.GetShoppingCartDetails(SessionId);
            if (SessionId == null)
            {
                lblGrandTotal.Visible = false;
                btnCheckOut.Visible = false;

                btnContinue.Visible = false;
                btnSelectAll.Visible = false;
                btnUpdate.Visible = false;
            }
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlCart.DataSource = ds;
                dlCart.DataBind();
                lblGrandTotal.Text = "Grand Total: Rs " + ProductController.GetCartTotal(SessionId).ToString();
                              
            }
            else
            {
                dlCart.Visible = false;
                lblGrandTotal.Visible = false;
                btnCheckOut.Visible = false;
                btnRemove.Visible = false;
                btnSelectAll.Visible = false;
                btnUpdate.Visible = false;
                lblMsg.Text = "Your cart is empty.";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnSelectAll_Click(object sender, EventArgs e)
    {
        
        if (btnSelectAll.Text == "Select All")
        {
            SelectAllCartItems(true);
            btnSelectAll.Text = "DeSelect All";
        }
        else
        {
            SelectAllCartItems(false);
            btnSelectAll.Text = "Select All";
        }
        

    }
    private void SelectAllCartItems(bool status)
    {
        Object obj;
        CheckBox chk;
        try
        {
            lblMsg.Text = "";
            foreach (DataListItem li in dlCart.Items)
            {
                obj = li.FindControl("chkSelect");
                if (obj != null)
                {
                    chk = (CheckBox)obj;
                    chk.Checked = status;
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Object obj;
        Object obj1;
        CheckBox chk;
        TextBox txtQty;
        Label lblSID, lblPID,lblTOT,lblPRICE;
        lblMsg.Text = "";
        lblPID = null;
        lblSID = null;
        txtQty = null;
        int i = 0;
         try
        {
            
            foreach (DataListItem li in dlCart.Items)
            {
                obj = li.FindControl("chkSelect");
                if (obj != null)
                {
                    chk = (CheckBox)obj;
                }
                obj = li.FindControl("txtQuantity");
                if (obj != null)
                {
                    txtQty = (TextBox)obj;
                }
                obj = li.FindControl("lblSessionID");
                if (obj != null)
                {
                    lblSID = (Label)obj;
                }
                obj = li.FindControl("lblProductID");
                if (obj != null)
                {
                    lblPID = (Label)obj;
                }
                ProductController.UpdateShoppingCartItem(lblSID.Text, Convert.ToInt32(lblPID.Text),Convert.ToInt32(txtQty.Text));
                obj = li.FindControl("lblTotal");
                
                obj1=li.FindControl("lblPrice");
                if (obj != null)
                {
                    lblTOT = (Label)obj;
                    lblPRICE = (Label)obj1;
                    lblTOT.Text = (Convert.ToInt32(lblPRICE.Text) * Convert.ToInt32(txtQty.Text)).ToString();
                }
            }
            BindCart(); 
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        Object obj;
        CheckBox chk=null;
        Label lblSID, lblPID;
        lblPID = null;
        lblSID = null;
        try
        {
            lblMsg.Text = "";
            foreach (DataListItem li in dlCart.Items)
            {
                obj = li.FindControl("chkSelect");
                if (obj != null)
                {
                    chk = (CheckBox)obj;
                }
                obj = li.FindControl("lblSessionID");
                if (obj != null)
                {
                    lblSID = (Label)obj;
                }
                obj = li.FindControl("lblProductID");
                if (obj != null)
                {
                    lblPID = (Label)obj;
                }
                if (chk.Checked == true)
                {
                    ProductController.RemoveShoppingCartItem(lblSID.Text, Convert.ToInt32(lblPID.Text));
                }                           
            }
            BindCart();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ShipingBilling/frmShipping.aspx");
    }
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        if (cartcount > 0)
        {
            Response.Redirect("../ShipingBilling/frmShipping.aspx");
        }
        
        //else
        //{
        //    lblGrandTotal.Visible = false;
        //    btnSelectAll.Visible = false;
        //    btnUpdate.Visible = false;
        //    btnRemove.Visible = false;
        //    btnCheckOut.Visible = false;

        //    Response.Write("hai");
           
        //    //Response.Write(""<script> alert('cart is empty')</script>"");
        //}
    }

    protected void dlCart_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        
            //DropDownList dlquantity = (DropDownList)e.Item.FindControl("ddlquantity");
            //Label lbltotalamount = (Label)e.Item.FindControl("lblPrice");
            //string strprice =e.Item.FindControl("lblTotal").ToString();
            //dlquantity.Attributes.Add("onchange","fncalculater('"+dlquantity.ClientID+"','"+strprice+"','"+lbltotalamount.ClientID+"')");
        
    }
}
