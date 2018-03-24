<%@ Control Language="C#" AutoEventWireup="true" CodeFile="totalvendors.ascx.cs" Inherits="Admin_usercontrol_totalvendors" %>
 <div class="four-agileinfo">
                    <div class="icon">
                       <asp:Image ID="Image2" runat="server" ImageUrl="~/Admin/img/vendor.png" height="40px" />
                    </div>
                    <div class="four-text">
                        <h3>Vendors</h3>
                       <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
 <h4><a href="/Admin/vendor/AllVendor"><asp:Label ID="Label9" runat="server" Text='<%# Eval("Total") %>' /> </a> </h4>
                            </ItemTemplate>
                        </asp:ListView> 

                    </div>

                </div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Total FROM dbo.Profile"></asp:SqlDataSource>


