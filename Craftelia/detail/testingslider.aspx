<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="testingslider.aspx.cs" Inherits="testingslider" %>

<%@ Register Src="~/newslider/offerdealhome.ascx" TagPrefix="uc1" TagName="offerdealhome" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:offerdealhome runat="server" ID="offerdealhome" />
</asp:Content>

