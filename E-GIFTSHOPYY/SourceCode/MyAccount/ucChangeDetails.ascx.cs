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

public partial class MyAccount_ucChangeDetails : System.Web.UI.UserControl
{
    ServiceReference1.WebServiceSoapClient obj = new ServiceReference1.WebServiceSoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {   
        string s = Session["Username"].ToString();
         txtUser.Text = s;

         SqlDataReader dr = ProductController.getAccountDetails(s);

         if (!IsPostBack)
         {
             country();
             state();
             city();
             if (dr.HasRows)
             {
                 if (dr.Read())
                 {
                     GMDatePicker1.DateString = dr["DOB"].ToString();
                     txtfname.Text = dr["FName"].ToString();
                     txtlname.Text = dr["LName"].ToString();
                     rdSex.SelectedValue = dr["Gender"].ToString();
                     txtcontact.Text = dr["ContactNo"].ToString();
                     txtmail.Text = dr["EmailID"].ToString();
                     //ddlQuestion.Items.FindByText(dr["HintQuestion"].ToString()).Selected = true;
                     ListItem li = ddlQuestion.Items.FindByText(dr["HintQuestion"].ToString().Trim());
                     if (li != null)
                         li.Selected = true;
                     txtAnswer.Text = dr["Answer"].ToString();
                     txtaddr.Text = dr["Address"].ToString();
                     txtZipCode.Text = dr["ZipCode"].ToString();
                     ddlcountry.Items.FindByText(dr["CountryName"].ToString()).Selected = true;

                     ddlstate.Items.FindByText(dr["StateName"].ToString()).Selected = true;
                     ddlcity.Items.FindByText(dr["Cityname"].ToString()).Selected = true;
                 }
             }
         }
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
    private void city()
    {
        DataSet dscity = ProductController.getCitydetails();
        BindDDL(ddlcity, dscity, "Name", "ID");
    }

    
    private void BindDDL(DropDownList ddl, DataSet ds, string txtField, string valField)
    {
        ddl.DataSource = ds;
        ddl.DataTextField = txtField;
        ddl.DataValueField = valField;
        ddl.DataBind();
    }
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dscity = ProductController.getCitydetailsByStateID(int.Parse(ddlstate.SelectedValue));
        BindDDL(ddlcity, dscity, "Name", "ID");
        
    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dsState = ProductController.getAllStatesByCountryID(int.Parse(ddlcountry.SelectedValue));
        BindDDL(ddlstate, dsState, "Name", "ID");
        DataSet dscity = ProductController.getCitydetailsByStateID(int.Parse(ddlstate.SelectedValue));
        BindDDL(ddlcity, dscity, "Name", "ID");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
       // obj.getupdate(txtUser.Text, txtfname.Text, txtlname.Text, ddlQuestion.SelectedItem.Text, txtAnswer.Text, GMDatePicker1.Date, txtcontact.Text, rdSex.Text, txtmail.Text, txtaddr.Text, int.Parse(ddlcountry.SelectedValue), int.Parse(ddlstate.SelectedValue), int.Parse(ddlcity.SelectedValue), txtZipCode.Text);
        //ProductController.getupdate(txtUser.Text, txtfname.Text, txtlname.Text,ddlQuestion.SelectedItem.Text ,txtAnswer.Text,GMDatePicker1.Date,txtcontact.Text, rdSex.Text,txtmail.Text, txtaddr.Text,int.Parse( ddlcountry.SelectedValue), int.Parse(ddlstate.SelectedValue),int.Parse( ddlcity.SelectedValue), txtZipCode.Text);
       lbl.Text = "Your data is updated";
    }
 }

