<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home11nov2017.ascx.cs" Inherits="usercontrol_home11nov2017" %>













<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
                    <EmptyDataTemplate>


                        <div class="alert alert-warning">
                         <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Search.aspx">No Record found for this search please click here to refine your search.</asp:LinkButton>
                        </div>

                    </EmptyDataTemplate>


                    <ItemTemplate>
<div class="col-md-4" style="margin-bottom:20px; padding:5px; ">
    <div class="s-product" style="background:white">
                         
                              <h5 style="height:20px;">
                                  <asp:Label ID="Label5" runat="server" Text='<%# Eval("SalesType") %>' Font-Size="10px" Visible="False"></asp:Label>  <small class="pull-right">
                                     
<asp:LinkButton ID="LinkButton2" runat="server" CommandName="favorite" Font-Bold="False" Font-Italic="False" Text="Save for later"> </asp:LinkButton>  <i class="fa fa-heart"></i>   </small> 
                              </h5>
 <asp:LinkButton ID="LinkButton1" CommandName="Details" runat="server">

                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProductKey") %>' Visible="false" ></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("favstatus") %>' Visible="false" ></asp:Label>
     <div style="text-align:center">
                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("CoverImage") %>' /></div>
    <h5>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                              </h5>
    
                              <h6>
         
                           <small><asp:Label ID="Label17" Visible="false" runat="server" >The leasing price is  </asp:Label> </small> <asp:Label Font-Italic="False" ID="Label4" runat="server" >  <%# Eval("Currency") %> </asp:Label><asp:Label Font-Italic="False" ID="Label9" runat="server" Text='<%# Eval("Price") %>' >  </asp:Label> <small> <asp:Label ID="Label11" runat="server" Font-Strikeout="True" Font-Overline="False" Text=<%# Eval("ActualPrice") %>> </asp:Label> <asp:Label ID="Label16" Visible="false" runat="server" > Per <%# Eval("demotime") %> week(s) </asp:Label> <br /></small>
                               
<span class="pull-right" style="margin-top:-15px">
      <asp:Label ID="Label22" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label> <br />   <asp:Label ID="Label23" runat="server" Text='<%# Eval("SCategoryname") %>'></asp:Label>  
                                
</span>

                           
                               <div class="discount" style="border:none" runat="server" visible="false">
                                  <br />
                               <asp:Label ID="Label12" runat="server" Text='<%# Eval("discountoffer") %>' Visible="false"> </asp:Label> <asp:Label ID="Label13" runat="server" > -<%# Eval("discountoffer") %>%</asp:Label> &nbsp; <asp:Label ID="Label15" runat="server" Text='<%# Eval("enabledeal") %>' Visible="false" Font-Size="10px" ></asp:Label>
                            </div>  
                             <div class="pull-right" style="border:none" runat="server" visible="false">
                              <h6>

                              <small>
                                 Avail.Qty : <asp:Label ID="Label18" runat="server" Text='<%# Eval("AvailableQuantity") %>'></asp:Label>  <asp:Label ID="Label21" Visible="false" runat="server" ForeColor="Red" Text="  Bid is closed"></asp:Label> <br />
                                  <asp:Label ID="Label20" runat="server" Text="Expiry" Visible="false"></asp:Label> :  <asp:Label ID="Label19" Visible="false" runat="server" Text='<%# Eval("offerexpiry") %>'></asp:Label> <br />
                                 
                               </small>   </h6>  </div>      
                                
                              </h6>
     
                              <hr style="margin-bottom:8px;" />
                        
     
                         <h6>

                          <small>Vendor:</small><br />
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("VendorName") %>'></asp:Label>
                            
                          <span class="pull-right">

                            <i class="fa fa-eye"></i> <asp:Label ID="Label1" runat="server" Text='<%# Eval("totalview") %>'></asp:Label> </span> 
                            </h6>  
                               
                          </asp:LinkButton>
              </div>        </div>
                    </ItemTemplate>
                </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.Products.ProductKey, dbo.Products.CoverImage, ISNULL(dbo.Products.enabledeal, N'Discount') AS enabledeal, CAST(dbo.Products.ProductName AS nvarchar(100)) AS productname, dbo.Products.Price, dbo.Products.Model, dbo.Products.StartDate, dbo.Products.ExpiryDate, dbo.Profile.vendorname, dbo.Profile.vendorlogo, dbo.Profile.ProfileId, dbo.Products.UserApproval, dbo.Products.SubCategoryId, dbo.Products.Brand, dbo.Products.CountryofOrigin, dbo.Products.featurestatus, ISNULL(BusinessViews.Totalview, 0) AS TotalView, ISNULL(favorite.MyProductId, 0) AS favstatus, dbo.Products.discountoffer, dbo.SalesType.SalesType, dbo.Products.actualprice, dbo.Country.Country, dbo.City.CityName, dbo.Condition.Condition, dbo.Condition.ConditionID, ISNULL(dbo.Products.demotime, N'1') AS demotime, ISNULL(dbo.Products.offerexpiry, GETDATE()) AS offerexpiry, dbo.Products.AvailableQuantity, dbo.Currency.Currency, dbo.Products.ProductID, dbo.Category.CategoryName, dbo.SCategory.SCategoryname, nullorder.ProductKey AS Expr1 FROM dbo.SCategory INNER JOIN dbo.Products INNER JOIN dbo.Profile ON dbo.Products.UserName = dbo.Profile.UserName INNER JOIN dbo.SalesType ON dbo.Products.SaleTypeId = dbo.SalesType.SalesTypeID INNER JOIN dbo.Condition ON dbo.Products.ConditionId = dbo.Condition.ConditionID INNER JOIN dbo.Currency ON dbo.Products.Currency = dbo.Currency.CurrencyId INNER JOIN dbo.Category ON dbo.Products.CategoryId = dbo.Category.CategoryId ON dbo.SCategory.ScategoryId = dbo.Products.SubCategoryId LEFT OUTER JOIN dbo.City ON dbo.Profile.city = dbo.City.CityID LEFT OUTER JOIN dbo.Country ON dbo.Profile.country = dbo.Country.Countryid LEFT OUTER JOIN (SELECT ProductKey, Status FROM dbo.[Order] WHERE (Status = N'Active')) AS nullorder ON dbo.Products.ProductKey = nullorder.ProductKey LEFT OUTER JOIN (SELECT MyProductId FROM dbo.Favorite AS Favorite_1 WHERE (UserName = @UserName)) AS favorite ON dbo.Products.ProductKey = favorite.MyProductId LEFT OUTER JOIN (SELECT BusineessId, COUNT(*) AS Totalview FROM dbo.BusinessViews AS BusinessViews_1 GROUP BY BusineessId) AS BusinessViews ON dbo.Products.ProductKey = BusinessViews.BusineessId WHERE (dbo.Products.AdminApproval = N'Active') AND (dbo.Products.UserApproval = N'Active') AND (nullorder.ProductKey IS NULL) ORDER BY dbo.Products.ProductID DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" DefaultValue="%" />
            
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:HiddenField ID="HiddenField1" runat="server" />







    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT TOP (10) PostAd.AdPostId, PostAd.PostedBy, PostAd.Name, PostAd.Mobile, PostAd.Email, PostAd.Location, City.CityName, PropertyType.PropertyTypeName, PropertyStatus.PropertyStatus, PostAd.RentType, PostAd.Rent, PostAd.Specification, PostAd.Image, PostAd.AdminApproval, PostAd.Status, PostAd.InsertBy, ISNULL(views.totalviews, 0) AS totalviews, ISNULL(fav.totalfav, 0) AS totalfav FROM PostAd INNER JOIN PropertyType ON PostAd.PropertyTypeId = PropertyType.PropertyTypeId INNER JOIN City ON PostAd.CityId = City.CityId INNER JOIN PropertyStatus ON PostAd.Tenure = PropertyStatus.PropertyStatusId LEFT OUTER JOIN (SELECT MyProductId, COUNT(MyProductId) AS totalfav FROM Favorite GROUP BY MyProductId) AS fav ON PostAd.AdPostId = fav.MyProductId LEFT OUTER JOIN (SELECT BusinessId AS MyProductId, COUNT(*) AS totalviews FROM BusinessViews GROUP BY BusinessId) AS views ON PostAd.AdPostId = views.MyProductId WHERE (PostAd.AdminApproval = N'Approved') AND (PostAd.Status = N'Approved') ORDER BY PostAd.AdPostId DESC" InsertCommand="INSERT INTO Favorite(MyProductId, UserName, InsertDate, Status) VALUES (@ProductId, @UserName, GETDATE(), @Status)">
     <InsertParameters>
         <asp:Parameter DefaultValue="Active" Name="Status" />
     </InsertParameters>
                       </asp:SqlDataSource>



    

    