<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucAllBrands.ascx.cs" Inherits="Browse_Controls_ucAllBrands" %>
<table><tr><td><h3>All Brands</h3></td></tr></table>
<asp:DataList ID="dlAllBrands" runat="server" RepeatColumns="4">
 <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Logo","~/Browse/Images/{0}") %>' width="100" height="100"  />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#DataBinder.Eval(Container.DataItem,"ID","../frmBrandsProducts.aspx?BID={0}") %>'>Click Here</asp:HyperLink>
                </ItemTemplate>
</asp:DataList>