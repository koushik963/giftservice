<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucRating.ascx.cs" Inherits="Browse_Controls_Rating_ucRating" %>
<table>
<tr align="center">
<td align="center">
<asp:RadioButtonList ID="rdbtnRate" runat="server" RepeatDirection="Horizontal" >
 <asp:ListItem Value="0">Poor * &nbsp;&nbsp;&nbsp; 
   </asp:ListItem>
   <asp:ListItem  Value="1">Fair  ** &nbsp;&nbsp;&nbsp;
  </asp:ListItem>
  <asp:ListItem  Value="2" Selected="True">Good   *** &nbsp;&nbsp;&nbsp;
  </asp:ListItem>
  <asp:ListItem Value="3">Outstanding   **** &nbsp;&nbsp;&nbsp;
  </asp:ListItem>
  
  <asp:ListItem  Value="4">Excellent     *****
  </asp:ListItem>
  
  </asp:RadioButtonList>
 </td>
 </tr>
 <tr align="center">
 <td>
  <asp:Button ID="btnrate" Text="Rate" runat="server" Width="75px" OnClick="btnrate_Click" />
  </td>
 </tr>
  </table>