<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="projectconfirmation.aspx.cs" Inherits="label" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


        <div class="container">
         <div class="content"style="margin-top:10%"> 
        <div class="row">
            <div class="col-md-3"></div>
             <div class="col-md-6 form"  style="text-align:center;">
                 <br />      <h1>
                     <asp:Label ID="Label2" runat="server" Text="   Congratulation !" Font-Size="40px"></asp:Label>
                 </h1>
                 <br />
                 <i class="fa fa-check text-success" style="font-size:60px;"> </i>
                       <br />
                 <div style="font-size:16px;" role="alert"> 
            <br />
            Your transaction has been added succesfully
        </div>      <br />
            
        </div>
        </div>
    </div></div>
        
</asp:Content>

