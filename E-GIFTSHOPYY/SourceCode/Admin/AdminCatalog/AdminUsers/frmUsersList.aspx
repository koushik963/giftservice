<%@ Page Language="C#" MasterPageFile="~/Templates/Default/AdminMaster.master" AutoEventWireup="true" CodeFile="frmUsersList.aspx.cs" Inherits="Admin_AdminCatalog_AdminUsers_frmUsersList"  %>
<%@ Register Src="ucUsersList.ascx" TagName="ucUsersList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucUsersList ID="UcUsersList1" runat="server" />
</asp:Content>

