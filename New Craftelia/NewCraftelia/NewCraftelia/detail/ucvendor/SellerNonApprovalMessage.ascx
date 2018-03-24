<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellerNonApprovalMessage.ascx.cs" Inherits="usercontrol_SellerApproval" %>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AdminApproval FROM Profile WHERE (AccountMasterType &lt;&gt; N'Buyer') AND (UserName = @UserName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
<div class="alert alert-danger center" id="notify" runat="server" visible="false">
You are successfully Registered with us. You cannot add products in your store unless your account is approved. <br />
Your account is under reviewed due to following reason:<br />
1. You have not filled your below vendor profile.<br />
2. if you have already filled it so you will be notify in 24 to 72 hours.</div>