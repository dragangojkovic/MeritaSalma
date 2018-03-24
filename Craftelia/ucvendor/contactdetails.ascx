<%@ Control Language="C#" AutoEventWireup="true" CodeFile="contactdetails.ascx.cs" Inherits="ucvendor_contactdetails" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>

<div class="title">
    <uc1:savediv runat="server" ID="savediv" Visible="false" />

    <asp:Label ID="Label15" runat="server" Text="Contact Details:"></asp:Label>

</div>


<div class="form form-div form-horizontal">
    <div class="form-group">



        <div class="col-md-6">
            <asp:Label ID="Label2" runat="server" Text="Telephone"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox1_FilteredTextBoxExtender" TargetControlID="TextBox1" ID="TextBox1_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This Field is Required" ValidationGroup="cd" ControlToValidate="TextBox1" CssClass="required"></asp:RequiredFieldValidator>

                       </div>
                          <div class="col-md-6">
                           <asp:Label ID="Label24" runat="server" Text="Mobile"></asp:Label> 
                           <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                              <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox2_FilteredTextBoxExtender" TargetControlID="TextBox2" ID="TextBox2_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="This Field is Required" ValidationGroup="cd" ControlToValidate="TextBox2" CssClass="required"></asp:RequiredFieldValidator>

                       </div>
                     <div class="col-md-6">
                           <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label> 
                           <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This Field is Required" ValidationGroup="cd" ControlToValidate="TextBox3" CssClass="required"></asp:RequiredFieldValidator>
</div>
                   <div class="col-md-6">
                       <br />
                          
                             <asp:Button ID="Button1" runat="server" ValidationGroup="cd" Text="Save" OnClick="Button1_Click" OnClientClick="if (!Page_ClientValidate('cd')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />   
                       <br />
                       <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(TelePhone, '') AS Telephone, ISNULL(Mobile, '') AS Mobile, ISNULL(Emailaddress, '') AS Email FROM Profile WHERE (UserName = @UserName)" UpdateCommand="UPDATE Profile SET TelePhone = @Telephone, Mobile = @Mobile, Emailaddress = @Email WHERE (UserName = @UserName)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                           </SelectParameters>
                           <UpdateParameters>
                               <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                               <asp:ControlParameter ControlID="TextBox1" Name="Telephone" PropertyName="Text" />
                               <asp:ControlParameter ControlID="TextBox2" Name="Mobile" PropertyName="Text" />
                               <asp:ControlParameter ControlID="TextBox3" Name="Email" PropertyName="Text" />
                           </UpdateParameters>
                       </asp:SqlDataSource>
                       <asp:HiddenField ID="HiddenField1" runat="server" />
                                      </div>    
                           
                         </div>

</div>                    <br />