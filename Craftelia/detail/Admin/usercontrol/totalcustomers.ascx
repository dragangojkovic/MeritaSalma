<%@ Control Language="C#" AutoEventWireup="true" CodeFile="totalcustomers.ascx.cs" Inherits="Admin_usercontrol_totalcustomers" %>
  <div class="four-agileits">
                    <div class="icon">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/img/usericon.png" height="40px" />
                    </div>
                    <div class="four-text">
                        <h3>User</h3>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
 <h4><asp:Label ID="Label9" runat="server" Text='<%# Eval("Total") %>' />  </h4>
                            </ItemTemplate>
                        </asp:ListView> 

                    </div>

                </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Total FROM dbo.Customer"></asp:SqlDataSource>

