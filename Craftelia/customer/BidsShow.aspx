<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BidsShow.aspx.cs" Inherits="seller_BidsShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <div class="mainbg">
        <br />

<div class="container table-responsive form-div">

   <h3>
      My BIDS
   </h3>
    <div class="alert alert-info">
        The highlighted row below shows that you win the Bid for the product applied. Please click on Buy It Link to process your order!

    </div>

    Filert Bid Status: <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
        <asp:ListItem Selected="True" Value="%">All</asp:ListItem>
        <asp:ListItem>Bid</asp:ListItem>
        <asp:ListItem>Offer</asp:ListItem>
    </asp:RadioButtonList> 


      Filter Sales Type: <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
        
        <asp:ListItem Selected="True">Tender</asp:ListItem>
        <asp:ListItem>Auction</asp:ListItem>
    </asp:RadioButtonList>

    <div class="table-responsive grid">

       <table style="width: 100%;">

                <tr>
                     <td></td>
                    <td>Bid Id</td>
                    <td>Product Name</td>
                     <td>Product Image</td>
                    <td>Bid Expiry Date</td>
                    <td>Bid Start Price</td>
                  
                    <td>Bid By User</td>
                  
                    <td>Bid Status</td>
                  
                     <td>Vendor Name</td>

                     <td>Type</td>
                </tr>


                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
                    <ItemTemplate>

                        <tr>
                          <td>
                              <asp:LinkButton ID="LinkButton1" runat="server"   Text="View Product" CommandName="Details"></asp:LinkButton>
                               <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn-color"  Text="Buy It" CommandName="Buy"></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("BidId") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Product Name") %>'></asp:Label>
                            </td>

                              <td>
                                  <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("CoverImage") %>' Height="50" Width="50" />
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Bid Expiry Date") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Bid Start Price") %>'></asp:Label>
                            </td>
                          
                            <td>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Bid By User") %>'></asp:Label>
                            </td>
                           
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("UserName") %>' Visible="false"></asp:Label>
                          
                            <td>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("Bid Status") %>'></asp:Label>
                            </td>

                              
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Productkey") %>' Visible="false"></asp:Label>
                           

                             
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("profileid") %>' Visible="false"></asp:Label>
                           
                            
                              <td>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("VendorName") %>'></asp:Label>
                            </td>

                              <td>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("SalesType") %>'></asp:Label>
                                  

                            </td>
                        </tr>


                    </ItemTemplate>
                </asp:ListView>

            </table>
          </div>
        </div>
        <br />
    </div>

    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO ProductBid(ProductBidExpiry, ProductKey, status) VALUES (@BidExpiry, @ProductKey, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductName AS [Product Name], ProductBid.ProductBidExpiry AS [Bid Expiry Date], ProductBid.status AS [Product Bid Status], Bids.BidPrice AS [Bid By User], Bids.UserName, Bids.status AS [Bid Status], Bids.BidId, Products.Price AS [Bid Start Price], ProductBid.ProductBidId, Products.ProductKey, Profile.ProfileId, Profile.VendorName, Products.CoverImage, SalesType.SalesType FROM Bids RIGHT OUTER JOIN ProductBid INNER JOIN Products ON ProductBid.ProductKey = Products.ProductKey INNER JOIN Profile ON Products.UserName = Profile.UserName INNER JOIN SalesType ON Products.SaleTypeId = SalesType.SalesTypeID ON Bids.ProductBidId = ProductBid.ProductBidId WHERE (Bids.UserName = @UserName) AND (Bids.status LIKE '%' + @BidStatus + '%') AND (SalesType.SalesType = @SalesType) ORDER BY [Product Name], [Bid By User] DESC">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="BidExpiry" PropertyName="Text" />
            <asp:QueryStringParameter Name="ProductKey" QueryStringField="ID" />
            <asp:Parameter DefaultValue="Active" Name="Status" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
            <asp:ControlParameter ControlID="RadioButtonList1" Name="BidStatus" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="RadioButtonList2" Name="SalesType" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>






    <asp:HiddenField ID="HiddenField1" runat="server" />
     
    <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO [Order] SELECT DISTINCT @OrderNo AS OrderNo, (SELECT Id FROM AspNetUsers WHERE (UserName = @buyerusername)) AS buyerid, (SELECT AspNetUsers.Id FROM Profile INNER JOIN AspNetUsers ON Profile.UserName = AspNetUsers.UserName WHERE (Profile.ProfileId = @sellerusername)) AS sellerid, @ID AS ProductKey, GETDATE() AS OrderDate, @Amount AS Expr1, @Status AS Status, @Requirement AS Requirement, GETDATE() AS ActionDate, 0 AS DeliveryId, 'NA' AS Comments, @Quantity AS Quantity FROM AspNetUsers" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(availablebalance.availablefunds - serviceamount.MinAmount, 0) AS balanceforshopping FROM (SELECT MinAmount FROM CreateService WHERE (CreateServiceId = @ID)) AS serviceamount CROSS JOIN (SELECT balancefund.funds - orderfund.orderfund AS availablefunds FROM (SELECT ISNULL(SUM(Funds), 0) AS funds FROM AddBalance WHERE (BuyerId = (SELECT Id FROM dbo.AspNetUsers WHERE (UserName = @username)))) AS balancefund CROSS JOIN (SELECT ISNULL(SUM(Amount), 0) AS orderfund FROM [Order] WHERE (Status &lt;&gt; N'Pending') AND (Status &lt;&gt; 'Cancel') AND (BuyerId = (SELECT Id FROM dbo.AspNetUsers AS AspNetUsers_1 WHERE (UserName = @username)))) AS orderfund) AS availablebalance">
    <InsertParameters>
        <asp:SessionParameter Name="OrderNo" SessionField="cart" />
        <asp:ControlParameter ControlID="HiddenField1" Name="buyerusername" PropertyName="Value" />
        <asp:Parameter DefaultValue="Pending" Name="Status" />
        <asp:Parameter DefaultValue="1" Name="Quantity" />
    </InsertParameters>
    <SelectParameters>
        <asp:RouteParameter Name="ID" RouteKey="ID" />
        <asp:ControlParameter ControlID="HiddenField1" Name="username" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
    





</asp:Content>

