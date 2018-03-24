<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="SetupPayment.aspx.cs" Inherits="Admin_configration_SetupPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


   

    <div class="row">
        <div class="col-md-4 col-md-offset-4 form form-div">
            <h3>
           
Setup Payment</h3>
        <div class="form-horizontal">
                            <div class="form-group">

  Paypal Addresss:  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>


    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />

                                </div>
            </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Paypal FROM dbo.Setup" UpdateCommand="UPDATE dbo.Setup SET Paypal = @Paypal">
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="Paypal" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>

            </div> </div> </div>
</asp:Content>

