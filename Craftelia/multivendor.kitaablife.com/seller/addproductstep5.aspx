<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="addproductstep5.aspx.cs" Inherits="seller_addproductstep2" %>





<%@ Register Src="~/ucproduct/Auction.ascx" TagPrefix="uc1" TagName="Auction" %>





<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="min-height">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-1 col-md-10">
                    <div class="form-div form" style="background-color:whitesmoke">
                        <h3>
                            

                          Add Product 
                        </h3>
                   <br />   
                 
                    <div class="form-horizontal">
      
   

                     
      
   
                        <uc1:Auction runat="server" ID="Auction" />
                       
      
   

                     
      
   

        </div>
     </div>   </div>
     </div>   </div>
     </div>
</asp:Content>

