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
<%@ Register Src="~/usercontrol/home11nov2017.ascx" TagPrefix="uc1" TagName="home11nov2017" %>
<%@ Register Src="~/usercontrol/ShopForGifts.ascx" TagPrefix="uc1" TagName="ShopForGifts" %>
<%@ Register Src="~/usercontrol/NewestGoods.ascx" TagPrefix="uc1" TagName="NewestGoods" %>
<%@ Register Src="~/usercontrol/category-defaultpage - Copy.ascx" TagPrefix="uc1" TagName="categorydefaultpageCopy" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="homebanner">
        <div class="container">
            <div class="visible-lg">
                <uc1:banner runat="server" ID="banner" />
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="bann-strip-main">
            <div class="col-md-4 bann-strip-grid">
                <a href="Account/Register.aspx">
                    <div class="col-md-4 b-strip-left">
                        <span class="glyphicon glyphicon-ok-sign hovicon effect-4 sub-b" aria-hidden="true"> </span>
                    </div>
                    <div class="col-md-8 b-strip-right">
                        <h4>Register For Free</h4>
                        <p>Step 1</p>
                    </div>
                </a>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-4 bann-strip-grid">
                <a href="Account/Register.aspx">
                    <div class="col-md-4 b-strip-left">
                        <span class="glyphicon glyphicon-thumbs-up hovicon effect-4 sub-b" aria-hidden="true"> </span>
                    </div>
                    <div class="col-md-8 b-strip-right">
                        <h4>Upload Your Product</h4>
                        <p>Step 2</p>
                    </div>
                </a>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-4 bann-strip-grid">
                <a href="Account/Register.aspx">
                    <div class="col-md-4 b-strip-left">
                        <span class="glyphicon glyphicon-globe  <%--glyphicon glyphicon-eye-open--%> hovicon effect-4 sub-b" aria-hidden="true"> </span>
                    </div>
                    <div class="col-md-8 b-strip-right">
                        <h4>Connect With Buyers </h4>
                        <p>Step 3</p>
                    </div>
                </a>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <br />
    </div>
    <div class="vedio" style="background:#ededed">
        <div class="container">
            <br />
            <div class="offers">
                <h3 class="visible-lg">Shop By Category</h3>
                <h4 class="hidden-lg">
                    Shop by Category
                </h4>
                <br />
                <uc1:categorydefaultpageCopy runat="server" ID="categorydefaultpageCopy" />
            </div>
        </div>
        <br />
    </div>
    <div class="vedio grey-index">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="categories">
                        <h3 class="visible-lg">
                            All Categories
                        </h3>
                        <h4 class="hidden-lg">
                            All Categories
                        </h4>
                    </div>
                    <uc1:categorydefaultpage runat="server" ID="categorydefaultpage" />
                </div>
                <br class="hidden-lg" />
                <div class="col-md-9 nopadding">
                    <br />
                    <h2 class="hidden-lg">
                        Featured Products
                    </h2>
                    <div class="offers visible-lg">
                        <h3>Featured Products</h3>
                    </div>
                    <div class="row">
                        <uc1:home11nov2017 runat="server" id="home11nov2017" />
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </div>
    <div class="vedio grey-index">
        <div class="container">
            <div class="row">
               <%-- <div class="col-md-3">
                </div>--%>
                <br class="hidden-lg" />
                <div class="col-md-12 nopadding">
                    <br />
                    <h2 class="hidden-lg">
                        Shop for Gifts
                    </h2>
                    <div class="offers visible-lg">
                        <h3>Shop for Gifts</h3>
                    </div>
                    <div class="row">
                        <uc1:ShopForGifts runat="server" id="shopForGifts" />
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </div>
    <div class="vedio grey-index">
        <div class="container">
            <div class="row">
               <%-- <div class="col-md-3">
                </div>--%>
                <br class="hidden-lg" />
                <div class="col-md-12 nopadding">
                    <br />
                    <h2 class="hidden-lg">
                        Newest Goods on Craftelia
                    </h2>
                    <div class="offers visible-lg">
                        <h3>Newest Goods on Craftelia</h3>
                    </div>
                    <div class="row">
                        <uc1:NewestGoods runat="server" id="newestGoods1" />
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </div>
    <div class="charity">
        <div class="container">
            <div class="charity-main row wow fadeInRight" data-wow-delay="0.3s">
                <div class="col-md-4">
                    <h3>
                        <asp:Label ID="Label1" runat="server" Text="Quality" ForeColor="White"></asp:Label> Products</h3>
                    <p>Buying direct from the person who put their heart and soul into creating what you need and desire</p>
                </div>
                <div class="col-md-4">
                    <h3>
                        <asp:Label ID="Label2" runat="server" Text="Your" ForeColor="White"></asp:Label> Timeline</h3>
                    <p>We’ve made sure that browsing, searching and paying for the products you love is a piece of cake
                    </p>
                </div>
                <div class="col-md-4">
                    <h3>
                        <asp:Label ID="Label3" runat="server" Text="Your" ForeColor="White"></asp:Label> Benefit</h3>
                    <p>Everything on here is unique; we have many items on here which are truly one-of-a-kind </p>
                </div>
            </div>
        </div>
    </div>
    <div class="terisa" style="background:white">
        <div class="container">
            <div class="terisa-main">
                <div class="col-md-11 terisa-left wow fadeInLeft" data-wow-delay="0.3s">
                    <br />
                    <h3>Benefits of <a class="href-link">Craftelia</a></h3>
                    <%--<p>Earn money while you socialize with your friends and family.</p>--%>
                        <ul>
                            <li><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span><a> Everything is handled in a safe, secure and simplistic manner. We know you are here to sell or buy; so let’s keep things simple. </a></li>
                            <li><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span><a> With a safe and secure payment service and an easy to work interface, we’ve made sure that browsing, searching and paying for the products you love is a piece of cake.</a></li>
                            <li><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span><a> Everything on here is unique; we have many items on here which are truly one-of-a-kind, and also a wide collection of exclusive item ranges that you will not find elsewhere.</a></li>
                            <li><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span><a> All of our sellers work for themselves, so you are buying direct from the person who put their heart and soul into creating what you need and desire. </a></li>
                            <li><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span><a> Also, every seller has been vetted and looked into extensively in a bid to find out more about them, and what they bring to the table.  </a></li>
                            <li><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span><a> Secure, safe shopping experiences can be hard to find; with Craftelia, your purchases are made using the safest security systems possible to stop you from feeling uncertain. </a></li>
                            <li><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span><a> Got any issue? Fear not; our dedicated support team will get back to you as soon as they possibly can to deliver an eloquent, easy solution.  </a></li>
                        </ul>
                </div>
                <div class="col-md-1 terisa-right wow fadeInRight" data-wow-delay="0.3s">
                    <%--<img src="images/benefits.png" width="80%" />  --%>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</asp:Content>