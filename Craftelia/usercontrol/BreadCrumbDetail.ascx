<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BreadCrumbDetail.ascx.cs" Inherits="usercontrol_BreadCrumbDetail" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductName, Category.CategoryName, SCategory.SCategoryname, Products.ProductKey, Category.CategoryId, SCategory.ScategoryId FROM Products INNER JOIN Category ON Products.CategoryId = Category.CategoryId INNER JOIN SCategory ON Products.SubCategoryId = SCategory.ScategoryId WHERE (Products.ProductKey = @ID)">
    <SelectParameters>
        <asp:RouteParameter Name="ID" RouteKey="ID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
    <ItemTemplate>
           <ol class="breadcrumb">
  <li><a href="~/Default.aspx" runat="server">Home</a></li>
  <li>

       <asp:Label ID="Label12" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>
               <asp:Label ID="Label4" runat="server" Text='<%# Eval("ScategoryId") %>' Visible="False"></asp:Label>
      <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("CategoryName") %>' CommandName="cat" ></asp:LinkButton></li>
              <li> <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("SCategoryName") %>' CommandName="scat"></asp:LinkButton></li>
                 <li>  <%# Eval("ProductName") %></li>

</ol>


    </ItemTemplate>
</asp:ListView>

