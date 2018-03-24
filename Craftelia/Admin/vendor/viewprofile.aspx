<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="viewprofile.aspx.cs" Inherits="seller_viewprofile" %>

<%@ Register Src="~/Admin/vendor/SellerDetails.ascx" TagPrefix="uc1" TagName="SellerDetails" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
        <uc1:SellerDetails runat="server" ID="SellerDetails" />
    </div>
</asp:Content>

