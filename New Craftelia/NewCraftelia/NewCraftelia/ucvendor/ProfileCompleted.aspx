<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProfileCompleted.aspx.cs" Inherits="ucvendor_ProfileCompleted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container">
        <br />    <br />    <br />
    <div class="alert alert-success">
        Your profile has been completed.

        <br />
        <br />

        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/seller/addproduct.aspx">Click here to add products</asp:LinkButton>

    </div>
         <br />
        <br />    <br />

    </div>
       
</asp:Content>

