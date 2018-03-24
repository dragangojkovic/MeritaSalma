<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Add-Category.aspx.cs" Inherits="Admin_Addpages" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      

            
            <div class="row">
          
                <div class="col-md-4">
                    <uc1:savediv runat="server" id="savediv" Visible="false" />
                    <div class="form form-div">

                        <h3>
            
 Add Category</h3>
                      
                          <div class="form-horizontal">
                            <div class="form-group">
                               
                                  
                          <asp:Label ID="Label1" runat="server" Text="Category Name:"></asp:Label>
                                   
                               
                           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                               
                              
                           </div>
                                 <div class="form-group">
                               
                                  
                          <asp:Label ID="Label3" runat="server" Text="Icon:"></asp:Label>
                                   
                               
                                     <asp:FileUpload ID="FileUpload1" runat="server" />
                                     <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=btnUpload.ClientID %>").click();
                                }
                            }
</script>
                             
                               
                              
                           </div>

                                <div class="form-group">
                               
                                  
                          <asp:Label ID="Label4" runat="server" Text="Front Banner:"></asp:Label>
                                   
                               
                                     <asp:FileUpload ID="FileUpload2" runat="server" />

                                       <asp:Button ID="Button2" Text="Upload" runat="server" OnClick="Upload2" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile2(fileUpload2) {
                                        if (fileUpload2.value != '') {
                                            document.getElementById("<%=Button2.ClientID %>").click();
                                        }
                                    }
</script>
                             
                                   
                            
                               
                              
                           </div>
                                <div class="form-group">
                              
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">Active</asp:ListItem>
                                        <asp:ListItem>InActive</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <br />
                              
                                <asp:Button ID="Button1" runat="server" Text="Save" ValidationGroup="a" OnClick="Button1_Click" />
                                    <asp:Label ID="Label5" runat="server" CssClass="text-danger"></asp:Label>
                                    </div>
                        </div>
                    </div>
                </div>
              
                <div class="col-md-7 col-md-offset-1">
                    <div class="form form-div">
                        <h3>
                            Icon Image Preview
                        </h3>

                        <asp:Image ID="Image1" runat="server" Width="50px" ImageUrl="~/DynamicImage/NoImage.jpg" />
                    </div>
                    <br />
                             <div class="form form-div">
                        <h3>
                            Front Banner Image Preview
                        </h3>

                        <asp:Image ID="Image2" runat="server" Width="200px"  ImageUrl="~/DynamicImage/NoImage.jpg"/>
                    </div>
                </div>
                
                
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Category(CategoryName, Status, Icon, FrontBanner) VALUES (@categoryname, @status, @Icon, @FrontBanner)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName, Icon, FrontBanner, Status FROM Category WHERE (CategoryId = @ID)" UpdateCommand="UPDATE Category SET CategoryName = @CategorynName, Icon = @Icon, FrontBanner = @FrontBanner, Status = @Status
where CategoryID=@ID">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="categoryname" PropertyName="Text" />
                        <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="Active" Name="status" PropertyName="SelectedValue" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="CategorynName" PropertyName="Text" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="Status" PropertyName="SelectedValue" />
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
            
                
            </div>
            
      
</asp:Content>

