<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="paymentgateway.aspx.cs" Inherits="paymentgateway" %>

<%@ Register Src="~/usercontrol/Paypal.ascx" TagPrefix="uc1" TagName="Paypal" %>
<%@ Register Src="~/usercontrol/Stripe.ascx" TagPrefix="uc1" TagName="Stripe" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container">
            <div class="row">
                  <div class="col-md-6 col-md-offset-3 form-div">  
                       
                      <div class="form">
                          <h3>              
      <asp:Label ID="Label9" runat="server" Text="Select Payment Type"></asp:Label></h3>
                          <div class="alert alert-info">
                              <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                  <asp:ListItem Selected="True">Paypal</asp:ListItem>
                                  <asp:ListItem>Credit Card</asp:ListItem>
                              </asp:RadioButtonList>

                          </div>
                     <hr />
                          <uc1:Paypal runat="server" ID="Paypal" Visible ="True" />
                         <%-- <asp:Button ID="Button1" runat="server" Text="Continue" OnClick="Button1_Click" />--%>
                          <uc1:Stripe runat="server" ID="Stripe" Visible ="false" />

                          </div>
                      </div>
                </div>
                </div>
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" UpdateCommand="UPDATE dbo.[Order] SET paymenttype = @Type WHERE (OrderNo = @OrderNo)">
        <UpdateParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="Type" PropertyName="SelectedValue" />
            <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
        </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>

