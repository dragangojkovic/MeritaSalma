<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="ucheader_menu" %>
<%@ Register Src="~/usercontrol/UserFullNameDisplay.ascx" TagPrefix="uc1" TagName="UserFullNameDisplay" %>


<div class="col-xs-4 nopadding" id="admin" runat="server" visible="false">
    <asp:LinkButton ID="LinkButton23" runat="server" PostBackUrl="~/Admin/Admin-Dashboard.aspx">Go To Admin Dashboard</asp:LinkButton>
    </div>



<div class="col-xs-4 nopadding" id="buyer" runat="server" visible="false">      
                                  
                                      
                                           <div >

                                        <div class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-weight:bold;"><i class="fa fa-user"></i>    <br /> My Account <i class="fa fa-angle-down "></i> </a>
                                          

                                            	<ul class="dropdown-menu dropdown-left" role="menu" aria-labelledby="dropdownMenu" style="text-align: left;">
 <li><a runat="server" title="Manage your account">Hello,<uc1:UserFullNameDisplay runat="server" ID="UserFullNameDisplay" /> !</a></li>
            
                                           <li>
                                                    <asp:LinkButton ID="LinkButton26" runat="server" CausesValidation="False" PostBackUrl="~/customer/customerprofile.aspx">Customer Profile</asp:LinkButton>
                                                </li>  

                                                  <li>
                                                    <asp:LinkButton ID="LinkButton8" runat="server" CausesValidation="False" PostBackUrl="~/customer/MyPurchases.aspx">My Orders</asp:LinkButton>
                                                </li>   
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton14" runat="server" CausesValidation="False" PostBackUrl="~/customer/mysaveitem.aspx">My Wish list</asp:LinkButton>
                                                </li>   
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton16" runat="server" CausesValidation="False" PostBackUrl="~/customer/BidsShow.aspx">Track My Bid</asp:LinkButton>
                                                </li>   
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton20" runat="server" CausesValidation="False" PostBackUrl="~/postreq/PostRequest.aspx">Post Wanted Item</asp:LinkButton>
                                                </li>   
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton7" runat="server" CausesValidation="False" PostBackUrl="~/Account/Manage.aspx">Change Password</asp:LinkButton>
                                                </li>  
                                                    
                                                       <li >
              <asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/" OnLoggingOut="Unnamed_LoggingOut"  Font-Bold="True" />
                               
              
              </li>
                                        
                                                    
                                                  
            </ul>
                                        </div>
                                    </div>
                                      

                                  
                                            </div>


<div class="col-xs-4" id="both" runat="server" visible="false">      
                                  
                                      
                                           <div >

                                        <div class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-weight:bold;"><i class="fa fa-user"></i>    <br /> My Account <i class="fa fa-angle-down "></i> </a>
                                          

                                            	<ul class="dropdown-menu dropdown-left" role="menu" aria-labelledby="dropdownMenu" style="text-align: left;">
 <li><a runat="server" title="Manage your account">Hello, <uc1:UserFullNameDisplay runat="server" ID="UserFullNameDisplay1" /></a></li>
            
                                                <li>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/seller/viewprofile.aspx">Vendor Profile</asp:LinkButton>
                                                </li>  
                                                    
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" PostBackUrl="~/seller/addproduct.aspx">Add Product</asp:LinkButton>
                                                </li>  
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False" PostBackUrl="~/seller/allproducts.aspx">My Products</asp:LinkButton>
                                                </li> 
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton18" runat="server" CausesValidation="False" PostBackUrl="~/seller/jobs.aspx">Post Job</asp:LinkButton>
                                                </li> 
                                                  <li>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" PostBackUrl="~/seller/Myorders.aspx">My Sales</asp:LinkButton>
                                                </li>   
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton24" runat="server" CausesValidation="False" PostBackUrl="~/seller/BestSellingProducts.aspx">Sales Analytics</asp:LinkButton>
                                                </li>  
                                                    
                                                    <li>
                                                    <asp:LinkButton ID="LinkButton29" runat="server" CausesValidation="False" PostBackUrl="~/seller/CommisssionStatus.aspx">Website Commission</asp:LinkButton>
                                                </li>   
                                                    <li>
                                                        <hr />
                                                    </li>
                                                    
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton27" runat="server" CausesValidation="False" PostBackUrl="~/customer/customerprofile.aspx">Customer Profile</asp:LinkButton>
                                                </li>  
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" PostBackUrl="~/customer/MyPurchases.aspx">My Orders</asp:LinkButton>
                                                </li>  
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton15" runat="server" CausesValidation="False" PostBackUrl="~/customer/mysaveitem.aspx">My Wish list</asp:LinkButton>
                                                </li>    <li>
                                                    <asp:LinkButton ID="LinkButton17" runat="server" CausesValidation="False" PostBackUrl="~/customer/BidsShow.aspx">Track My Bid</asp:LinkButton>
                                                </li>   
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton21" runat="server" CausesValidation="False" PostBackUrl="~/postreq/PostRequest.aspx">Post Wanted Item</asp:LinkButton>
                                                </li>   
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" PostBackUrl="~/Account/Manage.aspx">Change Password</asp:LinkButton>
                                                </li>  
                                                     <li >
              <asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/" OnLoggingOut="Unnamed_LoggingOut"   Font-Bold="True" />
                               
              
              </li>
                                                    
                                                     
                                        
                                                    
                                                  
            </ul>
                                        </div>
                                    </div>
                                      

                                  
                                            </div>

<div class="col-xs-4" id="vendor" runat="server" visible="false">      
                                  
                                      
                                           <div >

                                        <div class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-weight:bold;"><i class="fa fa-user"></i>    <br /> My Account <i class="fa fa-angle-down "></i> </a>
                                          

                                            	<ul class="dropdown-menu dropdown-left" role="menu" aria-labelledby="dropdownMenu" style="text-align: left;">
 <li><a runat="server" title="Manage your account">Hello, <uc1:UserFullNameDisplay runat="server" ID="UserFullNameDisplay2" />!</a></li>
            
                                                <li>
                                                    <asp:LinkButton ID="LinkButton9" runat="server" CausesValidation="False" PostBackUrl="~/seller/viewprofile.aspx">Vendor Profile</asp:LinkButton>
                                                </li>  
                                                    
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton10" runat="server" CausesValidation="False" PostBackUrl="~/seller/addproduct.aspx">Add Product</asp:LinkButton>
                                                </li>  
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton11" runat="server" CausesValidation="False" PostBackUrl="~/seller/allproducts.aspx">My Products</asp:LinkButton>
                                                </li> 
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton19" runat="server" CausesValidation="False" PostBackUrl="~/seller/jobs.aspx">Post Job</asp:LinkButton>
                                                </li> 
                                                  <li>
                                                    <asp:LinkButton ID="LinkButton12" runat="server" CausesValidation="False" PostBackUrl="~/seller/Myorders.aspx">My Sales</asp:LinkButton>
                                                </li>  
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton25" runat="server" CausesValidation="False" PostBackUrl="~/seller/BestSellingProducts.aspx">Sales Analytics</asp:LinkButton>
                                                </li>    
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton22" runat="server" CausesValidation="False" PostBackUrl="~/postreq/PostRequest.aspx">Post Wanted Item</asp:LinkButton>
                                                </li>   
                                                     <li>
                                                    <asp:LinkButton ID="LinkButton28" runat="server" CausesValidation="False" PostBackUrl="~/seller/CommisssionStatus.aspx">Website Commission</asp:LinkButton>
                                                </li>   
                                                      <li>
                                                    <asp:LinkButton ID="LinkButton13" runat="server" CausesValidation="False" PostBackUrl="~/Account/Manage.aspx">Change Password</asp:LinkButton>
                                                </li>  
                                                     <li >
              <asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/" OnLoggingOut="Unnamed_LoggingOut"  Font-Bold="True" />
                               
              
              </li>
                                                    
                                                       <li >
              
              
              </li>
                                        
                                                    
                                                  
            </ul>
                                        </div>
                                    </div>
                                      

                                  
                                            </div>


<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AccountMasterType FROM dbo.Profile WHERE (UserName = @UserName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
