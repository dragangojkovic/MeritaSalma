<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="mychat.aspx.cs" Inherits="chatt" %>

<%@ Register Src="~/UserControl/chat.ascx" TagPrefix="uc1" TagName="chat" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    


    <uc1:chat runat="server" id="chat" />
</asp:Content>

