<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/Default/AdminMaster.master" CodeFile="frmProductList.aspx.cs" Inherits="AdminProduct_frmProductList" %>
<%@ Register Src="ucProductList.ascx" TagName="ucProductList" TagPrefix="uc1" %>
<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <uc1:ucProductList ID="UcProductList1" runat="server" />
    </div>
</asp:Content>