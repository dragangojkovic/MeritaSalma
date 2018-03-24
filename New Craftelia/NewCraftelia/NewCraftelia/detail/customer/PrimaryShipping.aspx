﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PrimaryShipping.aspx.cs" Inherits="customer_Shipping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="mainbg">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-6">
                    <div class="form form-div">
                        <h3>Shipping Details:
                        </h3>
                        <br />
                        <div class="form-horizontal">
                            <div class="form-gorup">
                                  Name:
                                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This Field is Required" ValidationGroup="shp" ControlToValidate="TextBox1" CssClass="required"></asp:RequiredFieldValidator>
                                
                            </div>
                             <div class="form-group">
                                  Phone:
                                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This Field is Required" ValidationGroup="shp" ControlToValidate="TextBox2" CssClass="required"></asp:RequiredFieldValidator>
                                
                            </div>
                             <div class="form-group">
                                  Country:
                                  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This Field is Required" ValidationGroup="shp" ControlToValidate="TextBox3" CssClass="required"></asp:RequiredFieldValidator>
                                
                            </div>
                             <div class="form-group">
                                   City:
                                  <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This Field is Required" ValidationGroup="shp" ControlToValidate="TextBox4" CssClass="required"></asp:RequiredFieldValidator>
                                
                            </div>
                             <div class="form-group">
                                 Address:
                                  <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This Field is Required" ValidationGroup="shp" ControlToValidate="TextBox5" CssClass="required"></asp:RequiredFieldValidator>
                                
                            </div>
                          
                             <div class="form-group">
                                 <asp:Button ID="Button1" runat="server" Text="Save & Continue" ValidationGroup="shp" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO dbo.Customer(FullName, Contactnumber, Country, City, Shippingaddress, UserName) VALUES (@FullName, @ContactNumber, @Country, @City, @ShippingAddress, @UserName)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(FullName, '') AS FullName, ISNULL(Contactnumber, '') AS ContactNumber, ISNULL(Shippingaddress, '') AS Shippingaddress, ISNULL(City, '') AS City, ISNULL(PostCode, '') AS PostCode, ISNULL(Country, '') AS Country, UserName FROM dbo.Customer WHERE (UserName = @UserName)" UpdateCommand="UPDATE dbo.Customer SET FullName = @FullName, Contactnumber = @ContactNumber, Country = @Country, City = @City, Shippingaddress = @ShippingAddress WHERE (UserName = @UserName)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="FullName" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="ContactNumber" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" Name="Country" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox4" Name="City" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox5" Name="ShippingAddress" PropertyName="Text" />
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="FullName" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="ContactNumber" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" Name="Country" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox4" Name="City" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox5" Name="ShippingAddress" PropertyName="Text" />
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
   
    <asp:HiddenField ID="HiddenField1" runat="server" />
   
</asp:Content>

