<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VerticalBanner.ascx.cs" Inherits="usercontrol_horizonbanner" %>
<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SliderImage, url, Status FROM Slider WHERE (Status = N'Active' and Type ='Banner' and  BannerType ='Vertical')"></asp:SqlDataSource>
    
         <script src="js/responsiveslides.min.js"></script>
				<script>
			
				    $(function () {
				     
				        $("#slider4").responsiveSlides({
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
				<div  id="top" class="callbacks_container visible-lg">
					<ul class="rslides" id="slider4">  
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource6">
                            <ItemTemplate>
                              
                         <li>    <a href='<%# Eval("URL") %>' runat="server" target="_blank">
                             <asp:Image ID="Image1" runat="server" CssClass="img-responsive" ImageUrl='<%# Eval("SliderImage") %>' Width="100%" Height="535px"/>
                             </a>
                               <%-- <asp:Label ID="Label1" runat="server" Text='<%# Eval("URL") %>' Visible="False"></asp:Label> 
                             <asp:ImageButton ID="ImageButton1" runat="server" CssClass="img-responsive" ImageUrl='<%# Eval("SliderImage") %>' CommandName="view" Width="100%" Height="535px" />--%>
    					
</li>  
					
                            </ItemTemplate>
                        </asp:ListView>

                        </ul>
				</div>