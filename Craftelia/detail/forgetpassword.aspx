<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Async="true" Inherits="forgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
      
    <br /><br /><br />
         
         <div class="container">
        <div class="row">
        <div class="col-md-offset-4 col-md-4 form-div">
    
            
             <div class="form">    
       <h3>              
      <asp:Label ID="Label9" runat="server" Text=" Forgott Password"></asp:Label></h3>
 

            
                
                 Email
                   
                 <asp:TextBox ID="TextBox1" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
     
               
               <br />      <asp:Button ID="Button1" runat="server" Text="Forgot Password" Width="100%" OnClick="Button1_Click" />
                
              <br />  <asp:Label ID="Label1" runat="server" CssClass="text-danger"></asp:Label>
                 <br />

    
   
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SMTP, BCC, Emailfrom, Port, Password FROM EmailSetup"></asp:SqlDataSource>

    
   
     </div>
             </div>
             </div>
         </div>      
</asp:Content>

