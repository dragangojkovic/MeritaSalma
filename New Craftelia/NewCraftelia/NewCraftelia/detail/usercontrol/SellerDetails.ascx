<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellerDetails.ascx.cs" Inherits="ucdetail_SellerDetails" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Profile.VendorName, Profile.tagline, Profile.VendorLogo, Profile.AdminApproval, Profile.ProfileId, Profile.UserName, ProfileSpeciality.ProfileSpeciality, Profile.ProfileSpecialityID, ISNULL(Country.Country, '') AS Country, City.CityName AS city FROM Profile INNER JOIN ProfileSpeciality ON Profile.ProfileSpecialityID = ProfileSpeciality.ProfileSpecialityID INNER JOIN Country ON Profile.country = Country.Countryid INNER JOIN City ON Profile.city = City.CityID WHERE (Profile.AdminApproval = N'Active') AND (Profile.ProfileId = @ProfileID)">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="1" Name="ProfileID" QueryStringField="PID" />
    </SelectParameters>
</asp:SqlDataSource>


<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
    <ItemTemplate>
<div class="form form-div row"> 
  <div class="col-md-2">
<asp:Image ID="Image1" runat="server" Width="100%" Height="100px" ImageUrl='<%# Eval("VendorLogo") %>' ImageAlign="Bottom" /> <br /> <br /> 
    </div>
    
       <div class="col-md-8">    <asp:Label ID="Label3" runat="server" Text='<%# Eval("UserName") %>' Font-Bold="True" Visible="false"></asp:Label> 
    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProfileId") %>' Font-Bold="True" Visible="false"></asp:Label> 


<table style="width: 100%;" class="row">
    <tr>
        <td class="col-md-2">
Vendor Name:
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




                            

    </div>
   
     <div class="col-md-2"><asp:Button ID="Button2" runat="server" Text="Contact seller" CommandName="contact" CssClass="btn-color" Width="100%" />
         </div>
                             
              
                           </div>
    </ItemTemplate>
</asp:ListView>
 
