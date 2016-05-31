<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucContactUs.ascx.cs" Inherits="ucContactUs" %>
<style type="text/css">
    .auto-style1 {
        width: 64px;
    }
    .auto-style2 {
        width: 64px;
        height: 36px;
    }
    .auto-style3 {
        width: 253px;
        height: 36px;
    }
</style>
<table style="width: 55%">
<tr>
<td align="left" colspan="2" >
<h3>Contact Us</h3>
</td>
</tr>
<tr>
<td align="center" style="text-align: left" colspan="2">
        EGIFTSHOPPE STORE<br />
        CHOWRASTHA<br />
        HANMAKONDA
        <br />
        WARANGAL<br />
        0870-256 4888</td>
</tr>
<tr>
<td align="right" class="auto-style1" >
<asp:Label ID="lblname" runat="server" CssClass="text" Text="From" Font-Bold="True"></asp:Label>
</td>
<td style="width: 253px">
   
    <table>
        <tr><td> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td><asp:TextBox ID="TextBox2" runat="server"  Height="19px" Width="121px" TextMode="Password" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
</td></tr>
    </table>
</td>
</tr>
<tr>
<td align="right" class="auto-style2">
<asp:Label ID="lblemail" runat="server" CssClass="text" Text="To" Font-Bold="True"></asp:Label>
</td>
<td class="auto-style3">
    <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" OnTextChanged="TextBox3_TextChanged">egiftshoppeestore@gmail.com</asp:TextBox>
    </td>
</tr>
<tr>
<td align="right" class="auto-style1">
<asp:Label ID="lblsubject" runat="server" CssClass="text" Text ="Subject" Font-Bold="True"></asp:Label>
</td>
<td style="width: 253px">
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right" class="auto-style1">
<asp:Label ID="lblMessage" runat="server"  CssClass="text" Text="Body" Font-Bold="True"></asp:Label>
</td>
<td style="width: 253px">
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right" class="auto-style1">
    &nbsp;</td>
<td style="width: 253px">
    &nbsp;</td>
</tr>
<tr>
<td colspan="2" align="center">
<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" style="height: 26px" />
</td>
</tr>
</table>