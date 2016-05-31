<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucategoryListl.ascx.cs" Inherits="ucategoryListl" %>
  <table style="width:100%" cellpadding="0" cellspacing="0">
  <tr>
    <td style="width:100%" id="tdCategoryList" align="left">
       <asp:Panel ID="panelCategoryTop" runat="server" Width="100%">
          <asp:LinkButton ID="lBtnNewCategory" Text="Add New Category" runat="server" OnClick="lBtnNewCategory_Click"></asp:LinkButton>
            <asp:DataList ID="dlCategory" RepeatColumns="1" runat="server" Width="100%" OnItemCommand="dlCategory_ItemCommand">
                <HeaderStyle BackColor="Aqua" />
                    <ItemStyle  BackColor="azure"/>
                      <AlternatingItemStyle  BackColor="lightBlue"/>
                        <HeaderTemplate >
                            <table style="width:100%">
                               <tr>
                                 <td style="width:30%" align="center">Category Name</td>
                                 <td style="width:40%" align="center">Description</td>
                                 <td style="width:15%" align="center">Edit</td>
                                 <td style="width:15%" align="center">Delete</td>
                              </tr>
                            </table>
                       </HeaderTemplate>
                       <ItemTemplate>
                        <table style="width:100%">
                            <tr>
                                <td style="width:30%" align="center">
                                   <asp:Label ID="lblCategoryName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Name") %>'></asp:Label>
                                </td>
                                <td style="width:40%" align="center">
                                    <img id="imgCategory" alt='<%#DataBinder.Eval(Container.DataItem,"Description")%>' src='<%#DataBinder.Eval(Container.DataItem,"Image","~/Browse/Images/{0}")%>' runat="server" width="100" height="75" />
                                </td>
                                <td style="width:15%" align="center">
                                    <asp:ImageButton ID="IbtnEditCat" AlternateText="Edit Record" ImageUrl="~/Admin/AdminCatalog/Images/edit.gif" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' runat="server" />
                                </td>
                                <td style="width:15%" align="center">
                                    <asp:ImageButton ID="IbtnDeleteCat" AlternateText="Delete Record" ImageUrl="~/Admin/AdminCatalog/Images/delete.gif" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' runat="server" />
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
         <td style="width:100%" id="tdNewCategory" align="left">
           <asp:Panel ID="panelNewCategory" runat="server" Width="100%">
             <table style="width:100%" cellpadding="0" cellspacing="0">
                    <tr>
                    <th align="center" colspan="3">
                    <asp:Label ID="lblNewCAtegoryHeader" Text="" runat="server"></asp:Label>
                    </th>
                        </tr>
                    <tr>
                        <td colspan="3" align="center">
                        <asp:Label ID="lblCatID" Text="" runat="server" Visible="false"></asp:Label>
                        </td>
                    </tr>
                 <tr>
                     <td align="right">
                         Category Name</td>
                     <td align="center" style="width: 2%">
                         <b>:</b></td>
                     <td align="left">
                        <asp:TextBox ID="txtCategoryName" runat="server" />
                     </td>
                 </tr>
                 <tr>
                        <td align="right" style="height: 38px">Description</td>
                        <td align="center" style="width:2%; height: 38px;"><b>:</b></td>
                        <td align="left" style="height: 38px">
                            <asp:TextBox ID="txtCatDescriptrion" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                        <td align="right">                                                   
                            <asp:Label ID="lblImage" Text="Uploaded Image" runat="server"></asp:Label></td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:Image ID="imgCatLogo" runat="server" AlternateText="Not Available" Height="75px" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Upload New Image</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:FileUpload ID="fileCat" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center" style="height: 34px">
                            <asp:ImageButton ID="IbtnCatSubmit" ImageUrl="~/Admin/AdminCatalog/Images/update11.jpg" AlternateText="Submit" runat="server" OnClick="IbtnCatSubmit_Click" />
                            <asp:ImageButton ID="IBtnCatCancel" ImageUrl="~/Admin/AdminCatalog/Images/cancel11.jpg" AlternateText="Cancel" runat="server" OnClick="IBtnCatCancel_Click" />
                        </td>
                    </tr>
                </table>
               <asp:Label ID="lblMsgNewCat" runat="server" ForeColor="Red" Text=""></asp:Label></asp:Panel>
           </td>
         </tr>
       </table>
   