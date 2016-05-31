<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmChangeAccountDetails.aspx.cs" Inherits="MyAccount_frmChangeAccountDetails"  %>

<%@ Register Src="ucChangeDetails.ascx" TagName="ucChangeDetails" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucChangeDetails id="UcChangeDetails1" runat="server">
    </uc1:ucChangeDetails>
  
</asp:Content>

