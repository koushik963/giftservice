<%@ Page Language="C#" MasterPageFile="~/Templates/Default/MasterPage.master" AutoEventWireup="true" CodeFile="frmFeaturedProducts.aspx.cs" Inherits="Featured_Products_frmFeaturedProducts"  %>

<%@ Register Src="ucFeaturedp.ascx" TagName="ucFeaturedp" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucFeaturedp ID="UcFeaturedp1" runat="server" />
</asp:Content>

