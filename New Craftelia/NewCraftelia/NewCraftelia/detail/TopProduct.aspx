<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TopProduct.aspx.cs" Inherits="TopProduct" %>

<%@ Register src="usercontrol/TopViewedProduct.ascx" tagname="TopViewedProduct" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:TopViewedProduct ID="TopViewedProduct1" runat="server" />
</asp:Content>

