<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucRefertoFriend.ascx.cs" Inherits="Browse_Controls_ucRefertoFriend" %>
<table >
    <tr>
        <td align="left" colspan="2">
            <strong>Refer to Friend</strong></td>
    </tr>
  <tr>
    <td colspan="2">
        <asp:Label ID="lblLink" runat="server"> </asp:Label>
    </td>
  </tr>  
  <tr>
   <td style="background-color:#ccc0fc">
   <asp:Label ID="lblfemail" runat="server" Text="Sender's Email" >
   </asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtemail" runat="server">
   </asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtemail"
           ></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
           ErrorMessage="Invalid Email"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
   </td>
   </tr>
   <tr>
   <td style="background-color:#ccc0fc">
   <asp:Label ID="lblName" runat="server" Text="Your Name" >
   </asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtName" runat="server">
   </asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName"
           ErrorMessage="*" ></asp:RequiredFieldValidator>
   </td>
   </tr>
   <tr>
   <td style="background-color:#ccc0fc">
   <asp:Label ID="lblRemail" runat="server" Text="Receipient's Email" >
   </asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtrEmail" runat="server">
   </asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtrEmail"
           ErrorMessage="*" ></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtrEmail"
           ErrorMessage="Invalid Email"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
   </td>
   </tr>
   <tr>
   </tr>
   <tr>
   <td colspan="2" align="center">
   <p>
   use comma(,) to separate more than 1 email-ids</p>
   </td>
   </tr>
   <tr>
   <td colspan="2" align="center">
   <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
   </td>
   </tr>
   </table>
   
   