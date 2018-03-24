<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Add-sub-category.aspx.cs" Inherits="Admin_Addpages" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
             
                <div class="col-md-3">

                    <uc1:savediv runat="server" ID="savediv" Visible ="false"/>
                    <div class="form form-div">
                        <h3>
           
 Add Sub Category</h3>
                       
                          <div class="form-horizontal">
                            <div class="form-group">
                            
                                    
                          <asp:Label ID="Label1" runat="server" Text="Category Name:"></asp:Label>
                                 
                               
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
                             
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                   </div>
                                       <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Sub Category Name:"></asp:Label>
                                   
                            <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                  

  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="text text-danger" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                               </div>
                               
                               
                                <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-color" Width="100%" ValidationGroup="a" OnClick="Button1_Click" />
                                    </div>
                          </div>
                        </div>
                    </div>
               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO SCategory(CategoryId, SCategoryname, Status) VALUES (@category, @Scategoryname, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="Scategoryname" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="category" PropertyName="SelectedValue" />
                        <asp:Parameter DefaultValue="Active" Name="Status" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <div class="col-md-9">
                    
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
                         
                        <asp:GridView ID="GridView1" runat="server"  PageSize="30" AutoGenerateColumns="False" DataKeyNames="ScategoryId" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" Width="100%">
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:BoundField DataField="ScategoryId" HeaderText="ScategoryId" ReadOnly="True" SortExpression="ScategoryId" />
                                <asp:TemplateField HeaderText="CategoryName" SortExpression="CategoryName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="CategoryId" SelectedValue='<%# Bind("CategoryId") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="SCategoryname" HeaderText="SCategoryname" SortExpression="SCategoryname" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [SCategory] WHERE [ScategoryId] = @ScategoryId" InsertCommand="INSERT INTO [SCategory] ([CategoryId], [SCategoryname]) VALUES (@CategoryId, @SCategoryname)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SCategory.ScategoryId, SCategory.CategoryId, SCategory.SCategoryname, SCategory.Status, Category.CategoryName FROM SCategory INNER JOIN Category ON SCategory.CategoryId = Category.CategoryId
WHERE  (SCategory.Status = @status) AND ( SCategory.SCategoryname LIKE N'%' + @key + N'%')" UpdateCommand="UPDATE SCategory SET CategoryId = @CategoryId, SCategoryname = @SCategoryname, Status = @Status WHERE (ScategoryId = @ScategoryId)">
                            <DeleteParameters>
                                <asp:Parameter Name="ScategoryId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CategoryId" Type="Int32" />
                                <asp:Parameter Name="SCategoryname" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList2" DefaultValue="" Name="status" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="TextBox2" DefaultValue="%" Name="key" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CategoryId" Type="Int32" />
                                <asp:Parameter Name="SCategoryname" Type="String" />
                                <asp:Parameter Name="ScategoryId" Type="Int32" />
                                <asp:Parameter Name="Status" />
                                <asp:Parameter Name="ScatImage" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                 
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Category] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [Category] ([CategoryName]) VALUES (@CategoryName)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName FROM dbo.Category WHERE (Status = 'Active') ORDER BY CategoryName" UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName WHERE [CategoryId] = @CategoryId">
                            <DeleteParameters>
                                <asp:Parameter Name="CategoryId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CategoryName" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CategoryName" Type="String" />
                                <asp:Parameter Name="CategoryId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </div>
                    </div>
                </div>
           </div>  
            
     
</asp:Content>

