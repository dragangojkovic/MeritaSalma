<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserFullNameDisplay.ascx.cs" Inherits="usercontrol_UserFullNameDisplay" %>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(VendorName, 'Anonymous') AS VendorName FROM Profile WHERE (UserName = @UserName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
   <ItemTemplate>

        <asp:Label ID="Label1" runat="server" Text='<%# Eval("VendorName") %>' ></asp:Label>
   </ItemTemplate>
</asp:ListView>

