<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="type.aspx.cs" Inherits="Admin_usercontrol_type" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="row">
                
                <div class="col-md-3">
                    <uc1:savediv runat="server" ID="savediv" />
                    <div class="form form-div">
                        <h3>
         
 Add </h3>
                      
                          <div class="form-horizontal">
                            <div class="form-group">
                                 <asp:Label ID="Label1" runat="server" Text="Titile:"></asp:Label><br />
                                    
                          <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

                                </div> 

                              <div class="form-group">
                                    <asp:Button ID="Button1" runat="server" Text="Save" Width="100%" ValidationGroup="a" />
                              </div>

                          </div> </div> </div> 
               <div class="col-md-8">
                    <div class="form form-div">
                        <div class="table-responsive">

                        </div>
                        </div>
                   </div>

      </div> 
</asp:Content>

