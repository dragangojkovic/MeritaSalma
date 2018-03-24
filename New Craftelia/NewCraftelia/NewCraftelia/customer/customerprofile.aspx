<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="customerprofile.aspx.cs" Inherits="customer_customerprofile" %>


<%@ Register Src="~/ucvendor/addressdetails.ascx" TagPrefix="uc1" TagName="addressdetails" %>
<%@ Register Src="~/ucvendor/contactdetails.ascx" TagPrefix="uc1" TagName="contactdetails" %>
<%@ Register Src="~/ucvendor/customerdetails.ascx" TagPrefix="uc1" TagName="customerdetails" %>





<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

     <div class="mainbg">
        <div class="container">
            <div class="row">
             
                <div class="col-md-offset-2 col-md-8"> <br /> 
                    <div class="form-div nopadding" style="border:none; background-color:transparent;">
                        <h3>
                            Customer Details <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning pull-right" PostBackUrl="~/customer/PrimaryShipping.aspx" Font-Size="13px">View Shipping Details</asp:LinkButton>
                        </h3>
                    </div>

               <br />
                    <uc1:customerdetails runat="server" ID="customerdetails" />
                    <uc1:addressdetails runat="server" ID="addressdetails" />
                    <uc1:contactdetails runat="server" ID="contactdetails" />
                    </div> </div> </div> </div>


</asp:Content>

