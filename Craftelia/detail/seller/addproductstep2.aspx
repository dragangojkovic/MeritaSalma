<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="addproductstep2.aspx.cs" Inherits="seller_addproductstep2" %>

<%@ Register src="../ucproduct/catalog.ascx" tagname="catalog" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="min-height">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-1 col-md-10">
                    <div class="form-div form" style="background-color:whitesmoke">
                        <h3>
                            

                          Add Product <small>( Step 2 )</small>
                        </h3>
                   <br />   
                 
                    <div class="form-horizontal">
      
    <uc1:catalog ID="catalog1" runat="server" />

        </div>
     </div>   </div>
     </div>   </div>
     </div>
</asp:Content>

