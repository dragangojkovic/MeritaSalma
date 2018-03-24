<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addressdetails.ascx.cs" Inherits="ucvendor_addressdetails" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>






<div class="title">
    <uc1:savediv runat="server" ID="savediv" Visible="false" />
                             <asp:Label ID="Label7" runat="server" Text="Address Details:"></asp:Label>
                           
                         </div>       
                    
                     <div class="form form-div form-horizontal">
                     <div class="form-group"> 
                         
                           
                      
                               <div class="col-md-6">
                           <asp:Label ID="Label8" runat="server" Text="Country"></asp:Label> 
                                   :<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ad" InitialValue="0" ControlToValidate="DropDownList1" CssClass="required"></asp:RequiredFieldValidator>--%>

                       </div>
                                     <div class="col-md-6">
                           <asp:Label ID="Label9" runat="server" Text="City"></asp:Label> 
                                         <%--<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource7" DataTextField="CityName" DataValueField="Cityid" AppendDataBoundItems="True">
                                             <asp:ListItem Value="0">Select City</asp:ListItem>
                                         </asp:DropDownList>--%>
                                         <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ad" ControlToValidate="TextBox6" CssClass="required" ></asp:RequiredFieldValidator>

                       </div>
                                     <div class="col-md-6">
                           <asp:Label ID="Label10" runat="server" Text="District"></asp:Label> 
                           <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ad" ControlToValidate="TextBox3" CssClass="required"></asp:RequiredFieldValidator>

                       </div>
                                     <div class="col-md-6">
                           <asp:Label ID="Label11" runat="server" Text="Street"></asp:Label> 
                           <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ad" ControlToValidate="TextBox4" CssClass="required"></asp:RequiredFieldValidator>

                       </div>


                           <div class="col-md-6">
                           <asp:Label ID="Label1" runat="server" Text="Post Code"></asp:Label> 
                           <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ad" ControlToValidate="TextBox2" CssClass="required"></asp:RequiredFieldValidator>
                               <br />
                               <asp:Label ID="Label13" runat="server" ForeColor="#CC0000" Text="Please add your correct Post Code to calcualte delivery cost correctly." Visible="False"></asp:Label>

                       </div>


                                     <div class="col-md-6">
                           <asp:Label ID="Label12" runat="server" Text="Building"></asp:Label> 
                           <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ad" ControlToValidate="TextBox5" CssClass="required"></asp:RequiredFieldValidator>

                       </div>
                                     <div class="col-md-6" runat="server" visible="false">
                                         Locate yourself on google map (city, street, building number)
                                         <asp:TextBox ID="TextBox1" runat="server" placeholder="Locate yourself on google map"></asp:TextBox>
                                         <%--  <input type="text" id="txtPlaces" style="width: 250px" placeholder="Enter a location" />--%>
                                         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&key=AIzaSyCI2rrQ6FeYu6JvfehofKYLLKxkDxem78o"></script>
    <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('<%= TextBox1.ClientID %>'));
            google.maps.event.addListener(places, 'place_changed', function () {
                var geocoder = new google.maps.Geocoder();
                var place = places.getPlace();
                var address = place.formatted_address;
                geocoder.geocode({ 'address': address }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var latitude = results[0].geometry.location.lat();
                        var longitude = results[0].geometry.location.lng();
                        var mapOptions = { center: new google.maps.LatLng(latitude, longitude), zoom: 15, mapTypeId: google.maps.MapTypeId.ROADMAP };
                        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                        var marker = new google.maps.Marker({ position: new google.maps.LatLng(latitude, longitude), map: map });

                    } else {
                        alert("Request failed.")
                    }
                });
            });
        });
    </script>



                                          <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&key=AIzaSyCI2rrQ6FeYu6JvfehofKYLLKxkDxem78o"></script>
    <script type="text/javascript">
        window.onload = function () { AddMarkerFromAddress(document.getElementById('<%= TextBox1.ClientID %>').value); }

        function AddMarkerFromAddress(address) {
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var location = {};
                    location.lattitude = results[0].geometry.location.lat();
                    location.longitude = results[0].geometry.location.lng();
                    var mapOptions = { center: new google.maps.LatLng(location.lattitude, location.longitude), zoom: 15, mapTypeId: google.maps.MapTypeId.ROADMAP };
                    var infoWindow = new google.maps.InfoWindow();
                    var latlngbounds = new google.maps.LatLngBounds();
                    var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                    var myLatLng = new google.maps.LatLng(location.lattitude, location.longitude);
                    var marker = new google.maps.Marker({ position: myLatLng, map: map });
                    google.maps.event.addListener(marker, "click", function (e) {
                        var location = e.latLng;
                        //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                        infoWindow.setContent("<div style = 'width:200px;min-height:40px'> Latitude:" + location.lat() + "<br/> Longitude:" + location.lng() + "</div>");
                        infoWindow.open(map, marker);
                    });
                }
            });
        };
    </script>
                         
                       </div>
                        

                     </div>  <div class="form-group">
                             <div class="col-md-12">

                          
                             <asp:Button ID="Button1" runat="server" ValidationGroup="ad" Text="Save" OnClick="Button1_Click" OnClientClick="if (!Page_ClientValidate('ad')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />   </div>
                         </div>  <div class="form-group">    <div class="col-md-12">
                            <%-- <div class="form-div">
                                 <br />
                                 <h1>
                                     Google Map
                                 </h1>
                                 <br />
                             </div>--%>

                          <div id="dvMap" style="width: 100%; height:500px" runat="server" visible="false">
                    </div>
                         </div>
            
                           </div>  

                            

                     </div>
                         <br />
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(country, '0') AS Country, ISNULL(cityname, '') AS City, ISNULL(District, '') AS District, ISNULL(Street, '') AS Street, ISNULL(Building, '') AS Building, ISNULL(googlemap, '') AS googlemap, ISNULL(postcode, '') AS postcode FROM dbo.Profile WHERE (UserName = @UserName)" UpdateCommand="UPDATE dbo.Profile SET  District = @District, Street = @Street, Building = @Building, googlemap = @googlemap, postcode = @postcode, cityname = @CityName WHERE (UserName = @UserName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        <asp:ControlParameter ControlID="TextBox3" Name="District" PropertyName="Text" />
        <asp:ControlParameter ControlID="TextBox4" Name="Street" PropertyName="Text" />
        <asp:ControlParameter ControlID="TextBox5" Name="Building" PropertyName="Text" />
        <asp:ControlParameter ControlID="TextBox1" Name="googlemap" PropertyName="Text" />
        <asp:ControlParameter ControlID="TextBox2" Name="postcode" PropertyName="Text" />
        <asp:ControlParameter ControlID="TextBox6" Name="CityName" PropertyName="Text" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
                         <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Country, CountryId FROM Country ORDER BY Country"></asp:SqlDataSource>
                        <%-- <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT City.CityName, Country.Country, City.Cityid FROM City INNER JOIN Country ON City.Countryid = Country.Countryid WHERE (Country.Countryid = @CountryName) ORDER BY City.CityName">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="DropDownList1" Name="CountryName" PropertyName="SelectedValue" />
                             </SelectParameters>
</asp:SqlDataSource>--%>
                         <br />