<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/Default/AdminMaster.master" EnableEventValidation="true" CodeFile="frmOrdersList.aspx.cs" Inherits="Order_frmOrdersList" %>
<%@ Register Src="Controls/ucOrdersList.ascx" TagName="ucOrdersList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucOrdersList ID="UcOrdersList1" runat="server" />
</asp:Content>