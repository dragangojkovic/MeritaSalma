<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AddCity.aspx.cs" Inherits="Admin_AddCategory" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <uc1:savediv runat="server" ID="savediv" Visible="false" />






    <div class="row">
                  <br />  
        <div class="col-md-3 form form-div">



 <h3>
        City
    </h3> 
                      <div class="form-horizontal">
                          <div class="form-group">
 Key ID:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><asp:Label ID="Label2" runat="server"></asp:Label>

                          </div>
                           <div class="form-group">
Country:<asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="Country" DataValueField="Countryid" CssClass="form-control">
                <asp:ListItem Value="0">Please Select Country</asp:ListItem>
            </asp:DropDownList>
                               </div>

                           <div class="form-group">
Ctiy Name: <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="City Name is required" ValidationGroup="a" CssClass="required"></asp:RequiredFieldValidator>
                     </div>
                          <div class="form-group">
                             Status:  <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Active</asp:ListItem>
                <asp:ListItem>Pending</asp:ListItem>
            </asp:RadioButtonList> </div>

                           <div class="form-group">
 <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" ValidationGroup="a" CssClass="btn btn-default" />
                               </div>

                      </div>


        </div>
   
    <div class="col-md-8"><div class="form form-div">

                        
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="Country" DataValueField="Country" CssClass="form-control" AutoPostBack="True" Width="200px">
                <asp:ListItem Value="0">Please Select Country</asp:ListItem>
            </asp:DropDownList>
        
        <div class="table-responsive">

       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CityID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." Width="100%">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="CityID" HeaderText="CityID" ReadOnly="True" SortExpression="CityID" />
                        <asp:TemplateField HeaderText="Country" SortExpression="Countryid">
                            <EditItemTemplate>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Category] WHERE [Categoryid] = @Categoryid" InsertCommand="INSERT INTO [Category] ([CategoryName], [Insertby], [InsertDate], [Status], [CategoryIcon]) VALUES (@CategoryName, @Insertby, @InsertDate, @Status, @CategoryIcon)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Countryid, Country, Status FROM dbo.Country WHERE (Status = N'Active')" UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName, [Insertby] = @Insertby, [InsertDate] = @InsertDate, [Status] = @Status, [CategoryIcon] = @CategoryIcon WHERE [Categoryid] = @Categoryid">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Categoryid" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="CategoryName" Type="String" />
                                        <asp:Parameter Name="Insertby" Type="String" />
                                        <asp:Parameter Name="InsertDate" Type="DateTime" />
                                        <asp:Parameter Name="Status" Type="String" />
                                        <asp:Parameter Name="CategoryIcon" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="CategoryName" Type="String" />
                                        <asp:Parameter Name="Insertby" Type="String" />
                                        <asp:Parameter Name="InsertDate" Type="DateTime" />
                                        <asp:Parameter Name="Status" Type="String" />
                                        <asp:Parameter Name="CategoryIcon" Type="String" />
                                        <asp:Parameter Name="Categoryid" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="Country" DataValueField="Countryid" SelectedValue='<%# Bind("Countryid") %>'>
                                    <asp:ListItem Value="0">Please Select Category</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CityName" HeaderText="City Name" SortExpression="CityName" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="InsertDate" HeaderText="Insert Date" SortExpression="InsertDate" />
                        <asp:BoundField DataField="InsertBy" HeaderText="Insert By" SortExpression="InsertBy" />
                    </Columns>
                </asp:GridView>  </div>
 </div>
    </div>
 </div>

    
    <br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
    InsertCommand="INSERT INTO dbo.City(Countryid, CityName, Status, InsertDate, InsertBy) VALUES (@CountryId, @CityName, @Status, GETDATE(), @InsertBy)" 
    
    ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" 
    oninserted="SqlDataSource1_Inserted">
    <InsertParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="InsertBy" 
            PropertyName="Value" />
        <asp:ControlParameter ControlID="RadioButtonList1" Name="Status" 
            PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DropDownList2" Name="CountryId" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="TextBox1" Name="CityName" 
            PropertyName="Text" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
    DeleteCommand="DELETE FROM [Category] WHERE [Categoryid] = @Categoryid" 
    InsertCommand="INSERT INTO [Category] ([CategoryName], [Insertby], [InsertDate], [Status], [CategoryIcon]) VALUES (@CategoryName, @Insertby, @InsertDate, @Status, @CategoryIcon)" 
    ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" 
    SelectCommand="SELECT Countryid, Country, Status FROM dbo.Country WHERE (Status = N'Active')
order by country" 
    
        UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName, [Insertby] = @Insertby, [InsertDate] = @InsertDate, [Status] = @Status, [CategoryIcon] = @CategoryIcon WHERE [Categoryid] = @Categoryid">
    <DeleteParameters>
        <asp:Parameter Name="Categoryid" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CategoryName" Type="String" />
        <asp:Parameter Name="Insertby" Type="String" />
        <asp:Parameter Name="InsertDate" Type="DateTime" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="CategoryIcon" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CategoryName" Type="String" />
        <asp:Parameter Name="Insertby" Type="String" />
        <asp:Parameter Name="InsertDate" Type="DateTime" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="CategoryIcon" Type="String" />
        <asp:Parameter Name="Categoryid" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [City] WHERE [CityID] = @CityID" InsertCommand="INSERT INTO [City] ([Countryid], [CityName], [Image], [Status], [InsertDate], [InsertBy]) VALUES (@Countryid, @CityName, @Image, @Status, @InsertDate, @InsertBy)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.City.CityID, dbo.City.Countryid, dbo.City.CityName, dbo.City.Image, dbo.City.Status, dbo.City.InsertDate, dbo.City.InsertBy, dbo.Country.Country FROM dbo.City INNER JOIN dbo.Country ON dbo.City.Countryid = dbo.Country.Countryid WHERE (dbo.Country.Country LIKE N'%' + @Country + N'%')" UpdateCommand="UPDATE [City] SET [Countryid] = @Countryid, [CityName] = @CityName, [Image] = @Image, [Status] = @Status, [InsertDate] = @InsertDate, [InsertBy] = @InsertBy WHERE [CityID] = @CityID">
    <DeleteParameters>
        <asp:Parameter Name="CityID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Countryid" Type="Int32" />
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="Image" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="InsertDate" Type="DateTime" />
        <asp:Parameter Name="InsertBy" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="Country" PropertyName="SelectedValue" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Countryid" Type="Int32" />
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="Image" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="InsertDate" Type="DateTime" />
        <asp:Parameter Name="InsertBy" Type="String" />
        <asp:Parameter Name="CityID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

