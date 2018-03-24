<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Async ="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="whitebg">
   <div class="container">
       <div class="row">
        <br />  
           
               
            <div style="text-align:center;" class="hidden-lg">
            <img src="images/myfriend.png" width="200px" />    </div>
           
            <div class="col-md-offset-3 col-md-6">
            
               <div class="form form-div" style="border:none;">
                   <h3>
                       We would love to hear from you
                   </h3>
                   <br />
                   <div class="form-horizontal" style="padding: 0px 13px">
                       <div class="form-group">
                           <div class="col-md-2">
                               Name:
                           </div>
                           <div class="col-md-10">
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" Display="Dynamic" CssClass="text-danger" ControlToValidate="TextBox1" ValidationGroup="contact"></asp:RequiredFieldValidator>
                           </div>
                       </div>

                       <div class="form-group">
                           <div class="col-md-2">
                              Email:

                           </div>
                           <div class="col-md-10">
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" Display="Dynamic" CssClass="text-danger" ControlToValidate="TextBox2" ValidationGroup="contact"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid Email Required" ControlToValidate="TextBox2" CssClass="text-danger" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                       </div>

                       <div class="form-group">
                           <div class="col-md-2">
                               Comments:

                           </div>
                           <div class="col-md-10">
<asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" Display="Dynamic" CssClass="text-danger" ControlToValidate="TextBox3" ValidationGroup="contact"></asp:RequiredFieldValidator>
                           </div>
                       </div>

                       <div class="form-group">
                           <div class="col-md-4 col-md-offset-8">
                               <asp:Button ID="Button1" runat="server" Text="Send" Width="100%" OnClick="Button1_Click" ValidationGroup="contact" OnClientClick="if (!Page_ClientValidate('contact')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />
                               <br />
                               <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                           </div>
                         
                       </div>
                   </div>
                   

                 
               </div>

           </div>
      
          <div class="col-md-3">

           <img src="images/myfriend.png" class="img-responsive visible-lg" />
           </div>
           
            </div>
       <br />
   </div></div>


             <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SMTP, BCC, Emailfrom, Password FROM EmailSetup"></asp:SqlDataSource>
         </asp:Content>
