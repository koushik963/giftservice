<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmChangePassword.aspx.cs" Inherits="Browse_frmChangePassword"  %>

<%@ Register Src="RContols/ucResetPassword.ascx" TagName="ucResetPassword" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucResetPassword ID="UcResetPassword1" runat="server" />
    
</asp:Content>

