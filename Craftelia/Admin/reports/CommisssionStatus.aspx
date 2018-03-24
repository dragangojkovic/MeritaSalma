<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="CommisssionStatus.aspx.cs" Inherits="seller_CommisssionStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
        <div class="form form-div">
            <h3>
               Website Commission Details
            </h3>
      <div class="row">
          <div class="col-md-3">
<%--Commission Status:
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="Pending">Pending</asp:ListItem>
            <asp:ListItem Value="Paid">Paid</asp:ListItem>
        </asp:RadioButtonList>--%>
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
            <th>Order <br/>
                Date</th>
            <th>Product <br/>
                Name</th>
            <th>Sale <br/>
                Amount</th>
            <th>Order <br/>
                Commission%</th>
           
             <th>Pay to <br/>
                 Vendor</th>
              <th>Commission <br/>
                  Amount</th>
          <%--  <th>Status</th>--%>
           <%-- <th>Action</th>--%>
            <th>Paypal Id</th>
             
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
                <asp:Label ID="Label9" runat="server"></asp:Label>
            </td>
      <td>
                <asp:Label ID="Label6" runat="server" ></asp:Label>
            </td>
     <%-- <td>
                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Commstatus") %>'></asp:Label>

            </td>--%>

       
    <%--  <td>
          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="received">Pay</asp:LinkButton>  
            </td>--%>

      <td>
                <asp:Label ID="Label8" runat="server" Text='<%# Eval("paypal") %>'></asp:Label>

            </td>
        </tr>
                                                    </ItemTemplate></asp:ListView>
      
    </table></div>   </div> 
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT dbo.Profile.VendorName, dbo.Products.UserName AS VendorEmail, dbo.Products.ProductName, dbo.[Order].Amount, ISNULL(dbo.OrderShipping.OrderCommission, 20) AS ordercommission, dbo.[Order].OrderDate, ISNULL(dbo.OrderShipping.CommissionAmount, 0) AS commreceived, dbo.[Order].Status, dbo.[Order].OrderId, dbo.[Order].Amount * ISNULL(dbo.OrderShipping.OrderCommission, 10) / 100 AS Orderper, dbo.[Order].OrderNo, CASE ISNULL(OrderShipping.CommissionAmount , 0) WHEN 0 THEN 'Pending' ELSE 'Paid' END AS Commstatus, dbo.Profile.paypal FROM dbo.Profile INNER JOIN dbo.Products ON dbo.Profile.UserName = dbo.Products.UserName INNER JOIN dbo.OrderShipping INNER JOIN dbo.[Order] ON dbo.OrderShipping.OrderNo = dbo.[Order].OrderNo ON dbo.Products.ProductKey = dbo.[Order].ProductKey WHERE (dbo.Profile.VendorName LIKE N'%' + @VendorName + N'%')  ORDER BY dbo.[Order].OrderId" UpdateCommand="UPDATE OrderShipping SET CommissionAmount = @Commissionreceived WHERE (OrderNo = @OrderNo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="%" Name="VendorName" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT distinct dbo.Profile.VendorName FROM dbo.Profile INNER JOIN dbo.Products ON dbo.Profile.UserName = dbo.Products.UserName where dbo.Profile.VendorName is not null  ORDER BY dbo.Profile.VendorName">
    </asp:SqlDataSource>
</asp:Content>

