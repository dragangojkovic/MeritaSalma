<%@ Control Language="C#" AutoEventWireup="true" CodeFile="savelater.ascx.cs" Inherits="usercontrol_TopViewedProduct" %>

<div class="whitebg">


<div class="container">
    <div class="">
        <br />
    <div class="row form form-div" style="border:none;" runat="server" visible="false">
       <div class="col-md-1 col-xs-2 nopadding" style="text-align:right">
           <br />
 Sort By:&nbsp;
       </div>
        <div class="col-md-4 col-xs-10 nopadding">
    
       
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="PN">Product Name</asp:ListItem>
                        <asp:ListItem Value="P">Price- Low to High</asp:ListItem>
                        <asp:ListItem Selected="True" Value="F">Featured</asp:ListItem>
                        <asp:ListItem Value="V">Top Views</asp:ListItem>
                    </asp:DropDownList>
                    <br />
    </div>  </div>

<div class="row">

               

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView1_ItemCommand">

                    <EmptyDataTemplate>

                        You have no item in your wish or favorite list!
                    </EmptyDataTemplate>

                    <ItemTemplate>
<div class="col-md-3" style="margin-bottom:10px;">
    <div class=" s-product">
                          <asp:LinkButton ID="LinkButton1" CommandName="Details" runat="server">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProductKey") %>' Visible="false" ></asp:Label>

                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("CoverImage") %>' Height="250px" />
    <h5>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                              </h5>
                              <h6>
                                  <span>

                            <asp:Label Font-Italic="False" ID="Label4" runat="server" >  <%# Eval("Currency") %>  <%# Eval("Price") %></asp:Label>
                              </span>
                                 <asp:LinkButton ID="LinkButton2" runat="server" CommandName="favorite" CssClass="pull-right" Font-Bold="False" Visible="true"> <i class="fa fa-heart"></i> Un Save</asp:LinkButton> <br />
                              
                                  
                                   <%--<small class="pull-right">
                                     MGF:   <asp:Label ID="Label1" runat="server" Text='<%# Eval("StartDate") %>'></asp:Label> <br />
                                     EXP:   <asp:Label ID="Label3" runat="server" Text='<%# Eval("ExpiryDate") %>'></asp:Label>
                                  </small>--%>
                              </h6>
                              <hr style="margin-bottom:8px;" />
                        

                             <small>Vendor:</small><br />
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("VendorName") %>'></asp:Label>
                            
                          <span class="pull-right">

                            <i class="fa fa-eye"></i> <asp:Label ID="Label1" runat="server" Text='<%# Eval("totalview") %>'></asp:Label> </span> 
                           
                               
                          </asp:LinkButton>
                    </div>  </div>
                    </ItemTemplate>
                </asp:ListView>
                  </div>
<br />
                  <div style="text-align:center">    
  <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="20">
            <Fields>
                <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ButtonType="Button" 
                    ShowFirstPageButton="True" ShowNextPageButton="False" 
                    ShowPreviousPageButton="False" />
                <asp:NumericPagerField ButtonCount="10" CurrentPageLabelCssClass="active" 
                    NumericButtonCssClass="pagination" />
                <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ButtonType="Button" 
                    ShowLastPageButton="True" ShowNextPageButton="False" 
                    ShowPreviousPageButton="False" />
            </Fields>
        </asp:DataPager>
</div></div>
</div></div>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT TOP (30) Products.ProductKey, Products.CoverImage, Products.ProductName, Products.Currency, Products.Price, Products.Model, Products.StartDate, Products.ExpiryDate, Profile.VendorName, Profile.VendorLogo, Profile.ProfileId, Products.UserApproval, Products.SubCategoryId, Products.Brand, Products.CountryofOrigin, Products.featurestatus, ISNULL(BusinessViews.Totalview, 0) AS TotalView FROM Products INNER JOIN Profile ON Products.UserName = Profile.UserName INNER JOIN (SELECT MyProductId FROM Favorite AS Favorite_1 WHERE (UserName = @username)) AS favorite ON Products.ProductKey = favorite.MyProductId LEFT OUTER JOIN (SELECT BusineessId, COUNT(*) AS Totalview FROM BusinessViews AS BusinessViews_1 GROUP BY BusineessId) AS BusinessViews ON Products.ProductKey = BusinessViews.BusineessId WHERE (Products.AdminApproval = N'Active') AND (Products.UserApproval = N'Active') ORDER BY BusinessViews.Totalview DESC, CASE WHEN @sort = 'PN' THEN Products.ProductName END, CASE WHEN @sort = 'F' THEN Products.featurestatus END DESC, CASE WHEN @sort = 'P' THEN Products.Price END, CASE WHEN @sort = 'V' THEN ISNULL(BusinessViews.Totalview , 0) END DESC">
        <SelectParameters>
            
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="PN" Name="sort" PropertyName="SelectedValue" />
            
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="username" PropertyName="Value" />
            
        </SelectParameters>
    </asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT TOP (10) PostAd.AdPostId, PostAd.PostedBy, PostAd.Name, PostAd.Mobile, PostAd.Email, PostAd.Location, City.CityName, PropertyType.PropertyTypeName, PropertyStatus.PropertyStatus, PostAd.RentType, PostAd.Rent, PostAd.Specification, PostAd.Image, PostAd.AdminApproval, PostAd.Status, PostAd.InsertBy, ISNULL(views.totalviews, 0) AS totalviews, ISNULL(fav.totalfav, 0) AS totalfav FROM PostAd INNER JOIN PropertyType ON PostAd.PropertyTypeId = PropertyType.PropertyTypeId INNER JOIN City ON PostAd.CityId = City.CityId INNER JOIN PropertyStatus ON PostAd.Tenure = PropertyStatus.PropertyStatusId LEFT OUTER JOIN (SELECT MyProductId, COUNT(MyProductId) AS totalfav FROM Favorite GROUP BY MyProductId) AS fav ON PostAd.AdPostId = fav.MyProductId LEFT OUTER JOIN (SELECT BusinessId AS MyProductId, COUNT(*) AS totalviews FROM BusinessViews GROUP BY BusinessId) AS views ON PostAd.AdPostId = views.MyProductId WHERE (PostAd.AdminApproval = N'Approved') AND (PostAd.Status = N'Approved') ORDER BY PostAd.AdPostId DESC" InsertCommand="INSERT INTO Favorite(MyProductId, UserName, InsertDate, Status) VALUES (@ProductId, @UserName, GETDATE(), @Status)" DeleteCommand="DELETE FROM Favorite WHERE (MyProductId = @ID) AND (UserName = @UserName)">
     <InsertParameters>
         <asp:Parameter DefaultValue="Active" Name="Status" />
     </InsertParameters>
                       </asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
