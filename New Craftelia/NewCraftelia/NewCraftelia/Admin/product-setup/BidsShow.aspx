<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="BidsShow.aspx.cs" Inherits="seller_BidsShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


  
            <div class="table-responsive form-div form">

          
            <h3>BIDS
            </h3>
            <div class="alert alert-info">
                Below show all users who bid on your product. Click Allocate Bid to User to qualify the user for the product. When you click on Allocate Bid to User an email will be send to user to buy the product.
            </div>
      

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" DataKeyNames="BidId" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField SelectText="Allocate Bid  To User" ShowSelectButton="True" />
                    <asp:BoundField DataField="BidId" HeaderText="BidId" InsertVisible="False" SortExpression="BidId" />
                    <asp:BoundField DataField="Product Name" HeaderText="Product Name" SortExpression="Product Name" />
                    <asp:BoundField DataField="Bid Expiry Date" HeaderText="Bid Expiry Date" SortExpression="Bid Expiry Date" />
                    <asp:BoundField DataField="Bid Start Price" HeaderText="Bid Start Price" SortExpression="Bid Start Price" />
                    <asp:BoundField DataField="Product Bid Status" HeaderText="Product Bid Status" SortExpression="Product Bid Status" />
                    <asp:BoundField DataField="Bid By User" HeaderText="Bid By User" SortExpression="Bid By User" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="Bid Status" HeaderText="Bid Status" SortExpression="Bid Status" />
                </Columns>
            </asp:GridView>
  </div>
  


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO ProductBid(ProductBidExpiry, ProductKey, status) VALUES (@BidExpiry, @ProductKey, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductName AS [Product Name], ProductBid.ProductBidExpiry AS [Bid Expiry Date], ProductBid.status AS [Product Bid Status], Bids.BidPrice AS [Bid By User], Bids.UserName, Bids.status AS [Bid Status], Bids.BidId, Products.Price AS [Bid Start Price], ProductBid.ProductBidId FROM ProductBid INNER JOIN Products ON ProductBid.ProductKey = Products.ProductKey LEFT OUTER JOIN Bids ON ProductBid.ProductBidId = Bids.ProductBidId WHERE (ProductBid.ProductBidId = @ProductBIDID) ORDER BY [Bid By User] DESC" UpdateCommand="UPDATE Bids SET status = @Status WHERE (BidId = @ID)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="BidExpiry" PropertyName="Text" />
            <asp:QueryStringParameter Name="ProductKey" QueryStringField="ID" />
            <asp:Parameter DefaultValue="Active" Name="Status" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="ProductBIDID" SessionField="PBID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DefaultValue="Offer" Name="Status" />
            <asp:SessionParameter DefaultValue="" Name="ID" SessionField="ID" />
        </UpdateParameters>
    </asp:SqlDataSource>






</asp:Content>

