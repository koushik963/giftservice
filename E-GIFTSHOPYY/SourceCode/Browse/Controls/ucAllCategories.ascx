<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucAllCategories.ascx.cs" Inherits="Browse_Controls_ucAllcategories" %>
<table width="100%">
    <tr>
        <td style="width:100%;">
         <h3>All Categories</h3>
        </td>
    </tr>
    <tr>
        <td style="width:100%">
            <asp:DataList ID="dlCategories" runat="server" RepeatColumns="4" CellSpacing="12">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' width="100" height="100"  />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#DataBinder.Eval(Container.DataItem,"ID","../frmCategoriesProducts.aspx?CID={0}")%>'>Click Here</asp:HyperLink>
                </ItemTemplate>
            </asp:DataList>
             
        </td>
    </tr>
</table>
