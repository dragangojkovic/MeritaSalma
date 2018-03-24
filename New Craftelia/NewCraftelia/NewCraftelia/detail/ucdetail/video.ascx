<%@ Control Language="C#" AutoEventWireup="true" CodeFile="video.ascx.cs" Inherits="ucdetail_video" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Description, Feature, CatalogPDF, Replace(VideoUpload,'~','') as VideoUpload FROM Products WHERE (ProductKey = @ID)">
    <SelectParameters>
        <asp:RouteParameter DefaultValue="5530700810042017112336" Name="ID" RouteKey="ID" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>


    <hr />
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
  <video width="100%" controls >
  <source src='<%# Eval("VideoUpload") %>' type="video/mp4">

  Your browser does not support the video tag.
</video> 
            </div>
        </div>
     

    

    </ItemTemplate>
</asp:ListView>