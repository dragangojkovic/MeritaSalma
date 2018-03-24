<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="viewprofile.aspx.cs" Inherits="seller_viewprofile" %>

<%@ Register Src="~/ucvendor/SellerDetails.ascx" TagPrefix="uc1" TagName="SellerDetails" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="mainbg">

   <div class="container">
        <uc1:SellerDetails runat="server" ID="SellerDetails" />
    </div> </div>
</asp:Content>

