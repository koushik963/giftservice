<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucPopularCategories.ascx.cs" Inherits="Browse_Controls_ucPopularCategories" %>
<table border="0" style="width: 14%">
    <tr>
        <td style="width:122%; height: 21px;">
            <b style="color:orange;font-family:Verdana"><span style="font-size: 8pt">Popular Category</span></b></td>
    </tr>
    <tr>
        <td style="width:122%; text-align: right;">
            <asp:DataList ID="dlCategories" runat="server" RepeatColumns="2" Width="125px">
                <ItemTemplate>
                    
                    <a href='<%#DataBinder.Eval(Container.DataItem,"ID","~/Browse/frmCategoriesProducts.aspx?CID={0}")%>'>
                    
                        <img alt='<%#DataBinder.Eval(Container.DataItem,"Name")%>' src='<%#DataBinder.Eval(Container.DataItem,"Image","/EGiftShopee/Browse/Images/{0}")%>' width="50" height="50" border="0" />
                    </a>
                </ItemTemplate>
            </asp:DataList><a style="margin-left:0" href="../frmAllCategories.aspx">More... </a>     
        </td>
    </tr>
</table>