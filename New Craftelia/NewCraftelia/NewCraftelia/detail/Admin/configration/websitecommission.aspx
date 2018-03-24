<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="websitecommission.aspx.cs" Inherits="Admin_configration_websitecommission" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="row">

        <div class="col-md-4 col-md-offset-4">
            <div class="form form-div">
                <h3>Website Commission</h3>

                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-12">
                       <asp:Label ID="Label1" runat="server" Text="Commission:"></asp:Label><br />
      
                            
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
 
                            
                            </div>
                            <div class="col-md-11">

                            

                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                   <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox1_FilteredTextBoxExtender" TargetControlID="TextBox1" ID="TextBox1_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
                        </div>
                                <div class="col-md-1">
                                    %
                                </div> </div>
                                 <div class="form-group">
                                     <div class="col-md-12">
                                <asp:Button ID="Button1" runat="server" Text="Save"   ValidationGroup="a" OnClick="Button1_Click" />
                                  </div>   </div>
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Id, websitecommission FROM websitesetup" UpdateCommand="UPDATE websitesetup SET websitecommission = @commission">
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="TextBox1" Name="commission" PropertyName="Text" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                         
                        </div>
                    </div>
                </div>
               </div>
                    
                  

</asp:Content>

