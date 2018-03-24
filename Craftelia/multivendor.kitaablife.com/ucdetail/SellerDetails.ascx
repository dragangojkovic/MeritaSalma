<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellerDetails.ascx.cs" Inherits="ucdetail_SellerDetails" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT VendorName, VendorLogo, AdminApproval, ProfileId, UserName FROM Profile WHERE (AdminApproval = N'Active') AND (ProfileId = @ProfileID)">
    <SelectParameters>
        <asp:RouteParameter DefaultValue="1" Name="ProfileID" RouteKey="PID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
    <ItemTemplate>
<div class="arrow_box">
    <asp:Label ID="Label3" runat="server" Text='<%# Eval("UserName") %>' Font-Bold="True" Visible="false"></asp:Label> 
    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProfileId") %>' Font-Bold="True" Visible="false"></asp:Label> 
                              <h5>
                                  Sold By <asp:Label ID="Label2" runat="server" Text='<%# Eval("VendorName") %>' Font-Bold="True"></asp:Label> <asp:Image ID="Image1" runat="server" Width="35" Height="30" ImageUrl='<%# Eval("VendorLogo") %>' ImageAlign="Bottom" CssClass="img-circle" />
                              </h5>
                               <asp:Button ID="Button2" runat="server" Text="Contact" CommandName="contact" CssClass="btn-color" />
                               <hr />
                               <div class="row">
                                   <div class="col-md-6">
                                      <%-- <h6 class="nomargin">
                                           <small> Delivery </small>2 - 4 business days
                                       </h6>--%>
                                   </div>
                                   <div class="col-md-6">
                                       <asp:LinkButton ID="LinkButton2" CommandName="Details" runat="server">View Seller Shop</asp:LinkButton>
                                   </div>
                               </div>
                           </div>
    </ItemTemplate>
</asp:ListView>
 
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
                  