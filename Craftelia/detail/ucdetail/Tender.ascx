<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tender.ascx.cs" Inherits="ucdetail_book" %>
    

<div class="row">


 <div class="col-md-6">

   <div class="row form" id="bidapply" runat="server">
     
      
 
    <div class="col-xs-4 nopadding">
       
        <asp:TextBox ID="TextBox1" runat="server" Text="0"></asp:TextBox>
        
    </div>
       <div class="col-xs-8" style="text-align:right;margin-top: 5px">
                               
   
                               
 <asp:Button ID="Button1" runat="server" Text="Add Your Bid" OnClick="Button1_Click" ValidationGroup="bid" />
                     <br />     
                             
                               
                                  </div>



   </div>  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Add Your Bid" ValidationGroup="bid" InitialValue="0" ControlToValidate="TextBox1" CssClass="required" Display="Static"></asp:RequiredFieldValidator>
       <br />   <asp:Label ID="Label4" runat="server" Visible="false" CssClass="alert alert-warning" ForeColor="Red" Font-Size="10px"></asp:Label> 
 </div>
    <div class="col-md-6">

 
<div class="form form-div" id="lastbid" runat="server">
    

 
   
    <asp:Label ID="Label1" runat="server" Visible="false" Text="0"></asp:Label>   
    <br />
Days/Time Remaining:
    
  
           
        
   
   
           <br />   <br /><asp:Label ID="Label3" runat="server" Text="0"  CssClass="alert alert-danger" Font-Names="Orbitron" Font-Bold="True" Font-Size="14px"></asp:Label> 
           
     <br />  <br />
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
   
   </div>
   </div>
   </div>




     
    <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Bids(ProductBidId, BidPrice, UserName, BidDate, status) VALUES (@BidID, @BidPrice, @UserName, GETDATE(), @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProductBidID.ProductBidExpiry, ISNULL(LastBid.BidPrice, 0) AS LastBidPrice, ProductBidID.ProductBidId FROM (SELECT TOP (1) BidPrice, ProductBidId FROM Bids ORDER BY BidPrice DESC) AS LastBid RIGHT OUTER JOIN (SELECT TOP (1) ProductBidId, ProductBidExpiry, ProductKey FROM ProductBid WHERE (ProductBidExpiry &gt; GETDATE()) AND (ProductKey = @ProductKey) ORDER BY ProductBidId DESC) AS ProductBidID ON LastBid.ProductBidId = ProductBidID.ProductBidId">
    <InsertParameters>
        <asp:ControlParameter ControlID="Label2" DefaultValue="1" Name="BidID" PropertyName="Text" />
        <asp:ControlParameter ControlID="TextBox1" Name="BidPrice" PropertyName="Text" DefaultValue="" />
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        <asp:Parameter DefaultValue="Bid" Name="Status" />
    </InsertParameters>
    <SelectParameters>
        <asp:RouteParameter Name="ProductKey" RouteKey="ID" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />





  <button data-toggle="modal" id="btnShowPopup2" data-target="#myModal2" style="visibility:hidden;"></button>
					<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm popup center" style="margin-top:40px">
						 <h3>
                             Your Bid is Successfully Added. You can keep track on updates on your bid in My Account &gt; My Auction Tab. </h3>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/addbid.png" Width="200px" />
        <br />
        <hr />
        <div class="row">
            <div class="col-xs-6"> <%--<asp:Button ID="Button4" runat="server" Text="Continue Shopping" PostBackUrl="~/Default.aspx" CssClass="btn btn-default" />--%> </div>  
              <div class="col-xs-6">
        <asp:Button ID="Button5" runat="server" Text="Track Your Bid" CssClass="btn btn-warning" PostBackUrl="~/customer/BidsShow.aspx" />
                                                                                                                                                                         </div>
        </div>
						</div>
					</div>
				<script type="text/javascript">
				    function ShowPopup2() {
				        $("#btnShowPopup2").click();
				    }
    </script>




