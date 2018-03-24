<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="getquote.aspx.cs" Inherits="getquote" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


     <div class="min-height">

 
    <div class="container">
        <uc1:savediv runat="server" ID="savediv" Visible="false" />
            <div class="row">
               
                  <div class="col-md-8 col-md-offset-2 form-div form">  
                      <h3>
                          Get a Quote
                      </h3>
                      <br />
                      <div class="form-horizontal"> <div class="form-group">
                          <div class="col-md-6">
                              First Name:
                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" ControlToValidate="TextBox1" CssClass="required" ValidationGroup="quote"></asp:RequiredFieldValidator>
                          </div>
                          <div class="col-md-6">
                              Last Name:
                              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" ControlToValidate="TextBox2" CssClass="required" ValidationGroup="quote"></asp:RequiredFieldValidator>
                          </div>
                              <div class="col-md-6">
                          Country:
                               <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource6" DataTextField="Country" DataValueField="CountryId" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                       <asp:ListItem Value="0">Select Country</asp:ListItem>
                                   </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This Field is Required" ValidationGroup="quote" InitialValue="0" ControlToValidate="DropDownList1" CssClass="required"></asp:RequiredFieldValidator>


                              </div>
                           <div class="col-md-6">
                          City
                                         <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource7" DataTextField="CityName" DataValueField="Cityid" AppendDataBoundItems="True">
                                             <asp:ListItem Value="0">Select City</asp:ListItem>
                                         </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This Field is Required" ValidationGroup="quote" ControlToValidate="DropDownList2" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

                       </div>
                              <div class="col-md-6">
                                  Contact Number:
                              <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required" ValidationGroup="quote" ControlToValidate="TextBox3" CssClass="required"></asp:RequiredFieldValidator>
                          </div>
                          
                          <div class="col-md-6">
                              Email:
                              <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid Email Required" CssClass="required" ControlToValidate="TextBox4" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required" ValidationGroup="quote" ControlToValidate="TextBox4" CssClass="required"></asp:RequiredFieldValidator>
                          </div>
                            <div class="col-md-6">
                              Specification:
                              <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required" ValidationGroup="quote" ControlToValidate="TextBox5" CssClass="required"></asp:RequiredFieldValidator>
                         
                                 </div>
                             <div class="col-md-6 nopadding">
                                
                                 <div class="row">
                                     <div class="col-xs-6"> Price Range:<br />
                                         <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                          <ajaxToolkit:FilteredTextBoxExtender ID="TextBox6_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox6_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="TextBox6">
                                         </ajaxToolkit:FilteredTextBoxExtender>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required" ValidationGroup="quote" ControlToValidate="TextBox6" CssClass="required"></asp:RequiredFieldValidator>
                         
                                         
                                     </div>
                                      <div class="col-xs-6">
                                          <br />
                                          <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                           <ajaxToolkit:FilteredTextBoxExtender ID="TextBox7_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox7_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="TextBox7">
                                          </ajaxToolkit:FilteredTextBoxExtender>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is required" ValidationGroup="quote" ControlToValidate="TextBox7" CssClass="required"></asp:RequiredFieldValidator>
                         
                                     </div>
                                 </div>
                               </div>
                           <div class="col-md-12">
                               <br />
                               <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" ValidationGroup="quote" />
                               </div>
                      </div>
                      </div> </div> </div>  </div>  </div>

    <br />
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Country, CountryId FROM Country ORDER BY Country"></asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT City.CityName, Country.Country, City.Cityid FROM City INNER JOIN Country ON City.Countryid = Country.Countryid WHERE (Country.Countryid = @CountryName) ORDER BY City.CityName">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="DropDownList1" Name="CountryName" PropertyName="SelectedValue" />
                             </SelectParameters>
     </asp:SqlDataSource>
                           
     <br />
     <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO GetQuote(FirstName, LastName, CountryId, CityId, ContactNumber, Email, Specifiication, Pricemin, Pricemax, InsertDate, status) VALUES (@FirstName, @LastName, @CountryId, @City, @ContactNumber, @Email, @Specification, @Pricemin, @Pricemax, GETDATE(), @status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
         <InsertParameters>
             <asp:ControlParameter ControlID="TextBox1" Name="FirstName" PropertyName="Text" />
             <asp:ControlParameter ControlID="TextBox2" Name="LastName" PropertyName="Text" />
             <asp:ControlParameter ControlID="DropDownList1" Name="CountryId" PropertyName="SelectedValue" />
             <asp:ControlParameter ControlID="DropDownList2" Name="City" PropertyName="SelectedValue" />
             <asp:ControlParameter ControlID="TextBox3" Name="ContactNumber" PropertyName="Text" />
             <asp:ControlParameter ControlID="TextBox4" Name="Email" PropertyName="Text" />
             <asp:ControlParameter ControlID="TextBox5" Name="Specification" PropertyName="Text" />
             <asp:ControlParameter ControlID="TextBox6" Name="Pricemin" PropertyName="Text" />
             <asp:ControlParameter ControlID="TextBox7" Name="Pricemax" PropertyName="Text" />
             <asp:Parameter DefaultValue="Pending" Name="status" />
         </InsertParameters>
     </asp:SqlDataSource>
                           
</asp:Content>

