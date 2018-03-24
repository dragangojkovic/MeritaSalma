<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Addcountry.aspx.cs" Inherits="Admin_Addpages" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
  
            <uc1:savediv runat="server" ID="savediv" Visible="false" />
            <div class="row">
              
                <div class="col-md-3">
                    <div class="form form-div">
                        <h3>
               Add Country</h3>
                       
                          <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-12">
                                    
                          <asp:Label ID="Label1" runat="server" Text="Country Name:"></asp:Label><br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                               
                               
                              <asp:TextBox ID="TextBox1" runat="server" placeholder="Country Name:"></asp:TextBox>
                                 
                                <asp:Button ID="Button1" runat="server" Text="Save"  Width="100%" ValidationGroup="a" OnClick="Button1_Click" />
                           </div> </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    
                    <div class="form form-div">
                          <h3>
                Country List</h3>
                    
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Countryid" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" PageSize="30">
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:BoundField DataField="Countryid" HeaderText="Countryid" ReadOnly="True" SortExpression="Countryid" />
                                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Country] WHERE [Countryid] = @Countryid" InsertCommand="INSERT INTO dbo.Country(Country, Image, Status, InsertDate, InsertBy) VALUES (@Country, @Image, @Status, GETDATE(), @InsertBy)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [Countryid], [Country], [Image], [Status], [InsertDate], [InsertBy] FROM [Country]" UpdateCommand="UPDATE [Country] SET [Country] = @Country, [Image] = @Image, [Status] = @Status, [InsertDate] = @InsertDate, [InsertBy] = @InsertBy WHERE [Countryid] = @Countryid">
                            <DeleteParameters>
                                <asp:Parameter Name="Countryid" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="TextBox1" Name="Country" PropertyName="Text" Type="String" />
                                <asp:Parameter Name="Image" Type="String" DefaultValue="No" />
                                <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
                                <asp:Parameter Name="InsertBy" Type="String" DefaultValue="Admin" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Country" Type="String" />
                                <asp:Parameter Name="Image" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="InsertDate" Type="DateTime" />
                                <asp:Parameter Name="InsertBy" Type="String" />
                                <asp:Parameter Name="Countryid" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </div>
                    </div>
                </div>
            </div>
            
       
</asp:Content>

