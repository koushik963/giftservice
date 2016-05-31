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
using System.IO;
using EGiftShopee.BL;

public partial class ucProductList : System.Web.UI.UserControl
{
    string Image="" ,imageUrl="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CategoryName();
            BrandName();
            BindList();
            panelProductTop.Visible = true;
            panelNewProduct.Visible = false;
            panelEditProduct.Visible = false;
        }
    }
    private void CategoryName()
    {
        DataSet ds = ProductController.getCategoryNames();
        BindDDL(ddlCategoryName, ds, "Name", "Id");
    }
    private void BrandName()
    {
        DataSet ds = ProductController.getBrandNames();
        BindDDL(ddlBrandName, ds, "BrandName", "Id");
    }
    private void BindDDL(DropDownList ddl, DataSet ds, string txtField, string valField)
    {
        ddl.DataSource = ds;
        ddl.DataTextField = txtField;
        ddl.DataValueField = valField;
        ddl.DataBind();
    }
    private void BindList()
    {
        DataSet ds = ProductController.GetAllProducts();
        lblMsg.Text = "";
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlProduct.DataSource = ds;
            dlProduct.DataBind();
        }
        else
        {
            lblMsg.Text = "No such Item !!! Please add one";
        }
    }
    protected void lBtnNewProduct_Click(object sender, EventArgs e)
    {
        panelProductTop.Visible = false;
        panelNewProduct.Visible = true;
        panelEditProduct.Visible = false;
    }
    protected void dlProduct_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DataSet ds = ProductController.GetAllProductsBYID(int.Parse(e.CommandArgument.ToString()));
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblID.Text = e.CommandArgument.ToString();
                txtUpdateProductName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtUpdateQuantity.Text = ds.Tables[0].Rows[0]["Quantity"].ToString();
                txtUpdatePurchasePrice.Text = ds.Tables[0].Rows[0]["PurchasePrice"].ToString();
                txtUpdateSalePrice.Text = ds.Tables[0].Rows[0]["SalePrice"].ToString();
                txtUpdateDiscription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                iUpload.ImageUrl = String.Format("~/Browse/Images/{0}", ds.Tables[0].Rows[0]["Image"]).ToString();
                panelProductTop.Visible = false;
                panelNewProduct.Visible = false;
                panelEditProduct.Visible = true;
            }
        }
        if (e.CommandName == "Delete")
        {
            lblID.Text = e.CommandArgument.ToString();
            int Id = int.Parse(lblID.Text);
            ProductController.DeleteProduct(Id);
            BindList();
        }
    }
    protected void ibCancel_Click(object sender, ImageClickEventArgs e)
    {
        panelProductTop.Visible = true;
        panelNewProduct.Visible = false;
        panelEditProduct.Visible = false;
    }
    protected void IBtnProCancel_Click(object sender, ImageClickEventArgs e)
    {
        panelProductTop.Visible = true;
        panelNewProduct.Visible = false;
        panelEditProduct.Visible = false;
    }
    protected void ibNewproduct_Click(object sender, ImageClickEventArgs e)
    {
        string productname = "", Description = "";
        float PurchasePrice = 0, SalePrice = 0;
        int Quantity = 0;
        int BrandId = int.Parse(ddlBrandName.SelectedValue);
        Response.Write(BrandId);
        int CategoryId = int.Parse(ddlCategoryName.SelectedValue);
        Response.Write(CategoryId);
        PurchasePrice = float.Parse(txtPurPrice.Text);
        SalePrice = float.Parse(txtSalePrice.Text);
        Quantity = int.Parse(txtProductQuantity.Text);
        Image = fileProduct.FileName;
        if (txtProductName.Text.Trim().Length > 0)
            productname = txtProductName.Text.Trim();
        else
            lblMsgNewProduct.Text = "Enter Product Name";
        Description = txtProDescriptrion.Text.Trim();
        if (fileProduct.FileName != null && fileProduct.FileName.Trim() != "")
        {
            imageUrl = "~/Browse/Images/" + fileProduct.FileName;
            fileProduct.SaveAs(Server.MapPath(imageUrl));
            Image = fileProduct.FileName;
        }
        else
        {
            if (imgProductLogo.ImageUrl != null)
            {
                Image = Path.GetFileName(imgProductLogo.ImageUrl);
            }
            else
                imageUrl = "na.jpg";
        }
        ProductController.InsertProduct(productname, PurchasePrice, SalePrice, Quantity, Description, Image, BrandId, CategoryId);
        Response.Write(Image);
        BindList();
        panelProductTop.Visible = true;
        panelEditProduct.Visible = false;
        panelNewProduct.Visible = false;
    }
           protected void IbtnProUpdate_Click(object sender, ImageClickEventArgs e)
           {
            string productname = "", Description = "";
            float PurchasePrice = 0, SalePrice = 0;
            int Quantity = 0;
            PurchasePrice = float.Parse(txtUpdatePurchasePrice.Text);
            SalePrice = float.Parse(txtUpdateSalePrice.Text);
            Quantity = int.Parse(txtUpdateQuantity.Text);
            Image = fileUpdateImage.FileName;
            if (txtUpdateProductName.Text.Trim().Length > 0)
                productname = txtUpdateProductName.Text.Trim();
            else
                lblMsgUdateProduct.Text = "Enter Product Name";
            Description = txtUpdateDiscription.Text.Trim();

            if (fileUpdateImage.FileName != null && fileUpdateImage.FileName.Trim() != "")
            {
            imageUrl = "~/Browse/Images/" + fileUpdateImage.FileName;
            fileUpdateImage.SaveAs(Server.MapPath(imageUrl));
            Image = fileUpdateImage.FileName;
            }
            else
            {
            if (iUpload.ImageUrl != null)
            {
                Image = Path.GetFileName(iUpload.ImageUrl);
            }
            else
                Image = "na.jpg";
            }
            int Id = int.Parse(lblID.Text);
            ProductController.UpdateProduct(Id, productname, Description, Quantity, Image, PurchasePrice, SalePrice);
            
       
            BindList();
            panelProductTop.Visible = true;
            panelNewProduct.Visible = false;
            panelEditProduct.Visible = false;
        }
    
}


           
