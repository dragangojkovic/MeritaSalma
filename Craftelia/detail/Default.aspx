<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<%@ Register Src="~/book/book-ad.ascx" TagPrefix="uc1" TagName="bookad" %>
<%@ Register Src="~/usercontrol/category-defaultpage.ascx" TagPrefix="uc1" TagName="categorydefaultpage" %>
<%@ Register Src="~/usercontrol/banner.ascx" TagPrefix="uc1" TagName="banner" %>
<%@ Register Src="~/usercontrol/VerticalBanner.ascx" TagPrefix="uc1" TagName="VerticalBanner" %>
<%@ Register Src="~/usercontrol/horizonbanner.ascx" TagPrefix="uc1" TagName="horizonbanner" %>
<%@ Register Src="~/usercontrol/homepagedata.ascx" TagPrefix="uc1" TagName="homepagedata" %>
<%@ Register Src="~/thumbnailslider/offerdeal.ascx" TagPrefix="uc1" TagName="offerdeal" %>
<%@ Register Src="~/newslider/offerdealhome.ascx" TagPrefix="uc1" TagName="offerdealhome" %>
<%@ Register Src="~/Elastislide/offerdealhome.ascx" TagPrefix="uc2" TagName="offerdealhome" %>















<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="mainbg">
        <div class="container">
            <div class="row whitebg center">
                <div class="col-md-3 visible-lg nopadding" style="text-align:left;">

                    <uc1:categorydefaultpage runat="server" ID="categorydefaultpage" />

              

                </div>
                <div class="col-md-7 nopadding">
                
                  <uc1:banner runat="server" ID="banner" />

            <div class="visible-lg">
                <uc1:horizonbanner runat="server" ID="horizonbanner" />
                 </div>  


                </div>
                <div class="col-md-2">
                   
                    <uc1:VerticalBanner runat="server" ID="VerticalBanner" /> 

                </div>
            </div>
 
              <div class="row whitebg visible-lg">
                  <div class="col-md-3 salestype">
                      <div class="night-hotel">DEALS</div>
                      <h3>
                          OF THE WEEK
                      </h3>
                      <br />     <br />
                      <asp:Button ID="Button1" runat="server" Text="View All Deals" CssClass="btn-color" PostBackUrl="http://onlinehcs.com/Offer-Deals/offertype" />
                  </div>
                  <div class="col-md-9 nopadding">
                <%--      <uc1:offerdeal runat="server" ID="offerdeal" />--%>

                      <uc2:offerdealhome runat="server" ID="offerdealhome" />

                  </div>
                  </div>

            <uc1:homepagedata runat="server" ID="homepagedata" />

            
            
            
            
            
                </div>  
    </div>



</asp:Content>
