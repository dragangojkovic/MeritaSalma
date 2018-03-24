<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductConfirmation.aspx.cs" Inherits="seller_addproductstep2" %>




<%@ Register src="../ucproduct/images.ascx" tagname="images" tagprefix="uc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="min-height">
        <div class="container">


            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div class="alert alert-success center">
                     <i class="fa fa-check-circle fa-5x"></i>
                        <h4>
                            Your Product has been added successfully
                        </h4>

                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/seller/allproducts.aspx">Check out your products</asp:LinkButton>
                    </div>
                </div>
            </div>

              </div>
     </div>
</asp:Content>

