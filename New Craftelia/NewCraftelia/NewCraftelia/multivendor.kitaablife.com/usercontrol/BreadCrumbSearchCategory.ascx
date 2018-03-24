<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BreadCrumbSearchCategory.ascx.cs" Inherits="usercontrol_BreadCrumbSearchCategory" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryName, CategoryId FROM Category WHERE (CategoryId = @ID)">
    <SelectParameters>
        <asp:RouteParameter Name="ID" RouteKey="CID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
           <ol class="breadcrumb">
  <li><a href="~/Default.aspx" runat="server">Home</a></li>
  <li>


      <asp:LinkButton ID="LinkButton1" runat="server" Enabled="false"  Text='<%# Eval("CategoryName") %>' PostBackUrl=<%# "~/" + Eval("CategoryId") + "/topsearches"%>></asp:LinkButton></li>
              
                 <%--<li>  <%# Eval("ProductName") %></li>--%>

</ol>


    </ItemTemplate>
</asp:ListView>

