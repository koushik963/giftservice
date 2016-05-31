<%@ Page Language="C#" MasterPageFile="~/Browse/MasterPage1.master" AutoEventWireup="true"
    CodeFile="frmProductDetails.aspx.cs" Inherits="Browse_frmProductDetails"  %>

<%@ Register Src="Controls/ProductDetails/ucOffers.ascx" TagName="ucOffers" TagPrefix="uc1" %>
<%@ Register Src="Controls/ProductDetails/ucBrandName.ascx" TagName="ucBrandName"
    TagPrefix="uc6" %>
<%@ Register Src="Controls/ProductDetails/ucProductImgName.ascx" TagName="ucProductImgName"
    TagPrefix="uc2" %>
<%@ Register Src="Controls/ProductDetails/ucProdFeatures.ascx" TagName="ucProdFeatures"
    TagPrefix="uc3" %>
<%--<%@ Register Src="Controls/ProductDetails/ucOffers.ascx" TagName="ucOffers" TagPrefix="uc4" %>
--%>
<%@ Register Src="Controls/ProductDetails/ucProddesc.ascx" TagName="ucProddesc" TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr align="left">
            <td style="width:40%">
                <uc2:ucProductImgName ID="UcProductImgName1" runat="server" />
            </td>
            <td align="left">

                <uc6:ucBrandName ID="UcBrandName1" runat="server"></uc6:ucBrandName>
                <uc1:ucOffers ID="UcOffers1" runat="server" />
                  <b><i>Product Features</i></b>
                <uc3:ucProdFeatures ID="UcProdFeatures1" runat="server"></uc3:ucProdFeatures>
                
            </td>
        </tr>
        <tr align="left">
            <td colspan="2">
                <uc5:ucProddesc ID="UcProddesc1" runat="server" />
            </td>
        </tr>
        </table>
        <table>
         <tr>
        <td align="center">   
       <asp:Button ID="btnBuy" Text="Buy Now" runat="server" OnClick="btnBuy_Click1" />
       </td>
       <td align="center">
       <asp:Button ID="btnRating" Text="Rate Now" runat="server" OnClick="btnRating_Click1" />
       </td>
       <td align="center"> 
       <asp:Button ID="btnRefer" Text="Refer to Friend" runat="server" OnClick="btnRefer_Click" />
       </td>
       <td align="center">  
       <asp:Button ID="btnWish" Text="Add to wish List"  runat="server" OnClick="btnWish_Click" Visible="false"/>
       </td>
       </tr>
       </table>
    
</asp:Content>
