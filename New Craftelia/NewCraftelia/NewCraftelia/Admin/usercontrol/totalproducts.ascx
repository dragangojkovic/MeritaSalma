﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="totalproducts.ascx.cs" Inherits="Admin_usercontrol_totalproducts" %>
<div class="four-w3ls">
                    <div class="icon">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Admin/img/folder.png" height="40px" />
                    </div>
                    <div class="four-text">
                        <h3>Products</h3>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
 <h4><a href="/Admin/product-setup/allproducts"><asp:Label ID="Label9" runat="server" Text='<%# Eval("Total") %>' /> </a> </h4>
                            </ItemTemplate>
                        </asp:ListView> 

                    </div>

                </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Total FROM dbo.Products"></asp:SqlDataSource>
