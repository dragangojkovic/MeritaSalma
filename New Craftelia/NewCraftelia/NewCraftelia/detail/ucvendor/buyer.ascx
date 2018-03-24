<%@ Control Language="C#" AutoEventWireup="true" CodeFile="buyer.ascx.cs" Inherits="ucvendor_vendor" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


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
     <uc1:savediv runat="server" ID="savediv" Visible="false"/>
                             <asp:Label ID="Label25" runat="server" Text="Vendor Details:"></asp:Label>
                             
                         </div>  
                    
                    
                      <div class="form form-div form-horizontal">
                     <div class="form-group"> 
                       

                           <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
           
           <asp:Image ID="Image2" runat="server" ImageUrl="~/loader.gif" Height="50" Width="50" />
        
            
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">

        <ContentTemplate>
                                      <div class="col-md-6">
                           <asp:Label ID="Label26" runat="server" Text="Vendor Name"></asp:Label> 
                           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox1" CssClass="required"></asp:RequiredFieldValidator>

                       </div>
                     <div class="col-md-6">
                           <asp:Label ID="Label27" runat="server" Text="Vendor Logo"></asp:Label> 
                         <asp:Label ID="Label1" runat="server" Text="Only JPG & PNG allowed" CssClass="text-danger" Font-Size="10px" Font-Bold="True"></asp:Label>
                         <asp:FileUpload ID="FileUpload11" runat="server" />
                         <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=btnUpload.ClientID %>").click();
                                        }
                                    }
</script>


   

                               
                             
                           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="FileUpload1" CssClass="required"></asp:RequiredFieldValidator>--%>

                           

                       </div>
                          
                      
                               
                               <div class="col-md-6 center"> 
                                   <asp:Image ID="Image111" runat="server" Height="75px" ImageUrl="~/DynamicImage/NoImage.jpg" Width="75px" />
                         

                                                   </div>
                             <div class="col-md-6">
                                 </ContentTemplate>

        <Triggers>
    <asp:PostBackTrigger ControlID="btnUpload" />
</Triggers>
    </asp:UpdatePanel>
                          
                             <asp:Button ID="Button1" runat="server" ValidationGroup="vendor" Text="Save" OnClick="Button1_Click" OnClientClick="if (!Page_ClientValidate('vendor')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />   
                                 <asp:Label ID="Label28" runat="server"></asp:Label>
                               </div>
                         </div>

</div>                    <br />
                       <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(VendorName, '') AS VendorName, ISNULL(VendorLogo, '') AS VendorLogo FROM Profile WHERE (UserName = @UserName)" UpdateCommand="UPDATE Profile SET VendorName = @VendorName, VendorLogo = @VendorLogo WHERE (UserName = @UserName)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                           </SelectParameters>
                           <UpdateParameters>
                               <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                               <asp:ControlParameter ControlID="TextBox1" Name="VendorName" PropertyName="Text" />
                           </UpdateParameters>
                       </asp:SqlDataSource>
                       <asp:HiddenField ID="HiddenField1" runat="server" />