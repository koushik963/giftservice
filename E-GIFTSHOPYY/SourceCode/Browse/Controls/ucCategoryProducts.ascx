<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCategoryProducts.ascx.cs" Inherits="Browse_Controls_ucCategoryProducts" %>
<table width="100%">
    <tr>
        <td style="width:100%<%--; background-color:#6699ff--%>">
            <asp:Label ID="lblHeader" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width:100%" valign="top" align="center">
            <asp:DataList ID="dlCatProducts" runat="server" RepeatColumns="3" Width="100%" OnItemCommand="dlCatProducts_ItemCommand">
                <ItemTemplate>
                    <table cellpadding="1" cellspacing="2">
                        <tr>
                            <td colspan="2" align="center" valign="top">
                                <%#DataBinder.Eval(Container.DataItem,"Name")%>
                             </td>
                        </tr>
                        <tr>
                            <td align="center" valign="top">
                              <%--  <a href='<%#DataBinder.Eval(Container.DataItem,"ID","/EGiftShopee/Browse/frmCategoriesProducts.aspx?PID={0}")%>'>
                                    <img alt='<%#DataBinder.Eval(Container.DataItem,"Name")%>' src='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' width="50" height="50" />--%>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' width="50" height="50" />
                                 </a>
                             </td>
                         </tr>
                         <tr>
                             <td align="center" valign="top">
                                <b>$&nbsp;<%#DataBinder.Eval(Container.DataItem,"SalePrice")%></b>
                             </td>
                        </tr>
                        <tr>
                            <td colspan="2">
        
                                <asp:ImageButton ID="ibtnDetail" AlternateText="Detail" runat="server"  CommandName="Detail" ImageUrl="~/Browse/Images/details.gif" Width="65" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>'/>
                            </td>
                            <td>
                                <asp:ImageButton ID="ibtnBuy" AlternateText="Buy Now" runat="server"  CommandName="Buy Now" ImageUrl="~/Browse/Images/BuyNow.gif" Width="65" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMsg" runat="server" ForeColor="red"></asp:Label>
        </td>
    </tr>
</table>