<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserBalance.ascx.cs" Inherits="usercontrol_UserBalance" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(profit.profit, 0) - ISNULL(withdraw.withdrawamount, 0) AS availablefunds FROM (SELECT SUM(ISNULL(WithdrawAmount, 0)) AS withdrawamount FROM dbo.WithDraw AS WithDraw_1 WHERE (UserName = @UserName)) AS withdraw CROSS JOIN (SELECT ISNULL(REPLACE(SUM(dbo.[Order].commissionamount), '-', ''), 0) AS profit FROM dbo.[Order] INNER JOIN dbo.AspNetUsers ON dbo.[Order].SellerId = dbo.AspNetUsers.Id WHERE (dbo.AspNetUsers.UserName = @UserName) AND (dbo.[Order].Status = 'Active')) AS profit">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />

<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <div class="visible-lg" style="margin:-10px;" > </div>
       <span class="btn btn-color" style="padding:5px; color:black">
           <asp:LinkButton ID="LinkButton1" PostBackUrl="~/seller/Withdraw.aspx" runat="server" ForeColor="Black">Click to withdraw profit</asp:LinkButton> £ <asp:Label ID="Label1" runat="server" Text='<%# Eval("availablefunds") %>' ForeColor="Black"></asp:Label></span>
    </ItemTemplate>
</asp:ListView>

