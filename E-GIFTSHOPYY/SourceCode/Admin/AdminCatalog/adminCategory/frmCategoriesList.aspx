<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/Default/AdminMaster.master" CodeFile="frmCategoriesList.aspx.cs" Inherits="frmCategoriesList" %>

<%@ Register Src="ucategoryListl.ascx" TagName="ucategoryListl" TagPrefix="uc1" %>
<%@ Register Src="ucategoryListl.ascx" TagName="ucategoryListl" TagPrefix="uc2" %>
<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        
        <uc2:ucategoryListl ID="ucategoryListl1" runat="server" />
    </div>
</asp:Content>