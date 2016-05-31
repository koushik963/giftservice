<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucOrderMgnt.ascx.cs" Inherits="WebUserControl" %>
<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
    <tr bgcolor='#ccccff'>
        <td align="left" nowrap valign="top" style="width:40%">
            <table style="width:100%">
                <tr>
                    <td valign="top" style="height: 47px">
                        Sort By:
                    </td>
                    <td valign="top" style="height: 47px">
                        <asp:DropDownList ID="ddlSort" runat="server">
                        <asp:ListItem>Order No</asp:ListItem>
                        <asp:ListItem>Order Date</asp:ListItem>
                        <asp:ListItem>Customer Name</asp:ListItem>
                        <asp:ListItem>Order Status</asp:ListItem>
                        </asp:DropDownList>        
                    </td>
                    <td valign="top" style="height: 47px">
                        <asp:RadioButtonList ID="rdOrder" runat="server" RepeatDirection='horizontal'>
                            <asp:ListItem>Ascending</asp:ListItem>
                            <asp:ListItem>Descending</asp:ListItem>
                        </asp:RadioButtonList>        
                    </td>
                    <td valign="top">
                        <asp:Button ID="btnSortByGo" Text="Go" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
        <td style="width:10%" nowrap>&nbsp;</td>
        <td align="left" nowrap valign="top" style="width:50%">
            <table style="width:100%">
                <tr>
                    <td align="left" valign="top" nowrap>
                        Filter By:
                    </td>
                    <td align="left" valign="top" nowrap>
                        <asp:DropDownList ID="ddlFilter" runat="server" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                            <asp:ListItem>Order Date</asp:ListItem>
                            <asp:ListItem>Order Amount</asp:ListItem>
                            <asp:ListItem>Customer Name</asp:ListItem>
                            <asp:ListItem>Order Status</asp:ListItem>
                            <asp:ListItem>Order Number</asp:ListItem>
                        </asp:DropDownList>        
                    </td>
                    <td valign="top" align="left" nowrap>
                        <asp:Button ID="btnFilterBYGo" Text="Go" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="width: 100%" align="center">
            <asp:DataList ID="dlOrder" runat="server" RepeatColumns="1" Width="100%" OnItemCommand="dlOrder_ItemCommand">
                <HeaderTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" style="width:5%">
                                <b>Order No.</b>
                            </td>
                            <td align="left" style="width:25%">
                                <b>Customer Name</b>
                            </td>
                            <td align="left" style="width:25%">
                                <b>Order Date</b>
                            </td>
                            <td align="left" style="width:10%">
                                <b>Order Amount</b>
                            </td>
                            <td align="left" style="width:10%">
                                <b>Order Status</b>
                            </td>
                            <td align="left" style="width:20%">
                            </td>
                            <td align="left" style="width:5%">
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table style="width:100%">
                        <tr>
                            <td align="left" style="width:5%">
                                <asp:Label ID="lblOrderNo" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderId")%>'>
                                </asp:Label>
                            </td>
                            <td align="left" style="width:25%">
                                <asp:Label ID="lblCustName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserName") %>'>
                                </asp:Label>
                            </td>
                            <td align="left" style="width:25%">
                                <asp:Label ID="lblOrderDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"orderdate")%>'>
                                </asp:Label>
                            </td>
                            <td align="left" style="width:10%">
                                <asp:Label ID="lblAmount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NetAmount")%>'>
                                </asp:Label>
                                <asp:TextBox ID="txtAmount" runat='server' Text='<%#DataBinder.Eval(Container.DataItem,"NetAmount") %>'
                                    Visible='false'></asp:TextBox>
                            </td>
                            <td align="left" style="width:10%">
                                <asp:Label ID="lblOrderStatus" runat='server' Text='Delivered'></asp:Label>
                                <asp:DropDownList ID="ddlOrderStatus" runat='server' Visible='false'>
                                    <asp:ListItem>Pending</asp:ListItem>
                                    <asp:ListItem>Delivered</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="left" style="width:20%">
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"OrderId")%>'/>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="false" CommandName="Cancel" />
                            </td>
                            <td align="left" style="width:5%">
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"OrderId")%>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
