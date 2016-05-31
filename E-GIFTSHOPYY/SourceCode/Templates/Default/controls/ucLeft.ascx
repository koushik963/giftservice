<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucLeft.ascx.cs" Inherits="Templates_Default_controls_ucLeft" %>
<%@ Register Src="../../../Browse/Controls/ucPopularCategories.ascx" TagName="ucPopularCategories"
    TagPrefix="uc1" %>

<table border="0" style="width: 14%">
    <tr>
        <td style="width:122%; text-align: right;">
            <uc1:ucPopularCategories ID="UcPopularCategories1" runat="server" />
            <a style="margin-left:0" href='/Shopping/Browse/frmAllCategories.aspx'> </a>     
        </td>
    </tr>
</table>