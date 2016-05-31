<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmShoppingCart.aspx.cs" Inherits="Browse_frmShoppingCart1"  %>

<%@ Register Src="../Cart/ucShopping.ascx" TagName="ucShopping" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucShopping ID="UcShopping1" runat="server" />
</asp:Content>

