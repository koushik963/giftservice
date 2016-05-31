<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/Default/AdminMaster.master"CodeFile="frmBrandList.aspx.cs" Inherits="AdminBrand_frmBrandList" %>
<%@ Register Src="ucBrandList.ascx" TagName="ucBrandList" TagPrefix="uc1" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <uc1:ucBrandList ID="UcBrandList1" runat="server" />
    </div>
</asp:Content>