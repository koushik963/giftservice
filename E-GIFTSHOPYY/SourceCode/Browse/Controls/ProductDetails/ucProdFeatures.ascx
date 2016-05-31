<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucProdFeatures.ascx.cs" Inherits="Browse_Controls_ProductDetails_ucProdFeatures" %>
<asp:DataList ID="dlProdFeatures" runat="server" RepeatColumns="1">
<ItemTemplate>
    
    <table width="100%">
    <tr valign="top" align="left">
        <td align="left"><%#DataBinder.Eval(Container.DataItem,"AttributeName") %>
        </td>
   
        <td align="left">
            :  <%#DataBinder.Eval(Container.DataItem,"AttributeValue") %>
        </td>
    </tr>
</table>
</ItemTemplate>
</asp:DataList>
