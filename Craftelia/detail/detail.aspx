<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" %>

<%@ Register Src="~/ucdetail/slider.ascx" TagPrefix="uc1" TagName="slider" %>
<%@ Register Src="~/ucdetail/pdetail.ascx" TagPrefix="uc1" TagName="pdetail" %>
<%@ Register Src="~/ucdetail/book.ascx" TagPrefix="uc1" TagName="book" %>
<%@ Register Src="~/ucdetail/SellerDetails.ascx" TagPrefix="uc1" TagName="SellerDetails" %>
<%@ Register Src="~/ucdetail/description.ascx" TagPrefix="uc1" TagName="description" %>
<%@ Register Src="~/ucdetail/catalog.ascx" TagPrefix="uc1" TagName="catalog" %>
<%@ Register Src="~/ucdetail/video.ascx" TagPrefix="uc1" TagName="video" %>
<%@ Register Src="~/ucdetail/rating.ascx" TagPrefix="uc1" TagName="rating" %>
<%@ Register Src="~/usercontrol/ViewsInsert.ascx" TagPrefix="uc1" TagName="ViewsInsert" %>
<%@ Register Src="~/usercontrol/BreadCrumbDetail.ascx" TagPrefix="uc1" TagName="BreadCrumbDetail" %>
<%@ Register Src="~/ucdetail/Sharethis.ascx" TagPrefix="uc1" TagName="Sharethis" %>












<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     
         <div class="container">
            <%--  <ol class="breadcrumb">
  <li><a href="#">Home</a></li>
  <li><a href="#">Library</a></li>

</ol>--%>
             <uc1:BreadCrumbDetail runat="server" ID="BreadCrumbDetail" />

          <br />
               <br />
              


             <uc1:Sharethis runat="server" ID="Sharethis" />

             <br />
              <br />
             <div class="row details">
                 <div class="col-md-4">
                     <uc1:ViewsInsert runat="server" ID="ViewsInsert" />

                     <uc1:slider runat="server" ID="slider" />
           
                 </div>

                       <div class="col-md-6">
                          

                               <uc1:pdetail runat="server" ID="pdetail" />
                          
                         
                              
                           <uc1:SellerDetails runat="server" ID="SellerDetails" />
                      
                           </div>

                   <div class="col-md-2"></div>
             </div>

      
             <div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Reviews</a></li>
   

  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
        <br />
        <uc1:description runat="server" ID="description" />

        <uc1:catalog runat="server" ID="catalog" />

        <uc1:video runat="server" ID="video" />
    </div>
    <div role="tabpanel" class="tab-pane" id="profile">

        <uc1:rating runat="server" id="rating" />



    </div>


  </div>

</div>
             
                </div>
       <br />
</asp:Content>

