<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmShipping.aspx.cs" Inherits="ShipingBilling_frmShipping"  %>

<%@ Register Src="ucShipping.ascx" TagName="ucShipping" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucShipping ID="UcShipping1" runat="server" />
</asp:Content>

