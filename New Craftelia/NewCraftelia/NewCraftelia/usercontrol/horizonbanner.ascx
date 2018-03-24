<%@ Control Language="C#" AutoEventWireup="true" CodeFile="horizonbanner.ascx.cs" Inherits="usercontrol_horizonbanner" %>
<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SliderImage, url, Status FROM Slider WHERE (Status = N'Active' and Type ='Banner' and  BannerType ='Horizontal')"></asp:SqlDataSource>
    <br />
           <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource6">
                            <ItemTemplate>
                                 <div class="col-md-6 nopadding"><%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("URL") %>' Visible="False"></asp:Label>
                 <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("SliderImage") %>' CommandName="view" Width="100%" Height="165px" />--%>
    					            <a href='<%# Eval("URL") %>' runat="server" target="_blank">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("SliderImage") %>' Width="100%" Height="165px" /></a>
                        </div>

					
                            </ItemTemplate>
                        </asp:ListView>

