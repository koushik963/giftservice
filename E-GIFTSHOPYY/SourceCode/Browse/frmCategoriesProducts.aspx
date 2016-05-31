<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmCategoriesProducts.aspx.cs" Inherits="Browse_frmCategoriesProducts"  %>

<%@ Register Src="Controls/ucCategoryProducts.ascx" TagName="ucCategoryProducts"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:100%">
    <tr>
        <td style="width:100%">
        <h3>Products</h3>
            <uc1:ucCategoryProducts ID="UcCategoryProducts1" runat="server" />
        </td>
    </tr>
 </table>
</asp:Content>

