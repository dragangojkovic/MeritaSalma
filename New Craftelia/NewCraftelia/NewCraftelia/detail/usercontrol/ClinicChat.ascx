<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClinicChat.ascx.cs" Inherits="ucdetail_SellerDetails" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CAST(Profile.VendorName AS nvarchar(1)) AS FL, Profile.VendorName, Profile.VendorLogo, Profile.AdminApproval, Profile.ProfileId, Profile.UserName, ProfileSpeciality.ProfileSpeciality, Profile.ProfileSpecialityID, ISNULL(Country.Country, '') AS Country, City.CityName AS city, Profile.AccountMasterType, ProfileType.ProfileType, Profile.ProfileSubSpecialityID FROM Profile INNER JOIN ProfileSpeciality ON Profile.ProfileSpecialityID = ProfileSpeciality.ProfileSpecialityID INNER JOIN Country ON Profile.country = Country.Countryid INNER JOIN City ON Profile.city = City.CityID INNER JOIN ProfileType ON Profile.ProfileTypeId = ProfileType.ProfileTypeId WHERE (Profile.AdminApproval = N'Active') AND (Profile.AccountMasterType &lt;&gt; N'Buyer') AND (Profile.VendorName LIKE N'%' + @VendorName + N'%') AND (City.CityName LIKE N'%' + @CityName + N'%') AND (ProfileSpeciality.ProfileSpeciality LIKE N'%' + @ProfileType + N'%') AND (Profile.ProfileSubSpecialityID LIKE N'%' + @ProfileSpeciality + N'%') ORDER BY Profile.VendorName">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="VendorName" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DropDownList5" Name="CityName" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DropDownList3" Name="ProfileType" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DropDownList2" Name="ProfileSpeciality" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>

<div class="mainbg">
 <div class="container">
     <br />
     <div class="row form">
         <div class="col-md-2" >
              City:
                       <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource10" DataTextField="CityName" DataValueField="CityName" AutoPostBack="True">
        <asp:ListItem Value="%">All</asp:ListItem>
    </asp:DropDownList>
         </div> <div class="col-md-2" >
           
             Vendor:
                       <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="VendorName" DataValueField="VendorName">
                           <asp:ListItem Value="%">All</asp:ListItem>
                       </asp:DropDownList>
                </div>
         
           <div class="col-md-2" >
                <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label> 
         <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="ProfileSpeciality" DataValueField="ProfileSpeciality" AutoPostBack="True">
             <asp:ListItem Value="%">Select Category</asp:ListItem>
         </asp:DropDownList>
               </div> 

          <div class="col-md-2" >
                <asp:Label ID="Label7" runat="server" Text="Speciality"></asp:Label> 
         <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource4" DataTextField="ProfileSubSpeciality" DataValueField="ProfileSubSpeciality" AutoPostBack="True">
             <asp:ListItem Value="%">Select Speciality</asp:ListItem>
         </asp:DropDownList>
               </div> 
          <div class="col-md-4" >
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Search" />
                       </div>
     </div>

        <div class="row">


<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
    <ItemTemplate>
<div class="col-md-4"> 
    <div class="form-div ">

  

 
<asp:Image ID="Image1" runat="server" Width="50px" CssClass="pull-right" Height="50px" ImageUrl='<%# Eval("VendorLogo") %>' ImageAlign="Bottom" /> 
    
    
    
           
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("UserName") %>' Font-Bold="True" Visible="false"></asp:Label> 
    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProfileId") %>' Font-Bold="True" Visible="false"></asp:Label> 


<table style="width: 100%;" class="row">
    <tr>
        <td class="col-md-2">
Name:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label2" runat="server" Text='<%# Eval("VendorName") %>' Font-Bold="True"></asp:Label> 
        </td>
       
    </tr>
    <tr>
        <td class="col-md-2">
Category:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label6" runat="server" Text='<%# Eval("ProfileSpeciality") %>' Font-Bold="True"></asp:Label> 
        </td>
       
    </tr>

    
    <%-- <tr>
        <td class="col-md-2">
Speciality:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileSpecialityID") %>' Font-Bold="True"></asp:Label> 
        </td>
       
    </tr>--%>
     <tr>
        <td class="col-md-2">
Country:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label4" runat="server" Text='<%# Eval("Country") %>' Font-Bold="True"></asp:Label> 
        </td>
       
    </tr>
     <tr>
        <td class="col-md-2">
City:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label5" runat="server" Text='<%# Eval("city") %>' Font-Bold="True"></asp:Label> 
        </td>
       
    </tr>
    

</table>
        <br />
          <div class="row">
        <div class="col-md-6">
          
 <asp:Button ID="Button2" runat="server" CssClass="btn btn-success btn-xs" Text="Contact" CommandName="contact" Width="100%" />
        </div>
        <div class="col-md-6">
          <asp:Button ID="Button3" runat="server" CssClass="btn btn-info btn-xs" Text="View Profile" CommandName="Details" Width="100%" />
        </div>
       
    </div>


                            
          </div>
                             
              
                           </div>
    </ItemTemplate>
</asp:ListView>
  </div>
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
     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProfileSpeciality] WHERE [ProfileSpecialityID] = @ProfileSpecialityID" InsertCommand="INSERT INTO [ProfileSpeciality] ([ProfileSpeciality], [Status]) VALUES (@ProfileSpeciality, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfileSpecialityID, ProfileSpeciality, Status FROM dbo.ProfileSpeciality WHERE (Status = N'Active') ORDER BY ProfileSpeciality" UpdateCommand="UPDATE [ProfileSpeciality] SET [ProfileSpeciality] = @ProfileSpeciality, [Status] = @Status WHERE [ProfileSpecialityID] = @ProfileSpecialityID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProfileSpecialityID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ProfileSpeciality" PropertyName="Text" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProfileSpeciality" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ProfileSpecialityID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

  <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CityName FROM City WHERE (Status = N'Active') ORDER BY CityName"></asp:SqlDataSource>

  <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT distinct dbo.Profile.VendorName FROM dbo.Profile INNER JOIN dbo.Products ON dbo.Profile.UserName = dbo.Products.UserName where dbo.Profile.VendorName is not null  ORDER BY dbo.Profile.VendorName">
    </asp:SqlDataSource>
    <br />
</div>

                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProfileSubSpeciality] WHERE [ProfileSubSpecialityID] = @ProfileSubSpecialityID" InsertCommand="INSERT INTO [ProfileSubSpeciality] ([ProfileSubSpeciality], [ProfileSpecialityID], [Status]) VALUES (@ProfileSubSpeciality, @ProfileSpecialityID, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfileSubSpecialityID, ProfileSubSpeciality, ProfileSpecialityID, Status FROM dbo.ProfileSubSpeciality WHERE (Status = N'Active') ORDER BY ProfileSubSpeciality" UpdateCommand="UPDATE [ProfileSubSpeciality] SET [ProfileSubSpeciality] = @ProfileSubSpeciality, [ProfileSpecialityID] = @ProfileSpecialityID, [Status] = @Status WHERE [ProfileSubSpecialityID] = @ProfileSubSpecialityID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProfileSubSpecialityID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ProfileSubSpeciality" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileSpecialityID" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProfileSubSpeciality" Type="String" />
                                    <asp:Parameter Name="ProfileSpecialityID" Type="Int32" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ProfileSubSpecialityID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
