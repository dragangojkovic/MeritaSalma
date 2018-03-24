<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PurchaseTotal.ascx.cs" Inherits="uccart_PurchaseTotal" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SUM(Amount * Quantity) AS TotalPrice FROM [Order] WHERE (OrderNo = @ID)">
    <SelectParameters>
        <asp:SessionParameter Name="ID" SessionField="cart" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>

            		<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total <asp:Label ID="Label2" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label></strong></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total <asp:Label ID="Label1" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label></strong></td>
							<td></td>
						</tr>
					</tfoot>
            



        </ItemTemplate>
    </asp:ListView>