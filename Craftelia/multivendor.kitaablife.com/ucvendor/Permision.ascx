<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Permision.ascx.cs" Inherits="ucvendor_Identificationdetails" %>
   
                                  
                             
                              <div class="form-group"> 
                         
                           <div class="col-md-12">
  <asp:Label ID="Label19" runat="server" Text="Permision"></asp:Label> 
                           </div>
                                <div class="col-md-4">
                          
                           <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="This Field is Required" ValidationGroup="Permision" ControlToValidate="TextBox3" CssClass="required"></asp:RequiredFieldValidator>
</div> <div class="col-md-4">
                                      <asp:FileUpload ID="FileUpload3" runat="server" />

    <%-- <asp:Button ID="Button3" Text="Upload" runat="server" OnClick="Upload3" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile3(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=Button3.ClientID %>").click();
                                        }
                                    }
</script>--%>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="This Field is Required" ValidationGroup="Permision" ControlToValidate="FileUpload3" CssClass="required"></asp:RequiredFieldValidator>

                    
                       </div> 
                                    <div class="col-md-2 center nopadding">
             <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="Permision">Update</asp:LinkButton>
             </div>
                                  
                                    <div class="col-md-2 center nopadding">
<%--<asp:Image ID="Image3" runat="server" Height="75px" ImageUrl="~/DynamicImage/NoImage.jpg" Width="75px" />--%>
                                         <asp:Label ID="Label24" Visible="False" runat="server" Text="NA"></asp:Label>
                                          <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">View PDF</asp:LinkButton>
                                                   </div>
                       </div>
                                 
                          
                       <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(ID, '') AS ID, ISNULL(IDFile, 'NA') AS IDFile, ISNULL(License, '') AS License, ISNULL(LicenseFile, 'NA') AS LicenseFile, ISNULL(Permission, '') AS Permission, ISNULL(PermissionFile, 'NA') AS PermissionFile, ISNULL(Reg, '') AS Reg, ISNULL(RegFile, 'NA') AS RegFile FROM Profile WHERE (UserName = @UserName)" UpdateCommand="UPDATE Profile SET ID = @ID, IDFile = @IDFile, License = @License, LicenseFile = @LicenseFile, Permission = @Permission, PermissionFile = @PermissionFile, Reg = @Reg, RegFile = @RegFile WHERE (UserName = @UserName)">
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
                                      