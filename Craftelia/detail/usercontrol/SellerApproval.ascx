<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellerApproval.ascx.cs" Inherits="usercontrol_SellerApproval" %>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AdminApproval FROM Profile WHERE (AccountMasterType &lt;&gt; N'Buyer') AND (UserName = @UserName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
