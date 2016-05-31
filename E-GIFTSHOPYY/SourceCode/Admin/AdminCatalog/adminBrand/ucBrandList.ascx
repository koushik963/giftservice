<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucBrandList.ascx.cs" Inherits="ucBrandList" %>
<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td align="center" bgcolor="navy">
            <strong><span style="color:White">BRAND LIST</span></strong><br />
        </td>
    </tr>
    <tr>
        <td id="tdBrandList" style="width:100%" align="left">
        <asp:Panel ID="panelTop" runat="server" Width="100%">
            <asp:LinkButton ID="lBtnNewBrand" Text="Add New Brand" runat="server" OnClick="lBtnNewBrand_Click"></asp:LinkButton>
            <asp:DataList ID="dlBrand" RepeatColumns="1" runat="server" Width="100%" OnItemCommand="dlBrand_ItemCommand">
                    <HeaderStyle BackColor="Lavender"/>
                    <ItemStyle  BackColor="Azure"/>
                    <AlternatingItemStyle  BackColor="LightBlue"/>
                    <HeaderTemplate >
                        <table style="width:100%">
                            <tr>
                                <td style="width:25%" align="center">Brand Name</td>
                                <td style="width:45%" align="center">Description</td>
                                <td style="width:15%" align="center">Edit</td>
                                <td style="width:15%" align="center">Delete</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table style="width:100%">
                            <tr>
                                <td style="width:25%" align="center">
                                    <asp:Label ID="lblBrandName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"BrandName")%>'></asp:Label>
                                </td>
                                <td style="width:45%" align="center">
                                   <img id="imgBrand" alt='<%#DataBinder.Eval(Container.DataItem,"Description")%>' src='<%#DataBinder.Eval(Container.DataItem,"Logo","~/Browse/Images/{0}")%>' runat="server" width="50" height="50" />
                             </td>
                            <td style="width:15%" align="center">
                                    <asp:ImageButton ID="IbtnBrandEdit" AlternateText="Edit Record" ImageUrl="~/Admin/AdminCatalog/Images/edit.gif" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' runat="server" />
                                </td>
                                <td style="width:15%" align="center">
                                    <asp:ImageButton ID="IbtnBrandDelete" AlternateText="Delete Record" ImageUrl="~/Admin/AdminCatalog/Images/delete.gif" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' runat="server" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:Label ID="lblMsg" runat="server" ></asp:Label>
        </asp:Panel>
        </td>
    </tr>
    <tr>
        <td id="tdNewBrand" style="width:100%" align="left">
            <asp:Panel ID="panelupdate" runat="server" Width="100%">
                <table style="width:100%">
                    <tr>
                        <th colspan="3" align="center" style="height: 21px">
                            <asp:Label ID="lblUpdateBrand" runat="server" ForeColor="Green"></asp:Label></th>
                    </tr>
                    <tr>
                        <td colspan="3" align="center"><asp:Label ID="lblBrandID" Text="" runat="server" Visible="false"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="right">Brand Name</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:TextBox ID="txtBrandName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Description</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:TextBox ID="txtBrandDescriptrion" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="height: 36px">
                            <asp:Label ID="lblBrandLogo" runat="server" Text="UpLoadLogo"></asp:Label>
                            </td>
                        <td align="center" style="width:2%; height: 36px;"><b>:</b></td>
                        <td align="left" style="height: 36px">
                            <asp:Image ID="imgBrandLogo" runat="server" AlternateText="Not Available" width="100" Height="75"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Logo (Image)</td>
                        <td align="center" style="width:2%"><b>:</b></td>
                        <td align="left">
                            <asp:FileUpload ID="fileBrand" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:ImageButton ID="IbtnBrandSubmit" ImageUrl="~/Admin/AdminCatalog/Images/update11.jpg" AlternateText="Submit" runat="server" OnClick="IbtnBrandSubmit_Click" />
                            <asp:ImageButton ID="IBtnBrandCancel" ImageUrl="~/Admin/AdminCatalog/Images/cancel11.jpg" AlternateText="Cancel" runat="server" OnClick="IBtnBrandCancel_Click" />
                        </td>
                    </tr>
                </table>
               <asp:Label ID="lblMsgNewBrand" runat="server" ForeColor="Red" Text=""></asp:Label></asp:Panel>
        </td>
    </tr>
</table>