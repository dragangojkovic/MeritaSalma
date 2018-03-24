<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="socialmedia.aspx.cs" Inherits="Admin_Addpages" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    

            
            <div class="row">    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
              
                <div class="col-md-3">
                    <uc1:savediv runat="server" ID="savediv" Visible="False" />
                    <div class="form form-div">
                        <h3>
           
Socail Media</h3>
                        <div>
                          <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-12">
                                    
                          <asp:Label ID="Label1" runat="server" Text="Image:"></asp:Label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="text text-danger" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                               
                               
                          <div>

                       
                                   <asp:FileUpload ID="FileUpload1" runat="server" Width="100%" />
                                  
                                    </div>
                           
                                
                                        <asp:Label ID="Label4" runat="server" Text="URL:"></asp:Label>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>  
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="text text-danger" ControlToValidate="TextBox2" Display="Dynamic"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid URL is Required" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ControlToValidate="TextBox2" Display="Dynamic"></asp:RegularExpressionValidator>
                                    
                                  
                                 
                              
                                      
                               
                               <div class="form-group">
                                   <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                       <asp:ListItem Selected="True">Active</asp:ListItem>
                                       <asp:ListItem>InActive</asp:ListItem>
                                   </asp:RadioButtonList>
                                 
                               </div> 
                             
                                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-color" Width="100%" ValidationGroup="a" OnClick="Button1_Click" />
                           </div> </div>
                        </div></div>
                    </div>
                </div>
            
                <div class="col-md-9">
                    
                    <div class="form form-div">
                          <h3>
             Images</h3>
                        <div>
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SocialMediaId" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." AllowPaging="True" Width="100%" PageSize="30">
                            <Columns>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                                <asp:BoundField DataField="SocialMediaId" HeaderText="SocialMediaId" ReadOnly="True" SortExpression="SocialMediaId" InsertVisible="False" />
                                <asp:TemplateField HeaderText="Icon" SortExpression="Icon">
                                    <EditItemTemplate>
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Icon") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Icon") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Status") %>'>
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>InActive</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM SocialMedia WHERE (SocialMediaId = @SocialMediaId)" InsertCommand="INSERT INTO [Slider] ([SliderImage], [Status]) VALUES (@SliderImage, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Icon, URL, Status, SocialMediaId FROM SocialMedia" UpdateCommand="UPDATE SocialMedia SET  URL = @URL, Status = @Status
where SocialMediaId =@SocialMediaId">
                            <DeleteParameters>
                                <asp:Parameter Name="SocialMediaId" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="SliderImage" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="URL" />
                                <asp:Parameter Name="Status" />
                                <asp:Parameter Name="SocialMediaId" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </div></div>
                    </div>
                </div>
            </div>
            

                     
     

    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO SocialMedia(Icon, URL, Status) VALUES (@Image, @URL, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
          <InsertParameters>
              <asp:ControlParameter ControlID="RadioButtonList1" Name="Status" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="TextBox2" Name="URL" PropertyName="Text" />
          </InsertParameters>
      </asp:SqlDataSource>
</asp:Content>

