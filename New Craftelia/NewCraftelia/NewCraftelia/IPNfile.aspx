<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IPNfile.aspx.cs" Async="true" Inherits="customer_IPNfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


table {
  max-width: 100%;
  background-color: transparent;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
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
</head>
<body>
    <form id="form1" runat="server">








    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" UpdateCommand="UPDATE dbo.DOrder SET PaypalId = @Id, PaymentDate = GETDATE(), Status = @status WHERE (orderkey = @OrderId)">
        <UpdateParameters>
            <asp:SessionParameter Name="Id" SessionField="payeeemail" DefaultValue="" />
            <asp:Parameter DefaultValue="Paid" Name="status" />
            <asp:SessionParameter DefaultValue="" Name="OrderId" SessionField="custom" />
        </UpdateParameters>
        </asp:SqlDataSource>






    <div>
    
    </div>
    </form>
</body>
</html>
