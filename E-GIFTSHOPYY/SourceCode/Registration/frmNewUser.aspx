<%@ Page Language="C#"  MasterPageFile="~/Templates/Default/MasterPage.master" AutoEventWireup="true" CodeFile="frmNewUser.aspx.cs" Inherits="Registration_frmNewUser" %>

<%@ Register Src="RContols/ucRegistration.ascx" TagName="ucRegistration" TagPrefix="uc1" %>


    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucRegistration ID="UcRegistration1" runat="server" />
    

  </asp:Content>      
  