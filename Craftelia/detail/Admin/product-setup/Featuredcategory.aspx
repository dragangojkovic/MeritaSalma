<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Featuredcategory.aspx.cs" Inherits="Admin_product_setup_Featuredcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

     <div class="row">
          
                <div class="col-md-4">
                 
                    <div class="form form-div">

                        <h3>
            
 Add Category</h3>
                      
                          <div class="form-horizontal">
                            <div class="form-group">
                                  <asp:Label ID="Label1" runat="server" Text="Select Category:"></asp:Label>

                                  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryId">
                                  </asp:DropDownList>
                                <br />
                                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />

                                </div>    </div>    </div>    </div>  


         <div class="col-md-8">
             <div class="table-responsive">



                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FeatureCategoryID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:CommandField ShowDeleteButton="True" />
                         <asp:BoundField DataField="FeatureCategoryID" HeaderText="FeatureCategoryID" ReadOnly="True" SortExpression="FeatureCategoryID" />
                         <asp:TemplateField HeaderText="CategoryId" SortExpression="CategoryId">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [FeaturedCategory] WHERE [FeatureCategoryID] = @FeatureCategoryID" InsertCommand="INSERT INTO dbo.FeaturedCategory(CategoryId) VALUES (@CategoryId)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT FeaturedCategory.FeatureCategoryID, FeaturedCategory.CategoryId, dbo.Category.CategoryName FROM FeaturedCategory INNER JOIN dbo.Category ON FeaturedCategory.CategoryId = dbo.Category.CategoryId" UpdateCommand="UPDATE [FeaturedCategory] SET [CategoryId] = @CategoryId WHERE [FeatureCategoryID] = @FeatureCategoryID">
                     <DeleteParameters>
                         <asp:Parameter Name="FeatureCategoryID" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:ControlParameter ControlID="DropDownList1" Name="CategoryId" PropertyName="SelectedValue" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="CategoryId" Type="Int32" />
                         <asp:Parameter Name="FeatureCategoryID" Type="Int32" />
                     </UpdateParameters>
                 </asp:SqlDataSource>



                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName, Status FROM dbo.Category ORDER BY CategoryName"></asp:SqlDataSource>



             </div>
         </div>

     </div>


</asp:Content>

