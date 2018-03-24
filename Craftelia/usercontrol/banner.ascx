<%@ Control Language="C#" AutoEventWireup="true" CodeFile="banner.ascx.cs" Inherits="usercontrol_banner" %>

  <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SliderImage, Status FROM Slider WHERE (Status = N'Active') and Type='Slider'"></asp:SqlDataSource>
   

<script src="js/responsiveslides.min.js"></script>
				<script>
			
				    $(function () {
				     
				        $("#slider3").responsiveSlides({
				            auto: true,
				            pager: true,
				            nav: false,
				            speed: 500,
				            namespace: "callbacks",
				            before: function () {
				                $('.events').append("<li>before event fired.</li>");
				            },
				            after: function () {
				                $('.events').append("<li>after event fired.</li>");
				            }
				        });
				    });
				</script>
				<div  id="top" class="callbacks_container">
					<ul class="rslides" id="slider3">
						
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource6">
                            <ItemTemplate>
<li>
    <asp:Image ID="Image3" runat="server" Width="100%"  ImageUrl='<%# Eval("SliderImage") %>' Height="350px" CssClass="visible-lg" />						
 <asp:Image ID="Image1" runat="server" Width="100%"  ImageUrl='<%# Eval("SliderImage") %>'  CssClass="hidden-lg img-responsive" />	
						</li>
                            </ItemTemplate>
                        </asp:ListView>
					
					
						
					</ul>
				</div>
			