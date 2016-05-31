<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucWishList.ascx.cs" Inherits="WishList_ucWishList" %>
<table width="100%">
<tr width="100%" align="center">
<td width="100%" align="left"> 
    <h4>WishList</h4></td>
</tr>
    <tr>
        
        <td style="width: 100%">
            <asp:DataList ID="dlWishList" runat="server" Width="100%" CellPadding="4" ForeColor="#333333"
               >
                <HeaderTemplate>
                    <table width="100%">
                        <tr>
                            <td style="width: 20%" align="left">
                                Select</td>
                            <td style="width: 50%" align="center">
                                Product</td>
                            <td style="width: 30%" align="left">
                                Price
                            </td>
                            
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td style="width: 20%">
                                <asp:CheckBox ID="chkSelect" runat="server" Checked="false" />
                            </td>
                          <td>
                            <asp:Label ID="lblProductID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Id") %>' 
                                Visible="true"></asp:Label>
                                </td>
                            <td style="width: 50%" align="center">
                                <asp:Label ID="lblImage" runat="server"> 
           <img src='<%#DataBinder.Eval(Container.DataItem,"Image","/EGiftShopee/Browse/Images/{0}")%>' alt='<%#DataBinder.Eval(Container.DataItem,"Name")%>' width="30" height="30" /><br>
            <%#DataBinder.Eval(Container.DataItem,"Name") %>
                                </asp:Label>
                            </td>
                            <td style="width: 30%" align="left">
                                $
                                <asp:Label ID="lblPrice" runat="server" Text=' <%#DataBinder.Eval(Container.DataItem,"SalePrice")%>'>
                                </asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </td>
    </tr>
</table>
<table width="87%">
    <tr align="right">
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMsg" Text="" ForeColor="Red" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<table width="100%">
    <tr>
        <td align="center">
            <asp:Button ID="btnSelectAll" Text="Select All" runat="server" OnClick="btnSelectAll_Click"  />
        </td>
        <td align="center">
            <asp:Button ID="btnAddToCart" Text="Add To Cart" runat="server" OnClick="btnAddToCart_Click" />
        </td>
        <td align="center">
            <asp:Button ID="btnRemove" Text="Remove from WishList" runat="server" OnClick="btnRemove_Click"  />
        </td>
        <td align="center">
            &nbsp;</td>
        <td align="center">
            &nbsp;</td>
    </tr>
</table>
