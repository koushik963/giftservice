<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucShipping.ascx.cs" Inherits="Payment_ucShipping" %>
<html><head><style type="text/css">
td
{
color:Gray;
}
</style></head><body>
<table width="100%" border="0">
    <tr align="center"> <%--style="background-color:#ccccff" >--%>
        <th colspan="2"  valign="bottom"><h4>
            <span style="color: #0066ff">
            Shipping and Billing Details</span></h4></th>
    </tr>
    <%--<tr><td colspan="2" style="height: 21px"> </td></tr>--%>
    <tr>
        <td> <%--style="background-color:#ccccff">--%>
            <table width="100%" border="0">
                <tr align="center">
                    <td colspan="2" style="color:Blue; font-size:larger; height: 22px;">
                        Shipping Details</td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkEditShip" runat="server" Text="Edit Shipping Details" OnCheckedChanged="chkEditShip_CheckedChanged" AutoPostBack="True"/></td>
                </tr>
                <tr>
                    <td style="height: 26px">
                        First Name:</td>
                    <td style="height: 26px">
                        <asp:TextBox ID="txtfname" runat="server" Enabled="False"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rfvfname" runat="server" ErrorMessage="This Field Cannot be Blank"
                            ToolTip="This Field Cannot be Blank" ControlToValidate="txtfname">*</asp:RequiredFieldValidator>
                           </td>
                </tr>
                <tr>
                    <td style="height: 27px">
                        Last Name:</td>
                    <td style="height: 27px">
                        <asp:TextBox ID="txtlname" runat="server" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        Email Id:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This Field Cannot be Blank"
                            ToolTip="This Field Cannot be Blank" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                  <td> Gender:</td>
                  <td> <asp:RadioButtonList ID="rdbtn" runat="server" RepeatDirection="Horizontal" >
                  <asp:ListItem Selected='true'>Male</asp:ListItem>
                  <asp:ListItem>Female</asp:ListItem>
                  </asp:RadioButtonList>
                      <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="Must select gender"
                      text="*" ToolTip ="Must select gender" ControlToValidate="rdbtn"
                          ></asp:RequiredFieldValidator>
                  </td>
                  
                  </tr>
                <tr>
                    <td style="height: 26px">
                        Contact No.:</td>
                    <td style="height: 26px">
                        <asp:TextBox ID="txtContact" runat="server" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        Address:</td>
                    <td>
                        <asp:TextBox ID="txtaddr" runat='server' Enabled="False" TextMode="MultiLine"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This Field Cannot be Blank"
                            ToolTip="This Field Cannot be Blank" ControlToValidate="txtaddr">*</asp:RequiredFieldValidator>
               </td>
                </tr>
                <tr>
                    <td>
                        Country:</td>
                    <td>
                        <asp:DropDownList ID="ddlCountry" runat="server" Enabled="False" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList></td>
    </tr>
    <tr>
        <td>
            State:</td>
        <td>
            <asp:DropDownList ID="ddlState" runat="server" Enabled="False" OnSelectedIndexChanged="ddlState_SelectedIndexChanged1" AutoPostBack="True">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td>
            City:</td>
        <td>
            <asp:DropDownList ID="ddlCity" runat="server" Enabled="False">
            </asp:DropDownList></td>
    </tr>
</table>
            &nbsp;
</td>

<td><%--style="background-color:#ccccff">--%>

 <table width="100%" border="0">
                <tr align="center">
                    <td colspan="2" style="color:Blue; font-size:larger">
                        Billing Details</td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkEditBiling" runat="server" Text="Same as Shipping  Details" OnCheckedChanged="chkEditBiling_CheckedChanged" AutoPostBack="True"/></td>
                </tr>
                <tr>
                    <td>
                        First Name:</td>
                    <td>
                        <asp:TextBox ID="txtfname1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvfname1" runat="server" ErrorMessage="This Field Cannot be Blank"
                            ControlToValidate="txtfname1" ToolTip="This Field Cannot be Blank">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Last Name:</td>
                    <td>
                        <asp:TextBox ID="txtlname1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        Email Id:</td>
                    <td>
                        <asp:TextBox ID="txtmail1" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This Field Cannot be Blank"
                           ControlToValidate="txtmail1" ToolTip="This Field Cannot be Blank">*</asp:RequiredFieldValidator>
                  </td>
                </tr>
                 <tr>
                  <td> Gender:</td>
                  <td> <asp:RadioButtonList ID="rdbtn1" runat="server" RepeatDirection="Horizontal">
                  <asp:ListItem>Male</asp:ListItem>
                  <asp:ListItem>Female</asp:ListItem>
                  </asp:RadioButtonList><asp:RequiredFieldValidator ID="rfvGender1" runat="server" ErrorMessage="Must select gender"
                      text="*" ToolTip ="Must select gender" ControlToValidate="rdbtn1"
                          ></asp:RequiredFieldValidator>
               </td>
                  
                  </tr>
              
                <tr>
                    <td>
                        Contact No.:</td>
                    <td>
                        <asp:TextBox ID="txtno1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        Address:</td>
                    <td>
                        <asp:TextBox ID="txtaddr1" runat='server' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvaddr1" runat="server" ErrorMessage="This Field Cannot be Blank"
                            ControlToValidate="txtaddr1" ToolTip="This Field Cannot be Blank">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Country:</td>
                    <td>
                        <asp:DropDownList ID="ddlcountry1" runat="server" OnSelectedIndexChanged="ddlcountry1_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList></td>
    </tr>
    <tr>
        <td>
            State:</td>
        <td>
            <asp:DropDownList ID="ddlstate1" runat="server" AutoPostBack="True">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td style="height: 29px">
            City:</td>
        <td style="height: 29px">
            <asp:DropDownList ID="ddlcity1" runat="server">
            </asp:DropDownList></td>
    </tr>
</table>
</td> </tr> 
<tr align="center">
<td colspan="2" style="height: 26px">
<asp:Button ID="btnPayment" runat="server" Text="Proceed to Payment"  OnClick="btnPayment_Click" /> </td>

</tr></table> 
</body></html>