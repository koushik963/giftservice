<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucSitemap.ascx.cs" Inherits="SiteMap_ucSitemap" %>
<table style="width: 100%">
    <tr>
        <td align="left">
            <h3>
                Site Map</h3>
        </td>
    </tr>
    <tr>
        <td style="width: 30%">
            <asp:Panel ID="pnlAboutus" runat="server" Visible="true" Width="100%">
                <table style="width: 100%">
                    <tr>
                        <td align="left">
                            <asp:LinkButton ID="btnAboutus" Text="About Us" runat="server" Font-Underline="false"
                                OnClick="btnAboutus_Click" PostBackUrl="~/About Us/frmAboutus.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:LinkButton ID="btnContact" runat="server" Text="Contact Us" Font-Underline="false"
                                OnClick="btnContact_Click" PostBackUrl="~/Contact Us/frmContactUs.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td style="width: 30%">
            <asp:Panel ID="pnlaccount" runat="server" Visible="false" Width="100%">
                <table style="width: 100%">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblAccount" runat="server" Text="Account Details" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="btnAccount" runat="server" Text="My Account" Font-Underline="false"
                                OnClick="btnAccount_Click" PostBackUrl="~/MyAccount/frmMyAccount.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="btnchangeaccount" runat="server" Text="Change Account Details"
                                Font-Underline="false" OnClick="btnchangeaccount_Click" PostBackUrl="~/MyAccount/frmChangeAccountDetails.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td style="width: 30%">
            <asp:Panel ID="pnlregister" runat="server" CssClass=".sitemap" Width="100%">
                <table style="width: 100%">
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 25px" class="sitemap">
                            <asp:Label ID="lblRegistration" runat="server" Text="Registration Page" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="sitemap">
                            <asp:LinkButton ID="btnnewuser" runat="server" Text="New User Register" Font-Underline="false"
                                OnClick="btnnewuser_Click" PostBackUrl="~/Registration/frmNewUser.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="sitemap">
                            <asp:LinkButton ID="btnlogin" runat="server" Text="Login Page" Font-Underline="false"
                                OnClick="btnlogin_Click" PostBackUrl="~/Registration/frmLogin.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 21px" class="sitemap">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" class="sitemap">
                            <asp:LinkButton ID="btnchangepwd" runat="server" Text="Change Password" Font-Underline="false"
                                OnClick="btnchangepwd_Click" PostBackUrl="~/Registration/frmChangePassword.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td style="width: 30%">
            <asp:Panel ID="pnlOrder" runat="server" Visible="false" Width="100%">
                <table style="width: 100%">
                    <tr>
                        <td align="center" style="height: 21px">
                            <asp:Label ID="lblOdetails" runat="server" Text="Order Details" Font-Bold="True"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="btnodetails" runat="server" Text="View Order History" Font-Underline="false"
                                OnClick="btnodetails_Click" PostBackUrl="~/OrderDetails/frmOrderDetails.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="btnostatus" runat="server" Text="View Order Status" Font-Underline="false"
                                OnClick="btnostatus_Click" PostBackUrl="~/OrderDetails/frmOrderStatus.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td style="width: 30%">
            <asp:Panel ID="pnlWish" runat="server" Visible="false" Width="100%">
                <table width="100%">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblWish" runat="server" Text="WishList" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="btnwish" runat="server" Text="View Wish List" Font-Underline="false"
                                OnClick="btnwish_Click" PostBackUrl="~/WishList/frmWishList.aspx"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>
