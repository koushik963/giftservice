<%@ Page Language="C#" MasterPageFile="~/Templates/Default/MasterPage.master" AutoEventWireup="true"
    CodeFile="frmLogin.aspx.cs" Inherits="Registration_frmLogin"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            
            <td>
                <asp:Label ID="lblLogin" runat="server"><b>Log In</b></asp:Label>&nbsp;<br />
                <div>
                <asp:Label ID="lblError" runat="server" Font-Bold="true" ForeColor="red"
                                Text=""></asp:Label>
                </div>
                <table>
                    <tr>
                        <td>
                            UserName:
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserName" runat="server" Width="160px"></asp:TextBox>
                           <%-- <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="txtUserName"
                                Text="*" ToolTip="Username cannot be Blank" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="160px"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd"
                                Text="*" ToolTip="Must enter password" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnSignin" Text="Sign in" runat="server" OnClick="btnSignin_Click" style="height: 26px" />
                        </td>
                        <td>
                            
                        </td>
        </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                        <td>
                        </td>
                    </tr>
        
        <tr> 
        <td align="center" colspan="2">Not yet Registered? Click here to<asp:HyperLink 
                ID="HyperLink1" runat="server" NavigateUrl="~/Registration/frmNewUser.aspx">Registration Now</asp:HyperLink>
&nbsp;<%--<a href="/Shopping/Registration/frmNewUser.aspx">Register Now</a>--%>
            </td>
        </tr>
                    <tr>
                        <td align="center" colspan="2">
                            &nbsp;</td>
                    </tr>
        <tr>
            <td align="center" colspan="2">
                <a href="frmForgotPassword.aspx">Forgot Password?</a>
            </td>
        </tr>
        <%--<tr>
            <td>
            </td>
            <td align="right">
                <a href="/reEasyWear/Registration/frmChangePassword.aspx">Change Password</a>
            </td>
        </tr>--%>
        
        
    </table>
    </td> </tr> </table>
</asp:Content>
