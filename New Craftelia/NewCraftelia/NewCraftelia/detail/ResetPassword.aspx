<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="Account_ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <br />
        <div class="container">

    <div class="row">
        <div class="col-md-4 col-md-offset-4 form-div">  
           
        
            <div class="form">
                       <h3>              
      <asp:Label ID="Label9" runat="server" Text="Reset Password"></asp:Label></h3>
    New Password:
                            
    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
    
    <asp:Button ID="Button1" runat="server" Text="Reset Password" OnClick="Button1_Click" />
                <br />
                           
                </div>
            </div>
        </div>
            </div>
      
</asp:Content>

