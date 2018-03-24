<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="min-height">

 
    <div class="container">
            <div class="row">
               
                  <div class="col-md-4 col-md-offset-4 form-div">  
                   <div class="alert alert-danger" runat="server" id="mylogin" visible="false">
     Please login to continue your purchasing

 </div>
                      <div class="form">
                          
                          <h3>              
      <asp:Label ID="Label9" runat="server" Text="LOGIN"></asp:Label></h3>
                     <br />
                           <section id="loginForm">
                <div class="form-horizontal" onkeypress="return WebForm_FireDefaultButton(event, '<%= Login.ClientID %>')">
                    
                   
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                      <%--  <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">User name</asp:Label>--%>
                        <div class="col-md-12">
                            <asp:TextBox runat="server" ID="UserName" placeholder="Email" ValidationGroup="b" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="required" ErrorMessage="The user name field is required." ValidationGroup="b" Display="Static" />
                        </div>
                    </div>
                    <div class="form-group">
                       <%-- <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>--%>
                        <div class="col-md-12">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password" ValidationGroup="b" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="required" ErrorMessage="The password field is required." ValidationGroup="b" Display="Static" />
                        </div>
                    </div>
               <div class="form-group">
                        <div class="col-md-12">
                            <asp:Button runat="server" OnClick="LogIn" Text="LOGIN" ID="Login" OnClientClick="if (!Page_ClientValidate('b')){ return false; } this.disabled = true; this.value = 'Logging...';" UseSubmitBehavior="False" ValidationGroup="b" />
                        </div>
                    </div>    
                    
                     <div class="form-group">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                          <div class="col-md-6" style="text-align:right; padding-top:8px;">
                              <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/forgetpassword.aspx">Forget Password</asp:LinkButton>
                        </div>
                    </div>
                    
                </div>
             
            </section>
                  
                     
                        

                         
                <asp:HyperLink runat="server" ID="RegisterHyperLink" Visible="False">Signup</asp:HyperLink> 
                  
              

                       </div>

                   </div>
             
            </div>
        </div>   </div>      
                      <%--     <section id="socialLoginForm">
                <uc:openauthproviders runat="server" id="OpenAuthLogin" />
            </section> --%>
                           
</asp:Content>

