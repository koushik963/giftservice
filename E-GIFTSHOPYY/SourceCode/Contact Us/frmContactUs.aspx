<%@ Page Language="C#" MasterPageFile="~/Templates/Default/MasterPage.master" AutoEventWireup="true" CodeFile="frmContactUs.aspx.cs" Inherits="Contact_Us_frmContactUs" %>

<%@ Register Src="ucContactUs.ascx" TagName="ucContactUs" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucContactUs ID="UcContactUs1" runat="server" />
</asp:Content>

