<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Add-pages.aspx.cs" Inherits="Admin_Addpages" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
            
            <div class="row">
                
                <div class="col-md-3">
                    <uc1:savediv runat="server" ID="savediv" Visible="false"/>
                    <div class="form form-div">
                        <h3>
         
 Add Page</h3>
                      
                          <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-12">
                                       <br />     Select menu type:
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Selected="True">Header</asp:ListItem>
                <asp:ListItem>Footer</asp:ListItem>
            </asp:RadioButtonList>
                                    <br />
                          <asp:Label ID="Label1" runat="server" Text="Page Title:"></asp:Label><br />
                                    
                          <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

                                    <div id="footercat" runat="server" visible="false">
                                        <asp:Label ID="Label3" runat="server" Text="Footer Category:"></asp:Label><br />
                                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="MenuTitle" DataValueField="MenuTitleId">
                                            <asp:ListItem Value="0">Select Footer Category</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="DropDownList1" InitialValue="0" Enabled="False"></asp:RequiredFieldValidator>

                                    </div>

                              <div>

                                  <asp:Label ID="Label2" runat="server" Text="URL:"></asp:Label>
                                  
                                  <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:TextBox ID="TextBox2" runat="server" Visible="false" >NO</asp:TextBox>
                             </div>   <hr />
                                <asp:Button ID="Button1" runat="server" Text="Save" Width="100%" ValidationGroup="a" OnClick="Button1_Click" />
                           </div> </div>
                        </div>
                    </div>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO dbo.PageTitle(PageTitle, HFData, URL, MenuTitleId) VALUES (@pagetitle, @HF, @URL, @MenuTitle)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="pagetitle" PropertyName="Text" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="HF" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TextBox2" Name="URL" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="MenuTitle" PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <div class="col-md-9">
                    
                    <div class="form form-div">
                   
                        <div>
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PageTitleId" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." PageSize="30">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="PageTitleId" HeaderText="PageTitleId" ReadOnly="True" SortExpression="PageTitleId" />
                                <asp:BoundField DataField="PageTitle" HeaderText="PageTitle" SortExpression="PageTitle" />
                                <asp:BoundField DataField="HFData" HeaderText="HFData" SortExpression="HFData" />
                                <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                                <asp:BoundField DataField="MenuTitle" HeaderText="MenuTitle" SortExpression="MenuTitle" />
                            </Columns>
                            <PagerStyle BorderStyle="None" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [PageTitle] WHERE [PageTitleId] = @PageTitleId" InsertCommand="INSERT INTO [PageTitle] ([PageTitle], [HFData], [URL]) VALUES (@PageTitle, @HFData, @URL)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.PageTitle.PageTitleId, dbo.PageTitle.PageTitle, dbo.PageTitle.HFData, dbo.PageTitle.URL, dbo.PageTitle.MenuTitleId, MenuTitle.MenuTitle FROM dbo.PageTitle LEFT OUTER JOIN MenuTitle ON dbo.PageTitle.MenuTitleId = MenuTitle.MenuTitleId" UpdateCommand="UPDATE [PageTitle] SET [PageTitle] = @PageTitle, [HFData] = @HFData, [URL] = @URL WHERE [PageTitleId] = @PageTitleId">
                            <DeleteParameters>
                                <asp:Parameter Name="PageTitleId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="PageTitle" Type="String" />
                                <asp:Parameter Name="HFData" Type="String" />
                                <asp:Parameter Name="URL" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="PageTitle" Type="String" />
                                <asp:Parameter Name="HFData" Type="String" />
                                <asp:Parameter Name="URL" Type="String" />
                                <asp:Parameter Name="PageTitleId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT MenuTitleId, MenuTitle, Status FROM MenuTitle WHERE (Status = N'Active') ORDER BY MenuTitle"></asp:SqlDataSource>
                        <br />
                    </div></div>
                    </div>
                </div>
            </div>
            
      
</asp:Content>

