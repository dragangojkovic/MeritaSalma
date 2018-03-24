<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="meta.aspx.cs" Inherits="Admin_configration_meta" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


     <div class="row">
                
                <div class="col-md-6 col-md-offset-3">
                    <uc1:savediv runat="server" ID="savediv" Visible="false"/>
                    <div class="form form-div">
                        <h3>
         
 Add Meta Tags</h3>
                      
                          <div class="form-horizontal">
                            <div class="form-group">
                                  <asp:Label ID="Label1" runat="server" Text="Title:"></asp:Label><br />
                                    
                          <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

                                </div>
                              <div class="form-group">
                                  <asp:Label ID="Label2" runat="server" Text="Keyword(use comma seperated values Max 15 keywords):"></asp:Label><br />
                                    
                          <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                  <asp:Label ID="Label3" runat="server" Text="Description (use max 200 characters description):"></asp:Label><br />
                                    
                          <asp:TextBox ID="TextBox3" runat="server" Height="300px"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="required" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>

                                </div>

                               <div class="form-group">
                                   <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                                   <br />
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT MetaTitle, MetaKey, MetaDescription FROM SeoMeta" UpdateCommand="UPDATE SeoMeta SET MetaTitle = @Title, MetaKey = @Key , MetaDescription = @Description">
                                       <UpdateParameters>
                                           <asp:ControlParameter ControlID="TextBox1" Name="Title" PropertyName="Text" />
                                           <asp:ControlParameter ControlID="TextBox2" Name="Key" PropertyName="Text" />
                                           <asp:ControlParameter ControlID="TextBox3" Name="Description" PropertyName="Text" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   </div>
                              </div>
                        </div>
                    </div>
                    </div>



</asp:Content>

