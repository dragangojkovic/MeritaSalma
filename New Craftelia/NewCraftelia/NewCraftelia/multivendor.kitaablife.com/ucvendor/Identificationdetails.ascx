<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Identificationdetails.ascx.cs" Inherits="ucvendor_Identificationdetails" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>



<script type="text/javascript">
        window.onsubmit = function () {
            if (Page_IsValid) {
                var updateProgress = $find("<%= UpdateProgress1.ClientID %>");
        window.setTimeout(function () {
            updateProgress.set_visible(true);
        }, 100);
    }
}
</script>
<div class="title">
    <uc1:savediv runat="server" ID="savediv" Visible="false" />
      <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
           
           <asp:Image ID="Image2" runat="server" ImageUrl="~/loader.gif" Height="50" Width="50" />
        
            
        </ProgressTemplate>
    </asp:UpdateProgress>
                             <asp:Label ID="Label16" runat="server" Text="Identification Details:"></asp:Label> <asp:Label ID="Label1" runat="server" Text="Only PDF allowed" CssClass="text-danger" Font-Size="10px" Font-Bold="True"></asp:Label>
                           
                         </div>     
                     <asp:UpdatePanel ID="UpdatePanel2" runat="server">

        <ContentTemplate>
                       <div class="form form-div form-horizontal">
                     <div class="form-group"> 
                         
                           <div class="col-md-12">
 <asp:Label ID="Label17" runat="server" Text="ID#"></asp:Label> 
                           </div>
                        
                               <div class="col-md-6">
                          
                           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="TextBox1" CssClass="required"></asp:RequiredFieldValidator>

                       </div>
                          <div class="col-md-4">
                              <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                                      <asp:FileUpload ID="FileUpload1" runat="server" />

                            <%--   <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=btnUpload.ClientID %>").click();
                                }
                            }
</script>--%>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="FileUpload1" CssClass="required" Enabled="False"></asp:RequiredFieldValidator>

                    
                       </div> 
                           <div class="col-md-2 center nopadding">
<%--<asp:Image ID="Image1" runat="server" Height="75px" ImageUrl="~/DynamicImage/NoImage.jpg" Width="75px" />--%>
                               <asp:Label ID="Label22" Visible="False" runat="server" Text="NA"></asp:Label>
                               <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">View PDF</asp:LinkButton>
                                                   </div>

                          </div> 
                              
                           <div class="form-group"> 
                         
                           <div class="col-md-12">
 <asp:Label ID="Label18" runat="server" Text="Licence"></asp:Label> 
                           </div>   
                             
                             
                                    <div class="col-md-6">
                           
                           <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="TextBox2" CssClass="required"></asp:RequiredFieldValidator>

                       </div> 
                                  <div class="col-md-4">
                                      <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                                      <asp:FileUpload ID="FileUpload2" runat="server" />


                                    <%--   <asp:Button ID="Button2" Text="Upload" runat="server" OnClick="Upload2" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile2(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=Button2.ClientID %>").click();
                                        }
                                    }
</script>--%>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="FileUpload2" CssClass="required" Enabled="False"></asp:RequiredFieldValidator>

                    
                       </div> 
                                 <div class="col-md-2 center nopadding">
<%--<asp:Image ID="Image2" runat="server" Height="75px" ImageUrl="~/DynamicImage/NoImage.jpg" Width="75px" />--%>
                                      <asp:Label ID="Label23" Visible="False" runat="server" Text="NA"></asp:Label>
                                       <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">View PDF</asp:LinkButton>
                                                   </div>



                           </div>
                                  
                             
                              <div class="form-group"> 
                         
                           <div class="col-md-12">
  <asp:Label ID="Label19" runat="server" Text="Permision"></asp:Label> 
                           </div>
                                <div class="col-md-6">
                          
                           <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="TextBox3" CssClass="required"></asp:RequiredFieldValidator>
</div> <div class="col-md-4">
     <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                                      <asp:FileUpload ID="FileUpload3" runat="server" />

    <%-- <asp:Button ID="Button3" Text="Upload" runat="server" OnClick="Upload3" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile3(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=Button3.ClientID %>").click();
                                        }
                                    }
</script>--%>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="FileUpload3" CssClass="required" Enabled="False"></asp:RequiredFieldValidator>

                    
                       </div> 
                                    <div class="col-md-2 center nopadding">
<%--<asp:Image ID="Image3" runat="server" Height="75px" ImageUrl="~/DynamicImage/NoImage.jpg" Width="75px" />--%>
                                         <asp:Label ID="Label24" Visible="False" runat="server" Text="NA"></asp:Label>
                                          <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">View PDF</asp:LinkButton>
                                                   </div>
                       </div>
                                 
                             
                              <div class="form-group"> 
                         
                           <div class="col-md-12">
 <asp:Label ID="Label20" runat="server" Text="Reg #"></asp:Label> 
                           </div>
                                 <div class="col-md-6">
                          
                           <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="TextBox4" CssClass="required"></asp:RequiredFieldValidator>

                       </div>

                                   <div class="col-md-4">
                                      
                                       <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
                                      <asp:FileUpload ID="FileUpload4" runat="server" />

<%--                                        <asp:Button ID="Button4" Text="Upload" runat="server" OnClick="Upload4" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile4(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=Button4.ClientID %>").click();
                                        }
                                    }
</script>--%>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="FileUpload4" CssClass="required" Enabled="False"></asp:RequiredFieldValidator>

                    
                       </div> 
  <div class="col-md-2 center nopadding">
<%--<asp:Image ID="Image4" runat="server" Height="75px" ImageUrl="~/DynamicImage/NoImage.jpg" Width="75px" />--%>
       <asp:Label ID="Label25" Visible="False" runat="server" Text="NA"></asp:Label>
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">View PDF</asp:LinkButton>
                                                   </div>
                              </div>

                            <div class="form-group">
                             <div class="col-md-12">

                          
                             <asp:Button ID="Button1" runat="server" ValidationGroup="id" Text="Save" OnClick="Button1_Click" OnClientClick="if (!Page_ClientValidate('id')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />   
                                 <asp:Label ID="Label21" runat="server"></asp:Label>
                                 <br />
                                </div>
                         </div>
                                
            
                       </div>
             </ContentTemplate>

        <Triggers>
    <asp:PostBackTrigger ControlID="Button1" />
</Triggers>
    </asp:UpdatePanel>
                         <br />
                       <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(ID, '') AS ID, ISNULL(IDFile, 'NA') AS IDFile, ISNULL(License, '') AS License, ISNULL(LicenseFile, 'NA') AS LicenseFile, ISNULL(Permission, '') AS Permission, ISNULL(PermissionFile, 'NA') AS PermissionFile, ISNULL(Reg, '') AS Reg, ISNULL(RegFile, 'NA') AS RegFile, AdminApproval FROM Profile WHERE (UserName = @UserName)" UpdateCommand="UPDATE Profile SET ID = @ID, IDFile = @IDFile, License = @License, LicenseFile = @LicenseFile, Permission = @Permission, PermissionFile = @PermissionFile, Reg = @Reg, RegFile = @RegFile WHERE (UserName = @UserName)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                           </SelectParameters>
                           <UpdateParameters>
                               <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                               <asp:ControlParameter ControlID="TextBox1" Name="ID" PropertyName="Text" />
                               <asp:ControlParameter ControlID="TextBox2" Name="License" PropertyName="Text" />
                               <asp:ControlParameter ControlID="TextBox3" Name="Permission" PropertyName="Text" />
                               <asp:ControlParameter ControlID="TextBox4" Name="Reg" PropertyName="Text" />
                           </UpdateParameters>
                       </asp:SqlDataSource>
                       <asp:HiddenField ID="HiddenField1" runat="server" />
                                      