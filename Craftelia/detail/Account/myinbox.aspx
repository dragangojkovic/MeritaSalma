<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="myinbox.aspx.cs" Inherits="inboxx" %>

<%@ Register Src="~/UserControl/inbox.ascx" TagPrefix="uc1" TagName="inbox" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    
   

        <uc1:inbox runat="server" ID="inbox" />
</asp:Content>

