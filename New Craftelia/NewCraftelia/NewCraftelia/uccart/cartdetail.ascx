<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cartdetail.ascx.cs" Inherits="uccart_cartdetail" %>
<%@ Register Src="~/uccart/PurchaseTotal.ascx" TagPrefix="uc1" TagName="PurchaseTotal" %>



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.[Order].OrderNo, dbo.Products.CoverImage, dbo.Products.ProductName, dbo.[Order].Quantity, dbo.[Order].Amount, dbo.[Order].Comments, dbo.[Order].Quantity * dbo.[Order].Amount AS TotalPrice, dbo.[Order].OrderId, dbo.Products.wholesaleqty, dbo.Products.wholesaleprice, dbo.SalesType.SalesType, dbo.Products.Price, dbo.Currency.Currency, ISNULL(dbo.[Order].deliverycostperitem, 0) AS deliverycostperitem, ISNULL(dbo.[Order].deliverycostperitem, 0) * dbo.[Order].Quantity AS totaldeliverycost, dbo.[Order].Quantity * dbo.[Order].Amount + ISNULL(dbo.[Order].deliverycostperitem, 0) * dbo.[Order].Quantity AS totalcostwithdelivery FROM dbo.[Order] INNER JOIN dbo.Products ON dbo.[Order].ProductKey = dbo.Products.ProductKey INNER JOIN dbo.SalesType ON dbo.Products.SaleTypeId = dbo.SalesType.SalesTypeID INNER JOIN dbo.Currency ON dbo.Products.Currency = dbo.Currency.CurrencyId WHERE (dbo.[Order].OrderNo = @ID)" DeleteCommand="DELETE FROM dbo.[Order] WHERE (OrderId = @ID)" UpdateCommand="UPDATE [Order] SET Quantity = @Quantity, Amount = @Amount WHERE (OrderId = @ID)">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="cart" />
        </SelectParameters>
    </asp:SqlDataSource>


    				
				

 <thead>
						<tr>
							<th style="width:40%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
                            	<th style="width:8%">Per Item Delivery Cost</th>
							<th style="width:22%" class="text-center">*Total Cost <br />
                                </th>
							<th style="width:20%"></th>
						</tr>
					</thead>
                        
                       <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
                           <EmptyDataTemplate>
                               <div class="alert alert-info">
                               No Item in your Cart. <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Default.aspx">Click here to continue shopping</asp:LinkButton>
                               </div>
                           </EmptyDataTemplate>
                           <ItemTemplate>
                               
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("SalesType") %>' Visible="false"></asp:Label>  
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("wholesaleqty") %>' Visible="false"></asp:Label>  
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("wholesaleprice") %>' Visible="false"></asp:Label>  
                             <asp:Label ID="Label6" runat="server" Text='<%# Eval("OrderId") %>' Visible="false"></asp:Label>  
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("Price") %>' Visible="false"></asp:Label>  
                              
					<tbody>
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"> <asp:Image ID="Image1"  ImageUrl='<%# Eval("CoverImage") %>' runat="server" Width="70px" Height="70px" /></div>
									<div class="col-sm-10">
										<h4 class="nomargin"><strong> <asp:Label ID="Label3" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label></h4>
										
									</div>
								</div>
							</td>
							<td data-th="Price"> <asp:Label ID="Label1" runat="server" Text='<%# Eval("Currency") %>'></asp:Label><asp:Label ID="Label4" runat="server" Text='<%# Eval("Amount") %>'></asp:Label> <span class="text-muted">x</span></strong></h6>
						</td>
							<td data-th="Quantity">
							<asp:TextBox ID="TextBox1" Enabled="false" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control input-sm"></asp:TextBox>	

                             
                               
							</td>

                            
							<td data-th="Subtotal" class="text-center"> <asp:Label ID="Label12" runat="server" Text='<%# Eval("Currency") %>'></asp:Label>
                                     <asp:Label ID="Label13" runat="server" Text='<%# Eval("deliverycostperitem") %>'></asp:Label></td>
                          
							<td data-th="Subtotal" class="text-center"> <asp:Label ID="Label2" runat="server" Text='<%# Eval("Currency") %>'></asp:Label>
                                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("totalcostwithdelivery") %>'></asp:Label></td>
							<td class="actions" data-th="">
							<asp:LinkButton ID="LinkButton2" runat="server" CommandName="refresh" CausesValidation="False" CssClass="btn btn-info btn-sm"><i class="fa fa-refresh"></i></asp:LinkButton>	
							<asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" CausesValidation="False" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" CommandArgument="" CssClass="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></asp:LinkButton>									
							</td>
						</tr>
					</tbody>
			

				
                           </ItemTemplate>

                       </asp:ListView> 
  

    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SUM(Amount * Quantity) + SUM(deliverycostperitem * Quantity) AS TotalPrice FROM dbo.[Order] WHERE (OrderNo = @ID) GROUP BY deliverycostperitem">
    <SelectParameters>
        <asp:SessionParameter Name="ID" SessionField="cart" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>

            		<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total <asp:Label ID="Label11" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label></strong></td>
						</tr>
						<tr>
							<td></td>
                            <td></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total <asp:Label ID="Label1" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label></strong></td>
							<td></td>
						</tr>
					</tfoot>
            



        </ItemTemplate>
    </asp:ListView>
					
				
		<asp:Label ID="Label14" runat="server" Text=" * Total Cost = (Item Cost * Total Quantity) + (Per Item Delivery Cost * Quantity)" ForeColor="Red"></asp:Label>			
				
				
				
				