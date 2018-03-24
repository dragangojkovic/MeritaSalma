﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="offerdealhome.ascx.cs" Inherits="thumbnailslider_offerdeal" %>







<div class="container demo-1">
			<!-- Codrops top bar -->
            <div class="codrops-top clearfix">
               <a href="http://tympanus.net/Development/Slicebox/"><strong>&laquo; Previous Demo: </strong>Slicebox</a>
                <span class="right">
                	<a href="http://www.flickr.com/people/smanography/" target="_blank">Images by Sherman Geronimo-Tan</a>
					<a href="http://tympanus.net/codrops/?p=5677"><strong>back to the Codrops post</strong></a>
                </span>
            </div><!--/ Codrops top bar -->

            <div class="main">
				<header class="clearfix">	
					<h1>Elastislide <span>A Responsive Image Carousel</span></h1>
					<nav class="codrops-demos">
						<a class="current-demo" href="index.html">Example 1</a>
						<a href="index2.html">Example 2</a>
						<a href="index3.html">Example 3</a>
						<a href="index4.html">Example 4</a>
					</nav>
				</header>

				<!-- Elastislide Carousel -->
				<ul id="carousel" class="elastislide-list">
					<li><a href="#"><img src="../images/brand.jpg" alt="image01" /></a></li>
					<li><a href="#"><img src="../images/brand.jpg" alt="image01" /></a></li>
    	<li><a href="#"><img src="../images/brand.jpg" alt="image01" /></a></li>
    	<li><a href="#"><img src="../images/brand.jpg" alt="image01" /></a></li>
    	<li><a href="#"><img src="../images/brand.jpg" alt="image01" /></a></li>
    	<li><a href="#"><img src="../images/brand.jpg" alt="image01" /></a></li>
    	<li><a href="#"><img src="../images/brand.jpg" alt="image01" /></a></li>
    	<li><a href="#"><img src="../images/brand.jpg" alt="image01" /></a></li>
				</ul>
				<!-- End Elastislide Carousel -->

				<p><strong>Resize the browser to see how the carousel adapts</strong></p>

				<p class="info"><strong>Example 1:</strong> A minimum of 3 (default) images are always visible.</p>
			</div>
		</div>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquerypp.custom.js"></script>
		<script type="text/javascript" src="js/jquery.elastislide.js"></script>
		<script type="text/javascript">

		    $('#carousel').elastislide();

		</script>




	









<%--<div id="thumbnail-slider"   >
                <div class="inner">
                    <ul>
                      
                        
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView1_ItemCommand">
                    <ItemTemplate>

                         <li>
                            
 <asp:LinkButton ID="LinkButton1" CommandName="Details" runat="server" CssClass="thumb">
      <div class="s-product" style="border:none">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProductKey") %>' Visible="false" ></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("favstatus") %>' Visible="false" ></asp:Label>

                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("CoverImage") %>' />
    <h5>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                              </h5>
                              <h6>
         
                            <asp:Label Font-Italic="False" ID="Label4" runat="server" >  <%# Eval("Currency") %> </asp:Label> &nbsp;<asp:Label Font-Italic="False" ID="Label9" runat="server" > <%# Eval("Price") %> </asp:Label>
                                <small>

                                <asp:Label ID="Label11" runat="server" Font-Strikeout="True" Font-Overline="False"> <%# Eval("Currency") %>  <%# Eval("ActualPrice") %> </asp:Label> </small>


                           
                                  <asp:Label ID="Label12" runat="server" CssClass="discount pull-right" Text='<%# Eval("discountoffer") %>' Visible="false"> </asp:Label> <asp:Label ID="Label13" runat="server" CssClass="discount pull-right" > -<%# Eval("discountoffer") %>%</asp:Label>
                           
                               
                                
                              </h6>
                      
                               </div>
                          </asp:LinkButton>
              </li>
                    </ItemTemplate>
                </asp:ListView>



                           <%-- <a class="thumb" href="img/2.jpg"></a>--%>
                       
                      
                    </ul>
                </div>
            </div>--%>




<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductKey, Products.CoverImage, Products.ProductName, Products.Currency, Products.Price, Products.Model, Products.StartDate, Products.ExpiryDate, Profile.VendorName, Profile.VendorLogo, Profile.ProfileId, Products.UserApproval, Products.SubCategoryId, Products.Brand, Products.CountryofOrigin, Products.featurestatus, ISNULL(BusinessViews.Totalview, 0) AS TotalView, ISNULL(favorite.MyProductId, 0) AS favstatus, Products.discountoffer, SalesType.SalesType, Products.actualprice FROM Products INNER JOIN Profile ON Products.UserName = Profile.UserName INNER JOIN SalesType ON Products.SaleTypeId = SalesType.SalesTypeID LEFT OUTER JOIN (SELECT MyProductId FROM Favorite AS Favorite_1 WHERE (UserName = @UserName)) AS favorite ON Products.ProductKey = favorite.MyProductId LEFT OUTER JOIN (SELECT BusineessId, COUNT(*) AS Totalview FROM BusinessViews AS BusinessViews_1 GROUP BY BusineessId) AS BusinessViews ON Products.ProductKey = BusinessViews.BusineessId WHERE (Products.AdminApproval = N'Active') AND (Products.UserApproval = N'Active') AND (SalesType.SalesType = N'Offer-Deals')">
        <SelectParameters>
            
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" DefaultValue="nauna" />
            
        </SelectParameters>
    </asp:SqlDataSource>

  <asp:HiddenField ID="HiddenField1" runat="server" />