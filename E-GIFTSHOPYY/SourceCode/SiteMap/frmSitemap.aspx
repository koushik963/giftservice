<%@ Page Language="C#" MasterPageFile="~/Templates/Default/MasterPage.master" AutoEventWireup="true" CodeFile="frmSitemap.aspx.cs" Inherits="SiteMap_frmSitemap" %>

<%@ Register Src="ucSitemap.ascx" TagName="ucSitemap" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucSitemap id="UcSitemap1" runat="server">
    </uc1:ucSitemap>
</asp:Content>

