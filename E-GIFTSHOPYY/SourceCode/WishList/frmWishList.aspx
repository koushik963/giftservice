<%@ Page Language="C#" MasterPageFile="~/Templates/Default/MasterPage.master" AutoEventWireup="true" CodeFile="frmWishList.aspx.cs" Inherits="WishList_frmWishList" Title="E-Gift Shopee" %>

<%@ Register Src="ucWishList.ascx" TagName="ucWishList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucWishList id="UcWishList1" runat="server">
    </uc1:ucWishList>
</asp:Content>

