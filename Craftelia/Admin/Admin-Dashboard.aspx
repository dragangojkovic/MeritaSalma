<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Admin-Dashboard.aspx.cs" Inherits="Admin_AdminDashboard" %>

<%@ Register Src="~/Admin/usercontrol/totalcustomers.ascx" TagPrefix="uc1" TagName="totalcustomers" %>
<%@ Register Src="~/Admin/usercontrol/totalproducts.ascx" TagPrefix="uc1" TagName="totalproducts" %>
<%@ Register Src="~/Admin/usercontrol/totalvendors.ascx" TagPrefix="uc1" TagName="totalvendors" %>
<%@ Register Src="~/Admin/usercontrol/totalsales.ascx" TagPrefix="uc1" TagName="totalsales" %>





<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


    <div class="form form-div">
        <br />
        <br />
        <br />
        <h1 style="text-align: center;">
            <asp:Label ID="Label1" runat="server" Text=" WELCOME TO ADMIN PANEL" Font-Size="50px"></asp:Label>
        </h1>
        <br />
    </div>

        <div class="four-grids">
            <div class="col-md-3 four-grid">
                <uc1:totalcustomers runat="server" ID="totalcustomers" />
            </div>
            <div class="col-md-3 four-grid">
                <uc1:totalvendors runat="server" ID="totalvendors" />
            </div>
            <div class="col-md-3 four-grid">
                <uc1:totalproducts runat="server" ID="totalproducts" />
            </div>
            <div class="col-md-3 four-grid">
                <uc1:totalsales runat="server" ID="totalsales" />
            </div>
            <div class="clearfix"></div>
        </div>


</asp:Content>

