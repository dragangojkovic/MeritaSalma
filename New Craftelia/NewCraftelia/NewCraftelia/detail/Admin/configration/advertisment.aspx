<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="advertisment.aspx.cs" ValidateRequest="false" Inherits="Admin_configration_advertisment" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row">
        <uc1:savediv runat="server" ID="savediv" Visible="false" />
        <div class="col-md-8">

            <div class="form form-div">

                <h3>Advertisement Plans</h3>

                <div class="form-horizontal">
                    <div class="form-group">

                        <div class="col-md-6">
                            <asp:Label ID="Label1" runat="server" Text="Plan Name:"></asp:Label>


                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6">


                            <asp:Label ID="Label2" runat="server" Text="Plan Price:"></asp:Label>


                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

                            <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox2_FilteredTextBoxExtender" TargetControlID="TextBox2" ID="TextBox2_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                               
                              
                           </div>
                           </div>
                               
                               <div class="form-group">
                                <div class="col-md-12">
                                  
                                                     <asp:Label ID="Label3" runat="server" Text="Plan Details:"></asp:Label>
                                   
                               
                           <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                                   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                 <br /> <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />    <br /><br />


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AdvertisingSetupId" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="AdvertisingSetupId" HeaderText="AdvertisingSetupId" ReadOnly="True" SortExpression="AdvertisingSetupId" />
            <asp:BoundField DataField="PackageName" HeaderText="PackageName" SortExpression="PackageName" />
            <asp:BoundField DataField="PackagePrice" HeaderText="PackagePrice" SortExpression="PackagePrice" />
            <asp:TemplateField HeaderText="PackageDetails" SortExpression="PackageDetails">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PackageDetails") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PackageDetails") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="status" SortExpression="status">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("status") %>'>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>InActive</asp:ListItem>
                    </asp:RadioButtonList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

                              </div>
                           </div>
                               



                                   </div>
                             </div>
                         </div>
              </div>
     
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [AdSetup] WHERE [AdvertisingSetupId] = @AdvertisingSetupId" InsertCommand="INSERT INTO [AdSetup] ([PackageName], [PackagePrice], [PackageDetails], [status]) VALUES (@PackageName, @PackagePrice, @PackageDetails, @status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [AdvertisingSetupId], [PackageName], [PackagePrice], [PackageDetails], [status] FROM [AdSetup]" UpdateCommand="UPDATE [AdSetup] SET [PackageName] = @PackageName, [PackagePrice] = @PackagePrice, [PackageDetails] = @PackageDetails, [status] = @status WHERE [AdvertisingSetupId] = @AdvertisingSetupId">
        <DeleteParameters>
            <asp:Parameter Name="AdvertisingSetupId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PackageName" Type="String" />
            <asp:Parameter Name="PackagePrice" Type="Decimal" />
            <asp:Parameter Name="PackageDetails" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PackageName" Type="String" />
            <asp:Parameter Name="PackagePrice" Type="Decimal" />
            <asp:Parameter Name="PackageDetails" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="AdvertisingSetupId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO AdSetup(PackageName, PackagePrice, PackageDetails, status) VALUES (@Package, @PackagePrice, @PackageDetails, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="Package" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="PackagePrice" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" Name="PackageDetails" PropertyName="Text" />
            <asp:Parameter DefaultValue="Active" Name="Status" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

