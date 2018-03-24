<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AllAuctions.aspx.cs" Inherits="seller_AllAuctions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 
    

<div class="table-responsive form-div form">

    <h3>
        Auction List
    </h3>
 <div class="table-responsive ">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" DataKeyNames="ProductBidId" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="Show Bid Details" ShowSelectButton="True" />
            <asp:BoundField DataField="Product Name" HeaderText="Product Name" SortExpression="Product Name" />
            <asp:BoundField DataField="Bid Expiry Date" HeaderText="Bid Expiry Date" SortExpression="Bid Expiry Date" />
            <asp:BoundField DataField="Bid Start Price" HeaderText="Bid Start Price" SortExpression="Bid Start Price" />
            <asp:BoundField DataField="Product Bid Status" HeaderText="Product Bid Status" SortExpression="Product Bid Status" />
        </Columns>
    </asp:GridView>
    </div> </div>
      
  
    
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO ProductBid(ProductBidExpiry, ProductKey, status) VALUES (@BidExpiry, @ProductKey, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductName AS [Product Name], ProductBid.ProductBidExpiry AS [Bid Expiry Date], Products.Price AS [Bid Start Price], ProductBid.status AS [Product Bid Status], ProductBid.ProductBidId FROM ProductBid INNER JOIN Products ON ProductBid.ProductKey = Products.ProductKey WHERE (ProductBid.ProductKey = @ProductKey) ORDER BY ProductBid.ProductBidId DESC">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="BidExpiry" PropertyName="Text" />
            <asp:QueryStringParameter Name="ProductKey" QueryStringField="ID" />
            <asp:Parameter DefaultValue="Active" Name="Status" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductKey" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

