<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BreadCrumbSearch.ascx.cs" Inherits="usercontrol_BreadCrumbDetail" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Category.CategoryName, SCategory.SCategoryname, Category.CategoryId, SCategory.ScategoryId FROM Category INNER JOIN SCategory ON Category.CategoryId = SCategory.CategoryId WHERE (SCategory.ScategoryId = @ID)">
    <SelectParameters>
        <asp:RouteParameter Name="ID" RouteKey="SID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">

    <EmptyDataTemplate>
         <ol class="breadcrumb">
              <li><a href="~/Default.aspx" runat="server">Home</a></li>
              <li>All Search</li>
             </ol>

    </EmptyDataTemplate>
    <ItemTemplate>
           <ol class="breadcrumb">
  <li><a href="~/Default.aspx" runat="server">Home</a></li>
  <li>
        <asp:Label ID="Label12" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>' Visible="False"></asp:Label>

      <asp:LinkButton ID="LinkButton1" runat="server"   Text='<%# Eval("CategoryName") %>' CommandName="cat"></asp:LinkButton></li>
               <li>  <asp:LinkButton ID="LinkButton2" runat="server" Enabled="false"   Text='<%# Eval("SCategoryName") %>' CommandName="cat"></asp:LinkButton></li>
              
                 <%--<li>  <%# Eval("ProductName") %></li>--%>

</ol>


    </ItemTemplate>
</asp:ListView>

