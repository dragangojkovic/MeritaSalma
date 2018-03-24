<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="allproducts.aspx.cs" Inherits="Admin_product_setup_allproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SalesTypeID, SalesType, Status FROM SalesType WHERE (Status = N'Active') ORDER BY SalesType"></asp:SqlDataSource>


<div class="container">


    <div class="row form form-div">
        <div class="col-md-2">
            Select Category
            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryName" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="%">All</asp:ListItem>
               
            </asp:DropDownList>
        </div>
         <div class="col-md-2">
            Select Sub Category
            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource5" DataTextField="SCategoryname" DataValueField="SCategoryname">
                <asp:ListItem Value="%">All</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-2" runat="server" visible="false">
            Sales Type
            <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource7" DataTextField="SalesType" DataValueField="SalesType" AutoPostBack="True">
        <asp:ListItem Value="%">All</asp:ListItem>
    </asp:DropDownList>
        </div>
        <div class="col-md-3">
          Aprroval Satatus:
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                 <asp:ListItem Selected="True" Value="%">All</asp:ListItem>
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Reject</asp:ListItem>
            </asp:RadioButtonList>
        </div>
           <div class="col-md-3">
          Featured Satatus:
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="%">All</asp:ListItem>
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="col-md-2">
            <br />
            <asp:Button ID="Button1" runat="server" Text="Show Result" />
        </div>
    </div>
    <br />
    <div class="row">

   
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
                    <ItemTemplate>
<div class="col-md-3" style="margin-bottom:10px;">
                          <asp:LinkButton ID="LinkButton1" runat="server" >

                          <div class="form-div">
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("SalesType") %>'  Visible="False"></asp:Label> <asp:LinkButton ID="LinkButton2" runat="server" CssClass="text text-info pull-right" CommandName="Auction" Visible="false" Font-Size="11px" Font-Bold="True"></asp:LinkButton>
                      <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProductKey") %>' Visible="false" ></asp:Label>

                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("CoverImage") %>' Width="100%" Height="170px" />
    <h6 style="height:30px;">
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                              </h6>
                              <h6>
                                  <i>

                           <asp:Label ID="Label5" runat="server" Text='<%# Eval("Currency") %>' Font-Italic="False"></asp:Label>  <asp:Label Font-Italic="False" ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                              </i>
                                  <small class="pull-right">
                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label> <br />
                                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("SCategoryname") %>'></asp:Label>
                                  </small>
                              </h6>
                              <hr style="margin-bottom:8px;" />  <h6 >
                                  <small>

                               
                                Approval  Status: <asp:Label ID="Label6" runat="server" Text='<%# Eval("UserApproval") %>' Font-Bold="True"></asp:Label>  <br /> 
                                       Featured  Status: <asp:Label ID="Label7" runat="server" Text='<%# Eval("FeatureStatus") %>' Font-Bold="True"></asp:Label>  
                                  </small>
                              </h6>
                              <hr style="margin-bottom:8px;" />
                              <h6>

                            <small>

                           
                              <asp:LinkButton ID="LinkButton3" runat="server" CssClass="text text-info" CommandName="Approval" Visible="True">Active/In Active</asp:LinkButton>
                 
                              
                                
                                  </small> 
                                  <small class="pull-right">
  <asp:LinkButton ID="LinkButton4" runat="server" CssClass="text-danger" CommandName="Edit" >Edit</asp:LinkButton>    <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Feature" CssClass="text-success" Visible="False">Featured</asp:LinkButton> <br />
                                
                                  </small>    </div>        </asp:LinkButton>  </h6>
                      </div>
                    </ItemTemplate>
                </asp:ListView>

      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.Products.ProductKey, dbo.Products.CoverImage, dbo.Products.ProductName, dbo.Products.Price, dbo.Products.Model, dbo.Products.StartDate, dbo.Products.ExpiryDate, dbo.Products.AdminApproval, dbo.Category.CategoryName, dbo.SCategory.SCategoryname, ISNULL(dbo.Products.featurestatus, 'No') AS FeatureStatus, dbo.Products.UserName, dbo.Products.UserApproval, dbo.SalesType.SalesType, dbo.Currency.Currency FROM dbo.Products INNER JOIN dbo.Category ON dbo.Products.CategoryId = dbo.Category.CategoryId INNER JOIN dbo.SCategory ON dbo.Products.SubCategoryId = dbo.SCategory.ScategoryId INNER JOIN dbo.SalesType ON dbo.Products.SaleTypeId = dbo.SalesType.SalesTypeID INNER JOIN dbo.Currency ON dbo.Products.Currency = dbo.Currency.CurrencyId WHERE (ISNULL(dbo.Products.featurestatus, N'No') LIKE '%' + @FeatureStatus + '%') AND (dbo.Category.CategoryName LIKE N'%' + @Category + N'%') AND (dbo.SCategory.SCategoryname LIKE N'%' + @SubCategory + N'%') AND (dbo.Products.UserName = @UserName) AND (dbo.SalesType.SalesType LIKE N'%' + @Salestype + N'%') AND (dbo.Products.UserApproval LIKE N'%' + @AdminApproval + N'%') ORDER BY dbo.Products.ProductName" UpdateCommand="UPDATE dbo.Products SET featurestatus = @FeatureStatus WHERE (ProductKey = @ID)">
          <SelectParameters>
              <asp:ControlParameter ControlID="RadioButtonList2" Name="FeatureStatus" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="RadioButtonList1" Name="AdminApproval" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="DropDownList1" Name="Category" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="DropDownList2" Name="SubCategory" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
              <asp:ControlParameter ControlID="DropDownList3" Name="Salestype" PropertyName="SelectedValue" />
          </SelectParameters>
        </asp:SqlDataSource>
        <br />

      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" UpdateCommand="UPDATE dbo.Products SET UserApproval = @Approval WHERE (ProductKey = @ID)"></asp:SqlDataSource>
        <br />
        <br />


<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Category(CategoryName, Status, Icon, FrontBanner) VALUES (@categoryname, @status, @Icon, @FrontBanner)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName, Icon, FrontBanner, Status FROM dbo.Category WHERE (Status = N'Active') ORDER BY CategoryName" UpdateCommand="UPDATE Category SET CategoryName = @CategorynName, Icon = @Icon, FrontBanner = @FrontBanner, Status = @Status
where CategoryID=@ID">
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="categoryname" PropertyName="Text" />
        <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="Active" Name="status" PropertyName="SelectedValue" />
    </InsertParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="CategorynName" PropertyName="Text" />
        <asp:ControlParameter ControlID="RadioButtonList1" Name="Status" PropertyName="SelectedValue" />
        <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
    </UpdateParameters>
</asp:SqlDataSource>



<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [SCategory] WHERE [ScategoryId] = @ScategoryId" InsertCommand="INSERT INTO [SCategory] ([CategoryId], [SCategoryname]) VALUES (@CategoryId, @SCategoryname)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.SCategory.ScategoryId, dbo.SCategory.CategoryId, dbo.SCategory.SCategoryname, dbo.SCategory.Status, dbo.Category.CategoryName FROM dbo.SCategory INNER JOIN dbo.Category ON dbo.SCategory.CategoryId = dbo.Category.CategoryId WHERE (dbo.SCategory.Status = N'Active') AND (dbo.Category.CategoryName LIKE N'%' + @ID + N'%') ORDER BY dbo.SCategory.SCategoryname" UpdateCommand="UPDATE SCategory SET CategoryId = @CategoryId, SCategoryname = @SCategoryname, Status = @Status WHERE (ScategoryId = @ScategoryId)">
    <DeleteParameters>
        <asp:Parameter Name="ScategoryId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CategoryId" Type="Int32" />
        <asp:Parameter Name="SCategoryname" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="ID" PropertyName="SelectedValue" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="CategoryId" Type="Int32" />
        <asp:Parameter Name="SCategoryname" Type="String" />
        <asp:Parameter Name="ScategoryId" Type="Int32" />
        <asp:Parameter Name="Status" />
        <asp:Parameter Name="ScatImage" />
    </UpdateParameters>
</asp:SqlDataSource>


 </div></div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>

