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

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = ProductController.getadminorder();
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlOrder.DataSource = ds;
            dlOrder.DataBind();
        }
    }
    

    protected void dlOrder_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void dlOrder_ItemCommand(object source, DataListCommandEventArgs e)
    {
        TextBox t = null;
        Button b = null, bcancel = null;
        Label l = null;
        DropDownList ddl = null;
        Control cnt = null;
        if (e.CommandName == "Edit")
        {
            cnt = e.Item.FindControl("btnEdit");
            if (cnt != null)
            {
                b = (Button)cnt;
                b.Text = "Update";
            }

            cnt = e.Item.FindControl("btnCancel");
            if (cnt != null)
            {
                bcancel = (Button)cnt;
                bcancel.Visible = true;
            }
            cnt = e.Item.FindControl("lblAmount");
            if (cnt != null)
            {
                l = (Label)cnt;
                l.Visible = false;
            }
            cnt = e.Item.FindControl("txtAmount");
            if (cnt != null)
            {
                t = (TextBox)cnt;
                t.Visible = true;
            }
            cnt = e.Item.FindControl("lblStatus");
            if (cnt != null)
            {
                l = (Label)cnt;
                l.Visible = false;
            }
            cnt = e.Item.FindControl("ddlStatus");
            if (cnt != null)
            {
                ddl = (DropDownList)cnt;
                ddl.Visible = true;
            }

            //foreach (DataListItem li in dlOrder.Items)

            //{
            //    b = (Button)(li.FindControl("btnEdit"));
            //    b.Text = "Update";
            //    bcancel = (Button)(li.FindControl("btnCancel"));
            //    bcancel.Visible = true;
            //    l = (Label)(li.FindControl("lblAmount"));
            //    l.Visible = false;
            //    t = (TextBox)(li.FindControl("txtAmount"));
            //    t.Visible = true;
            //    l = (Label)(li.FindControl("lblOrderStatus"));
            //    l.Visible = false;
            //    ddl = (DropDownList)(li.FindControl("ddlOrderStatus"));
            //    ddl.Visible = true;
            //    // "btnCancel"txtAmount"lblAmount"
            //    //lblOrderStatus "ddlOrderStatus"
            //}
        }
    }
    protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
