<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucFeaturedp.ascx.cs" Inherits="Featured_Products_ucFeaturedp" %>
<table style="width:100%">
<tr>
<td style="width:100%">
<asp:DataList ID="dlProduct" runat="server" RepeatColumns="1" Width="100%">
<HeaderTemplate>
         <table width="100%">
         <tr>
         <td style="width:25%">Name</td>
         <td style="width:25%">Description</td>
         <td style="width:25%">Saleprice</td>
         <td style="width:25%">Image</td>
         </tr>
         </table>
</HeaderTemplate>
<ItemTemplate>
         <table width="100%">
         <tr>
         <td style="width:25%">
         <asp:Label ID="lblName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Name")%>'>
         </asp:Label>
          </td>
         <td style="width:25%">
         <asp:Label ID="lblDescription" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Name")%>'>
         </asp:Label>
         </td>
         <td style="width:25%">
         <asp:Label ID="lblSalePrice" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"SalePrice")%>'>
         </asp:Label>
         </td>
         <td style="width:25%">
         <img src='<%#DataBinder.Eval(Container.DataItem,"Image","/EGiftShopee/Browse/Images/{0}")%>' alt='<%#DataBinder.Eval(Container.DataItem,"Name")%>' width="30" height="30" />
         </td>
         </tr>

         </table>


</ItemTemplate>
</asp:DataList>
</td>
</tr>
</table>
