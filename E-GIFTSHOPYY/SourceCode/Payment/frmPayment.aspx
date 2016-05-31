<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmPayment.aspx.cs" Inherits="Payment_frmPayment"  %>

<%@ Register Src="UcPayment.ascx" TagName="UcPayment" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UcPayment ID="UcPayment1" runat="server" OnLoad="UcPayment1_Load" />
</asp:Content>

