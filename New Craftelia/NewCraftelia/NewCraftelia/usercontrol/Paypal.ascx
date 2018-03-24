<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Paypal.ascx.cs" Inherits="usercontrol_Paypal" %>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SUM(Amount + deliverycostperitem) AS Total FROM dbo.[Order] WHERE (OrderNo = @OrderNo)">
    <SelectParameters>
        <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
    </SelectParameters>
</asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Paypal FROM dbo.Setup" UpdateCommand="UPDATE dbo.Setup SET Paypal = @Paypal">
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="Paypal" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:HiddenField ID="HiddenField2" runat="server" />
<p>
    &nbsp;</p>
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Pay Now" />

