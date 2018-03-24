<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BestSellingProducts.aspx.cs" Inherits="seller_BestSellingProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container">
        <div class="form form-div" style="border:none;">
            <h3>
                Sales Analytics
            </h3>
            <div class="grid table-responsive">
<asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="totalviews" HeaderText="Total Views" ReadOnly="True" SortExpression="totalviews" />
            <asp:BoundField DataField="totalsalesamount" HeaderText="Total Sales Amount" ReadOnly="True" SortExpression="totalsalesamount" />
        </Columns>
    </asp:GridView>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT TOP (20) COUNT(BusinessViews.BusineessId) AS totalviews, Products.ProductName, Profile.VendorName, ISNULL(totalSalesamount.totalsales, 0) AS totalsalesamount FROM BusinessViews INNER JOIN Products ON BusinessViews.BusineessId = Products.ProductKey INNER JOIN Profile ON Products.UserName = Profile.UserName LEFT OUTER JOIN (SELECT ProductKey, SUM(Amount) AS totalsales FROM [Order] GROUP BY ProductKey) AS totalSalesamount ON Products.ProductKey = totalSalesamount.ProductKey WHERE (Products.UserName = @UserName) GROUP BY Products.ProductName, Profile.VendorName, totalSalesamount.totalsales">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    
</asp:Content>

