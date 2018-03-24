<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Slider.aspx.cs" Inherits="Admin_Addpages" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   

            
            <div class="row">    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
             
                <div class="col-md-3">
                    <uc1:savediv runat="server" ID="savediv" Visible="false"/>
                    <div class="form form-div">
                        <h3>
         
 Add Images</h3>
                        <div>
                          <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-12">
                                    
                   
                                    
                               
                          
                                   <asp:FileUpload ID="FileUpload1" runat="server" Width="100%" />
                                  
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                               
                         

                                      
                               
                               <div class="form-group">
                                   <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                       <asp:ListItem Selected="True">Active</asp:ListItem>
                                       <asp:ListItem>InActive</asp:ListItem>
                                   </asp:RadioButtonList>
                                 
                               </div> 
                                
                                     <div class="form-group">

                                     URL:
                               
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                   
                                        </div> 
                                        <div visible="false" runat="server" id="dv">   <asp:TextBox ID="TextBox2" runat="server" >No</asp:TextBox><br /></div>
                                     <div class="form-group">
                                   <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal">
                                       <asp:ListItem Selected="True">Slider</asp:ListItem>
                                       <asp:ListItem>Banner</asp:ListItem>
                                   </asp:RadioButtonList>
                                 
                               </div>   
                                   

 <div class="form-group">
                                   <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal">
                                       <asp:ListItem Selected="True">Horizontal</asp:ListItem>
                                       <asp:ListItem>Vertical</asp:ListItem>
                                   </asp:RadioButtonList>
                                 
                               </div> 

                                
                                    <br />
                             
                                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-color" Width="100%" ValidationGroup="a" OnClick="Button1_Click" />
                           </div> </div>
                        </div></div>
                    </div>
                </div>
            
                <div class="col-md-9">
                    
                    <div class="form form-div">
                          <h2>
              Images</h2>
                        <div>
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SliderID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." AllowPaging="True" Width="100%" AllowSorting="True" PageSize="30">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="SliderID" HeaderText="SliderID" ReadOnly="True" SortExpression="SliderID" />
                                <asp:TemplateField HeaderText="SliderImage" SortExpression="SliderImage">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SliderImage") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="75px" ImageUrl='<%# Eval("SliderImage") %>' Width="75px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                <asp:BoundField DataField="BannerType" HeaderText="BannerType" SortExpression="BannerType" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Slider] WHERE [SliderID] = @SliderID" InsertCommand="INSERT INTO [Slider] ([SliderImage], [Status]) VALUES (@SliderImage, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SliderID, SliderImage, Status, URL, Type, BannerType FROM Slider" UpdateCommand="UPDATE [Slider] SET [SliderImage] = @SliderImage, [Status] = @Status WHERE [SliderID] = @SliderID">
                            <DeleteParameters>
                                <asp:Parameter Name="SliderID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="SliderImage" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="SliderImage" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="SliderID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </div></div>
                    </div>
                </div>
            </div>
            
      

    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Slider(SliderImage, Status, URL, Type, BannerType) VALUES (@Image, @Status, @URL, @Type, @BannerType)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
          <InsertParameters>
              <asp:ControlParameter ControlID="RadioButtonList1" Name="Status" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="TextBox2" Name="URL" PropertyName="Text" />
              <asp:ControlParameter ControlID="RadioButtonList4" Name="Type" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="RadioButtonList3" Name="BannerType" PropertyName="SelectedValue" />
          </InsertParameters>
      </asp:SqlDataSource>
</asp:Content>

