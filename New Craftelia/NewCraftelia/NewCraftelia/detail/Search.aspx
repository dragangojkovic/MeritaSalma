<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Src="~/usercontrol/BreadCrumbSearch.ascx" TagPrefix="uc1" TagName="BreadCrumbSearch" %>
<%@ Register Src="~/usercontrol/BreadCrumbSearchCategory.ascx" TagPrefix="uc1" TagName="BreadCrumbSearchCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script>
        $(document).on('click', '.dropdown-menu.dropdown-menu-form', function (e) {
            e.stopPropagation();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('a[data-toggle="collapse"]').click(function () {
                $(this).find('span.toggle-icon').toggleClass('glyphicon-collapse-up glyphicon-collapse-down');
            })
        })
    </script>
    <div class="container">
        <uc1:BreadCrumbSearch runat="server" ID="BreadCrumbSearch" Visible="false" />
        <uc1:BreadCrumbSearchCategory runat="server" ID="BreadCrumbSearchCategory" Visible="false" />
   <%--     <ol class="breadcrumb">
            <li><a href="#">Home</a></li>
            <li><a href="#">Library</a></li>

        </ol>--%>
   
        <div class="row">
        
          

            <div class="col-md-3"> <div class="navbar-header visible-xs btn-color">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
            <span class="sr-only">Toggle navigation</span>
            <i class="fa fa-search">

            </i>          </button>
          <a class="navbar-brand" href="#">Search</a>
        </div>
                 <div class="collapse navbar-collapse nopadding nomargin" id="navbar-collapse-2" style="max-height:initial;">
             <div class="panel-group">

                 <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">Advance Search
                                <span class="pull-right">
                                    <a data-toggle="collapse" data-parent="#panel-quote-group" href="#collapse2">
                                        <span class="toggle-icon glyphicon glyphicon-collapse-up"></span>
                                    </a>
                                </span>
                            </h5>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                  <blockquote>
<div class="form">
    <div>
                       Vendor:
                       <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="VendorName" DataValueField="VendorName">
                           <asp:ListItem Value="%">All</asp:ListItem>
                       </asp:DropDownList>
                    </div> 
 <br />    <div>

                         
 Sort By:
      
<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="PN">Product Name</asp:ListItem>
                        <asp:ListItem Value="P">Price- Low to High</asp:ListItem>
                        <asp:ListItem Selected="True" Value="F">Featured</asp:ListItem>
                        <asp:ListItem Value="V">Top Views</asp:ListItem>
                    </asp:DropDownList>   </div>
    <br />
    <div>

 
    Sales Type
    <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource7" DataTextField="SalesType" DataValueField="SalesType" AutoPostBack="True">
        <asp:ListItem Value="%">All</asp:ListItem>
    </asp:DropDownList>
   </div>

   
    <br />
            <div>
                       Brand:
                      <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource9" DataTextField="Brand" DataValueField="Brand" AutoPostBack="True">
        <asp:ListItem Value="%">All</asp:ListItem>
    </asp:DropDownList>
                    </div>
                     <br />
                     <div>
                       Model #:
                        <asp:TextBox ID="TextBox2" placeholder="Type Here" runat="server"></asp:TextBox>
                    </div>
    <br />
                       <div>
                       City:
                       <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource10" DataTextField="CityName" DataValueField="CityName" AutoPostBack="True">
        <asp:ListItem Value="%">All</asp:ListItem>
    </asp:DropDownList>
                    </div>

                       
    <br />
                    <div>
                        
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn-color" Width="100%"><i class="fa fa-search"></i> Search</asp:LinkButton>
                </div>  </div>
                                      </blockquote>
                                </div></div>
                     </div>

                 <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                Condition
                                
                                <span class="pull-right">
                                    <a data-toggle="collapse" data-parent="#panel-quote-group" href="#collapse10">
                                        <span class="toggle-icon glyphicon glyphicon-collapse-up"></span>
                                    </a>
                                </span>
                            </h5>
                        </div>
                        <div id="collapse10" class="panel-collapse collapse">
                            <div class="panel-body">
                                <blockquote>
                               
                                 <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource8" DataTextField="Condition" DataValueField="ConditionID" AutoPostBack="True"  OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" CssClass="checkbox" ></asp:CheckBoxList>
   
                                </blockquote>
                         </div>
                            </div>
                        </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">Category
                                
                                <span class="pull-right">
                                    <a data-toggle="collapse" data-parent="#panel-quote-group" href="#collapse1">
                                        <span class="toggle-icon glyphicon glyphicon-collapse-up"></span>
                                    </a>
                                </span>
                            </h5>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel-body">

                               

                                <nav class="sidebar">
    <div class="container-fluid">
    
    <div id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav nomargin" style="width:100%;">
     
       
       

      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName, Icon, FrontBanner, Status FROM Category WHERE (Status = N'Active') ORDER BY CategoryName"></asp:SqlDataSource>

    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource6" >
    <ItemTemplate> 
      <asp:Label ID="Label2" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>  
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">  <asp:Image ID="Image8" runat="server" ImageUrl='<%# Eval("Icon") %>' Height="15px" ImageAlign="AbsMiddle" /> 
      &nbsp; <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label><i class="fa fa-angle-down pull-right" aria-hidden="true"></i>
</a>
          <ul class="dropdown-menu forAnimate  dropdown-menu-form" role="menu">
         
              <li>
                 

                 
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="SCategoryname" DataValueField="ScategoryId" CssClass="checkbox" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList2_SelectedIndexChanged"></asp:CheckBoxList>

       </li>   </ul>
        </li>          



         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ScategoryId, CategoryId, SCategoryname, Status FROM SCategory WHERE (Status = N'Active') AND (CategoryId = @CategoryId)">
    <SelectParameters>
        <asp:ControlParameter ControlID="Label2" Name="CategoryId" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
    </ItemTemplate>
</asp:ListView>    
  

              </ul>
    </div>
  </div>
</nav>
                         </div>
                            </div>
                        </div>



<div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">Price
                                <span class="pull-right">
                                    <a data-toggle="collapse" data-parent="#panel-quote-group" href="#collapse3">
                                        <span class="toggle-icon glyphicon glyphicon-collapse-up"></span>
                                    </a>
                                </span>
                            </h5>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <blockquote>
                                    <div>
                                            
                                    </div>
                                  
                                    <div class="row">

                                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
    <ajaxToolkit:MultiHandleSliderExtender ID="TextBox4_MultiHandleSliderExtender" runat="server" BehaviorID="TextBox4_MultiHandleSliderExtender" HandleAnimationDuration="0.1" Maximum="5000000" Minimum="0" TargetControlID="TextBox6" RaiseChangeOnlyOnMouseUp="true" EnableRailClick="false"
                Length="200" OnClientDragEnd="OnClientDragEnd">

         <MultiHandleSliderTargets>
                    <ajaxToolkit:MultiHandleSliderTarget ControlID="TextBox4" />
                    <ajaxToolkit:MultiHandleSliderTarget ControlID="TextBox5" />
                </MultiHandleSliderTargets>
    </ajaxToolkit:MultiHandleSliderExtender>

                                         <asp:LinkButton ID="lnkSliderChanged"  runat="server" />
            <script type="text/javascript">
                function OnClientDragEnd(sender, args) {
                    document.getElementById("<%=lnkSliderChanged.ClientID %>").click();
                }
            </script>
                                        <br />
                                        <br />
                                        <div class="col-xs-6 nopadding">

                                       

                                            <asp:TextBox ID="TextBox4" Text="0"  runat="server" CssClass="form-control"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox4_FilteredTextBoxExtender" TargetControlID="TextBox4" ID="TextBox4_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
                                        </div>
                           <div class="col-xs-6 nopadding">
                            <asp:TextBox ID="TextBox5" runat="server" Text="5000000" CssClass="form-control"></asp:TextBox>
                               <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox5_FilteredTextBoxExtender" TargetControlID="TextBox5" ID="TextBox5_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
                           </div>
                                       
                                     
                   </div> 
                                      	</blockquote>
                                </div>
                            </div>
                        </div>

</div>
                     </div>
                  

















               
            </div>

            <div class="col-md-9 nopadding">
             
            
         
                    
                    <br />    <div class="row">

               

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
                    <EmptyDataTemplate>


                        <div class="alert alert-warning">
                         <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Search.aspx">No Record found for this search please click here to refine your search.</asp:LinkButton>
                        </div>

                    </EmptyDataTemplate>


                    <ItemTemplate>
<div class="col-md-4" style="margin-bottom:20px; padding:5px;">
    <div class="s-product">
                         
                              <h5>
                                  <asp:Label ID="Label5" runat="server" Text='<%# Eval("SalesType") %>' Font-Size="10px"></asp:Label>  <small class="pull-right">
                                     
<asp:LinkButton ID="LinkButton2" runat="server" CommandName="favorite" Font-Bold="False" Font-Italic="False" Text="Save for later"> </asp:LinkButton>  <i class="fa fa-heart"></i>   </small> 
                              </h5>
 <asp:LinkButton ID="LinkButton1" CommandName="Details" runat="server">

                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProductKey") %>' Visible="false" ></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("favstatus") %>' Visible="false" ></asp:Label>

                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("CoverImage") %>' />
    <h5>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                              </h5>
    
                              <h6>
         
                           <small><asp:Label ID="Label17" Visible="false" runat="server" >The leasing price is  </asp:Label> </small> <asp:Label Font-Italic="False" ID="Label4" runat="server" >  <%# Eval("Currency") %> </asp:Label><asp:Label Font-Italic="False" ID="Label9" runat="server" Text='<%# Eval("Price") %>' >  </asp:Label> <small> <asp:Label ID="Label11" runat="server" Font-Strikeout="True" Font-Overline="False" Text=<%# Eval("ActualPrice") %>> </asp:Label> <asp:Label ID="Label16" Visible="false" runat="server" > Per <%# Eval("demotime") %> week(s) </asp:Label> <br /></small>
                               


                           
                               <span class="discount" style="border:none">
                                  <br />
                               <asp:Label ID="Label12" runat="server" Text='<%# Eval("discountoffer") %>' Visible="false"> </asp:Label> <asp:Label ID="Label13" runat="server" > -<%# Eval("discountoffer") %>%</asp:Label> &nbsp; <asp:Label ID="Label15" runat="server" Text='<%# Eval("enabledeal") %>' Visible="false" Font-Size="10px" ></asp:Label>
                            </span>  
                             <span class="pull-right" style="border:none">
                              <h6>

                              <small>
                                 Avail.Qty : <asp:Label ID="Label18" runat="server" Text='<%# Eval("AvailableQuantity") %>'></asp:Label>  <asp:Label ID="Label21" Visible="false" runat="server" ForeColor="Red" Text="  Bid is closed"></asp:Label> <br />
                                  <asp:Label ID="Label20" runat="server" Text="Expiry" Visible="false"></asp:Label> :  <asp:Label ID="Label19" Visible="false" runat="server" Text='<%# Eval("offerexpiry") %>'></asp:Label> <br />
                                 
                               </small>   </h6>  </span>      
                                
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
    
</div>      
                
                
                
                
                
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
                  
            </div>
        </div>

       
    </div>

    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName, Status FROM Category WHERE (Status = N'Active') ORDER BY CategoryName"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ScategoryId, CategoryId, SCategoryname, Status FROM dbo.SCategory WHERE (Status = N'Active') AND (CategoryId = @CategoryID)">
        <SelectParameters>
            <asp:RouteParameter DefaultValue="1" Name="CategoryID" RouteKey="CID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductKey, Products.CoverImage, ISNULL(Products.enabledeal, N'Discount') AS enabledeal, Products.ProductName, Products.Currency, Products.Price, Products.Model, Products.StartDate, Products.ExpiryDate, Profile.VendorName, Profile.VendorLogo, Profile.ProfileId, Products.UserApproval, Products.SubCategoryId, Products.Brand, Products.CountryofOrigin, Products.featurestatus, ISNULL(BusinessViews.Totalview, 0) AS TotalView, ISNULL(favorite.MyProductId, 0) AS favstatus, Products.discountoffer, SalesType.SalesType, Products.actualprice, Country.Country, City.CityName, Condition.Condition, Condition.ConditionID, ISNULL(Products.demotime, N'1') AS demotime, isnull(Products.offerexpiry, getdate()) as offerexpiry, Products.AvailableQuantity FROM (SELECT MyProductId FROM Favorite AS Favorite_1 WHERE (UserName = @UserName)) AS favorite RIGHT OUTER JOIN Products INNER JOIN Profile ON Products.UserName = Profile.UserName INNER JOIN SalesType ON Products.SaleTypeId = SalesType.SalesTypeID INNER JOIN Country ON Profile.country = Country.Countryid INNER JOIN City ON Profile.city = City.CityID INNER JOIN Condition ON Products.ConditionId = Condition.ConditionID ON favorite.MyProductId = Products.ProductKey LEFT OUTER JOIN (SELECT BusineessId, COUNT(*) AS Totalview FROM BusinessViews AS BusinessViews_1 GROUP BY BusineessId) AS BusinessViews ON Products.ProductKey = BusinessViews.BusineessId WHERE (Products.AdminApproval = N'Active') AND (Products.UserApproval = N'Active') AND (Products.SubCategoryId IN (SELECT CAST(Value AS int) AS Expr1 FROM dbo.udf_Split(@CategoryID, ',') AS udf_Split_1)) AND (Products.Price BETWEEN @min AND @max) AND (Products.Brand LIKE N'%' + @Brand + N'%') AND (Products.Model LIKE N'%' + @Model + N'%') AND (ISNULL(Profile.VendorName, N'') LIKE N'%' + @Vendor + N'%') AND (SalesType.SalesType LIKE N'%' + @salestype + N'%') AND (Products.ProductName + N' ' + ISNULL(Products.CountryofOrigin, N'') + ' ' + ISNULL(Profile.VendorName, N'') LIKE N'%' + @Keyword + N'%') AND (Condition.ConditionID IN (SELECT CAST(Value AS int) AS Expr1 FROM dbo.udf_Split(@Condition, ',') AS udf_Split_1)) AND (City.CityName LIKE N'%' + @City + N'%') ORDER BY CASE WHEN @sort = 'PN' THEN Products.ProductName END, CASE WHEN @sort = 'F' THEN Products.featurestatus END DESC, CASE WHEN @sort = 'P' THEN Products.Price END, CASE WHEN @sort = 'V' THEN ISNULL(BusinessViews.Totalview , 0) END DESC" OnSelecting="SqlDataSource3_Selecting">
        <SelectParameters>
            <asp:RouteParameter DefaultValue="%" Name="Keyword" RouteKey="Keyword" />
            <asp:ControlParameter ControlID="Label10" DefaultValue="" Name="CategoryID" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox4" DefaultValue="0" Name="min" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox5" DefaultValue="100000" Name="max" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList4" Name="Brand" PropertyName="SelectedValue" DefaultValue="%" />
            <asp:ControlParameter ControlID="TextBox2" DefaultValue="%" Name="Model" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="%" Name="Vendor" PropertyName="SelectedValue" />
            
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="PN" Name="sort" PropertyName="SelectedValue" />
            
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" DefaultValue="nauna" />
            
            <asp:ControlParameter ControlID="DropDownList3" Name="salestype" PropertyName="SelectedValue" DefaultValue="%" />
            
            <asp:ControlParameter ControlID="Label14" Name="Condition" PropertyName="Text" />
            
            <asp:ControlParameter ControlID="DropDownList5" Name="City" PropertyName="SelectedValue" />
            
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT TOP (10) PostAd.AdPostId, PostAd.PostedBy, PostAd.Name, PostAd.Mobile, PostAd.Email, PostAd.Location, City.CityName, PropertyType.PropertyTypeName, PropertyStatus.PropertyStatus, PostAd.RentType, PostAd.Rent, PostAd.Specification, PostAd.Image, PostAd.AdminApproval, PostAd.Status, PostAd.InsertBy, ISNULL(views.totalviews, 0) AS totalviews, ISNULL(fav.totalfav, 0) AS totalfav FROM PostAd INNER JOIN PropertyType ON PostAd.PropertyTypeId = PropertyType.PropertyTypeId INNER JOIN City ON PostAd.CityId = City.CityId INNER JOIN PropertyStatus ON PostAd.Tenure = PropertyStatus.PropertyStatusId LEFT OUTER JOIN (SELECT MyProductId, COUNT(MyProductId) AS totalfav FROM Favorite GROUP BY MyProductId) AS fav ON PostAd.AdPostId = fav.MyProductId LEFT OUTER JOIN (SELECT BusinessId AS MyProductId, COUNT(*) AS totalviews FROM BusinessViews GROUP BY BusinessId) AS views ON PostAd.AdPostId = views.MyProductId WHERE (PostAd.AdminApproval = N'Approved') AND (PostAd.Status = N'Approved') ORDER BY PostAd.AdPostId DESC" InsertCommand="INSERT INTO Favorite(MyProductId, UserName, InsertDate, Status) VALUES (@ProductId, @UserName, GETDATE(), @Status)">
     <InsertParameters>
         <asp:Parameter DefaultValue="Active" Name="Status" />
     </InsertParameters>
                       </asp:SqlDataSource>



    <br />
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT distinct dbo.Profile.VendorName FROM dbo.Profile INNER JOIN dbo.Products ON dbo.Profile.UserName = dbo.Products.UserName where dbo.Profile.VendorName is not null  ORDER BY dbo.Profile.VendorName">
    </asp:SqlDataSource>



    <asp:HiddenField ID="HiddenField1" runat="server" />







    <br />
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SalesTypeID, SalesType, Status FROM SalesType WHERE (Status = N'Active') ORDER BY SalesType"></asp:SqlDataSource>







<asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Condition] WHERE [ConditionID] = @ConditionID" InsertCommand="INSERT INTO [Condition] ([Condition], [Status]) VALUES (@Condition, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ConditionID, Condition, Status FROM dbo.Condition WHERE (Status = N'Active') ORDER BY Condition" UpdateCommand="UPDATE [Condition] SET [Condition] = @Condition, [Status] = @Status WHERE [ConditionID] = @ConditionID">
    <DeleteParameters>
        <asp:Parameter Name="ConditionID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="Condition" PropertyName="Text" Type="String" />
        <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Condition" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="ConditionID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>







    <asp:Label ID="Label10" runat="server" Text="0" Visible="False"></asp:Label>



    <asp:Label ID="Label14" runat="server" Text="0" Visible="False"></asp:Label>



    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT DISTINCT Brand FROM Products ORDER BY Brand"></asp:SqlDataSource>



    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CityName FROM City WHERE (Status = N'Active') ORDER BY CityName"></asp:SqlDataSource>



</asp:Content>

