<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucOrderStatus.ascx.cs" Inherits="OrderDetails_ucOrderStatus" %>
<table width="100%">
<tr>
<td></td>
<td style="width: 100%">
<asp:DataList  ID="dlOrders"  runat="server" Width="100%" CellPadding="4" ForeColor="#333333">
                <HeaderTemplate>
                    <table width="100%">
                        <tr>
                            <td  align="center" style="width:25%">CustomerId</td>
                            <td  align="center" style="width:25%">OrderId</td>
                            <td  align="center" style="width:25%">OrderDate</td>
                            <td align="center" style="width:25%">OrderStatus</td>     
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                   <table width="100%">
                        <tr>
                        <td style="width:25%" align="center">     
    <asp:Label ID="lblCustomerId" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem,"CustomerId")%>'>
    </asp:Label> </td>   
    <td style="width:25%" align="center"><asp:Label ID="lblOrderId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderId")%>'>
    </asp:Label> </td>
    <td style="width:25%" align="center">
    <asp:Label ID="lblOrderDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderDate")%>'>
    </asp:Label>  </td>   
    <td style="width:25%" align="center">
    <asp:Label ID="lblOrderStatus" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderStatus")%>'>
    </asp:Label></td>
    </tr>
    </table>
    </ItemTemplate>
 </asp:DataList>  
 </td>
 </tr>
 <tr>
 <td colspan="7" align="center">
 <asp:Button ID="btnCancelOrder" runat="server" Text="CancelOrder" OnClick="btnCancelOrder_Click" />
  </td>
 </tr>
 </table>         