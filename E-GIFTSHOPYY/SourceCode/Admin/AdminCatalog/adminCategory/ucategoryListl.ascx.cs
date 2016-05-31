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

public partial class ucategoryListl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindList();
            panelCategoryTop.Visible = true;
            panelNewCategory.Visible = false;
        }
    }
    private void BindList()
    {
        DataSet ds = ProductController.getALLCategories();
        lblMsg.Text = "";
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlCategory.DataSource = ds;
            dlCategory.DataBind();
        }
        else 
        {
            lblMsg.Text = "No such Item !!! Please add one";
        }
    }
    protected void lBtnNewCategory_Click(object sender, EventArgs e)
    {
        lblNewCAtegoryHeader.Text = "Add New Category";
        panelCategoryTop.Visible = false;
        panelNewCategory.Visible = true;
        IbtnCatSubmit.AlternateText = "Submit";
        txtCategoryName.Text = "";
        txtCatDescriptrion.Text = "";
       // imgCatLogo.Visible = false;
        //lblImage.Visible = false;
        
    }
    protected void IbtnCatSubmit_Click(object sender, ImageClickEventArgs e)
    {
        string catname="", description="", imageurl="",image="";
        if (txtCategoryName.Text.Trim().Length > 0)
            catname = txtCategoryName.Text.Trim();
        else
            lblMsgNewCat.Text = "Enter Category Name";
        description = txtCatDescriptrion.Text.Trim();
        if (fileCat.FileName != null && fileCat.FileName.Trim()!="")
            {
                imageurl = "~/Browse/Images/" + fileCat.FileName;
                fileCat.SaveAs(Server.MapPath(imageurl));
                image=fileCat.FileName;
            }
            else
            {
                if (imgCatLogo.ImageUrl != null)
                {
                    image = Path.GetFileName(imgCatLogo.ImageUrl);
                }
                else
                    image = "na.jpg";
            }
        
        
       if (IbtnCatSubmit.AlternateText == "Submit")
       {
           ProductController.InsertCategory(catname, description, image);
       }
        else
        {
            int catid = int.Parse(lblCatID.Text);
            ProductController.UpdateCategory(catid,catname, description, image);
        }
        BindList();
        panelCategoryTop.Visible = true;
        panelNewCategory.Visible = false;
    }
    protected void dlCategory_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            lblNewCAtegoryHeader.Text = "Update Category";
            DataSet ds = ProductController.GetAllCategoriesBYCategoryID(int.Parse(e.CommandArgument.ToString()));
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblCatID.Text = e.CommandArgument.ToString();
                txtCategoryName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtCatDescriptrion.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                imgCatLogo.ImageUrl = String.Format("~/Browse/Images/{0}", ds.Tables[0].Rows[0]["Image"].ToString());
                IbtnCatSubmit.AlternateText = "Update";
                panelCategoryTop.Visible = false;
                panelNewCategory.Visible = true;
            }
          }
        if (e.CommandName == "Delete")
        {
            lblCatID.Text = e.CommandArgument.ToString();
            int catid = int.Parse(lblCatID.Text);
            //Response.Write(catid);
           ProductController.DeleteCategory(catid);
           BindList();
        }
    }

    protected void IBtnCatCancel_Click(object sender, ImageClickEventArgs e)
    {
        panelCategoryTop.Visible = true;
        panelNewCategory.Visible = false;
    
    }
   }
