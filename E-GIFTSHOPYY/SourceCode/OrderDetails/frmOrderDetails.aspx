<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmOrderDetails.aspx.cs" Inherits="OrderDetails_frmOrderDetails"  %>

<%@ Register Src="ucOrderDetails.ascx" TagName="ucOrderDetails" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucOrderDetails ID="ucOrderDetails1" runat="server" />
</asp:Content>

