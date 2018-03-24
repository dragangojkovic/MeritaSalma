<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="testingimagesliders.aspx.cs" Inherits="testingimagesliders" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&key=AIzaSyCI2rrQ6FeYu6JvfehofKYLLKxkDxem78o"></script>
    <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('txtPlaces'));
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="3">
            <tr>
                <td colspan="2">
                    <input type="text" id="txtPlaces" style="width: 250px" placeholder="Enter a location" />
                    <hr />
                </td>
            </tr>
            <tr>
                <td>
                    <div id="dvMap" style="width: 500px; height: 500px">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>


</asp:Content>

