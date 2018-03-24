<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AllAds.aspx.cs" Inherits="Admin_reports_AllAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="form form-div">
        <h3>
            All Ads Request
        </h3>
  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AdvertisingId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
    <Columns>


        <asp:CommandField ShowEditButton="True" />
        <asp:TemplateField>

            
            <ItemTemplate>
                <asp:CheckBox ID="chkSelect" runat="server" />
                <asp:Label ID="lblFilePath" runat="server" Text='<%# Eval("ZipFile") %>' Visible="true"></asp:Label>
            </ItemTemplate>

            
        </asp:TemplateField>
        <asp:BoundField DataField="AdvertisingId" HeaderText="AdvertisingId" ReadOnly="True" SortExpression="AdvertisingId" />
        <asp:BoundField DataField="Advertisesetupid" HeaderText="Advertisesetupid" SortExpression="Advertisesetupid" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
        <asp:BoundField DataField="InsertDate" HeaderText="InsertDate" SortExpression="InsertDate" />
        <asp:TemplateField HeaderText="Status" SortExpression="Status">
            <EditItemTemplate>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Status") %>'>
                    <asp:ListItem>Pending</asp:ListItem>
                    <asp:ListItem>Rejected</asp:ListItem>
                    <asp:ListItem>Processed</asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView> <br /> <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Click on checkbox and download the zip file" /> </div>
    

    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Advertisement] WHERE [AdvertisingId] = @AdvertisingId" InsertCommand="INSERT INTO [Advertisement] ([Advertisesetupid], [ZipFile], [Name], [Email], [Contact], [InsertDate], [Status]) VALUES (@Advertisesetupid, @ZipFile, @Name, @Email, @Contact, @InsertDate, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [AdvertisingId], [Advertisesetupid], [ZipFile], [Name], [Email], [Contact], [InsertDate], [Status] FROM [Advertisement]

order by advertisingid desc" UpdateCommand="UPDATE [Advertisement] SET [Advertisesetupid] = @Advertisesetupid, [ZipFile] = @ZipFile, [Name] = @Name, [Email] = @Email, [Contact] = @Contact, [InsertDate] = @InsertDate, [Status] = @Status WHERE [AdvertisingId] = @AdvertisingId">
    <DeleteParameters>
        <asp:Parameter Name="AdvertisingId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Advertisesetupid" Type="Int32" />
        <asp:Parameter Name="ZipFile" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Contact" Type="String" />
        <asp:Parameter Name="InsertDate" Type="DateTime" />
        <asp:Parameter Name="Status" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Advertisesetupid" Type="Int32" />
        <asp:Parameter Name="ZipFile" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Contact" Type="String" />
        <asp:Parameter Name="InsertDate" Type="DateTime" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="AdvertisingId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>


</asp:Content>

