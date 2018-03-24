<%@ Control Language="C#" AutoEventWireup="true" CodeFile="catalog.ascx.cs" Inherits="ucdetail_catalog" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Description, Feature, isnull(CatalogPDF,'NA') as CatalogPDF, VideoUpload FROM Products WHERE (ProductKey = @ID)">
    <SelectParameters>
        <asp:RouteParameter DefaultValue="5530700810042017112336" Name="ID" RouteKey="ID" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
    <ItemTemplate>


        <asp:Label ID="Label2"  runat="server" Text='<%# Eval("CatalogPDF") %>' Visible="false"></asp:Label>

      <asp:LinkButton ID="lnkView" runat="server" Text="View Product Catalogue" CommandName="View"></asp:LinkButton>
<hr />

   

    </ItemTemplate>
</asp:ListView>