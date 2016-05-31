<%@ Page Language="C#" MasterPageFile="~/Templates/Default/MasterPage.master" AutoEventWireup="true" CodeFile="frmOrderStatus.aspx.cs" Inherits="OrderDetails_frmOrderStatus"  %>

<%@ Register Src="ucOrderStatus.ascx" TagName="ucOrderStatus" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucOrderStatus ID="UcOrderStatus1" runat="server" />
</asp:Content>

