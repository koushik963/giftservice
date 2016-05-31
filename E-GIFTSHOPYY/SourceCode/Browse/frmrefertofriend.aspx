<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true" CodeFile="frmrefertofriend.aspx.cs" Inherits="Browse_frmrefertofriend"  %>

<%@ Register Src="Controls/ucRefertoFriend.ascx" TagName="ucRefertoFriend" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    
 <table align="center" width="100%">
 <tr>
<td >
<div align="center">
 <uc1:ucRefertoFriend ID="UcRefertoFriend1" runat="server" /></div>
</td>
</tr>
</table>
</asp:Content>

