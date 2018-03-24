<%@ Page Title="Register" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
 

    <div class="row">
        <div class="col-md-4 col-md-offset-4">  
             <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
            <div class="form form-div"> 
                <h3>Create a new account.</h3>
                      <div>
 <div class="form-horizontal">
      
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
         <%--   <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">User name</asp:Label>--%>
            <div class="col-md-12">
                
                <asp:TextBox runat="server" ID="UserName"  placeholder="User Name" /> 
                 
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="UserName" CssClass="text text-danger" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="required" ErrorMessage="The user name field is required." Display="Dynamic" />
            </div>
        </div>
        <div class="form-group">
            <%--<asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>--%>
            <div class="col-md-12">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password" />
       

              
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="required" ErrorMessage="The password field is required." Display="Static" />
            </div>
        </div>
        <div class="form-group">
            <%--<asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>--%>
            <div class="col-md-12"> 
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" placeholder="Confirm  Password" />
               
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="required" Display="Static" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="required" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
       
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" />
        
        </div>
     </div>  </div>
                </div>
             </div>
         </div>
           
  &nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Customer(UserName) VALUES (@UserName)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
        <InsertParameters>
            <asp:ControlParameter ControlID="UserName" Name="UserName" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

