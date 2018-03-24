<%@ Control Language="C#" AutoEventWireup="true" CodeFile="description.ascx.cs" Inherits="ucdetail_description" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Description, Feature, CatalogPDF, VideoUpload FROM Products WHERE (ProductKey = @ID)">
    <SelectParameters>
        <asp:RouteParameter DefaultValue="5530700810042017112336" Name="ID" RouteKey="ID" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>

          <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>

        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Feature") %>'></asp:Label>

      

    

    </ItemTemplate>
</asp:ListView>
