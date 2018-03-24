<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Warranty.aspx.cs" Inherits="Admin_usercontrol_type" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="row">
                
                <div class="col-md-3">
                    <uc1:savediv runat="server" ID="savediv" Visible="false" />
                    <div class="form form-div">
                        <h3>
         
 Warranty </h3>
                      
                          <div class="form-horizontal">
                            <div class="form-group">
                                 <asp:Label ID="Label1" runat="server" Text="Warranty:"></asp:Label><br />
                                    
                          <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

                                </div> 

                              <div class="form-group">
                                    <asp:Button ID="Button1" runat="server" Text="Save" Width="100%" ValidationGroup="a" OnClick="Button1_Click" />
                              </div>

                          </div> </div> </div> 
               <div class="col-md-8">
                    <div class="form form-div">

                        <div class="row">
                                <div class="col-md-3"> <h3>
         
View & Edit </h3>
                             </div>
                       <div class="col-md-3">
                           <br />
                           Keyword Search:
                           <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                       </div>
                         <div class="col-md-3">
                             <br />
                             Status: <br />
                             <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                                 <asp:ListItem Selected="True">Active</asp:ListItem>
                                                <asp:ListItem>InActive</asp:ListItem>
                             </asp:RadioButtonList>
                             </div>
                         <div class="col-md-3">
                             <br /> <br />
                             <asp:Button ID="Button2" runat="server" Text="Refresh"  />
                             </div>
                   </div>

                        <div class="table-responsive">
                              
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  PageSize="30" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="WarrantyId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:BoundField DataField="WarrantyId" HeaderText="WarrantyId" ReadOnly="True" SortExpression="WarrantyId" />
                                    <asp:BoundField DataField="Warranty" HeaderText="Warranty" SortExpression="Warranty" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Warranty] WHERE [WarrantyId] = @WarrantyId" InsertCommand="INSERT INTO [Warranty] ([Warranty], [Status]) VALUES (@Warranty, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [WarrantyId], [Warranty], [Status] FROM [Warranty]
WHERE  (Status = @status) AND (Warranty LIKE N'%' + @key + N'%')" UpdateCommand="UPDATE [Warranty] SET [Warranty] = @Warranty, [Status] = @Status WHERE [WarrantyId] = @WarrantyId">
                                <DeleteParameters>
                                    <asp:Parameter Name="WarrantyId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="Warranty" PropertyName="Text" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="RadioButtonList2" Name="status" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="TextBox2" DefaultValue="%" Name="key" PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Warranty" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="WarrantyId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </div>
                        </div>
                   </div>

      </div> 
</asp:Content>

