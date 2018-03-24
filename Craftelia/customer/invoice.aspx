<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" async="true" CodeFile="invoice.aspx.cs" Inherits="customer_invoice" %>

<%@ Register Src="~/uccart/cartdetail.ascx" TagPrefix="uc1" TagName="cartdetail" %>
<%@ Register Src="~/uccart/PurchaseTotal.ascx" TagPrefix="uc1" TagName="PurchaseTotal" %>
<%@ Register Src="~/uccart/shippingdetail.ascx" TagPrefix="uc1" TagName="shippingdetail" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="mainbg">
        <div class="container">

            <br />
            <div class="alert alert-success">
                Your order has been successfully placed

            </div>
         

            <div class="form-div">
                <h4>

            
                <asp:Label ID="Label1" runat="server" Text="Your Invoice" CssClass="text text-warning"></asp:Label>  
                  
                </h4>
               <hr />
                <div class="row">
                    <div class="col-md-6">
                        <h4>
                            Order #: <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                        </h4>
                    </div>
                     <div class="col-md-6">
                        <h4>
                          Shipping Detail <br />
                            <small>
                                <uc1:shippingdetail runat="server" ID="shippingdetail" />
                            </small>
                        </h4>

                    </div>
                </div>
            
              <div>
	<table id="cart" class="table table-hover table-condensed">
<uc1:cartdetail runat="server" ID="cartdetail" />
                  <%--<uc1:PurchaseTotal runat="server" ID="PurchaseTotal" />--%>
        </table>
</div>
				
            </div>
      
             <br />
            <div class="alert alert-info center">
             Thank you for shopping. <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/customer/MyPurchases.aspx">Click Here to view your order</asp:LinkButton>
       <br />        <asp:Button ID="Button2" runat="server" Text="Continue Shopping" CssClass="btn-color" PostBackUrl="~/Default.aspx" />
                    </div>  
            <br />
            
            
              </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" UpdateCommand="UPDATE dbo.[Order] SET Status = N'Active' WHERE (OrderNo = @OrderNo)">
        <UpdateParameters>
            <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
        </UpdateParameters>
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SMTP, BCC, Emailfrom, Port, Password FROM EmailSetup"></asp:SqlDataSource>

        <br />
    <br />

        </asp:Content>

