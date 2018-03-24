<%@ Control Language="C#" AutoEventWireup="true" CodeFile="book.ascx.cs" Inherits="ucdetail_book" %>



<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<div class="col-md-6">

    <div class="row">



        <div class="col-md-3 nopadding">
            <br />
            QTY :
        </div>
        <div class="col-md-3 nopadding form" style="text-align: right">
            <asp:TextBox ID="TextBox1" runat="server" Text="0"></asp:TextBox>
            <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox1_FilteredTextBoxExtender" TargetControlID="TextBox1" ID="TextBox1_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
        </div>
<div class="col-md-6 form" style="text-align:right;margin-top: 5px">
                               
 <asp:Button ID="Button1" runat="server" Text="BUY NOW" OnClick="Button1_Click" ValidationGroup="book" />
                      <br />     
                                     <br />
                               
                                  </div>
   </div> 

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Quantity Must Be Greater than 0" ValidationGroup="book" InitialValue="0" ControlToValidate="TextBox1" CssClass="required" Display="Static"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Add Qty" ValidationGroup="book"  ControlToValidate="TextBox1" CssClass="required" Display="Static"></asp:RequiredFieldValidator>


 </div>
     
    <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO dbo.[Order] SELECT DISTINCT @OrderNo AS OrderNo, (SELECT Id FROM dbo.AspNetUsers WHERE (UserName = @buyerusername)) AS buyerid, (SELECT dbo.AspNetUsers.Id FROM dbo.Profile INNER JOIN dbo.AspNetUsers ON dbo.Profile.UserName = dbo.AspNetUsers.UserName WHERE (dbo.Profile.ProfileId = @sellerusername)) AS sellerid, @ID AS ProductKey, GETDATE() AS OrderDate, (SELECT Price FROM dbo.Products WHERE (ProductKey = @ID)) AS Amount, @Status AS Status, @Requirement AS Requirement, GETDATE() AS ActionDate, 0 AS DeliveryId, 'NA' AS Comments, @Quantity AS Quantity FROM dbo.AspNetUsers" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(availablebalance.availablefunds - serviceamount.MinAmount, 0) AS balanceforshopping FROM (SELECT MinAmount FROM CreateService WHERE (CreateServiceId = @ID)) AS serviceamount CROSS JOIN (SELECT balancefund.funds - orderfund.orderfund AS availablefunds FROM (SELECT ISNULL(SUM(Funds), 0) AS funds FROM AddBalance WHERE (BuyerId = (SELECT Id FROM dbo.AspNetUsers WHERE (UserName = @username)))) AS balancefund CROSS JOIN (SELECT ISNULL(SUM(Amount), 0) AS orderfund FROM [Order] WHERE (Status &lt;&gt; N'Pending') AND (Status &lt;&gt; 'Cancel') AND (BuyerId = (SELECT Id FROM dbo.AspNetUsers AS AspNetUsers_1 WHERE (UserName = @username)))) AS orderfund) AS availablebalance">
    <InsertParameters>
        <asp:SessionParameter Name="OrderNo" SessionField="cart" />
        <asp:ControlParameter ControlID="HiddenField1" Name="buyerusername" PropertyName="Value" />
        <asp:RouteParameter Name="sellerusername" RouteKey="PID" />
        <asp:Parameter DefaultValue="Pending" Name="Status" />
        <asp:Parameter DefaultValue="Requirement" Name="Requirement" />
        <asp:ControlParameter ControlID="TextBox1" Name="Quantity" PropertyName="Text" DefaultValue="" />
        <asp:RouteParameter Name="ID" RouteKey="ID" DefaultValue="" />
    </InsertParameters>
    <SelectParameters>
        <asp:RouteParameter Name="ID" RouteKey="ID" />
        <asp:ControlParameter ControlID="HiddenField1" Name="username" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />





  <button data-toggle="modal" id="btnShowPopup1" data-target="#myModal1" style="visibility:hidden;"></button>
					<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm popup center" style="margin-top:40px">
						 <h3>
            Product Added Successfully
        </h3>
       <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/images/addcart.png" Width="200px" />--%>
        <br />
        <hr />
        <div class="row">
            <div class="col-xs-6"> <asp:Button ID="Button4" runat="server" Text="Continue Shopping" PostBackUrl="~/Default.aspx" CssClass="btn btn-default" /> </div>  
              <div class="col-xs-6">
        <asp:Button ID="Button5" runat="server" Text="Checkout" PostBackUrl="~/checkout.aspx" CssClass="btn btn-warning" />
                                                                                                                                                                         </div>
        </div>
						</div>
					</div>
				<script type="text/javascript">
				    function ShowPopup1() {
				        $("#btnShowPopup1").click();
				    }
    </script>




