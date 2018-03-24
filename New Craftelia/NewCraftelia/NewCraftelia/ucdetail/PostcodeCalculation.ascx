<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PostcodeCalculation.ascx.cs" Inherits="ucdetail_PostcodeCalculation" %>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM QuoteDetails WHERE (QuoteKey = @ID)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.Products.Price, dbo.Products.deliverycost, dbo.Currency.Currency FROM dbo.Products INNER JOIN dbo.Currency ON dbo.Products.Currency = dbo.Currency.CurrencyId WHERE (dbo.Products.ProductKey = @Id)" UpdateCommand="UPDATE Quote SET totalfloor = @totalfoor, totalmilecost = @totalmil, totalmiles = @totalmiles, addressfrom = @addressfrom, addressto = @addressto, time= @time WHERE (quotekey = @key )">
    <DeleteParameters>
        <asp:ControlParameter ControlID="Label1" Name="ID" PropertyName="Text" />
    </DeleteParameters>
    <SelectParameters>
        <asp:RouteParameter Name="Id" RouteKey="ID" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="Label1" Name="totalfoor" PropertyName="Text" />
        <asp:ControlParameter ControlID="Label9" Name="totalmil" PropertyName="Text" />
        <asp:QueryStringParameter Name="key" QueryStringField="Key" />
        <asp:ControlParameter ControlID="Label8" Name="totalmiles" PropertyName="Text" />
        <asp:ControlParameter ControlID="Label4" Name="addressfrom" PropertyName="Text" />
        <asp:ControlParameter ControlID="Label6" Name="addressto" PropertyName="Text" />
        <asp:ControlParameter ControlID="Label10" Name="time" PropertyName="Text" />
    </UpdateParameters>
</asp:SqlDataSource>
<p>
    &nbsp;</p>
<table style="width: 100%;" class="table-bordered row">
    <tr>
        <td class="col-xs-2">
            <asp:Label ID="Label6" runat="server" Text="Label" Font-Bold="True"></asp:Label>
<asp:Label ID="Label7" runat="server" Text="Label" Font-Bold="True"></asp:Label></td>
        <td class="col-xs-10">

Item Price
        </td>
    </tr>
    <tr>
        <td class="col-xs-2">
            <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True"></asp:Label>
<asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True"></asp:Label></td>
        <td class="col-xs-10">

Shipping cost</td>
    </tr>
    <tr>
        <td class="col-xs-2"><asp:Label ID="Label8" runat="server" Text="Label" Font-Bold="True" Font-Size="30px"></asp:Label><asp:Label ID="Label3" runat="server" Font-Size="30px" Text="Label" Font-Bold="True"></asp:Label></td>
        <td class="col-xs-10">  Total Cost</td>
    </tr>

</table>
<br />
<asp:HiddenField ID="HiddenField7" runat="server" />

