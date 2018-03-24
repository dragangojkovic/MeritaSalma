<%@ Control Language="C#" AutoEventWireup="true" CodeFile="images.ascx.cs" Inherits="ucproduct_images" %>
      <div class="title">
                             <asp:Label ID="Label3" runat="server" Text="Add More Images:"></asp:Label>
                              
                         </div>       <br />    
                        
                          <div class="form-group whitebg">

                                 <br />   

                             <div class="col-md-6">
                                Upload Image:
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
                              
                              
                                <div class="col-md-6">
                              
                        
                           

                                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductImagesId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Width="100%">
                                     <Columns>
                                         <asp:CommandField ShowDeleteButton="True" />
                                         <asp:TemplateField HeaderText="Images" SortExpression="Images">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Images") %>'></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Image ID="Image1" runat="server" Height="75px" ImageUrl='<%# Eval("Images") %>' Width="75px" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     </Columns>
                                 </asp:GridView>
                              </div> 
                              
                                </div>
                              

<div class="form-group">
      <asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />
                                 <asp:Label ID="Label4" runat="server"></asp:Label>
</div>

                              
                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProductImages] WHERE [ProductImagesId] = @ProductImagesId" InsertCommand="INSERT INTO [ProductImages] ([ProductKey], [Images]) VALUES (@ProductKey, @Images)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProductImagesId, ProductKey, Images FROM ProductImages WHERE (ProductKey = @ProductKey)" UpdateCommand="UPDATE [ProductImages] SET [ProductKey] = @ProductKey, [Images] = @Images WHERE [ProductImagesId] = @ProductImagesId">
                                     <DeleteParameters>
                                         <asp:Parameter Name="ProductImagesId" Type="Int32" />
                                     </DeleteParameters>
                                     <SelectParameters>
                                         <asp:QueryStringParameter Name="ProductKey" QueryStringField="ID" />
                                     </SelectParameters>
                                     <UpdateParameters>
                                         <asp:Parameter Name="ProductKey" Type="String" />
                                         <asp:Parameter Name="Images" Type="String" />
                                         <asp:Parameter Name="ProductImagesId" Type="Int32" />
                                     </UpdateParameters>
                                 </asp:SqlDataSource>

                                <br />

                                                