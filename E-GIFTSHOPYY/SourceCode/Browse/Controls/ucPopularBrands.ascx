<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucPopularBrands.ascx.cs" Inherits="Browse_Controls_ucPopularBrands" %>
<table style="width: 10%">
    <tr>
        <td style="width:100%"> 
            <span style="font-size: 9pt">
            <b style="color:orange; font-family:Verdana">Popular Brands</b>
            </span>
        </td>
    </tr>
    <tr>
        <td style="width:100%; text-align: right;">
            <asp:DataList ID="dlBrands" runat="server" RepeatColumns="2">
                <ItemTemplate>
                    <a href='<%#DataBinder.Eval(Container.DataItem,"ID","/EGiftShopee/Browse/frmBrandsProducts.aspx?BID={0}")%>'>
                        <img alt='<%#DataBinder.Eval(Container.DataItem,"BrandName")%>' src='<%#DataBinder.Eval(Container.DataItem,"Logo","/EGiftShopee/Browse/Images/{0}")%>' width="50" height="50" />
                    </a>
                </ItemTemplate>
            </asp:DataList>           
             <a  href='/EGiftShopee/Browse/frmAllBrands.aspx'> More.. </a>     
        </td>
    </tr>
</table>