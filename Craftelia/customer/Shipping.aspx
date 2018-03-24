<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Shipping.aspx.cs" Inherits="customer_Shipping" %>

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
                                 PostCode:
                                  <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This Field is Required" ValidationGroup="shp" ControlToValidate="TextBox6" CssClass="required"></asp:RequiredFieldValidator>
                                
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO dbo.OrderShipping(FullName, ContactNumber, ShippingAddress, City, Country, UserName, InsertDate, OrderNo, OrderCommission, PostCode) VALUES (@FullName, @ContactNumber, @ShippingAddress, @City, @Country, @UserName, GETDATE(), @OrderNo, @OrderCom, @postcode)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(FullName, '') AS FullName, ISNULL(ContactNumber, '') AS ContactNumber, ISNULL(ShippingAddress, '') AS Shippingaddress, ISNULL(City, '') AS City, ISNULL(PostCode, '') AS PostCode, ISNULL(Country, '') AS Country, UserName FROM dbo.OrderShipping WHERE (UserName = @UserName)" UpdateCommand="UPDATE dbo.Customer SET FullName = @FullName, Contactnumber = @ContactNumber, Country = @Country, City = @City, Shippingaddress = @ShippingAddress, PostCode = @postcode WHERE (UserName = @UserName)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="FullName" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="ContactNumber" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" Name="Country" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox4" Name="City" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox5" Name="ShippingAddress" PropertyName="Text" />
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
            <asp:SessionParameter Name="OrderNo" SessionField="Cart" />
            <asp:SessionParameter Name="OrderCom" SessionField="comm" />
            <asp:ControlParameter ControlID="TextBox6" Name="postcode" PropertyName="Text" />
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
            <asp:ControlParameter ControlID="TextBox6" Name="postcode" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
   
    <asp:HiddenField ID="HiddenField1" runat="server" />
   
</asp:Content>

