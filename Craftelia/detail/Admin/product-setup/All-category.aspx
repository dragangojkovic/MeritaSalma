<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="All-category.aspx.cs" Inherits="Admin_usercontrol_Allcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
          
                <div class="col-md-10 col-md-offset-1">
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

                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="30">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" ReadOnly="True" SortExpression="CategoryId" />
                                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                                <asp:TemplateField HeaderText="Icon" SortExpression="Icon">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Icon") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl='<%# Eval("Icon") %>' Width="50px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FrontBanner" SortExpression="FrontBanner">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FrontBanner") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" Height="50px" ImageUrl='<%# Eval("FrontBanner") %>' Width="50px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Category] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [Category] ([CategoryName], [Icon], [FrontBanner], [Status]) VALUES (@CategoryName, @Icon, @FrontBanner, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [CategoryId], [CategoryName], [Icon], [FrontBanner], [Status] FROM [Category]
WHERE  (Status = @status) AND (CategoryName LIKE N'%' + @key + N'%')" UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName, [Icon] = @Icon, [FrontBanner] = @FrontBanner, [Status] = @Status WHERE [CategoryId] = @CategoryId">
                            <DeleteParameters>
                                <asp:Parameter Name="CategoryId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CategoryName" Type="String" />
                                <asp:Parameter Name="Icon" Type="String" />
                                <asp:Parameter Name="FrontBanner" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList2" DefaultValue="" Name="status" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="TextBox2" DefaultValue="%" Name="key" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CategoryName" Type="String" />
                                <asp:Parameter Name="Icon" Type="String" />
                                <asp:Parameter Name="FrontBanner" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="CategoryId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        </div>     </div>     </div>
</asp:Content>

