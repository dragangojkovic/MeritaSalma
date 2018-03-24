<%@ Control Language="C#" AutoEventWireup="true" CodeFile="shippingdetail.ascx.cs" Inherits="uccart_shippingdetail" %>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO dbo.Customer(FullName, Contactnumber, Country, City, Shippingaddress, UserName) VALUES (@FullName, @ContactNumber, @Country, @City, @ShippingAddress, @UserName)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT FullName, ContactNumber, ShippingAddress, City, Country, UserName, OrderNo FROM OrderShipping WHERE (OrderNo = @OrderNo)" UpdateCommand="UPDATE dbo.Customer SET FullName = @FullName, Contactnumber = @ContactNumber, Country = @Country, City = @City, Shippingaddress = @ShippingAddress, UserName = WHERE (UserName = @UserName)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="FullName" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="ContactNumber" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" Name="Country" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox4" Name="City" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox5" Name="ShippingAddress" PropertyName="Text" />
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="FullName" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="ContactNumber" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" Name="Country" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox4" Name="City" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox5" Name="ShippingAddress" PropertyName="Text" />
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
   
    <asp:HiddenField ID="HiddenField1" runat="server" />

<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
 <asp:Label ID="Label5" runat="server" Text='<%# Eval("FullName") %>'></asp:Label> <br />
 <asp:Label ID="Label1" runat="server" Text='<%# Eval("Contactnumber") %>'></asp:Label><br />
 <asp:Label ID="Label2" runat="server" Text='<%# Eval("UserName") %>'></asp:Label><br />
 <asp:Label ID="Label3" runat="server" Text='<%# Eval("Country") %>'></asp:Label>, <asp:Label ID="Label4" runat="server" Text='<%# Eval("City") %>'></asp:Label><br />
 <asp:Label ID="Label6" runat="server" Text='<%# Eval("Shippingaddress") %>'></asp:Label><br />
    </ItemTemplate>
</asp:ListView>

