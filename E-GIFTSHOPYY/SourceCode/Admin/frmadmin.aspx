<%@ Page Language="C#" MasterPageFile="~/Templates/Default/AdminMaster.master" AutoEventWireup="true" CodeFile="frmadmin.aspx.cs" Inherits="Admin_frmadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" cellpadding="0" cellspacing="0" border="1" height="345">
<tr>
<td valign="top" style="width: 20%">
<ul>
<li>
<a href='Order/frmOrdersList.aspx' runat='server'>Admin Order</a>
</li>
<li>
<a href="~/Admin/AdminCatalog/adminCategory/frmCategoriesList.aspx" runat='server'>Admin Category</a>
</li>
<li>
<a id="A1" href='AdminCatalog/adminBrand/frmBrandList.aspx' runat='server'>Admin Brand</a>
</li>
<li>
<a id="A2" href='AdminCatalog/adminProduct/frmProductList.aspx' runat='server'>Admin Products</a>
</li>
<li>
<a id="A3" href='AdminCatalog/adminUsers/frmUsersList.aspx' runat='server'>Manage Users</a>
</li>
</ul>
    <asp:LinkButton ID="lnk1" runat="server" PostBackUrl="~/Admin/LoginHistory.aspx" Text="Login Hostory"></asp:LinkButton>

    <br />
    <asp:LinkButton ID="lnk2" runat="server" PostBackUrl="~/Admin/LogoutHistory.aspx" Text="Log Out Hostory"></asp:LinkButton>
</td>
    <td align="center" style="font-size:20px">
   <strong>Welcome to E-Gift Shoppy Administration</strong>
    </td>
</tr>
</table>
</asp:Content>

