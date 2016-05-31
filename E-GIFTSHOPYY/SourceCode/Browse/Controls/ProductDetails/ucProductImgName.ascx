<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucProductImgName.ascx.cs"
    Inherits="Browse_Controls_ProductDetails_ucProductImgName" %>
<asp:DataList ID="dlimgname" RepeatColumns="1" runat="server">
    <ItemTemplate>
        <table width="100%">
            <tr align="center" valign="top">
                <td style="width: 100%">
                    <h3>
                        <%#DataBinder.Eval(Container.DataItem,"Name") %>
                    </h3>
                </td>
            </tr>
            <tr style="width: 39%" align="left" valign="top">
                <td>
                  <%--  <img src='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>'
                        alt='<%#DataBinder.Eval(Container.DataItem,"Name")%>' width="400" height="200" />--%>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' Width="400" Height="200" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
