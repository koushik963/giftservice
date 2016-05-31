<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucUsersList.ascx.cs" Inherits="Admin_AdminCatalog_AdminUsers_ucUsersList" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td id="tdBrandList" style="width:100%" align="left">
        <asp:Panel ID="panelTop" runat="server" Width="100%">
            <%--<asp:LinkButton ID="lBtnNewBrand" Text="Add New Brand" runat="server" OnClick="lBtnNewBrand_Click" Visible="False"></asp:LinkButton>--%>
            <asp:DataList ID="dlBrand" RepeatColumns="1" runat="server" Width="100%" OnItemCommand="dlBrand_ItemCommand">
                    <HeaderStyle BackColor="Lavender"/>
                    <ItemStyle  BackColor="Azure"/>
                    <AlternatingItemStyle  BackColor="LightBlue"/>
                    <HeaderTemplate >
                        <table style="width:100%">
                            <tr>
                                <td style="width:20%" align="center">UserName</td>
                                <td style="width:18%" align="center">Firstname</td>
                                <td style="width:17%" align="center">LastName</td>
                                <td style="width:15%" align="center">EmailID</td>
                                <td style="width:10%" align="center">Gender</td>
                                <td style="width:10%" align="center">ContactNo</td>
                                <td style="width:05%" align="center">Edit</td>
                                <td style="width:05%" align="center">Delete</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table style="width:100%">
                            <tr>
                                <td style="width:20%" align="center">
                                    <asp:Label ID="lblUserName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserName")%>'></asp:Label>
                                </td>
                                <td style="width:18%" align="center">
                                    <asp:Label ID="Label1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Firstname")%>'></asp:Label>
                                </td>
                                <td style="width:17%" align="center">
                                    <asp:Label ID="Label2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"LastName")%>'></asp:Label>
                                </td>
                                <td style="width:15%" align="center">
                                    <asp:Label ID="Label3" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"EmailID")%>'></asp:Label>
                                </td>
                                <td style="width:10%" align="center">
                                   <asp:Label ID="Label4" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Gender")%>'></asp:Label>
                                </td>
                                <td style="width:10%" align="center">
                                   <asp:Label ID="Label5" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ContactNo")%>'></asp:Label>
                                </td>
                                <td style="width:05%" align="center">
                                    <asp:ImageButton ID="IbtnBrandEdit" AlternateText="Edit Record" ImageUrl="~/Admin/AdminCatalog/Images/edit.gif" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserID")%>' runat="server" />
                                </td>
                                <td style="width:05%" align="center">
                                    <asp:ImageButton ID="IbtnBrandDelete" AlternateText="Delete Record" ImageUrl="~/Admin/AdminCatalog/Images/delete.gif" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserID")%>' runat="server" />
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
        <td id="tdNewBrand" style="width:100%; height: 290px;" align="left">
            <asp:Panel ID="panelupdate" runat="server" Width="100%">
                <table style="width:100%">
                    <tr>
                        <th colspan="3" align="center" style="height: 21px">
                            <asp:Label ID="lblUpdateBrand" runat="server" ForeColor="Green"></asp:Label></th>
                    </tr>
                    <tr>
                        <td colspan="3" align="center"><asp:Label ID="lblUserID" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="lblAddressID" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                                <tr>
                    <td align="right">
                        <span style="color: red">*</span> User Name:
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtuser" runat="server" CausesValidation="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="User name required"
                            ControlToValidate="txtuser" ToolTip="User name required">*</asp:RequiredFieldValidator>
                        <asp:Label ID="lblUser" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px; height: 34px;">
                        <span style="color: red">*</span>First Name:
                    </td>
                    <td align="left" style="height: 34px">
                        <asp:TextBox ID="txtfname" runat="server" CausesValidation="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" ControlToValidate="txtfname"
                            ErrorMessage="First Name should not be empty" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px">
                        Last Name:
                    </td>
                    <td align="left" style="width: 551px">
                        <asp:TextBox ID="txtlname" runat="server" CausesValidation="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px; height: 40px;">
                        Date Of Birth:
                    </td>
                    <td align="left" style="width: 551px; height: 40px;">
                        <cc1:GMDatePicker ID="GMDatePicker1" runat="server" Style="z-index: 225; left: 0px;
                            position: absolute; top: 0px">
                        </cc1:GMDatePicker>
                         <asp:Label ID="lblFormat" runat="server" Text="mm/dd/yyyy" Enabled="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="height: 55px">
                        <span style="color: red">*</span>Gender:
                    </td>
                    <td align="left" style="width: 551px; height: 55px;">
                        <asp:RadioButtonList ID="rdSex" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Male" Value="Male">
                            </asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female">
                            </asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="GenderValidator" runat="server" ErrorMessage="PLZ Select the gender!!!"
                            ControlToValidate="rdSex" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px">
                        Contact No:
                    </td>
                    <td align="left" style="width: 551px">
                        <asp:TextBox ID="txtcontact" MaxLength="20" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Must enter numeric value"
                             Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtcontact"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px; height: 34px;">
                        Alternate E-Mail ID:
                    </td>
                    <td align="left" style="width: 551px; height: 34px;">
                        <asp:TextBox ID="txtmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px">
                        <span style="color: red">*</span>Address:
                    </td>
                    <td align="left" style="width: 551px">
                        <asp:TextBox ID="txtaddr" runat="server" TextMode="MultiLine">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This Field should not be blank"
                            ControlToValidate="txtaddr"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px; height: 32px;">
                        <span style="color: red">*</span>Country:</td>
                    <td align="left" style="width: 551px; height: 32px;">
                        <asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px">
                        <span style="color: red">*</span>State:
                    </td>
                    <td align="left" style="width: 551px">
                        <asp:DropDownList ID="ddlstate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px">
                        <span style="color: red">*</span>City:
                    </td>
                    <td align="left" style="width: 551px">
                        <asp:DropDownList ID="ddlcity" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 195px; height: 34px;">
                        ZIP Code:
                    </td>
                    <td align="left" style="width: 551px; height: 34px;">
                        <asp:TextBox ID="txtZipCode" MaxLength="6" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtZipCode"
                            ErrorMessage="Enter Proper Zip Code" ValidationExpression="\d{6}">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lblres" runat="server" BackColor="#80FF80" Font-Bold="True" ForeColor="Red" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <small><span style="color: red">*Note:</span>Must enter data</small>
                    </td>
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EasyWearConnectionString %>"
    SelectCommand="SELECT tblAddress.Address, tblAddress.CityId, tblAddress.StateId, tblAddress.CountryId, tblAddress.ZipCode, tblAddress.AddressId, tblUser.FName, tblUser.LName, tblUser.DOB, tblUser.ContactNo, tblUser.Gender, tblUser.AccountId, tblUser.EmailID, tblUser.AddressID AS Expr1, tblUser.Description, tblUser.UserId, tblCity.Name, tblUserAccount.UserName, tblUserAccount.Password, tblUserAccount.HintQuestion, tblUserAccount.Answer, tblUserAccount.RoleId, tblCountry.Name AS Expr2, tblState.Name AS Expr3, tblRole.Role FROM tblAddress INNER JOIN tblUser ON tblAddress.AddressId = tblUser.AddressID INNER JOIN tblUserAccount ON tblUser.AccountId = tblUserAccount.Id INNER JOIN tblCity ON tblAddress.CityId = tblCity.Id INNER JOIN tblCountry ON tblAddress.CountryId = tblCountry.ID INNER JOIN tblState ON tblAddress.StateId = tblState.Id AND tblCity.StateID = tblState.Id AND tblCountry.ID = tblState.CountryId INNER JOIN tblRole ON tblUserAccount.RoleId = tblRole.Id">
</asp:SqlDataSource>
