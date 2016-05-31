<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucShopping.ascx.cs" Inherits="Browse_Controls_ucShopping" %>
<table width="100%">
    <tr>
        <td>
        <h4>Shopping Cart</h4>
        </td>
        </tr>
        <tr>
        <td style="width: 100%">
        
            <asp:DataList ID="dlCart" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" OnItemDataBound="dlCart_ItemDataBound"
                >
                <HeaderTemplate>
                    <table width="100%">
                        <tr>
                            <td style="width: 10%" align="center">
                                Select</td>
                            <td style="width: 30%" align="center">
                                Product</td>
                            <td style="width: 20%" align="center">
                                Price
                            </td>
                            <td style="width: 20%" align="center">
                                Quantity</td>
                            <td style="width: 20%" align="center">
                                Amount</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td style="width: 10%">
                                <asp:CheckBox ID="chkSelect" runat="server" Checked="false" />
                            </td>
                            <asp:Label ID="lblSessionID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"SessionId") %>'
                                Visible="false"></asp:Label>
                            <asp:Label ID="lblProductID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Id") %>'
                                Visible="false"></asp:Label>
                            <td style="width: 35%" align="center">
                                <asp:Label ID="lblImage" runat="server"> 
         <%--  <img src='<%#DataBinder.Eval(Container.DataItem,"Image","/EGiftShopee/Browse/Images/{0}")%>' alt='<%#DataBinder.Eval(Container.DataItem,"Name")%>' width="30" height="30" /><br>
            <%#DataBinder.Eval(Container.DataItem,"Name") %>--%>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' Width="30" Height="30" />
                                </asp:Label>
                            </td>
                            <td style="width: 10%" align="left">
                                Rs
                                <asp:Label ID="lblPrice" runat="server" Text=' <%#DataBinder.Eval(Container.DataItem,"Price")%>'>
                                </asp:Label>
                            </td>
                            <td style="width: 20%">
                                <asp:TextBox ID="txtQuantity" runat="server" MaxLength="2" Width="40%"  Text='<%#DataBinder.Eval(Container.DataItem,"Quantity")%>'></asp:TextBox>
                                <%--<asp:CompareValidator ID="comp" runat="server" Operator="greaterThan" Type=> </asp:CompareValidator>--%>
                            <%--<asp:DropDownList runat="server" ID="ddlquantity" onse>
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            </asp:DropDownList>--%>
                            </td>
                            <td style="width: 20%">
                                Rs
                                <asp:Label ID="lblTotal" runat="server"> 
             <%#DataBinder.Eval(Container.DataItem,"Total")%>
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
            <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
        </td>
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
            <asp:Button ID="btnSelectAll" Text="Select All" runat="server" OnClick="btnSelectAll_Click" />
        </td>
        <td align="center">
            <asp:Button ID="btnUpdate" Text="Update Cart" runat="server" OnClick="btnUpdate_Click" />
        </td>
        <td align="center">
            <asp:Button ID="btnRemove" Text="Remove from cart" runat="server" OnClick="btnRemove_Click" />
        </td>
        <td align="center">
            <asp:Button ID="btnContinue" runat="server" Text="ContinueShopping" 
                OnClick="btnContinue_Click" style="margin-left: 0px" />
        </td>
        <td align="center">
            <asp:Button ID="btnCheckOut" runat="server" Text="CheckOut" 
                OnClick="btnCheckOut_Click" Visible="False" />
        </td>
    </tr>
</table>
