<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Async="true" AutoEventWireup="true" CodeFile="ConfirmEmail.aspx.cs" Inherits="Account_ConfirmEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

 
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">  <br /><br /><br /><br /><br />

                    <div style="text-align:center;">
                        <i style="font-size:100px; color:#05801a" class="fa fa-check-circle"></i>
                    </div>
                    <br />
 <div id="message" runat="server" visible="false" class="alert alert-success" role="alert">Hi, <br />  You have successfully registered. A welcome email containing your username and password has been sent to your registered email address for your future reference.<br />
     <br />
     <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">Click Here to continue</asp:LinkButton>
                    </div>

                    <div class="alert alert-success" id="notconfirm" runat="server" visible="false" role="alert">Hey! some thing went wrong we do not found the verification link with us. Please <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/visiterregister.aspx">Click here</asp:HyperLink> &nbsp;to register again. Thanks

            </div>
                </div>
            </div>
           
        </div>
   

    <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SMTP, BCC, Emailfrom, Port, Password FROM EmailSetup"></asp:SqlDataSource>

        </asp:Content>

