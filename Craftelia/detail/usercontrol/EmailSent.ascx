<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmailSent.ascx.cs" Async="true" Inherits="usercontrol_EmailSent" %>
 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SMTP, BCC, Emailfrom, Password, Port FROM EmailSetup"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT EmailType, EmailText, Subject FROM EmailType WHERE (EmailType = @EmailType)">
    <SelectParameters>
        <asp:QueryStringParameter Name="EmailType" QueryStringField="Type" />
    </SelectParameters>
</asp:SqlDataSource>
