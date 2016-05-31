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

public partial class ucBrandList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindList();
            panelTop.Visible = true;
            panelupdate.Visible = false;
        }
    }
    private void BindList()
    {
        DataSet ds = ProductController.getALLBrands();
        lblMsg.Text = "";
        if (ds.Tables[0].Rows.Count > 0)
        {
         dlBrand.DataSource = ds;
         dlBrand.DataBind();
        }
        else
        {
            lblMsg.Text = "No such Item !!! Please add one";
        }

}
    protected void lBtnNewBrand_Click(object sender, EventArgs e)
    {
        lblUpdateBrand.Text = "Add New Record";
        panelTop.Visible = false;
        panelupdate.Visible = true;
        IbtnBrandSubmit.AlternateText = "Submit";
        txtBrandName.Text = "";
        txtBrandDescriptrion.Text = "";
        //imgBrandLogo.Visible = false;
        //lblBrandLogo.Visible = false;
                
    }
    protected void IbtnBrandSubmit_Click(object sender, ImageClickEventArgs e)
    {
        string BrandName="", Description="",imageurl="",Logo="";
        if (txtBrandName.Text.Trim().Length > 0)
            BrandName = txtBrandName.Text.Trim();
        else
            lblMsgNewBrand.Text = "Enter Brand Name";
        Description =txtBrandDescriptrion.Text.Trim();
        if (fileBrand.FileName != null && fileBrand.FileName.Trim() != "")
        {
            imageurl = "~/Browse/Images/" + fileBrand.FileName;
            fileBrand.SaveAs(Server.MapPath(imageurl));
            Logo = fileBrand.FileName;
        }
        else
        {
            if (imgBrandLogo.ImageUrl != null)
            {
                Logo = Path.GetFileName(imgBrandLogo.ImageUrl);
            }
            else
                Logo = "na.jpg";
        }        
        
        if (IbtnBrandSubmit.AlternateText == "Submit")
        {
            ProductController.InsertBrand(BrandName, Description, Logo);
        }
        else
        {
            int ID = int.Parse(lblBrandID.Text);
            ProductController.UpdateBrand(ID, BrandName,Description,Logo);
        }
        BindList();
        panelTop.Visible = true;
        panelupdate.Visible = false;
    }
    protected void dlBrand_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            lblUpdateBrand.Text = "Update Record";
            //IbtnBrandSubmit.AlternateText = "Update";
            DataSet ds = ProductController.GetAllBrandBYBrandID(int.Parse(e.CommandArgument.ToString()));
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblBrandID.Text = e.CommandArgument.ToString();
                txtBrandName.Text = ds.Tables[0].Rows[0]["BrandName"].ToString();
                txtBrandDescriptrion.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                imgBrandLogo.ImageUrl = String.Format("~/Browse/Images/{0}", ds.Tables[0].Rows[0]["Logo"].ToString());
                IbtnBrandSubmit.AlternateText = "Update";
                panelTop.Visible = false;
                panelupdate.Visible = true;
            }
          }
        if (e.CommandName == "Delete")
        {
             lblBrandID.Text = e.CommandArgument.ToString();
             int BrandId = int.Parse(lblBrandID.Text);
             //Response.Write(BrandId);
            ProductController.DeleteBrand(BrandId);
            BindList();
        }
    }

    protected void IBtnBrandCancel_Click(object sender, ImageClickEventArgs e)
    {
        panelupdate.Visible = false;
        panelTop.Visible = true;
    }
    
}


