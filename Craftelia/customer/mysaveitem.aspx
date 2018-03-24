<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="mysaveitem.aspx.cs" Inherits="customer_mysaveitem" %>

<%@ Register Src="~/usercontrol/savelater.ascx" TagPrefix="uc1" TagName="savelater" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:savelater runat="server" ID="savelater" />
</asp:Content>

