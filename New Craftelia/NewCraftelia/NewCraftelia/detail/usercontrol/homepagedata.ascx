<%@ Control Language="C#" AutoEventWireup="true" CodeFile="homepagedata.ascx.cs" Inherits="usercontrol_homepagedata" %>









<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.Category.CategoryName, dbo.Category.FrontBanner, dbo.Category.Icon, dbo.Category.CategoryId FROM dbo.Category INNER JOIN dbo.FeaturedCategory ON dbo.Category.CategoryId = dbo.FeaturedCategory.CategoryId ORDER BY dbo.Category.CategoryName"></asp:SqlDataSource>




<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>

  
<div class="row whitebg">
             
                  <div class="col-md-3 category-links"> <asp:Label ID="Label7" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>
                      <h4>
                          <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Icon") %>' Height="25px" ImageAlign="AbsMiddle" />  <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                      </h4>
                  
                           
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, SCategoryname, ScategoryId,  Status FROM dbo.SCategory WHERE (Status = N'Active') AND (CategoryId = @CategoryID) ORDER BY SCategoryname">
         <SelectParameters>
             <asp:ControlParameter ControlID="Label7" Name="CategoryID" PropertyName="Text" />
         </SelectParameters>
     </asp:SqlDataSource>

                                 <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="ListView2_ItemCommand">
    <ItemTemplate>
        <asp:Label ID="Label4" runat="server" Text='<%# Eval("ScategoryId") %>' Visible="False"></asp:Label>
         <asp:Label ID="Label12" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>
                             <div class="sub-category">      <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Details" CausesValidation="false" Text='<%# Eval("SCategoryname") %>'></asp:LinkButton>   </div> 
                           
                 </ItemTemplate>
                                     </asp:ListView>
                      
                </div>
                  <div class="col-md-5 nopadding">
                      <asp:Image ID="Image6" runat="server" Height="585px" Width="100%" ImageUrl='<%# Eval("FrontBanner") %>' CssClass="visible-lg" />
                      <asp:Image ID="Image7" runat="server" Width="100%" ImageUrl='<%# Eval("FrontBanner") %>' CssClass="hidden-lg img-responsive" />
                   
                </div>
                  <div class="col-md-4 nopadding">
                      <div class="row">

                         

                          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.Products.CoverImage, dbo.Products.ProductName, dbo.Products.Currency, dbo.Products.Price, dbo.Products.CategoryId, dbo.Profile.ProfileId, dbo.Products.ProductKey FROM dbo.Products INNER JOIN dbo.Profile ON dbo.Products.UserName = dbo.Profile.UserName WHERE (dbo.Products.CategoryId = @ID) AND (dbo.Products.featurestatus = 'Yes') AND (dbo.Products.AdminApproval = 'Active') ORDER BY dbo.Products.ProductName">
    <SelectParameters>
        <asp:ControlParameter ControlID="Label7" Name="ID" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
                          <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView3_ItemCommand">
                              <ItemTemplate>
<div class="col-md-6 product">
                          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Details">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProductKey") %>' Visible="false" ></asp:Label>
                              <h5>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                              </h5>

                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("coverimage") %>' />

                              <h3>
                                   <asp:Label ID="Label17" runat="server" Text='<%# Eval("Currency") %>'></asp:Label><asp:Label ID="Label18" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                              </h3>

                          </asp:LinkButton>
                      </div>
                              </ItemTemplate>
                          </asp:ListView>
                        




                      </div>
                </div>
            </div>
  </ItemTemplate>
</asp:ListView>
 
            
