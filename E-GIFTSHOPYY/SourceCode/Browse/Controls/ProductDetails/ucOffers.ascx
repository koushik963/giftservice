<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucOffers.ascx.cs" Inherits="Browse_Controls_ProductDetails_ucOffers" %>
   <asp:DataList ID="dloffer" runat="server" RepeatColumns="1">
     <ItemTemplate>
        <table>
           <tr>
              <td>
                  <b>  Offer Price</b>
              </td>
              <td>
                    :  <%#DataBinder.Eval(Container.DataItem,"OfferPrice")%>
               </td>    
           </tr>
         </table>
     </ItemTemplate>
   </asp:DataList>
      