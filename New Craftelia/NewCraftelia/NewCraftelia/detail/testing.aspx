<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="testing.aspx.cs" Inherits="testing" Culture = "en-GB" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

     


    Start Date: <asp:TextBox ID="txtStartDate" runat="server" Text = "24/02/1999"></asp:TextBox>&nbsp;
    End Date: <asp:TextBox ID="txtEndDate" runat="server" Text = "31/12/1988"></asp:TextBox><br />
    <asp:CompareValidator ID="CompareValidator1" ValidationGroup = "Date" ForeColor = "Red" runat="server" ControlToValidate = "txtStartDate" ControlToCompare = "txtEndDate" Operator = "GreaterThan" Type = "Date" ErrorMessage="Start date must be less than End date."></asp:CompareValidator>
    <br />
    <asp:Button ID="btnCompare" runat="server" Text="Compare" ValidationGroup = "Date"/>
</asp:Content>

