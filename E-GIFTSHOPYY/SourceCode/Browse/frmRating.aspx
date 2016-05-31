<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmRating.aspx.cs" Inherits="Browse_frmRating"  %>

<%@ Register Src="Controls/Rating/ucRating.ascx" TagName="ucRating" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucRating ID="UcRating1" runat="server" OnLoad="UcRating1_Load" />
</asp:Content>

