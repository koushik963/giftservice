<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucRegistration.ascx.cs"
    Inherits="Browse_Controls_ucRegistration" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>
<style type="text/css">
    .style1
    {
        width: 195px;
    }
    .style2
    {
        width: 551px;
    }
</style>
<table cellpadding="5" cellspacing="3"><%-- style="background-color: #ccccff"--%>
    <tr>
        <td colspan="2" align="left" style="width: 100%;font-family: Verdana;color:Orange;
            font-size: 10pt; font-style: italic; font-weight: bolder">
            Account Details
        </td>
    </tr>
    <tr>
        <td align="right">
            <span style="color: Red">*</span> User Name:
            <br />
            <small>(Enter your E-Mail ID) </small>
        </td>
        <td align="left">
            <asp:TextBox ID="txtuser" runat="server" CausesValidation="true" 
                ontextchanged="txtuser_TextChanged"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="User name required"
                ControlToValidate="txtuser" ToolTip="User name required">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revUserName" runat="server" Text="*" ErrorMessage="Invalid Username, Please enter in emailid format"
                ControlToValidate="txtUser" Display="Dynamic" ToolTip="Invalid Username, Please enter in emailid format"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp;
            <asp:Label ID="lblUser" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="right">
            <span style="color: Red">*</span>Password:
        </td>
        <td align="left">
            <asp:TextBox ID="txtpswd" runat="server" MaxLength="10" CausesValidation="true" TextMode="Password">
            </asp:TextBox>
            <small style="color: Blue">(Minimum 3-10 characters)</small>
            <asp:RequiredFieldValidator ID="rfvpswd" runat="server" ControlToValidate="txtpswd"
                Text="*" ErrorMessage="Must enter password" ToolTip="Must enter password"></asp:RequiredFieldValidator>
            </td>
    </tr>
    <tr>
        <td align="right" style="width: 195px; height: 34px;">
            <span style="color: Red">*</span>Re-Type Password:
        </td>
        <td align="left" style="width: 551px; height: 34px;">
            <asp:TextBox ID="txtRePswd" runat="server" CausesValidation="true" TextMode="Password">
            </asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch"
                ControlToCompare="txtpswd" ControlToValidate="txtRePswd"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="rfvRetype" runat="server" Text="*" ToolTip="must reenter the password"
            ControlToValidate="txtRePswd"></asp:RequiredFieldValidator>
                    </td>
    </tr>
    <tr>
        <td align="right" style="height: 32px">
            <asp:Label ID="lblQuestion" runat="server"> Hint Question:
            </asp:Label>
        </td>
        <td style="height: 32px">
            <asp:DropDownList ID="ddlQuestion" runat="server" Width="180px">
                <asp:ListItem> What is your Favourite Pet</asp:ListItem>
                <asp:ListItem> What is Your Favourite Color</asp:ListItem>
                <asp:ListItem>What is your pass time</asp:ListItem>
                <asp:ListItem>What is  your Favourite Food</asp:ListItem>
                <asp:ListItem>What is  your Favourite movie</asp:ListItem>
                <asp:ListItem>Which is Your Favourite Bike</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right" style="height: 34px">
            Answer:
        </td>
        <td align="left" style="height: 34px">
            <asp:TextBox ID="txtAnswer" runat="server">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" align="left" style="width: 100%; font-family: Verdana;
            font-size: 10pt; color:Orange; font-style: italic; font-weight: bolder">
            Personal Details</td>
    </tr>
    <tr>
        <td align="right" style="width: 195px; height: 34px;">
            <span style="color: Red">*</span>First Name:
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
            <span style="color: Red">*</span>Gender:
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
            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcontact"
                ErrorMessage="Must enter contact no."
              ValidationExpression="\d{1,15}"></asp:RegularExpressionValidator> --%> 
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
        <td colspan="2" align="left" style="width: 100%;font-family: Verdana;
            font-size: 10pt; color: Orange; font-style: italic; font-weight: bolder">
            Address Details
        </td>
    </tr>
    <tr>
        <td align="right" class="style1">
            <span style="color: Red">*</span>Address:
        </td>
        <td align="left" class="style2">
            <asp:TextBox ID="txtaddr" runat="server" TextMode="MultiLine">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This Field should not be blank"
                ControlToValidate="txtaddr"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 195px; height: 32px;">
            <span style="color: Red">*</span>Country:</td>
        <td align="left" style="width: 551px; height: 32px;">
            <asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged"
                AutoPostBack="True">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 195px">
            <span style="color: Red">*</span>State:
        </td>
        <td align="left" style="width: 551px">
            <asp:DropDownList ID="ddlstate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 195px">
            <span style="color: Red">*</span>City:
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
        <td>
            <asp:Label ID="lblres" runat="server" BackColor="#80FF80" Font-Bold="True" ForeColor="Red" ></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
                BackColor="#C0C0FF" />
        </td>
    </tr>
    <tr>
        <td>
            <small><span style="color: Red">*Note:</span>Must enter data</small>
        </td>
    </tr>
</table>
