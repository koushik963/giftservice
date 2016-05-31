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

public partial class Payment_ucShipping : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = "";
        ListItem li = null;
        if (!IsPostBack)
        {
            country();
            state();
            city();

            if (Session["UserName"] != null)
            {
                s = Session["UserName"].ToString();
                SqlDataReader dr = ProductController.getAccountDetails(s);
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {

                        txtfname.Text = dr["Fname"].ToString();
                        txtlname.Text = dr["Lname"].ToString();
                        txtContact.Text = dr["ContactNo"].ToString();
                        txtEmail.Text = dr["EmailID"].ToString();
                        txtaddr.Text = dr["Address"].ToString();
                        rdbtn.Text = dr["Gender"].ToString();
                        li=ddlCountry.Items.FindByValue(dr["CountryID"].ToString());
                        if (li != null)
                            li.Selected = true;
                        li = ddlState.Items.FindByValue(dr["StateID"].ToString());
                        if (li != null)
                            li.Selected = true;
                        li=ddlCity.Items.FindByText(dr["CityID"].ToString());
                        if (li != null)
                            li.Selected = true;
                    }
                }
            }

        }
    }
    private void state()
    {
        DataSet dsState = ProductController.getAllStatedetails();
        BindDDL(ddlState, dsState, "Name", "ID");
        BindDDL(ddlstate1, dsState, "Name", "ID");
    }
    private void country()
    {
        DataSet dsCountry = ProductController.getCountrydetails();
        BindDDL(ddlCountry, dsCountry, "Name", "ID");
        BindDDL(ddlcountry1, dsCountry, "Name", "ID");
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
        BindDDL(ddlCity, dscity, "Name", "ID");
        BindDDL(ddlcity1, dscity, "Name", "ID"); 
    } 

    protected void btnPayment_Click(object sender, EventArgs e)
    {
        int custid;
        int []a=new int[2];
       
        a = ProductController.spInsertAddressV2(txtfname.Text, txtlname.Text, txtEmail.Text, rdbtn.SelectedItem.ToString(), txtContact.Text,
       txtaddr.Text, int.Parse(ddlCountry.SelectedItem.Value),
       int.Parse(ddlState.SelectedItem.Value), int.Parse(ddlCity.SelectedItem.Value));
       custid=a[1];
       Session["shipid"] = a[0];
       a=ProductController.spInsertAddressV2(txtfname1.Text, txtlname1.Text, txtmail1.Text, rdbtn1.SelectedItem.ToString(),
       txtno1.Text, txtaddr1.Text, int.Parse(ddlcountry1.SelectedItem.Value),
       int.Parse(ddlstate1.SelectedItem.Value), int.Parse(ddlcity1.SelectedItem.Value));
       Session["billid"] = a[0];
       Response.Redirect("~/Payment/frmPayment.aspx?Billfname=" + txtfname.Text + "&custid=" + custid);
    }   
        
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dsState = ProductController.getAllStatesByCountryID(int.Parse(ddlCountry.SelectedValue));
        BindDDL(ddlState, dsState, "Name", "ID");
    DataSet dsCity = ProductController.getCitydetailsByStateID(int.Parse(ddlState.SelectedValue));
        BindDDL(ddlCity, dsCity, "Name", "ID");
    }
   protected void ddlState_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DataSet dscity = ProductController.getCitydetailsByStateID(int.Parse(ddlState.SelectedValue));
        BindDDL(ddlCity, dscity, "Name", "ID");
   }
    protected void chkEditShip_CheckedChanged(object sender, EventArgs e)
    {
        if (chkEditShip.Checked == true)
        {
            txtfname.Enabled = true;
            txtlname.Enabled = true;
            txtContact.Enabled = true;
            txtEmail.Enabled = true;
            txtaddr.Enabled = true;
            rdbtn.Enabled = true;
            ddlCountry.Enabled = true;
            ddlState.Enabled = true;
            ddlCity.Enabled = true;
        }

         else
        {
            txtfname.Enabled =false;
            txtlname.Enabled = false;
            txtContact.Enabled = false;
            txtEmail.Enabled = false;
            txtaddr.Enabled = false;
            rdbtn.Enabled = false;
            ddlCountry.Enabled = false;
            ddlState.Enabled = false;
            ddlCity.Enabled = false;
        }

    }
    protected void chkEditBiling_CheckedChanged(object sender, EventArgs e)
    {
        if (chkEditBiling.Checked == true)
        {
            ListItem li = null;
            txtfname1.Enabled = false; txtfname1.Text = txtfname.Text;
            txtlname1.Enabled = false; txtlname1.Text = txtlname.Text;
            txtno1.Enabled = false; txtno1.Text = txtContact.Text;
            txtmail1.Enabled = false; txtmail1.Text = txtEmail.Text;
            txtaddr1.Enabled = false; txtaddr1.Text = txtaddr.Text;
            ddlcountry1.Enabled = false;
            rdbtn1.Items.FindByValue(rdbtn.SelectedValue.ToString()).Selected=true;
            li=ddlcountry1.Items.FindByValue(ddlCountry.SelectedValue.ToString());
            if (li != null)
            {
                ddlcountry1.ClearSelection();
                li.Selected = true;
            }
            ddlstate1.Enabled = false;
            li = ddlstate1.Items.FindByValue(ddlState.SelectedValue.ToString());
            if (li != null)
            {
                ddlstate1.ClearSelection();
                li.Selected = true;
            }
            ddlcity1.Enabled = false;
            li = ddlcity1.Items.FindByValue(ddlCity.SelectedValue.ToString());
            if (li != null)
            {
                ddlcity1.ClearSelection();
                li.Selected = true;
            }
        }
        else
        {
            txtfname1.Enabled =true;
            txtlname1.Enabled =true;
            txtno1.Enabled = true;
            txtmail1.Enabled = true;
            txtaddr1.Enabled = true;
            rdbtn1.Enabled = true;
            ddlcountry1.Enabled = true;
            ddlstate1.Enabled = true;
            ddlcity1.Enabled = true;
        }

            
    }
    protected void ddlcountry1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dsState = ProductController.getAllStatesByCountryID(int.Parse(ddlcountry1.SelectedValue));
        BindDDL(ddlstate1, dsState, "Name", "ID");
        DataSet dsCity = ProductController.getCitydetailsByStateID(int.Parse(ddlstate1.SelectedValue));
        BindDDL(ddlcity1, dsCity, "Name", "ID");
    }
    protected void ddlstate1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCity.Items.Clear();
        DataSet dscity = ProductController.getCitydetailsByStateID(int.Parse(ddlstate1.SelectedValue));
        BindDDL(ddlcity1, dscity, "Name", "ID");

    }
} 

