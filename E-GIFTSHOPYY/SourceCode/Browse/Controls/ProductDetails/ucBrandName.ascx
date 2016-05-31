<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucBrandName.ascx.cs" Inherits="Browse_Controls_ProductDetails_ucBrandName" %>
&nbsp;
<table width="100%">
    <tr>
        <td style="width:100%">
                 <table width="100%">
                        <tr>
                            <td align="left" style="width:20%">
                               <b> Brand</b>
                            </td>
                            <td align="left">
                                :<asp:Label ID="lblBrandName" Text="" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width:20%">
                                <b>Price</b>
                            </td>
                            <td align="left">
                                :
                                <asp:Label ID="lblPrice" Text="" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
        </td>
    </tr>
</table>
