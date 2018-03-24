<%@ Control Language="C#" AutoEventWireup="true" CodeFile="video.ascx.cs" Inherits="ucproduct_video" %>


   <script type="text/javascript">
       window.onsubmit = function () {
           if (Page_IsValid) {
               var updateProgress = $find("<%= UpdateProgress2.ClientID %>");
                   window.setTimeout(function () {
                       updateProgress.set_visible(true);
                   }, 100);
               }
           }
</script> 
<div class="title">
 <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
           
           <asp:Image ID="Image2" runat="server" ImageUrl="~/loader.gif" Height="50" Width="50" /> File Uploading in process...
        
            
        </ProgressTemplate>
    </asp:UpdateProgress>
       
                             <asp:Label ID="Label2" runat="server" Text="Video:"></asp:Label>
                              
                         </div>       <br />      <div class="form-group whitebg">

<asp:Label ID="Label4" runat="server" ForeColor="#009900"></asp:Label>

                                 <br />   
<div class="col-md-6">
                                Video/ load video 2min:

    
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">

        <ContentTemplate>
                             <asp:FileUpload ID="FileUpload1" runat="server" />

     <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />

        <script type="text/javascript">
            function UploadFile(fileUpload) {
                if (fileUpload.value != '') {
                    document.getElementById("<%=btnUpload.ClientID %>").click();
                                        }
                                    }
        </script>
  

                                <br />

</div>
    </div>
     <div class="form-group">

            </ContentTemplate>

        <Triggers>
    <asp:PostBackTrigger ControlID="btnUpload" />
</Triggers>
    </asp:UpdatePanel>
    <asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />
                                         <asp:Label ID="Label3" runat="server" ForeColor="#009900" Visible="false"></asp:Label>
    <asp:Label ID="Label1" runat="server" ForeColor="#009900" Visible="false"></asp:Label>
                                        </div>   
                          <video  controls width="100%" height="230px">
                                        &nbsp; <source src='<%=Label1.Text%>' type="video/mp4">
                                        &nbsp; Your browser does not support the video tag.
</video>

                        
 
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" UpdateCommand="UPDATE Products SET VideoUpload = @Video WHERE (ProductKey = @ProductKey)" SelectCommand="SELECT ISNULL(REPLACE(VideoUpload, '~', ''), '') AS Video FROM Products WHERE (ProductKey = @ID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
    </SelectParameters>
    </asp:SqlDataSource>
