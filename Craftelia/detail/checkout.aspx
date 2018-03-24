<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<%@ Register Src="~/uccart/cartdetail.ascx" TagPrefix="uc1" TagName="cartdetail" %>
<%--<%@ Register Src="~/uccart/PurchaseTotal.ascx" TagPrefix="uc1" TagName="PurchaseTotal" %>--%>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

   <div class="mainbg">
       <br />
    <div class="container">
      

        <style>
    .table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}
</style>
<div class="row">
							<div class="col-md-6">
								<h3><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h3>
							</div>
							<div class="col-md-6" style="text-align:right">
                                <br />
								<asp:Button ID="Button1" runat="server" Text="Continue Shopping" CssClass="btn btn-default" PostBackUrl="~/Default.aspx" />		<asp:Button ID="Button2" runat="server" Text="Checkout" CssClass="btn-color" OnClick="Button2_Click"  />
							</div>
						</div>

<div class="form-div">
	<table id="cart" class="table table-hover table-condensed">
  <uc1:cartdetail runat="server" ID="cartdetail" />
	<%--<uc1:PurchaseTotal runat="server" ID="PurchaseTotal" />--%>
        </table>
</div>





			
			
                   

      

				

			</div>
	
    </div>

   
</asp:Content>

