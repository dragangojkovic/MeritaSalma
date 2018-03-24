<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellerDetails.ascx.cs" Inherits="ucdetail_SellerDetails" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.Profile.VendorName, dbo.Profile.tagline, dbo.Profile.VendorLogo, dbo.Profile.AdminApproval, dbo.Profile.ProfileId, dbo.Profile.UserName, dbo.Profile.ProfileSpecialityID, ISNULL(dbo.Country.Country, '') AS Country FROM dbo.Profile INNER JOIN dbo.Country ON dbo.Profile.country = dbo.Country.Countryid WHERE (dbo.Profile.AdminApproval = N'Active') AND (dbo.Profile.ProfileId = @ProfileID)">
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
       
</table>




                            

    </div>
   
     <div class="col-md-2"><asp:Button ID="Button2" runat="server" Text="Contact seller" CommandName="contact" CssClass="btn-color" Width="100%" />
         </div>
                             
              
                           </div>
    </ItemTemplate>
</asp:ListView>
 
