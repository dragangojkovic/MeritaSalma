<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AllVendor.aspx.cs" Inherits="Admin_vendor_AllVendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <br />
    <br />
    <div class="form form-div">
        <h3>
            All Vendors
        </h3>
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Search by Vendor Name"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Refresh" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProfileId" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" PageSize="30" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="View Profile" ShowSelectButton="True" />
            <asp:BoundField DataField="ProfileId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ProfileId" />
            <asp:BoundField DataField="VendorName" HeaderText="Vendor" SortExpression="VendorName" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="TelePhone" HeaderText="TelePhone" SortExpression="TelePhone" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
            <asp:BoundField DataField="Emailaddress" HeaderText="Emailaddress" SortExpression="Emailaddress" />
            <asp:BoundField DataField="InsertDate" HeaderText="InsertDate" SortExpression="InsertDate" />
            <asp:BoundField DataField="AccountMasterType" HeaderText="AccountMasterType" SortExpression="AccountMasterType" />
            <asp:BoundField DataField="AdminApproval" HeaderText="AdminApproval" SortExpression="AdminApproval" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfileId, UserName, Country, City, District, Street, Building, TelePhone, Mobile, Emailaddress, VendorName, VendorLogo, ID, License, Permission, Reg, InsertDate, AccountMasterType, AdminApproval FROM dbo.Profile WHERE (AccountMasterType &lt;&gt; N'Buyer') and VendorName like '%'+@vendorname+'%' ORDER BY ProfileId">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" Name="vendorname" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>

   </div>
</asp:Content>

