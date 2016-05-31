<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucChangeDetails.ascx.cs"
    Inherits="MyAccount_ucChangeDetails" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<table>
    <tr>
        <th  align="left"colspan="2" style="font-family:Verdana; color:orange; font-size:medium">
           
              Account Details
     </th>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="lblUser" runat="server" Text="UserName">
            </asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtUser" runat="server" Enabled="false">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <span style="color: Red">*</span>First Name:
        </td>
        <td align="left" style="height: 34px">
            <asp:TextBox ID="txtfname" runat="server" CausesValidation="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUser" ControlToValidate="txtfname" runat="server"
                Text="*" Display="Dynamic" ErrorMessage="Username cannot be blank" ToolTip="Username cannot be blank"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right">
            Last Name:
        </td>
        <td align="left" style="width: 551px">
            <asp:TextBox ID="txtlname" runat="server" CausesValidation="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 195px">
            Date Of Birth:
        </td>
        <td align="left" style="width: 551px">
         <cc1:GMDatePicker ID="GMDatePicker1" runat="server">
            </cc1:GMDatePicker>
          
        </td>
    </tr>
    <tr>
        <td align="right">
            <span style="color: Red">*</span>Gender:
        </td>
        <td align="left" style="width: 551px">
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
            <asp:TextBox ID="txtcontact" MaxLength="12" runat="server">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            E-Mail ID:
        </td>
        <td align="left">
            <asp:TextBox ID="txtmail" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" style="height: 23px">
            Hint Question:
        </td>
        <td align="left" style="height: 23px">
            <asp:DropDownList ID="ddlQuestion" runat="server">
                <asp:ListItem>What is your Favourite Pet</asp:ListItem>
                <asp:ListItem>What is Your Favourite Color</asp:ListItem>
                <asp:ListItem>What is your Favourite PassTime</asp:ListItem>
                <asp:ListItem>What is  your Favourite Food</asp:ListItem>
                <asp:ListItem>What is  your Favourite movie</asp:ListItem>
                <asp:ListItem>Which is Your Favourite Bike</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right">
            Answer:
        </td>
        <td>
            <asp:TextBox ID="txtAnswer" runat="SERVER"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <th colspan="2" align="left" style="width: 100%; color:orange;font-family: Verdana;">
            Address Details
        </th>
    </tr>
    <tr>
        <td align="right">
            <span style="color: Red">*</span>Address:
        </td>
        <td align="left">
            <asp:TextBox ID="txtaddr" runat="server" TextMode="MultiLine">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" Display="dynamic" ControlToValidate="txtaddr"
                Text="*" ToolTip="Must enter Address">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right">
            <span style="color: Red">*</span>Country:</td>
        <td align="left">
            <asp:DropDownList ID="ddlcountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right">
            <span style="color: Red">*</span>State:
        </td>
        <td align="left">
            <asp:DropDownList ID="ddlstate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right">
            <span style="color: Red">*</span>City:
        </td>
        <td align="left">
            <asp:DropDownList ID="ddlcity" runat="server" AutoPostBack="True">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right">
            ZIP Code:
        </td>
        <td align="left">
            <asp:TextBox ID="txtZipCode" MaxLength="6" runat="server"></asp:TextBox>
        </td>
    </tr>
    
    
    <tr>
        <td colspan="2" align="center">
            <asp:Button ID="btnUpdate" runat="server" Text="Submit" OnClick="btnUpdate_Click" />
            <asp:Label ID="lbl" runat="server" Text="" Font-Size="Medium" Font-Bold="true" ForeColor="red"></asp:Label>
        </td>
    </tr>
</table>
