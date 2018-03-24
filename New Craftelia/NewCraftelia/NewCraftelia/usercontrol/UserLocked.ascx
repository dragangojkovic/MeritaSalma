<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserLocked.ascx.cs" Inherits="usercontrol_UserLocked" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AdminApproval AS Status FROM Profile WHERE (UserName = @UserName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:HiddenField ID="HiddenField1" runat="server" />
