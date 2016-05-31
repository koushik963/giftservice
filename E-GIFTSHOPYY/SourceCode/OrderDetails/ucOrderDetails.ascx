<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucOrderDetails.ascx.cs" Inherits="OrderDetails_ucOrderDetails" %>
<table width="100%">
<tr>
<td></td>
<td style="width: 100%">
<asp:DataList  ID="dlOrders"  runat="server" Width="100%" CellPadding="4" ForeColor="#333333">
                <HeaderTemplate>
                    <table width="100%">
                        <tr>
                            
                            <td  align="center" style="width:7%">OrderId</td>
                            <td  align="center" style="width:7%">OrderDate</td>
                            <td  align="center" style="width:7%">ProductId</td>
                            <td align="center" style="width:7%">ProductName</td>
                            
                            <td align="center" style="width:7%">Price</td> 
                            <td align="center" style="width:7%">Quantity</td>
                            <td align="center" style="width:7%">OrderAmount</td>
                            <td align="center" style="width:7%">ShippingAmount</td>
                            <td align="center" style="width:7%">TaxAmount</td>
                            <td align="center" style="width:7%">NetAmount</td> 
                              
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                   <table width="100%">
                        <tr>
      
    <td style="width:7%"><asp:Label ID="lblOrderId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderId")%>'>
    </asp:Label> </td>
    <td style="width:7%">
    <asp:Label ID="lblOrderDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderDate")%>'>
    </asp:Label>  </td>   
    <td style="width:7%">
    <asp:Label ID="lblProductId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ProductId")%>'>
    </asp:Label> </td>  
    <td style="width:7%">
    <asp:Label ID="lblProductName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ProductName")%>'>
    </asp:Label>    </td>        
    
    <td style="width:7%"> 
    <asp:Label ID="lblPrice" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Price")%>'>
    </asp:Label></td>
    <td style="width:7%">
    <asp:Label ID="lblQuantity" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Quantity")%>'>
    </asp:Label></td>
    <td style="width:7%">
    <asp:Label ID="LabelOrderAmount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderAmount")%>'>
    </asp:Label></td>
    <td style="width:7%">
    <asp:Label ID="lblShippingAmount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ShippingAmount")%>'>
    </asp:Label></td>
    <td style="width:7%"> 
    <asp:Label ID="lblTaxAmount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TaxAmount")%>'>
    </asp:Label></td>
    <td style="width:7%"> 
    <asp:Label ID="lblNetAmount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NetAmount")%>'>
    </asp:Label></td>
    <td style="width:7%">
    <asp:Label ID="lblOrderStatus" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderStatus")%>'>
    </asp:Label></td>
    </tr>
    </table>
    </ItemTemplate>
 </asp:DataList>  
 </td>
 </tr>
 </table>         
 
