<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellerDetails.ascx.cs" Inherits="ucdetail_SellerDetails" %>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Profile.VendorName, Profile.VendorLogo, Profile.AdminApproval, Profile.ProfileId, Profile.UserName, ProfileSpeciality.ProfileSpeciality, Profile.ProfileSpecialityID, Profile.UserApproval, Profile.IP, Profile.District, Profile.Street, Profile.Building, Profile.TelePhone, Profile.Mobile, Profile.Email, Profile.ID, ISNULL(Profile.IDFile, 'NA') AS IDFile, Profile.License, ISNULL(Profile.LicenseFile, 'NA') AS LicenseFile, Profile.Permission, ISNULL(Profile.PermissionFile, 'NA') AS PermissionFile, Profile.Reg, ISNULL(Profile.RegFile, 'NA') AS RegFile, Profile.InsertDate, Profile.AccountMasterType, Profile.Emailaddress, Profile.admindescription, Profile.DeliveryID, Profile.PaymentID, ProfileType.ProfileType, Profile.ProfileSubSpecialityID, ProfileCategory.ProfileCategory, Profile.googlemap, Country.Country, Profile.tagline, City.CityName AS city FROM ProfileSpeciality RIGHT OUTER JOIN Profile INNER JOIN Country ON Profile.country = Country.Countryid INNER JOIN City ON Profile.city = City.CityID LEFT OUTER JOIN ProfileCategory ON Profile.ProfileCategoryID = ProfileCategory.ProfileCategoryID LEFT OUTER JOIN ProfileType ON Profile.ProfileTypeId = ProfileType.ProfileTypeId ON ProfileSpeciality.ProfileSpecialityID = Profile.ProfileSpecialityID WHERE (Profile.ProfileId = @ProfileId)" UpdateCommand="UPDATE Profile SET admindescription = @Description, AdminApproval = @Approval WHERE (ProfileId = @PID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="ProfileId" QueryStringField="PID" />
    </SelectParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="PID" QueryStringField="PID" />
    </UpdateParameters>
</asp:SqlDataSource>


<asp:HiddenField ID="HiddenField1" runat="server" />


<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
    <ItemTemplate>
<div class="form row"> 
  
    <div class="col-md-3">
        <div class=" form-div">
        <h4>
            <asp:Label ID="Label24" runat="server" Text='<%# Eval("VendorName") %>' ></asp:Label> 
        </h4>
<asp:Image ID="Image1" runat="server" Width="100%" Height="200px" ImageUrl='<%# Eval("VendorLogo") %>' ImageAlign="Bottom" /> <br /> <br /> 
   </div>
        <br />
        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/seller/profile.aspx" Visible="false" CssClass="btn btn-info" Width="100%">Edit Profile</asp:LinkButton>
    </div>
       <div class="col-md-9 form-div form">    <asp:Label ID="Label3" runat="server" Text='<%# Eval("UserName") %>' Font-Bold="True" Visible="false"></asp:Label> 
    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProfileId") %>'  Visible="false"></asp:Label> 


<table style="width: 100%;" class="table">
    <tr style="background-color:#dddddd">
        <td >
Account Details
        </td>
        <td >

        </td>
    </tr>
     <tr>
        <td class="col-md-2">
Master Account (Buyer/Seller or Both):
        </td>
        <td class="col-md-10">
<asp:Label ID="Label23" runat="server" Text='<%# Eval("AccountMasterType") %>' ></asp:Label> 
        </td>
       
    </tr>
       <tr>
        <td class="col-md-2">
Account Type:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label28" runat="server" Text='<%# Eval("ProfileType") %>' ></asp:Label> 
        </td>
       
    </tr>


    <tr>
        <td class="col-md-2">
Profile Type:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label2" runat="server" Text='<%# Eval("ProfileCategory") %>' ></asp:Label> 
        </td>
       
    </tr>
    <tr>
        <td class="col-md-2">
Category:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label6" runat="server" Text='<%# Eval("ProfileSpeciality") %>' ></asp:Label> 
        </td>
       
    </tr>
     <tr>
        <td class="col-md-2">
Speciality:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label7" runat="server" Text='<%# Eval("ProfileSubSpecialityID") %>' ></asp:Label> 
        </td>
         </tr>
        <tr>
           <td class="col-md-2">
About Me
        </td>
        <td class="col-md-10">
<asp:Label ID="Label12" runat="server" Text='<%# Eval("tagline") %>' ></asp:Label> 
        </td>
       
    </tr>
       <tr  style="background-color:#dddddd">
        <td >
Address Details
        </td>
        <td >

        </td>
    </tr>
     <tr>
        <td class="col-md-2">
Country:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label4" runat="server" Text='<%# Eval("Country") %>' ></asp:Label> 
        </td>
       
    </tr>
     <tr>
        <td class="col-md-2">
City:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label5" runat="server" Text='<%# Eval("city") %>' ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
District:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label8" runat="server" Text='<%# Eval("District") %>' ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Street
        </td>
        <td class="col-md-10">
<asp:Label ID="Label9" runat="server" Text='<%# Eval("Street") %>' ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Building:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label10" runat="server" Text='<%# Eval("Building") %>' ></asp:Label> 
        </td>
       
    </tr>  

     <tr>
        <td class="col-md-2">
Google Map Location:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label29" runat="server" Text='<%# Eval("googlemap") %>' ></asp:Label> 
        </td>

        
       
    </tr>  
    
     
     
    
      
    
       
    </tr>
</table>
       



                            

    </div>
   
 
                             
              
                           </div>
    </ItemTemplate>
</asp:ListView>
 
<br />