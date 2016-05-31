<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucHeader.ascx.cs" Inherits="Templates_Default_controls_ucHeader" %>
<style type="text/css">
    .style1
    {
        width: 10%;
        height: 21px;
    }
</style>
<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td align="right" colspan="2" style="height: 144px; text-align: center;" valign="top">                       
                        <asp:image ID="img2" runat="server" ImageUrl="~/Browse/Images/banner22.jpg" height="150" style="width: 100%"/>
         </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <table width="50%" style="background-color:#D3D3D3">
                <tr align="center">              
                    <td class="style1">
                        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Default.aspx">Home</asp:LinkButton>
&nbsp;</td>
                    <td class="style1">
                       <asp:LinkButton ID="lnkAdminLogin_Click" runat="server"  CausesValidation="False" OnClick="lnkAdminLogin_Click_Click">Admin</asp:LinkButton>
                    </td>
                    <td class="style1">
                        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Gallery/frmGallery.aspx">Gallary</asp:LinkButton>
&nbsp;</td>
                   
                
                    <td class="style1">
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Contact Us/frmContactUs.aspx">Contact Us</asp:LinkButton>
&nbsp;</td>                    
                </tr>
            </table>
            <small><a href="/EGiftShopee/Default.aspx">Home</a>
                <asp:LinkButton ID="lnkMyaccount" runat="server" OnClick="lnkMyaccount_Click" Visible="False">My Account</asp:LinkButton>
                <a href="/EGiftShopee/Cart/frmShoppingCart.aspx">
                    <asp:Label ID="lblCartCount" runat="server" Text="Cart: (0)"></asp:Label>
                </a>
                <asp:LinkButton ID="lnkLogin" runat="server" CausesValidation="False" OnClick="lnkLogin_Click">Login</asp:LinkButton>&nbsp;</small></td>
    </tr>
</table>