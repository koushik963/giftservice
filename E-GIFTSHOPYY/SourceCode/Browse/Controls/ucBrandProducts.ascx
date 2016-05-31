<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucBrandProducts.ascx.cs" Inherits="Browse_Controls_ucBrandProducts" %>
<table width="100%">
    <tr>
        <td style="width:100%;height: 21px;">
           <asp:Label ID="lblHeader" Font-Bold="True" Font-Size="Large" runat="server" ForeColor="#FF9966"></asp:Label> 
        </td>
    </tr>
    <tr>
        <td style="width:100%" valign="top" align="center">
            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="100%" OnItemCommand="dlProducts_ItemCommand">
                <ItemTemplate>
                    <table cellpadding="1" cellspacing="2">
                        <tr>
                            <td colspan="2" align="center" valign="top">
                                <%#DataBinder.Eval(Container.DataItem,"Name")%>
                             </td>
                        </tr>
                        <tr>
                            <td align="center" valign="top">
                               <%-- <a href='<%#DataBinder.Eval(Container.DataItem,"ID","../frmProductDetails.aspx?PID={0}")%>'>
                                    <img alt='<%#DataBinder.Eval(Container.DataItem,"Name")%>' src='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' width="50" height="50" />
                             --%> <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' width="50" height="50"/>  </a>
                             </td>
                        </tr>
                             <tr>  
                             <td align="center" valign="top">
                                <b>Rs&nbsp;<%#DataBinder.Eval(Container.DataItem,"SalePrice")%></b>
                             </td>
                             </tr>
                        
                        <tr>
                            <td colspan="2" style="width:50%" align="center">
                                <asp:ImageButton ID="ibtnDetail" AlternateText="Detail" runat="server" BorderStyle="ridge"  BackColor="Bisque" ImageUrl="~/Browse/Images/details.gif"  CommandName="Detail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' Width="65"/>
                                  
                                <asp:ImageButton ID="ibtnBuy" AlternateText="Buy Now" runat="server" CommandName="Buy" ImageUrl="~/Browse/Images/BuyNow.gif"  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' Width="65" />
                                                
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