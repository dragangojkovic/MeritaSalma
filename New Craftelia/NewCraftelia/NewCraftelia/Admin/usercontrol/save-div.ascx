<%@ Control Language="C#" AutoEventWireup="true" CodeFile="save-div.ascx.cs" Inherits="Admin_usercontrol_save_div" %>

<script type="text/javascript">
         function HideLabel() {
             var seconds =5;
             setTimeout(function () {
                 document.getElementById("<%=Alert.ClientID %>").style.display = "none";
            }, seconds * 15000);
        };
    </script>
 <div class="alert alert-success" id="Alert" runat="server" visible="true">
      Save Successfully

        </div>