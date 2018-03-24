<%@ Control Language="C#" AutoEventWireup="true" CodeFile="totalsales.ascx.cs" Inherits="Admin_usercontrol_totalsales" %>
 <div class="four-wthree">
                    <div class="icon">
                         <asp:Image ID="Image4" runat="server" ImageUrl="~/Admin/img/Briefcase-icon.png" height="40px" />
                    </div>
                    <div class="four-text">
                        <h3>Sales</h3>
                         <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
 <h4><asp:Label ID="Label9" runat="server" Text='<%# Eval("Total") %>' />  </h4>
                            </ItemTemplate>
                        </asp:ListView> 

                    </div>

                </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Total FROM dbo.[Order] WHERE (Status &lt;&gt; N'Pending')"></asp:SqlDataSource>

