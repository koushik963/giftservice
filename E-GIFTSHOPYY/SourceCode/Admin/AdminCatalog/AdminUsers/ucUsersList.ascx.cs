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

public partial class Admin_AdminCatalog_AdminUsers_ucUsersList : System.Web.UI.UserControl
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
        DataSet ds = UserController.getALLUsers();
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
        country();
        state();
        city();
    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dsState = ProductController.getAllStatesByCountryID(int.Parse(ddlcountry.SelectedValue));
        BindDDL(ddlstate, dsState, "Name", "ID");
        DataSet dscity = ProductController.getCitydetailsByStateID(int.Parse(ddlstate.SelectedValue));
        BindDDL(ddlcity, dscity, "Name", "ID");
    }
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dscity = ProductController.getCitydetailsByStateID(int.Parse(ddlstate.SelectedValue));
        BindDDL(ddlcity, dscity, "Name", "ID");
    }
    private void state()
    {
        DataSet dsState = ProductController.getAllStatedetails();
        BindDDL(ddlstate, dsState, "Name", "ID");
    }
    private void country()
    {
        DataSet dsCountry = ProductController.getCountrydetails();
        BindDDL(ddlcountry, dsCountry, "Name", "ID");
    }
    private void BindDDL(DropDownList ddl, DataSet ds, string txtField, string valField)
    {
        ddl.DataSource = ds;
        ddl.DataTextField = txtField;
        ddl.DataValueField = valField;
        ddl.DataBind();
    }
    private void city()
    {
        DataSet dscity = ProductController.getCitydetails();
        BindDDL(ddlcity, dscity, "Name", "ID");
    } 
    protected void IbtnBrandSubmit_Click(object sender, ImageClickEventArgs e)
    {
        string BrandName = "", Description = "", imageurl = "", Logo = "";
        //if (txtBrandName.Text.Trim().Length > 0)
        //    BrandName = txtBrandName.Text.Trim();
        //else
        //    lblMsgNewBrand.Text = "Enter Brand Name";
        //Description = txtBrandDescriptrion.Text.Trim();
        //if (fileBrand.FileName != null && fileBrand.FileName.Trim() != "")
        //{
        //    imageurl = "~/Browse/Images/" + fileBrand.FileName;
        //    fileBrand.SaveAs(Server.MapPath(imageurl));
        //    Logo = fileBrand.FileName;
        //}
        //else
        //{
        //    if (imgBrandLogo.ImageUrl != null)
        //    {
        //        Logo = Path.GetFileName(imgBrandLogo.ImageUrl);
        //    }
        //    else
        //        Logo = "na.jpg";
        //}

        int AddressID = Convert.ToInt32(lblAddressID.Text.Trim());
        int UserID = Convert.ToInt32(lblUserID.Text.Trim());
        UserController.UpdateUserDetails(txtuser.Text, txtfname.Text, txtlname.Text, GMDatePicker1.Date, txtcontact.Text, rdSex.SelectedValue, txtmail.Text, txtaddr.Text, int.Parse(ddlcountry.SelectedValue), int.Parse(ddlstate.SelectedValue), int.Parse(ddlcity.SelectedValue), txtZipCode.Text, AddressID, UserID);
        lblres.Text = "Done!!!";
        BindList();
        panelTop.Visible = true;
        panelupdate.Visible = false;
    }
    protected void dlBrand_ItemCommand(object source, DataListCommandEventArgs e)
    {
        ListItem li = null;
        if (e.CommandName == "Edit")
        {
            DataSet ds = UserController.GetUserBYUserID(int.Parse(e.CommandArgument.ToString()));
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblUserID.Text = e.CommandArgument.ToString();
                lblAddressID.Text = ds.Tables[0].Rows[0]["AddressId"].ToString();
                txtuser.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
                txtaddr.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                txtcontact.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                txtfname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                txtlname.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
                txtmail.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
                txtZipCode.Text = ds.Tables[0].Rows[0]["ZipCode"].ToString();
                li = ddlcity.Items.FindByText(ds.Tables[0].Rows[0]["CityName"].ToString());
                if(li!=null)
                {
                    ddlcity.ClearSelection();
                    li.Selected = true;
                }
                li = ddlcountry.Items.FindByText(ds.Tables[0].Rows[0]["CountryName"].ToString());
                if (li != null)
                {
                    ddlcountry.ClearSelection();
                    li.Selected = true;
                }
                li = ddlstate.Items.FindByText(ds.Tables[0].Rows[0]["StateName"].ToString());
                if (li != null)
                {
                    ddlstate.ClearSelection();
                    li.Selected = true;
                }
                li = rdSex.Items.FindByText(ds.Tables[0].Rows[0]["Gender"].ToString());
                if (li != null)
                {
                    rdSex.ClearSelection();
                    li.Selected = true;
                }
                GMDatePicker1.Date = Convert.ToDateTime(ds.Tables[0].Rows[0]["DOB"].ToString());
                panelTop.Visible = false;
                panelupdate.Visible = true;
            }
        }
        if (e.CommandName == "Delete")
        {
            lblUserID.Text = e.CommandArgument.ToString();
            int UserId = int.Parse(lblUserID.Text);
            UserController.DeleteUserByUserID(UserId);
            BindList();
        }
    }
    protected void IBtnBrandCancel_Click(object sender, ImageClickEventArgs e)
    {
        panelupdate.Visible = false;
        panelTop.Visible = true;
    }
}
