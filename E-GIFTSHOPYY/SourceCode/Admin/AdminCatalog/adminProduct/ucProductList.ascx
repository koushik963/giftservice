<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucProductList.ascx.cs" Inherits="ucProductList" %>
<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="width:100%" id="tdProductList" align="left">
       <asp:Panel ID="panelProductTop" runat="server" Width="100%">
          <asp:LinkButton ID="lBtnNewProduct" Text="Add New Product" runat="server" OnClick="lBtnNewProduct_Click"></asp:LinkButton>
            <asp:DataList ID="dlProduct" RepeatColumns="1" runat="server" Width="100%" OnItemCommand="dlProduct_ItemCommand">
                <HeaderStyle BackColor="lavender"/>
                    <ItemStyle  BackColor="azure"/>
                      <AlternatingItemStyle  BackColor="lightBlue"/>
                        <HeaderTemplate >
                            <table style="width:100%">
                               <tr>
                                 <td style="width:10%" align="center">Brand Name</td>
                                 <td style="width:30%" align="center">Product Name/PurchasePrice/SalePrice</td>
                                 <td style="width:30%" align="center">Description</td>
                                 <td style="width:10%" align="center">Quantity</td>
                                 <td style="width:10%" align="center">Edit</td>
                                 <td style="width:10%" align="center">Delete</td>
                              </tr>
                            </table>
                       </HeaderTemplate>
                       <ItemTemplate>
                        <table style="width:100%">
                            <tr>
                                <td style="width:10%" align="center">
                                   <asp:Label ID="lblBrandName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"BrandName" )%>'></asp:Label>
                                </td>
                                <td style="width:30%" align="center">
                                    <asp:Label ID="lblProductName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Name")%>'></asp:Label> /$
                                    <asp:Label ID="lblPurchasePrice" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"PurchasePrice" )%>'></asp:Label> /$
                                    <asp:Label ID="lblSalePrice" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"SalePrice") %>'></asp:Label>
                                </td>
                                <td style="width:30%" align="center">
                                   <img id="imgProduct" alt='<%#DataBinder.Eval(Container.DataItem,"Description")%>' src='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' runat="server" width="100" height="75" />
                                </td>
                                <td style="width:10%" align="center">
                                 <asp:Label ID="lblProductQuantity" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Quantity")%>'></asp:Label>
                                </td>
                                <td style="width:10%" align="center">
                                    <asp:ImageButton ID="IbtnProductEdit" AlternateText="Edit Record" ImageUrl="~/Admin/AdminCatalog/Images/edit.gif" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' runat="server" />
                                </td>
                                <td style="width:10%" align="center">
                                    <asp:ImageButton ID="IbtnProductDelete" AlternateText="Delete Record" ImageUrl="~/Admin/AdminCatalog/Images/delete.gif" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' runat="server" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:Label ID="lblMsg" Text="" ForeColor="Red" runat="server"></asp:Label>
           </asp:Panel>
         </td>
       </tr>
       <tr>
         <td style="width:100%" id="tdNewProduct" align="left">
           <asp:Panel ID="panelEditProduct" runat="server" Width="100%">
             <table style="width:100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="3" align="center">
                            Update Product</td>
                    </tr>
                    <tr>
                    <td  colspan="3" align="center"><asp:Label ID="lblID" Text="" runat="server" Visible="false"></asp:Label></td>
                </tr>
                    <tr>
                        <td align="right">Product Name</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            &nbsp;<asp:TextBox ID="txtUpdateProductName" runat="server"></asp:TextBox></td>
                    </tr>
                 <tr>
                     <td align="right">
                         Quantity</td>
                     <td align="center" style="width: 2%">
                         <b>:</b></td>
                     <td align="left">
                        <asp:TextBox ID="txtUpdateQuantity" runat="server" /></td>
                 </tr>
                 <tr>
                     <td align="right">
                         PurchasePrice</td>
                     <td align="center" style="width: 2%">
                        <b>:</b></td>
                     <td align="left">
                         <asp:TextBox ID="txtUpdatePurchasePrice" runat="server"/></td>
                 </tr>
                 <tr>
                     <td align="right">
                         Sale Price</td>
                     <td align="center" style="width: 2%">
                         <b>:</b>
                         </td>
                     <td align="left">
                        <asp:TextBox ID="txtUpdateSalePrice" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Description</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:TextBox ID="txtUpdateDiscription" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right">Uploaded Logo (Image)</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:Image ID="iUpload" runat="server" AlternateText="Not Available" Height="75" Width="100"/></td>
                    </tr>
                    <tr>
                        <td align="right">Logo (Image)</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:FileUpload ID="fileUpdateImage" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center" style="height: 34px">
                            <asp:ImageButton ID="IbtnProUpdate" ImageUrl="~/Admin/AdminCatalog/Images/update11.jpg" AlternateText="Update" runat="server" OnClick="IbtnProUpdate_Click" />
                            <asp:ImageButton ID="IBtnProCancel" ImageUrl="~/Admin/AdminCatalog/Images/cancel11.jpg" AlternateText="Cancel" runat="server" OnClick="IBtnProCancel_Click" />
                        </td>
                    </tr>
                 <tr>
                     <td align="center" colspan="3">
                         <asp:Label ID="lblMsgUdateProduct" runat="server"></asp:Label></td>
                 </tr>
                </table>
            </asp:Panel>
           </td>
         </tr>
       <tr>
         <td style="width:100%" id="td1" align="left">
           <asp:Panel ID="panelNewProduct" runat="server" Width="100%">
             <table style="width:100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="3" align="center" style="height: 19px">Add New Product</td>
                    </tr>
                    <tr>
                    <td  colspan="3" align="center"><asp:Label ID="lblBrandId" runat="server" Visible="False"></asp:Label></td>
                </tr>
                 <tr>
                     <td align="right">
                         Brand Name</td>
                     <td align="center" style="width: 2%">
                         <b>:</b></td>
                     <td align="left">
                         <asp:DropDownList ID="ddlBrandName" runat="server" >
                             <asp:ListItem>BrandName</asp:ListItem>
                         </asp:DropDownList></td>
                 </tr>
                 <tr>
                     <td align="right">
                         CategoryName</td>
                     <td align="center" style="width: 2%"><b>:</b>
                     </td>
                     <td align="left">
                         <asp:DropDownList ID="ddlCategoryName" runat="server">
                             <asp:ListItem>CategoryName</asp:ListItem>
                         </asp:DropDownList></td>
                 </tr>
                    <tr>
                        <td align="right">Product Name</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox></td>
                    </tr>
                 <tr>
                     <td align="right">
                         Quantity On Hand</td>
                     <td align="center" style="width: 2%">
                         <b>:</b></td>
                     <td align="left">
                         <asp:TextBox ID="txtProductQuantity" runat="server" /></td>
                 </tr>
                 <tr>
                     <td align="right">
                         PurchasePrice</td>
                     <td align="center" style="width: 2%">
                        <b>:</b></td>
                     <td align="left">
                         &nbsp;<asp:TextBox ID="txtPurPrice" runat="server"/></td>
                 </tr>
                 <tr>
                     <td align="right">
                         Sale Price</td>
                     <td align="center" style="width: 2%">
                         <b>:</b>
                         </td>
                     <td align="left">
                         &nbsp;<asp:TextBox ID="txtSalePrice" runat="server" /></td>
                 </tr>
                    <tr>
                        <td align="right">Description</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:TextBox ID="txtProDescriptrion" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right">Uploaded Logo (Image)</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            &nbsp;<asp:Image ID="imgProductLogo" runat="server" AlternateText="Not Available" Height="75" Width="100"/></td>
                    </tr>
                    <tr>
                        <td align="right" style="height: 22px">Logo (Image)</td>
                        <td align="center" style="width:2%; height: 22px;"><b>:</b></td>
                        <td align="left" style="height: 22px">
                            <asp:FileUpload ID="fileProduct" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:ImageButton ID="ibNewproduct" ImageUrl="" AlternateText="Submit" runat="server" OnClick="ibNewproduct_Click" />
                            <asp:ImageButton ID="ibCancel" ImageUrl="" AlternateText="Cancel" runat="server" OnClick="ibCancel_Click" />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblMsgNewProduct" runat="server" ForeColor="Red" Text=""></asp:Label></asp:Panel>
           </td>
         </tr>
        
       </table>
   