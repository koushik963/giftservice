<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucSubmitOrderno.ascx.cs" Inherits="OrderDetails_ucSubmitOrderno" %>
<table width="100%" >
<tr> 
<td align="right" style="width:50%">
<asp:Label ID="lblOrderId" runat="server" Text="OrderId">
</asp:Label>
</td>
<td align="center" style="width:50%">
<asp:TextBox ID="txtOrderId" runat="server">
</asp:TextBox>
<asp:RequiredFieldValidator ID="rfvOrderid" runat="server" ControlToValidate="txtOrderId" 
ErrorMessage="This field cannot be blank!!Plz Enter Order no" Display="Dynamic">
</asp:RequiredFieldValidator> 
</td>
</tr>
<tr>
<td align="center" colspan="2">
<asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
</td>
</tr>
</table>