<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="CommisssionStatus.aspx.cs" Inherits="seller_CommisssionStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
        <div class="form form-div">
            <h3>
               Website Commission Details
            </h3>
      <div class="row">
          <div class="col-md-3">
Commission Status:
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="Pending">Pending</asp:ListItem>
            <asp:ListItem Value="Paid">Paid</asp:ListItem>
        </asp:RadioButtonList>
          </div>
          <div class="col-md-3">
               Vendor:
                       <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="VendorName" DataValueField="VendorName">
                           <asp:ListItem Value="%">All</asp:ListItem>
                       </asp:DropDownList>
          </div>
      </div>
  
    <div class="table-responsive">
        
        
        <br />
    <table style="width: 100%;">
        <tr>
            <th>Order #</th>
            <th>Order Date</th>
            <th>Product Name</th>
            <th>Amount</th>
            <th>Order Commission%</th>
             <th>Commission Amount</th>
            <th>Status</th>
            <th>Action</th>
             
        </tr>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="ListView1_ItemDataBound" OnItemCommand="ListView1_ItemCommand">
            <ItemTemplate>
  <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderNo") %>'></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
            </td>
           <td>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
            </td>
      <td>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
            </td>
      <td>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ordercommission") %>'></asp:Label>
            </td>
      <td>
                <asp:Label ID="Label6" runat="server" ></asp:Label>
            </td>
      <td>
                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Commstatus") %>'></asp:Label>

            </td>
      <td>
          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="received">Received</asp:LinkButton>  
            </td>
        </tr>
                                                    </ItemTemplate></asp:ListView>
      
    </table></div>   </div> 
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Profile.VendorName, Products.UserName AS VendorEmail, Products.ProductName, [Order].Amount, ISNULL(OrderShipping.OrderCommission, 20) AS ordercommission, [Order].OrderDate, ISNULL(OrderShipping.CommissionAmount, 0) AS commreceived, [Order].Status, [Order].OrderId, [Order].Amount * ISNULL(OrderShipping.OrderCommission, 20) AS Orderper, [Order].OrderNo, CASE ISNULL(OrderShipping.CommissionAmount , 0) WHEN 0 THEN 'Pending' ELSE 'Paid' END AS Commstatus FROM Profile INNER JOIN Products ON Profile.UserName = Products.UserName INNER JOIN OrderShipping INNER JOIN [Order] ON OrderShipping.OrderNo = [Order].OrderNo ON Products.ProductKey = [Order].ProductKey WHERE (CASE ISNULL(OrderShipping.CommissionAmount , 0) WHEN 0 THEN 'Pending' ELSE 'Paid' END = @Status) AND (Profile.VendorName LIKE N'%' + @VendorName + N'%') ORDER BY [Order].OrderId" UpdateCommand="UPDATE OrderShipping SET CommissionAmount = @Commissionreceived WHERE (OrderNo = @OrderNo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="Status" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="%" Name="VendorName" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT distinct dbo.Profile.VendorName FROM dbo.Profile INNER JOIN dbo.Products ON dbo.Profile.UserName = dbo.Products.UserName where dbo.Profile.VendorName is not null  ORDER BY dbo.Profile.VendorName">
    </asp:SqlDataSource>
</asp:Content>

