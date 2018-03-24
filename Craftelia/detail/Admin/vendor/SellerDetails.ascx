<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellerDetails.ascx.cs" Inherits="ucdetail_SellerDetails" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Profile.VendorName, Profile.VendorLogo, Profile.AdminApproval, Profile.ProfileId, Profile.UserName, ProfileSpeciality.ProfileSpeciality, Profile.ProfileSpecialityID, Profile.UserApproval, Profile.IP, Profile.District, Profile.Street, Profile.Building, Profile.TelePhone, Profile.Mobile, Profile.Email, Profile.ID, ISNULL(Profile.IDFile, 'NA') AS IDFile, Profile.License, ISNULL(Profile.LicenseFile, 'NA') AS LicenseFile, Profile.Permission, ISNULL(Profile.PermissionFile, 'NA') AS PermissionFile, Profile.Reg, ISNULL(Profile.RegFile, 'NA') AS RegFile, Profile.InsertDate, Profile.AccountMasterType, Profile.Emailaddress, Profile.admindescription, Profile.DeliveryID, Profile.PaymentID, ProfileType.ProfileType, Profile.ProfileSubSpecialityID, ProfileCategory.ProfileCategory, Profile.googlemap, Country.Country, City.CityName AS city, tagline FROM ProfileSpeciality RIGHT OUTER JOIN Profile INNER JOIN Country ON Profile.country = Country.Countryid INNER JOIN City ON Profile.city = City.CityID LEFT OUTER JOIN ProfileCategory ON Profile.ProfileCategoryID = ProfileCategory.ProfileCategoryID LEFT OUTER JOIN ProfileType ON Profile.ProfileTypeId = ProfileType.ProfileTypeId ON ProfileSpeciality.ProfileSpecialityID = Profile.ProfileSpecialityID WHERE (Profile.ProfileId = @ProfileId)" UpdateCommand="UPDATE Profile SET admindescription = @Description, AdminApproval = @Approval WHERE (ProfileId = @PID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="ProfileId" QueryStringField="PID" />
    </SelectParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="PID" QueryStringField="PID" />
    </UpdateParameters>
</asp:SqlDataSource>


<asp:HiddenField ID="HiddenField1" runat="server" />
<uc1:savediv runat="server" ID="savediv" Visible="false" />

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
    
     <tr  style="background-color:#dddddd">
        <td >
Contact Details
        </td>
        <td >

        </td>
    </tr>
      <tr>
        <td class="col-md-2">
TelePhone:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label11" runat="server" Text='<%# Eval("TelePhone") %>' ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Mobile:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label12" runat="server" Text='<%# Eval("Mobile") %>' ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Email:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label13" runat="server" Text='<%# Eval("EmailAddress") %>' ></asp:Label> 
        </td>
       
    </tr>
       <tr  style="background-color:#dddddd">
        <td >
Identification Details
        </td>
        <td >

        </td>
    </tr>
      <tr>
        <td class="col-md-2">
Id:
        </td>
        <td class="col-md-10"> 
<asp:Label ID="Label14" runat="server" Text='<%# Eval("ID") %>' ></asp:Label> 
<asp:Label ID="Label22" runat="server" Text='<%# Eval("IDFile") %>' Visible="false" ></asp:Label> 

        </td>
       
    </tr>
        <tr>
        <td class="col-md-2">
ID Document:
        </td>
        <td class="col-md-10">
<asp:LinkButton ID="LinkButton1" runat="server" CommandName="ID">View PDF</asp:LinkButton>
        </td>
            
    </tr>
      <tr>
        <td class="col-md-2">
License:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label15" runat="server" Text='<%# Eval("License") %>' ></asp:Label> 
            <asp:Label ID="Label25" runat="server" Text='<%# Eval("LicenseFile") %>' Visible="false" ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
License file:
        </td>
        <td class="col-md-10">
            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="License">View PDF</asp:LinkButton>
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Permission:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label16" runat="server" Text='<%# Eval("PErmission") %>' ></asp:Label> 
            <asp:Label ID="Label26" runat="server" Text='<%# Eval("PermissionFile") %>' Visible="false" ></asp:Label> 
        </td>
       
    </tr>  <tr>
        <td class="col-md-2">
Permission File:
        </td>
        <td class="col-md-10">
            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Permission">View PDF</asp:LinkButton>
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Reg #:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label17" runat="server" Text='<%# Eval("Reg") %>' ></asp:Label> 
            <asp:Label ID="Label27" runat="server" Text='<%# Eval("RegFile") %>' Visible="false" ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Reg # File:
        </td>
        <td class="col-md-10">
            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Reg">View PDF</asp:LinkButton>
        </td>
       
    </tr>
       <tr  style="background-color:#dddddd">
        <td >
Other Details
        </td>
        <td >

        </td>
    </tr>
      <tr>
        <td class="col-md-2">
Delivery:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label18" runat="server" Text='<%# Eval("DeliveryID") %>' ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Payment:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label19" runat="server" Text='<%# Eval("PaymentID") %>' ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Insert Date:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label20" runat="server" Text='<%# Eval("InsertDate") %>' ></asp:Label> 
        </td>
       
    </tr>
      <tr>
        <td class="col-md-2">
Email Address:
        </td>
        <td class="col-md-10">
<asp:Label ID="Label21" runat="server" Text='<%# Eval("Emailaddress") %>' ></asp:Label> 
        </td>
       
    </tr>
    
      <tr  style="background-color:#dddddd">
        <td >
Approval Status
        </td>
        <td >

        </td>
    </tr>
     <tr>
        <td class="col-md-2">
Admin Approval:
        </td>
        <td class="col-md-10">

            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Eval("adminapproval") %>'>
                <asp:ListItem>Pending</asp:ListItem>
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>InActive</asp:ListItem>
            </asp:RadioButtonList>

        </td>
       
    </tr>  <tr>
        <td class="col-md-2">
Remarks:
        </td>
        <td class="col-md-10">
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("admindescription") %>'></asp:TextBox>

        </td>
       
    </tr>
</table>
           <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Update">Update</asp:LinkButton>



                            

    </div>
   
 
                             
              
                           </div>
    </ItemTemplate>
</asp:ListView>
 
<br />