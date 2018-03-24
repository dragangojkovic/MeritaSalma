<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Clinic.aspx.cs" Inherits="Account_Consultant" %>

<%@ Register Src="~/usercontrol/ClinicChat.ascx" TagPrefix="uc1" TagName="ClinicChat" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

   

    <uc1:ClinicChat runat="server" ID="ClinicChat" />
   

  
</asp:Content>

