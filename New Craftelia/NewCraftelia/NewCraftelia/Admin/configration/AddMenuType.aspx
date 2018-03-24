<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AddMenuType.aspx.cs" Inherits="Admin_Addpages" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     

            
            <div class="row">
              
                <div class="col-md-3">

                    <uc1:savediv runat="server" ID="savediv" Visible="false" />

                    <div class="form form-div">
                        <h3>
         
 Footer Menu Category</h3>
                        <div >
                          <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-12">
                                    
                          <asp:Label ID="Label1" runat="server" Text="Category Name:"></asp:Label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                               
                               
                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                              
                            
                         
                                <asp:Button ID="Button1" runat="server" Text="Save" Width="100%" ValidationGroup="a" OnClick="Button1_Click" />
                           </div> </div>
                        </div></div>
                    </div>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO MenuTitle(MenuTitle, Status) VALUES (@MenuTitle, @status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="MenuTitle" PropertyName="Text" />
                        <asp:Parameter DefaultValue="Active" Name="status" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <div class="col-md-9">
                    
                    <div class="form form-div">
                          <h3>
               View / Edit</h3>
                     
                    <div class="table-responsive">
                    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MenuTitleId" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." Width="100%" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:BoundField DataField="MenuTitleId" HeaderText="MenuTitleId" ReadOnly="True" SortExpression="MenuTitleId" />
                                <asp:BoundField DataField="MenuTitle" HeaderText="MenuTitle" SortExpression="MenuTitle" />
                                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Status") %>'>
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>InActive</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [MenuTitle] WHERE [MenuTitleId] = @MenuTitleId" InsertCommand="INSERT INTO [MenuTitle] ([MenuTitle]) VALUES (@MenuTitle)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [MenuTitleId], [MenuTitle], Status FROM [MenuTitle]" UpdateCommand="UPDATE [MenuTitle] SET [MenuTitle] = @MenuTitle,  [Status] = @Status WHERE [MenuTitleId] = @MenuTitleId">
                            <DeleteParameters>
                                <asp:Parameter Name="MenuTitleId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="MenuTitle" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="MenuTitle" Type="String" />
                                <asp:Parameter Name="MenuTitleId" Type="Int32" />
                                <asp:Parameter Name="Status" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>
                </div>
            </div>
            
      
</asp:Content>

