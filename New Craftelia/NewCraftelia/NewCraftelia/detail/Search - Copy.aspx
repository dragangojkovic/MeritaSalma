<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Search - Copy.aspx.cs" Inherits="Search" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Src="~/usercontrol/BreadCrumbSearch.ascx" TagPrefix="uc1" TagName="BreadCrumbSearch" %>
<%@ Register Src="~/usercontrol/BreadCrumbSearchCategory.ascx" TagPrefix="uc1" TagName="BreadCrumbSearchCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('a[data-toggle="collapse"]').click(function () {
                $(this).find('span.toggle-icon').toggleClass('glyphicon-collapse-up glyphicon-collapse-down');
            })
        })
    </script>
    <div class="container">
        <uc1:BreadCrumbSearch runat="server" ID="BreadCrumbSearch" />
        <uc1:BreadCrumbSearchCategory runat="server" ID="BreadCrumbSearchCategory" />
   <%--     <ol class="breadcrumb">
            <li><a href="#">Home</a></li>
            <li><a href="#">Library</a></li>

        </ol>--%>
   
        <div class="row">
            <div class="col-md-3 nopadding">
                <div class="panel-group" id="panel-quote-group">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">Sub Category
                                <span class="pull-right">
                                    <a data-toggle="collapse" data-parent="#panel-quote-group" href="#collapse2">
                                        <span class="toggle-icon glyphicon glyphicon-collapse-up"></span>
                                    </a>
                                </span>
                            </h5>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <blockquote>
                                     <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton3_Click">Select/Unselect All</asp:LinkButton>
                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="SCategoryname" DataValueField="ScategoryId" AutoPostBack="True" OnDataBound="CheckBoxList1_DataBound" CssClass="checkbox" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"></asp:CheckBoxList>
                                </blockquote>
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
                        <div id="collapse3" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <blockquote>
                                    <div>
                                            
                                    </div>
                                  
                                    <div class="row">

                                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
    <ajaxToolkit:MultiHandleSliderExtender ID="TextBox4_MultiHandleSliderExtender" runat="server" BehaviorID="TextBox4_MultiHandleSliderExtender" HandleAnimationDuration="0.1" Maximum="100000" Minimum="10" TargetControlID="TextBox6" RaiseChangeOnlyOnMouseUp="true" EnableRailClick="false"
                Length="230" OnClientDragEnd="OnClientDragEnd">

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

                                       

                                            <asp:TextBox ID="TextBox4" Text="10"  runat="server" CssClass="form-control"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox4_FilteredTextBoxExtender" TargetControlID="TextBox4" ID="TextBox4_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
                                        </div>
                           <div class="col-xs-6 nopadding">
                            <asp:TextBox ID="TextBox5" runat="server" Text="100000" CssClass="form-control"></asp:TextBox>
                               <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox5_FilteredTextBoxExtender" TargetControlID="TextBox5" ID="TextBox5_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
                           </div>
                                       
                                     
                   </div> 
                                      	</blockquote>
                                </div>
                            </div>
                        </div>
</div>
            </div>

            <div class="col-md-9">

                <div class="row form form-div nomargin">
                 
                     <div class="col-md-3">
                       Brand:
                        <asp:TextBox ID="TextBox1" placeholder="Type Here" runat="server"></asp:TextBox>
                    </div>
                     
                     <div class="col-md-3">
                       Model #:
                        <asp:TextBox ID="TextBox2" placeholder="Type Here" runat="server"></asp:TextBox>
                    </div>

                       <div class="col-md-3">
                       Region:
                        <asp:TextBox ID="TextBox3" placeholder="Type Here" runat="server"></asp:TextBox>
                    </div>

                       <div class="col-md-2">
                       Vendor:
                       <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="VendorName" DataValueField="VendorName">
                           <asp:ListItem Value="%">All</asp:ListItem>
                       </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <br /><br />
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn-color"><i class="fa fa-search"></i></asp:LinkButton>
                </div>
                </div>




                <br />
                 <div class="row form form-div" style="border:none;">
       <div class="col-md-1 col-xs-2 nopadding" style="text-align:right">
           <br />
 Sort By: &nbsp;
       </div>
        <div class="col-md-4 col-xs-10 nopadding">
<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="PN">Product Name</asp:ListItem>
                        <asp:ListItem Value="P">Price- Low to High</asp:ListItem>
                        <asp:ListItem Selected="True" Value="F">Featured</asp:ListItem>
                        <asp:ListItem Value="V">Top Views</asp:ListItem>
                    </asp:DropDownList>
            </div></div>
         
                    
                    <br />    <div class="row">

               

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView1_ItemCommand">
                    <ItemTemplate>
<div class="col-md-3 s-product">
                          <asp:LinkButton ID="LinkButton1" CommandName="Details" runat="server">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProductKey") %>' Visible="false" ></asp:Label>

                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("CoverImage") %>' />
    <h5>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                              </h5>
                              <h6>
                                  <span>

                            <asp:Label Font-Italic="False" ID="Label4" runat="server" >  <%# Eval("Currency") %>  <%# Eval("Price") %></asp:Label>
                              </span>
                                 <asp:LinkButton ID="LinkButton2" runat="server" CommandName="favorite" CssClass="pull-right" Font-Bold="False"> <i class="fa fa-heart"></i> Save for later</asp:LinkButton> <br />
                              
                                  
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
                      </div>
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ScategoryId, CategoryId, SCategoryname, Status FROM dbo.SCategory WHERE (Status = N'Active') AND (CategoryId = @CategoryID)" OnSelecting="SqlDataSource2_Selecting">
        <SelectParameters>
            <asp:RouteParameter DefaultValue="1" Name="CategoryID" RouteKey="CID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductKey, Products.CoverImage, Products.ProductName, Products.Currency, Products.Price, Products.Model, Products.StartDate, Products.ExpiryDate, Profile.VendorName, Profile.VendorLogo, Profile.ProfileId, Products.UserApproval, Products.SubCategoryId, Products.Brand, Products.CountryofOrigin, Products.featurestatus, ISNULL(BusinessViews.Totalview, 0) AS TotalView FROM Products INNER JOIN Profile ON Products.UserName = Profile.UserName LEFT OUTER JOIN (SELECT BusineessId, COUNT(*) AS Totalview FROM BusinessViews AS BusinessViews_1 GROUP BY BusineessId) AS BusinessViews ON Products.ProductKey = BusinessViews.BusineessId WHERE (Products.AdminApproval = N'Active') AND (Products.ProductName LIKE N'%' + @Keyword + N'%') AND (Products.UserApproval = N'Active') AND (Products.SubCategoryId IN (SELECT CAST(Value AS int) AS Expr1 FROM dbo.udf_Split(@CategoryID, ',') AS udf_Split_1)) AND (Products.Price BETWEEN @min AND @max) AND (Products.Brand LIKE N'%' + @Brand + N'%') AND (Products.Model LIKE N'%' + @Model + N'%') AND (Products.CountryofOrigin LIKE N'%' + @Country + N'%') AND (ISNULL(Profile.VendorName, N'') LIKE N'%' + @Vendor + N'%') ORDER BY CASE WHEN @sort = 'PN' THEN Products.ProductName END, CASE WHEN @sort = 'F' THEN Products.featurestatus END DESC, CASE WHEN @sort = 'P' THEN Products.Price END, CASE WHEN @sort = 'V' THEN ISNULL(BusinessViews.Totalview , 0) END DESC" OnSelecting="SqlDataSource3_Selecting">
        <SelectParameters>
            <asp:RouteParameter DefaultValue="%" Name="Keyword" RouteKey="Keyword" />
            <asp:ControlParameter ControlID="CheckBoxList1" Name="CategoryID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TextBox4" Name="min" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox5" Name="max" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" Name="Brand" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" DefaultValue="%" Name="Model" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" DefaultValue="%" Name="Country" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="%" Name="Vendor" PropertyName="SelectedValue" />
            
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="PN" Name="sort" PropertyName="SelectedValue" />
            
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT TOP (10) PostAd.AdPostId, PostAd.PostedBy, PostAd.Name, PostAd.Mobile, PostAd.Email, PostAd.Location, City.CityName, PropertyType.PropertyTypeName, PropertyStatus.PropertyStatus, PostAd.RentType, PostAd.Rent, PostAd.Specification, PostAd.Image, PostAd.AdminApproval, PostAd.Status, PostAd.InsertBy, ISNULL(views.totalviews, 0) AS totalviews, ISNULL(fav.totalfav, 0) AS totalfav FROM PostAd INNER JOIN PropertyType ON PostAd.PropertyTypeId = PropertyType.PropertyTypeId INNER JOIN City ON PostAd.CityId = City.CityId INNER JOIN PropertyStatus ON PostAd.Tenure = PropertyStatus.PropertyStatusId LEFT OUTER JOIN (SELECT MyProductId, COUNT(MyProductId) AS totalfav FROM Favorite GROUP BY MyProductId) AS fav ON PostAd.AdPostId = fav.MyProductId LEFT OUTER JOIN (SELECT BusinessId AS MyProductId, COUNT(*) AS totalviews FROM BusinessViews GROUP BY BusinessId) AS views ON PostAd.AdPostId = views.MyProductId WHERE (PostAd.AdminApproval = N'Approved') AND (PostAd.Status = N'Approved') ORDER BY PostAd.AdPostId DESC" InsertCommand="INSERT INTO Favorite(MyProductId, UserName, InsertDate, Status) VALUES (@ProductId, @UserName, GETDATE(), @Status)">
     <InsertParameters>
         <asp:Parameter DefaultValue="Active" Name="Status" />
     </InsertParameters>
                       </asp:SqlDataSource>



    <br />
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT distinct dbo.Profile.VendorName FROM dbo.Profile INNER JOIN dbo.Products ON dbo.Profile.UserName = dbo.Products.UserName WHERE (dbo.Products.CategoryId = @ID) ORDER BY dbo.Profile.VendorName">
        <SelectParameters>
            <asp:RouteParameter Name="ID" RouteKey="CID" />
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>

