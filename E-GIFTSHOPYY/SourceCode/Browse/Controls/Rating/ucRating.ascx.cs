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

public partial class Browse_Controls_Rating_ucRating : System.Web.UI.UserControl
{
    string S;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Request["PID"]) != null)
        {
            S = Request["PID"].ToString();   
            
        }

    }
    protected void btnrate_Click(object sender, EventArgs e)
    {
        Int16 I;
        I = Int16.Parse(rdbtnRate.SelectedValue);
        ProductController.UpdateRate(S, I);
    }
}