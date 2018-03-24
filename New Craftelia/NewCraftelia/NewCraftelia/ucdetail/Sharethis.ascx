<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Sharethis.ascx.cs" Inherits="ucdetail_Sharethis" %>
 


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductName, Products.Description, Products.CoverImage FROM SCategory INNER JOIN SalesType INNER JOIN Products INNER JOIN Size ON Products.SizeId = Size.SizeID ON SalesType.SalesTypeID = Products.SaleTypeId INNER JOIN Warranty ON Products.WarrantyId = Warranty.WarrantyId INNER JOIN Condition ON Products.ConditionId = Condition.ConditionID INNER JOIN Deliverable ON Products.DeliveryId = Deliverable.DeliveryID INNER JOIN Category ON Products.CategoryId = Category.CategoryId ON SCategory.ScategoryId = Products.SubCategoryId LEFT OUTER JOIN (SELECT BusineessId, COUNT(*) AS Totalview FROM BusinessViews GROUP BY BusineessId) AS Views ON Products.ProductKey = Views.BusineessId WHERE (Products.ProductKey = @ID)">
    <SelectParameters>
        <asp:RouteParameter DefaultValue="5530700810042017112336" Name="ID" RouteKey="ID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
<div class="sharethis-inline-share-buttons"></div>