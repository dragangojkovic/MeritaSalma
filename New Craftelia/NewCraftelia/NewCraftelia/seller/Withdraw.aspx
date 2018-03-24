<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Withdraw.aspx.cs" Inherits="seller_Withdraw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">

        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
        <div class="row">
          
            <div class="col-md-offset-3 col-md-6">
                <div class="form form-div"> <h3>
               
                 Withdraw</h3>  <br />  <br />
  <b>Paypal ID: </b>  <br />
    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="(Please be careful before click with draw button that your paypal id should be correct) "></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>  
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="required" ErrorMessage="Field is required" ValidationGroup="b"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" CssClass="required" ErrorMessage="Valid email is required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="b"></asp:RegularExpressionValidator>
    <br />
    <br />
    Available Profit:
    <asp:Label ID="Label2" runat="server" Text="0"></asp:Label>
    <br />

    <asp:Button ID="Button1" runat="server" Text="Withdraw" OnClick="Button1_Click" OnClientClick="if (!Page_ClientValidate('b')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" ValidationGroup="b" />

    <br />
    <asp:HiddenField ID="HiddenField1" runat="server" />

                    <asp:HiddenField ID="HiddenField2" runat="server" />
                    <asp:Label ID="Label3" runat="server" CssClass="required"></asp:Label>
    <br />
                </div>
            </div>
        </div>
    </div>
 
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(profit.profit, 0) - ISNULL(withdraw.withdrawamount, 0) AS availablefunds FROM (SELECT SUM(ISNULL(WithdrawAmount, 0)) AS withdrawamount FROM dbo.WithDraw AS WithDraw_1 WHERE (UserName = @UserName)) AS withdraw CROSS JOIN (SELECT ISNULL(REPLACE(SUM(dbo.[Order].commissionamount), '-', ''), 0) AS profit FROM dbo.[Order] INNER JOIN dbo.AspNetUsers ON dbo.[Order].SellerId = dbo.AspNetUsers.Id WHERE (dbo.AspNetUsers.UserName = @UserName)) AS profit">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(paypal, '') AS paypal FROM dbo.Profile WHERE (UserName = @UserName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO dbo.WithDraw(UserName, Withdrawdate, WithdrawAmount, PaypalId) VALUES (@UserName, GETDATE(), @Amount, @paypal)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
        <InsertParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
            <asp:ControlParameter ControlID="Label2" Name="Amount" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox1" Name="paypal" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>

