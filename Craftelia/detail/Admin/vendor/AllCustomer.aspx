<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AllCustomer.aspx.cs" Inherits="Admin_vendor_AllVendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <br />
    <br />
    <div class="form form-div">
        <h3>
            All Buyers
        </h3>

        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Search by Customer Name"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Refresh" />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" PageSize="30" DataKeyNames="UserName" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="Enable/Disable" ShowSelectButton="True" />
                <asp:BoundField DataField="lock" HeaderText="Is Account Locked" SortExpression="lock" />
            </Columns>
        </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Customer.CustomerID, Customer.FullName, Customer.Shippingaddress, Customer.City, Customer.Country, Customer.UserName, CAST(AspNetUsers.LockoutEnabled AS int) AS LockoutEnabled, AspNetUsers.LockoutEnabled AS lock FROM Customer INNER JOIN AspNetUsers ON Customer.UserName = AspNetUsers.UserName WHERE (Customer.FullName LIKE '%' + @customername + '%') ORDER BY Customer.CustomerID" UpdateCommand="UPDATE dbo.AspNetUsers SET LockoutEnabled = @Lockout FROM dbo.AspNetUsers
where username=@username">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" Name="customername" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Customer.CustomerID, Customer.FullName, Customer.Shippingaddress, Customer.City, Customer.Country, Customer.UserName, CAST(AspNetUsers.LockoutEnabled AS int) AS LockoutEnabled, AspNetUsers.LockoutEnabled AS lock FROM Customer INNER JOIN AspNetUsers ON Customer.UserName = AspNetUsers.UserName WHERE (Customer.UserName =@customer) ORDER BY Customer.CustomerID" UpdateCommand="UPDATE dbo.AspNetUsers SET LockoutEnabled = @Lockout FROM dbo.AspNetUsers
where username=@username">
        <SelectParameters>
            <asp:SessionParameter Name="customer" SessionField="ID" />
        </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <asp:HiddenField ID="HiddenField1" runat="server" />

   </div>
</asp:Content>

