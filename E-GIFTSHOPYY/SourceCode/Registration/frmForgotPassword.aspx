<%@ Page Language="C#" MasterPageFile="~/Templates/Default/MasterPage.master" AutoEventWireup="true" CodeFile="frmForgotPassword.aspx.cs" Inherits="Browse_frmForgotPassword"  %>

<%@ Register Src="RContols/ucForgotPassword.ascx" TagName="ucForgotPassword" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucForgotPassword ID="UcForgotPassword1" runat="server" />
</asp:Content>

