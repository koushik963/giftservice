<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UcPayment.ascx.cs" Inherits="Payment_UcPayment" %>
<style type="text/css">
    .auto-style1 {
        width: 40%;
        height: 40px;
    }
    .auto-style2 {
        height: 40px;
    }
    .auto-style3 {
        width: 40%;
        height: 36px;
    }
    .auto-style4 {
        height: 36px;
    }
    .auto-style6 {
        height: 26px;
        width: 160px;
    }
    .auto-style7 {
        width: 134px;
    }
    .auto-style8 {
        height: 36px;
        width: 160px;
    }
    .auto-style9 {
        height: 40px;
        width: 160px;
    }
    .auto-style10 {
        width: 100%;
    }
    .auto-style11 {
        width: 160px;
    }
</style>
<script language="javascript" type="text/javascript">
// <!CDATA[



// ]]>
</script>
<div align="center">

    <asp:Panel ID="panel2" runat="server" >
        <table class="auto-style10">
        <tr>
            <td>Enter One Time Password</td>
        </tr>
        <tr>
            <td>Transaction Id&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button2" runat="server" Height="27px" OnClick="Button2_Click" Text="Enter" Width="102px" />
            </td>
        </tr>
    </table>
    </asp:Panel>
  
</div>
<div align="center">
    <asp:Panel ID="panel1" runat="server">
<table width="100%" id="TABLE1">
    <tr>
        <td style="width: auto">
        
            <asp:Label ID="lbltitle" runat="server" Text="Payment Details" ForeColor="gray" Font-Size="Large"
                              Width="283px"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblSummary" runat="server" Text="Order Summary" BackColor="Cornsilk">
            </asp:Label>
        </td>
    </tr>
    <tr style="width: 100%">
        <td align="center" style="width: 40%">
            <asp:Label ID="lblCamount" runat="server" Text="Cart Amount">
            </asp:Label>
        </td>
        <td class="auto-style11">
            <asp:TextBox ID="txtcamount" runat="server" Width="225px" Enabled="False" EnableTheming="True"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr style="width: 100%">
        <td align="center" style="width: 40%">
            <asp:Label ID="lbltamount" runat="server" Text="Tax Amount(8.5)">
            </asp:Label>
        </td>
        <td class="auto-style11">
            <asp:TextBox ID="txttamount" runat="server" Width="225px" Enabled="False"></asp:TextBox>
        </td>
        
    </tr>
    <tr style="width: 100%">
        <td align="center" style="width: 40%">
            <asp:Label ID="lblsamount" runat="server" Text="Shipping Amount">
            </asp:Label>
        </td>
        <td class="auto-style11">
            <asp:TextBox ID="txtsamount" runat="server" Width="223px" Text="Rs 10" 
                Enabled="False"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr style="width: 100%">
        <td align="center" style="width: 40%; height: 26px;">
            <asp:Label ID="lblnamount" runat="server" Text="Net Payable Amount">
            </asp:Label>
        </td>
        <td class="auto-style6">
            <asp:TextBox ID="txtnamount" runat="server" Width="225px" Enabled="False"></asp:TextBox>
        </td>
        
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblenter" runat="server" Text="Accepted Cards: Visa,MasterCard,American Express">
            </asp:Label>
        </td>
        <td class="auto-style11">
            <asp:Image ID="icard" runat="server" ImageUrl="~/Browse/Images/PayCards.gif" />
        </td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        </td>
    </tr>
    <caption>
        *Enter in format (1111-1111-1111-1111) 
    </caption>
    </tr>
    <tr style="width: 100%">
        <td align="center" class="auto-style3">
            Card No</td>
        <td class="auto-style8">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
                OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Enter valid card number" 
                ValidationExpression="[0-9]{16}"></asp:RegularExpressionValidator>
            <br />
        </td>
        <td class="auto-style4">
            &nbsp;</td>
    </tr>
    <tr style="width: 100%">
        <td align="center" class="auto-style1">
            Pin</td>
        <td class="auto-style9">
            <asp:TextBox ID="txtcode" runat="server" AutoComplete="off" 
                 TextMode="Password"></asp:TextBox>
            </td>
        <td class="auto-style2">
            &nbsp;</td>
    </tr>
    <tr style="width: 100%">
        <td style="width: 40%" align="center">
            <asp:Label ID="lblexpiry" runat="server" Text="Expiry Date">
            </asp:Label>
        </td>
        <td class="auto-style11">
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlMonth" runat="server" ToolTip="EnterMonth">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:DropDownList ID="ddlyear" runat="server" ToolTip="EnterYear">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            &nbsp; mm/yyyy</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr style="width: 100%">
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        </td>
        <td align="center">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:Button ID="btnpay" runat="server" Text="PAY NOW" OnClick="btnpay_Click" CausesValidation="True" Height="33px" Width="121px" />
            
            <br />
            <br />
            
        </td>
        <td align="center">
            &nbsp;</td>
    </tr>
</table>
    </asp:Panel>
</div>

