<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmAllCategories.aspx.cs" Inherits="Browse_Images_frmAllCategories"  %>

<%@ Register Src="Controls/ucAllCategories.ascx" TagName="ucAllCategories" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%">
    <tr>
    <td>
        <uc1:ucAllCategories ID="UcAllCategories1" runat="server" />
    </td>
    </tr>
</table>

</asp:Content>

