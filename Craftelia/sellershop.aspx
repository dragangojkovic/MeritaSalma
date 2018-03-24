<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="sellershop.aspx.cs" Inherits="sellershop" %>

<%@ Register Src="~/usercontrol/SellerDetails.ascx" TagPrefix="uc1" TagName="SellerDetails" %>





<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="mainbg">
       
   
    <div class="container"> 

        <uc1:SellerDetails runat="server" ID="SellerDetails" />


        <div class="row form-div">
              <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView1_ItemCommand">
                    <ItemTemplate>
<div class="col-md-3 s-product">
                          <asp:LinkButton ID="LinkButton1" CommandName="Details" runat="server">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProductKey") %>' Visible="false" ></asp:Label>

                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("CoverImage") %>' Height="225px" />
    <h5>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                              </h5>
                              <h6>
                                  <span>

                            <asp:Label Font-Italic="False" ID="Label4" runat="server" >  <%# Eval("Currency") %>  <%# Eval("Price") %></asp:Label>
                              </span>
                                 <asp:LinkButton ID="LinkButton2" runat="server" CommandName="favorite" CssClass="pull-right" Font-Bold="False"> <i class="fa fa-heart"></i> Save for later</asp:LinkButton> 
                                  
                                  
                                   <%--<small class="pull-right">
                                     MGF:   <asp:Label ID="Label1" runat="server" Text='<%# Eval("StartDate") %>'></asp:Label> <br />
                                     EXP:   <asp:Label ID="Label3" runat="server" Text='<%# Eval("ExpiryDate") %>'></asp:Label>
                                  </small>--%>
                              </h6>
                              <hr style="margin-bottom:8px;" />
                        

                           <%--  <small>Vendor:</small><br />
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("VendorName") %>'></asp:Label>
                            
                              <asp:Image ID="Image1" runat="server" Width="35" Height="30" ImageUrl='<%# Eval("VendorLogo") %>' ImageAlign="AbsMiddle" CssClass="pull-right" /><br />--%>
                               
                          </asp:LinkButton>
                      </div>
                    </ItemTemplate>
                </asp:ListView>
        </div>
    </div> </div>
     <button data-toggle="modal" id="btnShowPopup" data-target="#myModal" style="visibility:hidden;"></button>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm" style="margin-top:60px; background:white;">
							<div>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: #000000">
										&times;</button>
							<br />	
                               
								<div class="center">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/loginalert.png" Width="100px" />
								<h4 >
                                 You are not login
                                    
                                    
                                    
								</h4>
                                    <h5 class="text-color">
                                         <asp:LinkButton ID="LinkButton2" PostBackUrl="~/Account/Login.aspx" runat="server" CausesValidation="False" ForeColor="#f6bc28">
                                             Click Here to Login
                                         </asp:LinkButton>
                                    </h5>

								</div>
							</div>
						</div>
					</div>
				<script type="text/javascript">
				    function ShowPopup() {
				        $("#btnShowPopup").click();
				    }
    </script>
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.Products.ProductKey, dbo.Products.CoverImage, dbo.Products.ProductName, dbo.Products.Currency, dbo.Products.Price, dbo.Products.Model, dbo.Products.StartDate, dbo.Products.ExpiryDate, dbo.Profile.VendorName, dbo.Profile.VendorLogo, dbo.Profile.ProfileId, dbo.Products.UserApproval FROM dbo.Products INNER JOIN dbo.Profile ON dbo.Products.UserName = dbo.Profile.UserName WHERE (dbo.Products.AdminApproval = N'Active') AND (dbo.Profile.ProfileId = @ID) AND (dbo.Products.UserApproval = N'Active') ORDER BY dbo.Products.ProductName">
           <SelectParameters>
               <asp:QueryStringParameter Name="ID" QueryStringField="PID" />
           </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT TOP (10) PostAd.AdPostId, PostAd.PostedBy, PostAd.Name, PostAd.Mobile, PostAd.Email, PostAd.Location, City.CityName, PropertyType.PropertyTypeName, PropertyStatus.PropertyStatus, PostAd.RentType, PostAd.Rent, PostAd.Specification, PostAd.Image, PostAd.AdminApproval, PostAd.Status, PostAd.InsertBy, ISNULL(views.totalviews, 0) AS totalviews, ISNULL(fav.totalfav, 0) AS totalfav FROM PostAd INNER JOIN PropertyType ON PostAd.PropertyTypeId = PropertyType.PropertyTypeId INNER JOIN City ON PostAd.CityId = City.CityId INNER JOIN PropertyStatus ON PostAd.Tenure = PropertyStatus.PropertyStatusId LEFT OUTER JOIN (SELECT MyProductId, COUNT(MyProductId) AS totalfav FROM Favorite GROUP BY MyProductId) AS fav ON PostAd.AdPostId = fav.MyProductId LEFT OUTER JOIN (SELECT BusinessId AS MyProductId, COUNT(*) AS totalviews FROM BusinessViews GROUP BY BusinessId) AS views ON PostAd.AdPostId = views.MyProductId WHERE (PostAd.AdminApproval = N'Approved') AND (PostAd.Status = N'Approved') ORDER BY PostAd.AdPostId DESC" InsertCommand="INSERT INTO Favorite(MyProductId, UserName, InsertDate, Status) VALUES (@ProductId, @UserName, GETDATE(), @Status)">
     <InsertParameters>
         <asp:Parameter DefaultValue="Active" Name="Status" />
     </InsertParameters>
                       </asp:SqlDataSource>



</asp:Content>

