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

public partial class Browse_Controls_ucAllcategories : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet dsAllCategories = ProductController.getALLCategories();
            if (dsAllCategories.Tables[0].Rows.Count > 0)
            {
                BindDataList(dlCategories, dsAllCategories);
            }

        }
    }
    private void BindDataList(DataList dl, DataSet ds)
    {
        dl.DataSource = ds;
        dl.DataBind();
    }

}
