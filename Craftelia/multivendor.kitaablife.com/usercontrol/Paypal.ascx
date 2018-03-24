<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Paypal.ascx.cs" Inherits="usercontrol_Paypal" %>
<style type="text/css">

*, a, button, i, input {
    -webkit-font-smoothing: antialiased;
}
*, :active, :focus, :hover {
    outline: 0!important;
    -webkit-tap-highlight-color: transparent!important;
}
*, :active, :focus, :hover {
    outline: 0!important;
    -webkit-tap-highlight-color: transparent!important;
}

*,
*:before,
*:after {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}

  * {
    color: #000 !important;
    text-shadow: none !important;
    background: transparent !important;
    box-shadow: none !important;
  }
  </style>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SUM(Amount) AS Total FROM dbo.[Order] WHERE (OrderNo = @OrderNo)">
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

