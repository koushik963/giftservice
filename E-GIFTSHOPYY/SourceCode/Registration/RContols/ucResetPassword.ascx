<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucResetPassword.ascx.cs"
    Inherits="Browse_Controls_ucResetPassword" %>
<table cellspacing="2" cellpadding="2" style="width: 100%" border="0">
    <tr>
        <td>
            <asp:Label ID="lblUser" runat="server" Text="User Name">
            </asp:Label>
        </td>
        <td style="">
            <asp:TextBox ID="txtUser" runat="server" CausesValidation="true">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Must enter username"
                ControlToValidate="txtUser" Text="*" ToolTip="Must enter username"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblOldpwd" runat="server" Text="Old Password">
            </asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOldpwd" runat="server" TextMode="Password">
            </asp:TextBox><asp:RequiredFieldValidator ID="rfvOldpwd" runat="server" ErrorMessage="Must enter password"
                ControlToValidate="txtOldpwd" Text="*" ToolTip="Must enter Password">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblNewpwd" runat="server" Text="New Password">
            </asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtNewpwd" runat="server" TextMode="Password">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNewpwd" runat="server" ErrorMessage="Must enter the new password"
                ControlToValidate="txtNewpwd" Text="*" ToolTip="Must enter new password">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblRetype" runat="server" Text="Retype New Password">
            </asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtRetype" runat="server" TextMode="password">
            </asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Entered passwords are not same"
                ControlToCompare="txtNewpwd" ControlToValidate="txtRetype"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center" style="width: 100%">
            <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center" style="width: 100%">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </td>
    </tr>
</table>
