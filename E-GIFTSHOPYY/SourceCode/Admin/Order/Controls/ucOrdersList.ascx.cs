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
using System.Data.SqlClient;


public partial class Order_Controls_ucOrdersList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {  
        if (!IsPostBack)
        {
            DataSet ds = ProductController.getadminorder();
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlOrder.DataSource = ds;
                dlOrder.DataBind();
            }
        }
    }
    protected void dlOrder_ItemCommand(object source, DataListCommandEventArgs e)
    {
        float amnt = 0;
        int j = 0;
        string s="";
        TextBox t = null;
        Button b = null, bcancel = null;
        Label l = null,lorder=null;
        DropDownList ddl = null;
        Control cnt = null;
        float bl;
        bool IsError = false;
        if (e.CommandName == "Edit")
        {
            cnt = e.Item.FindControl("btnEdit");
            if (cnt != null)
            {
                b = (Button)cnt;
                b.Text = "Update";
                b.CommandName="Update";
            }

            cnt = e.Item.FindControl("btnCancel");
            if (cnt != null)
            {
                bcancel = (Button)cnt;
                bcancel.Visible = true;
            }
           
            cnt = e.Item.FindControl("txtAmount");
            if (cnt != null)
            {
                t = (TextBox)cnt;
                t.Visible = true;
            }
            cnt = e.Item.FindControl("lblOrderStatus");
            if (cnt != null)
            {
                l = (Label)cnt;
                l.Visible = false;
            }
            cnt = e.Item.FindControl("lblAmount");
            if (cnt != null)
            {
                l = (Label)cnt;
                l.Visible = false;
            }
            cnt = e.Item.FindControl("ddlOrderStatus");
            if (cnt != null)
            {
                ddl = (DropDownList)cnt;
                ddl.Visible = true;
            }
        }
        if (e.CommandName == "Update")
        {
            cnt = e.Item.FindControl("txtAmount");
            if (cnt != null)
            {
                t = (TextBox)cnt;
                cnt = e.Item.FindControl("lblAmount");
                if (cnt != null)
                {
                    l = (Label)cnt;
                    l.Visible = false;
                }

                bl = float.Parse(l.Text);
                if (float.TryParse(t.Text, out bl))
                    amnt = float.Parse(t.Text);
                else
                {
                    //lblComment.Text = "Must enter valid amount";
                    Response.Write("<script>alert('Must enter valid amount');</script>");
                    lblComment.Visible = true;
                    IsError = true;
                }
            }
            
            cnt = e.Item.FindControl("ddlOrderStatus");
            if (cnt != null)
            {
                ddl = (DropDownList)cnt;
                s = ddl.SelectedItem.Text;
            }
            cnt = e.Item.FindControl("lblOrderNo");
            if (cnt != null)
            {
                l = (Label)cnt;
                j = int.Parse(l.Text);
            }
            if(!IsError)
            ProductController.updateadminorder(amnt, s, j);
            cnt = e.Item.FindControl("lblAmount");
            if (cnt != null)
            {
                l = (Label)cnt;
                l.Visible = true;
            }
            cnt = e.Item.FindControl("lblOrderNo");
            if (cnt != null)
            {
                lorder = (Label)cnt;
                j = int.Parse(lorder.Text);
                SqlDataReader dr = ProductController.updateadminorder1(j);
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        l.Text = dr["netamount"].ToString();
                        cnt = e.Item.FindControl("lblOrderStatus");
                        if (cnt != null)
                        {
                            l = (Label)cnt;
                            l.Visible = true;
                        }
                        l.Text = dr["description"].ToString();
                    }
                }
            }

            cnt = e.Item.FindControl("ddlOrderStatus");
            if (cnt != null)
            {
                ddl = (DropDownList)cnt;
                ddl.Visible = false;
            }


            cnt = e.Item.FindControl("txtAmount");
            if (cnt != null)
            {
                t = (TextBox)cnt;
                t.Visible = false;
            }
            cnt = e.Item.FindControl("btnEdit");
            if (cnt != null)
            {
                b = (Button)cnt;
                b.Text = "Edit";
                b.CommandName = "Edit";
            }

            cnt = e.Item.FindControl("btnCancel");
            if (cnt != null)
            {
                bcancel = (Button)cnt;
                bcancel.Visible = false;
            }
                                         
        }
        if (e.CommandName == "Cancel")
        {
                cnt = e.Item.FindControl("lblAmount");
                if (cnt != null)
                {
                    l = (Label)cnt;
                    l.Visible = true;
                }
                cnt = e.Item.FindControl("lblOrderNo");
                if (cnt != null)
                {
                    lorder = (Label)cnt;
                    j = int.Parse(lorder.Text);
                    SqlDataReader dr=ProductController.updateadminorder1(j);
                    if (dr.HasRows)
                    {
                        if (dr.Read())
                        {
                            l.Text = dr["netamount"].ToString();
                            cnt = e.Item.FindControl("lblOrderStatus");
                            if (cnt != null)
                            {
                                l = (Label)cnt;
                                l.Visible = true;
                            }
                            l.Text = dr["description"].ToString();
                        }
                    }
                }
            
                cnt = e.Item.FindControl("ddlOrderStatus");
                if (cnt != null)
                {
                    ddl = (DropDownList)cnt;
                    ddl.Visible = false;
                }
               
               
                cnt = e.Item.FindControl("txtAmount");
                if (cnt != null)
                {
                    t = (TextBox)cnt;
                    t.Visible = false;
                }
                cnt = e.Item.FindControl("btnEdit");
                if (cnt != null)
                {
                    b = (Button)cnt;
                    b.Text = "Edit";
                    b.CommandName = "Edit";
                }

                cnt = e.Item.FindControl("btnCancel");
                if (cnt != null)
                {
                    bcancel = (Button)cnt;
                    bcancel.Visible = false;
                }
             
        }
            if (e.CommandName == "Delete")
            {
                cnt = e.Item.FindControl("lblOrderNo");
                if (cnt != null)
                {
                    lorder = (Label)cnt;
                    j = int.Parse(lorder.Text);
                    ProductController.deleteadminorder(j);
                    DataSet ds = ProductController.getadminorder();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        dlOrder.DataSource = ds;
                        dlOrder.DataBind();
                    }
                }
            }
    }
    protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFilter.SelectedValue == "Order Date")
        {
            pnlDate.Visible = true;
            pnlAmount.Visible = false;
            pnlCustName.Visible = false;
            pnlStatus.Visible = false;
            pnlNumber.Visible = false;
        }
        else if (ddlFilter.SelectedValue == "Order Amount")
            {
                pnlDate.Visible = false;
                pnlAmount.Visible = true;
                pnlCustName.Visible = false;
                pnlStatus.Visible = false;
                pnlNumber.Visible = false;
            }
            else if (ddlFilter.SelectedValue == "Customer Name")
                {
                    pnlDate.Visible = false;
                    pnlAmount.Visible = false;
                    pnlCustName.Visible = true;
                    pnlStatus.Visible = false;
                    pnlNumber.Visible = false;
                }
                else if (ddlFilter.SelectedValue == "Order Status")
                {
                    pnlDate.Visible = false;
                    pnlAmount.Visible = false;
                    pnlCustName.Visible = false;
                    pnlStatus.Visible = true;
                    pnlNumber.Visible = false;
                }
                else if (ddlFilter.SelectedValue == "Order Number")
                {
                    pnlDate.Visible = false;
                    pnlAmount.Visible = false;
                    pnlCustName.Visible = false;
                    pnlStatus.Visible = false;
                    pnlNumber.Visible = true;
                }
    }
    protected void btnFilterBYGo_Click(object sender, EventArgs e)
    {
        int k=0;
        if (pnlCustName.Visible == true)
        {
            if (txtCustName.Text != null)
            {
                SqlDataReader dr = ProductController.filterbyname(txtCustName.Text);
                if (dr.HasRows)
                {
                    dlOrder.Visible = true;
                    dlOrder.DataSource = dr;
                    dlOrder.DataBind();
                    lblComment.Visible = false;
                }
                else
                {
                    dlOrder.Visible = false;
                    lblComment.Visible = true;
                    lblComment.Text = "No records found";
                }
            }
        }
        if (pnlNumber.Visible == true)
        {
            if (txtOrderNo.Text != null)
            {
                k = int.Parse(txtOrderNo.Text);
                SqlDataReader sqldr = ProductController.filterbyorderno(k);
                if (sqldr.HasRows)
                {
                    dlOrder.Visible = true;
                    dlOrder.DataSource = sqldr;
                    dlOrder.DataBind();
                    lblComment.Visible = false;

                }
                else
                {
                    dlOrder.Visible = false;
                    lblComment.Visible = true;
                    lblComment.Text = "No records found";
                }
            }
        }
       
        if (pnlStatus.Visible == true)
        {
            if (ddlStatus.SelectedValue!=null)
            {
                DataSet ds = ProductController.filterbystatus(ddlStatus.SelectedValue.ToString());
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dlOrder.Visible = true;
                    dlOrder.DataSource = ds;
                    dlOrder.DataBind();
                    lblComment.Visible = false;
                }
                else
                {
                    lblComment.Visible = true;
                    lblComment.Text = "No records found";
                    dlOrder.Visible = false;
                }
            }
        }
       if(pnlAmount.Visible==true)
       {
           if (txtOAmount.Text != null)
           {
               DataSet ds = ProductController.CustomFilter(int.Parse(ddlOAmount.SelectedValue), double.Parse(txtOAmount.Text));
               if (ds.Tables[0].Rows.Count > 0)
               {
                   dlOrder.DataSource = ds;
                   dlOrder.DataBind();
                   dlOrder.Visible = true;
                   lblComment.Visible = false;
               }
               else
               {
                   lblComment.Visible = true;
                   lblComment.Text = "No records found";
                   dlOrder.Visible = false;
               }
           }
       }
       if (pnlDate.Visible == true)
       {
           if (GMDatePicker1.Date != null)
           {
               if (GMDatePicker2.Date != null)
               {
                   DataSet ds = ProductController.filterbydate(GMDatePicker1.Date, GMDatePicker2.Date);
                   if (ds.Tables[0].Rows.Count > 0)
                   {
                       dlOrder.DataSource = ds;
                       dlOrder.DataBind();
                       dlOrder.Visible = true;
                       lblComment.Visible = false;
                   }
                   else
                   {
                       lblComment.Visible = true;
                       lblComment.Text = "No records found";
                       dlOrder.Visible = false;
                   }
               }
           }
       }
    }
    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSortByGo_Click(object sender, EventArgs e)
    {
        if (ddlSort.SelectedValue == "Order No")
        {
            if (rdOrder.Text == "Ascending")
            {
                DataSet ds = ProductController.sortbyordernoasc();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dlOrder.DataSource = ds;
                    dlOrder.DataBind();
                }
            }
            if (rdOrder.Text == "Descending")
            {
                DataSet ds = ProductController.sortbyordernodesc();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dlOrder.DataSource = ds;
                    dlOrder.DataBind();
                }
            }
        }
        if (ddlSort.SelectedValue == "Customer Name")
        {
            if (rdOrder.Text == "Ascending")
            {
                DataSet ds = ProductController.sortbycustnameasc();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dlOrder.DataSource = ds;
                    dlOrder.DataBind();
                }
            }
            if (rdOrder.Text == "Descending")
            {
                DataSet ds = ProductController.sortbycustnamedesc();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dlOrder.DataSource = ds;
                    dlOrder.DataBind();
                }
            }
        }
        if (ddlSort.SelectedValue == "Order Date")
        {
            if (rdOrder.Text == "Ascending")
            {
                DataSet ds = ProductController.sortbyorderdateasc();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dlOrder.DataSource = ds;
                    dlOrder.DataBind();
                }
            }
            if (rdOrder.Text == "Descending")
            {
                DataSet ds = ProductController.sortbyorderdatedesc();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dlOrder.DataSource = ds;
                    dlOrder.DataBind();
                }
            }
        }
    }
}
