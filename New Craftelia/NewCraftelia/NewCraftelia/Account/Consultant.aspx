<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Consultant.aspx.cs" Inherits="Account_Consultant" %>

<%@ Register src="../usercontrol/Consultation.ascx" tagname="Consultation" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

   

     
    <uc1:Consultation ID="Consultation1" runat="server" />

  
</asp:Content>

