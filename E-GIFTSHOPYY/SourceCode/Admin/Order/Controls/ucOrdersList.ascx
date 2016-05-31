<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucOrdersList.ascx.cs"
    Inherits="Order_Controls_ucOrdersList" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
    <tr bgcolor='#ccccff'>
        <td align="left" nowrap valign="top">
            <table style="width: 100%">
                <tr>
                    <td valign="top">
                        Sort By:
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlSort" runat="server" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                            <asp:ListItem>Order No</asp:ListItem>
                            <asp:ListItem>Order Date</asp:ListItem>
                            <asp:ListItem>Customer Name</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td valign="top">
                        <asp:RadioButtonList ID="rdOrder" runat="server" RepeatDirection='horizontal'>
                            <asp:ListItem Selected="true">Ascending</asp:ListItem>
                            <asp:ListItem>Descending</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td valign="top">
                        <asp:Button ID="btnSortByGo" Text="Go" runat="server" OnClick="btnSortByGo_Click" />
                    </td>
                </tr>
            </table>
        </td>
        <td nowrap>
            &nbsp;</td>
        <td align="left" nowrap valign="top">
            <table style="width: 100%">
                <tr>
                    <td align="left" valign="top" nowrap>
                        Filter By:
                    </td>
                    <td align="left" valign="top" nowrap>
                        <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                            <asp:ListItem>Order Date</asp:ListItem>
                            <asp:ListItem>Order Amount</asp:ListItem>
                            <asp:ListItem>Customer Name</asp:ListItem>
                            <asp:ListItem>Order Status</asp:ListItem>
                            <asp:ListItem>Order Number</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left" valign="top" nowrap>
                        <asp:Panel ID="pnlDate" runat="server">
                            From Date:<cc1:GMDatePicker ID="GMDatePicker1" runat="server">
                            </cc1:GMDatePicker>
                            To Date:<cc1:GMDatePicker ID="GMDatePicker2" runat="server">
                            </cc1:GMDatePicker>
                        </asp:Panel>
                        <asp:Panel ID="pnlAmount" runat="server" Visible="false">
                            Enter Amount:
                            <asp:DropDownList ID="ddlOAmount" runat="server">
                                <asp:ListItem Value="1">Less than</asp:ListItem>
                                <asp:ListItem Value="2">Greater than</asp:ListItem>
                                <asp:ListItem Value="3">Equal to</asp:ListItem>
                                <asp:ListItem Value="4">Not Equal to</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtOAmount" Width="75" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOAmount"
                                Display="Dynamic" ErrorMessage="RequiredFieldValidator" ToolTip="Must enter amount">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpvamount" runat="server" ControlToValidate="txtOAmount"
                                Display="Dynamic" ErrorMessage="Must enter Amount" Operator="DataTypeCheck" ToolTip="Must Enter Amount"
                                Type="Double">*</asp:CompareValidator>
                        </asp:Panel>
                        <asp:Panel ID="pnlCustName" runat="server" Visible="false">
                            Enter Name(Mail-Id):<asp:TextBox ID="txtCustName" runat="server"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlStatus" runat="server" Visible="false">
                            <asp:DropDownList ID="ddlStatus" runat="server">
                                <asp:ListItem>New Order</asp:ListItem>
                                <asp:ListItem>Ready</asp:ListItem>
                                <asp:ListItem>Canceled</asp:ListItem>
                                <asp:ListItem>Shipped</asp:ListItem>
                                <asp:ListItem>Delivered</asp:ListItem>
                            </asp:DropDownList>
                        </asp:Panel>
                        <asp:Panel ID="pnlNumber" runat="server" Visible="false">
                            Enter Order No:<asp:TextBox ID="txtOrderNo" Width="75" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvorderno" runat="server" ControlToValidate="txtOrderNo"
                                Text="*" ToolTip="Must enter order no" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvorderno" runat="server" Text="*" ToolTip="Must enter orderno"
                                ControlToValidate="txtOrderNo" Type="Double" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                        </asp:Panel>
                    </td>
                    <td valign="top" align="left" nowrap>
                        <asp:Button ID="btnFilterBYGo" Text="Go" runat="server" OnClick="btnFilterBYGo_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="lblComment" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                Visible="False"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3" style="width: 100%" align="center">
            <asp:DataList ID="dlOrder" runat="server" RepeatColumns="1" Width="100%" OnItemCommand="dlOrder_ItemCommand">
                <HeaderTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" style="width: 5%">
                                <b>Order No.</b>
                            </td>
                            <td align="left" style="width: 25%">
                                <b>Customer Name</b>
                            </td>
                            <td align="left" style="width: 25%">
                                <b>Order Date</b>
                            </td>
                            <td align="left" style="width: 10%">
                                <b>Order Amount</b>
                            </td>
                            <td align="left" style="width: 10%">
                                <b>Order Status</b>
                            </td>
                            <td align="left" style="width: 20%">
                            </td>
                            <td align="left" style="width: 5%">
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td align="left" style="width: 5%">
                                <asp:Label ID="lblOrderNo" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderId")%>'>
                                </asp:Label>
                            </td>
                            <td align="left" style="width: 25%">
                                <asp:Label ID="lblCustName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserName") %>'>
                                </asp:Label>
                            </td>
                            <td align="left" style="width: 25%">
                                <asp:Label ID="lblOrderDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderDate")%>'>
                                </asp:Label>
                            </td>
                            <td align="left" style="width: 10%">
                                $<asp:Label ID="lblAmount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NetAmount")%>'>
                                </asp:Label>
                                <asp:TextBox ID="txtAmount" Width="75" runat='server' Text='<%#DataBinder.Eval(Container.DataItem,"NetAmount") %>'
                                    Visible='false'></asp:TextBox>
                            </td>
                            <td align="left" style="width: 10%">
                                <asp:Label ID="lblOrderStatus" runat='server' Text='<%#DataBinder.Eval(Container.DataItem,"Description") %>'></asp:Label>
                                <asp:DropDownList ID="ddlOrderStatus" runat='server' Visible='false'>
                                    <asp:ListItem>New Order</asp:ListItem>
                                    <asp:ListItem>Ready</asp:ListItem>
                                    <asp:ListItem>Canceled</asp:ListItem>
                                    <asp:ListItem>Shipped</asp:ListItem>
                                    <asp:ListItem>Delivered</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="left" style="width: 20%">
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"OrderId")%>' />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="false" CommandName="Cancel" />
                            </td>
                            <td align="left" style="width: 5%">
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"OrderId")%>' />
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
