<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmBrandsProducts.aspx.cs" Inherits="Browse_frmBrandsProducts"  %>

<%@ Register Src="Controls/ucBrandProducts.ascx" TagName="ucBrandProducts" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:100%">
    <tr>
        <td style="width:100%">
            <uc1:ucBrandProducts ID="UcBrandProducts1" runat="server" />
        
        </td>
    </tr>
</table>
</asp:Content>


