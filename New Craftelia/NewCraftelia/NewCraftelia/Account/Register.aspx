<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script type = "text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("<%=CheckBox1.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
    </script> 
    <div class="min-height">

 
    <div class="container">
  <div class="row">
        <div class="col-md-4 col-md-offset-4">  
      
       <p class="text-danger center"> <asp:Literal runat="server" ID="ErrorMessage" Visible="true" /></p>

            <div class="form form-div"> 
                <h3>Create a new account</h3>
                <br />
                      <div>
 <div class="form-horizontal"  onkeypress="return WebForm_FireDefaultButton(event, '<%= CreateUser.ClientID %>')">
    
        <asp:ValidationSummary runat="server" CssClass="text-danger" Visible="true" />
        <div class="form-group">
      <div class="col-md-12">
 <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
         <asp:ListItem>Buyer</asp:ListItem>
         <asp:ListItem>Seller</asp:ListItem>
         <asp:ListItem Selected="True">Both</asp:ListItem>
     </asp:RadioButtonList>
      </div>

             
            <div class="col-md-12">
                
                <asp:TextBox runat="server" ID="UserName"  placeholder="Email Address"  /> 
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="required" ErrorMessage="The Email Address field is required." Display="Dynamic" ValidationGroup="r" />
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Valid Email Required" ControlToValidate="UserName" CssClass="required" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="r"></asp:RegularExpressionValidator>
            </div>

              <div class="col-md-12">
                
                <asp:TextBox runat="server" ID="TextBox1"  placeholder="Your Full Name"  /> 
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1"
                    CssClass="required" ErrorMessage="Your Full Name is required." Display="Dynamic" ValidationGroup="r" />
              
            </div>
        </div>
        <div class="form-group">
         <div class="col-md-12">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password" />
       

              
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="required" ErrorMessage="The password field is required." Display="Dynamic" ValidationGroup="r" />
            </div>
        </div>
        <div class="form-group">
         <div class="col-md-12"> 
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" placeholder="Confirm  Password" />
               
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="required" Display="Dynamic" ErrorMessage="The confirm password field is required." ValidationGroup="r" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="required" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ValidationGroup="r" />
            </div>
            <br />
             

        </div>
      <div class="form-group">
           <div class="col-md-12"> 
               <asp:CheckBox ID="CheckBox1" runat="server" Text="I Agree with Terms and Conditions" ForeColor="Red" /> <br />
    <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="required" ErrorMessage="Please Accept to terms and conditions"  ClientValidationFunction="ValidateCheckBox" ValidationGroup="r"></asp:CustomValidator><br />
           

              </div>

          </div>
        <div class="form-group">
          <div class="col-md-12"> 
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" ID="CreateUser" ValidationGroup="r" OnClientClick="if (!Page_ClientValidate('r')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />
        
       </div>  </div>
     </div>  </div>
                </div>
             </div>
         </div>

        </div></div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO dbo.Profile(AccountMasterType, InsertDate, UserName, IP, UserApproval, AdminApproval, Emailaddress, VendorName, postcode) VALUES (@AccountMaster, GETDATE(), @UserName, @IP, @UserApproval, @AdminApproval, @Emailaddress, @VendorName, @postcode)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
        <InsertParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="AccountMaster" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="UserName" Name="UserName" PropertyName="Text" />
            <asp:Parameter DefaultValue="Active" Name="UserApproval" />
            <asp:ControlParameter ControlID="UserName" Name="Emailaddress" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox1" Name="VendorName" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

