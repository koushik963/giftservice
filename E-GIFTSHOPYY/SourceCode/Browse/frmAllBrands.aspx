<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmAllBrands.aspx.cs" Inherits="Browse_frmAllBrands"  %>

<%@ Register Src="Controls/ucAllBrands.ascx" TagName="ucAllBrands" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucAllBrands id="UcAllBrands1" runat="server">
    </uc1:ucAllBrands>
</asp:Content>

