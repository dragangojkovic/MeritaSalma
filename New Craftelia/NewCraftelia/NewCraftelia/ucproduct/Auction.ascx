<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Auction.ascx.cs" Inherits="ucproduct_Auction" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<div class="title">
    <asp:Label ID="Label21" runat="server" Text="Auction Setup:"></asp:Label>

</div>
<br />
<div class="form-group whitebg" style="margin-bottom: 0px;">
    <br />
  
        <br />
       <div class="alert alert-danger center">   Please insert expiry date to start your auction. Its is not editable so please choose wisely
    </div>
    <br />
   
    <div class="col-md-6">
       Expiry Date:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" Format="dd/MMM/yyyy" TargetControlID="TextBox1">
        </ajaxToolkit:CalendarExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This Field is Required" ControlToValidate="TextBox1" CssClass="required" ValidationGroup="Auction"></asp:RequiredFieldValidator>
        </div>
    <div class="col-md-2">
       
        
        <br />
        <asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" OnClientClick="if (!Page_ClientValidate('Auction')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" ValidationGroup="Auction" />
    </div>
   
    
    
    </div><br /><br /><div class="table-responsive">
        
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="Product Name" HeaderText="Product Name" SortExpression="Product Name" />
                <asp:BoundField DataField="Bid Expiry Date" HeaderText="Bid Expiry Date" SortExpression="Bid Expiry Date" />
                <asp:BoundField DataField="Bid Start Price" HeaderText="Bid Start Price" SortExpression="Bid Start Price" />
                <asp:BoundField DataField="Product Bid Status" HeaderText="Product Bid Status" SortExpression="Product Bid Status" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    </div>
<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO ProductBid(ProductBidExpiry, ProductKey, status) VALUES (@BidExpiry, @ProductKey, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductName AS [Product Name], ProductBid.ProductBidExpiry AS [Bid Expiry Date], Products.Price AS [Bid Start Price], ProductBid.status AS [Product Bid Status] FROM ProductBid INNER JOIN Products ON ProductBid.ProductKey = Products.ProductKey WHERE (ProductBid.ProductKey = @ProductKey)">
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="BidExpiry" PropertyName="Text" />
        <asp:QueryStringParameter Name="ProductKey" QueryStringField="ID" />
        <asp:Parameter DefaultValue="Active" Name="Status" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="ProductKey" QueryStringField="ID" />
    </SelectParameters>
</asp:SqlDataSource>
