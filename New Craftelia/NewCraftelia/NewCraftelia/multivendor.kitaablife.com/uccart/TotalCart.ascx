<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TotalCart.ascx.cs" Inherits="uccart_TotalCart" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TotalCart FROM dbo.[Order] WHERE (OrderNo = @cart) AND (Status = N'Pending')">
    <SelectParameters>
        <asp:SessionParameter Name="cart" SessionField="cart" />
    </SelectParameters>
</asp:SqlDataSource>


<div class="col-xs-3 col-md-2 nopadding"> 
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
        <ItemTemplate>
  <asp:LinkButton ID="LinkButton2" runat="server" CommandName="cart" ><i class="fa fa-shopping-cart" aria-hidden="true"></i> <asp:Label ID="Label1" runat="server" Text='<%# Eval("TotalCart") %>'></asp:Label> Cart </asp:LinkButton>
        </ItemTemplate>
    </asp:ListView>
  


</div>

 <button data-toggle="modal" id="btnShowPopup12" data-target="#myModal12" style="visibility:hidden;"></button>
					<div class="modal fade" id="myModal12" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm popup center" style="margin-top:40px">
						 <h3>
           Your Shopping Cart is Empty
        </h3>
       <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/images/addcart.png" Width="200px" />--%>
        <br />
        <hr />
        <div class="center">
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx">Click Here to Continue Shopping</asp:LinkButton>
                
             
        </div>
						</div>
					</div>
				<script type="text/javascript">
				    function ShowPopup12() {
				        $("#btnShowPopup12").click();
				    }
    </script>
