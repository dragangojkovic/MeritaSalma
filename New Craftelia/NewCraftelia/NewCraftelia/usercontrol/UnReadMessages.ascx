<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UnReadMessages.ascx.cs" Inherits="usercontrol_UnReadMessages" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(*) AS total FROM dbo.Messages WHERE (Status = N'Unread') AND (recepient = (SELECT Id FROM dbo.AspNetUsers AS AspNetUsers_1 WHERE (UserName = @username)))">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="username" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>



<asp:HiddenField ID="HiddenField1" runat="server" />





<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound">
    <ItemTemplate>
        <asp:Label ID="Label1" runat="server" Text='<%# Eval("total") %>'></asp:Label>
    </ItemTemplate>
</asp:ListView>

      
