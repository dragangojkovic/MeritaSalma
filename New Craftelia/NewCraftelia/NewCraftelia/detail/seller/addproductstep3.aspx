<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="addproductstep3.aspx.cs" Inherits="seller_addproductstep2" %>


<%@ Register src="../ucproduct/video.ascx" tagname="video" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="min-height">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-1 col-md-10">
                    <div class="form-div form" style="background-color:whitesmoke">
                        <h3>
                            

                          Add Product <small>( Step 3 )</small>
                        </h3>
                   <br />   
                 
                    <div class="form-horizontal">
      
   

                        <uc1:video ID="video1" runat="server" />
      
   

        </div>
     </div>   </div>
     </div>   </div>
     </div>
</asp:Content>

