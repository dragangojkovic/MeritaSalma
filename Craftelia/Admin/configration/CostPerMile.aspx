<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="CostPerMile.aspx.cs" Inherits="Admin_configration_CostPerMile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="form form-div">
    <div class="table-responsive">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
    <Columns>
        <asp:CommandField ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
    </Columns>
</asp:GridView>

    </div></div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [costpermile] WHERE [Id] = @Id" InsertCommand="INSERT INTO [costpermile] ([Cost]) VALUES (@Cost)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [Id], [Cost] FROM [costpermile]" UpdateCommand="UPDATE [costpermile] SET [Cost] = @Cost WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Cost" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Cost" Type="Int32" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>



</asp:Content>

