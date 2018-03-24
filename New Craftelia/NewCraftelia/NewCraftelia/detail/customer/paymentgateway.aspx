<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="paymentgateway.aspx.cs" Inherits="paymentgateway" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container">
            <div class="row">
                  <div class="col-md-6 col-md-offset-3 form-div">  
                       
                      <div class="form">
                          <h3>              
      <asp:Label ID="Label9" runat="server" Text="Select Payment Type"></asp:Label></h3>
                          <div class="alert alert-info">
                              <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                  <asp:ListItem Selected="True">Cash on Delivery</asp:ListItem>
                              </asp:RadioButtonList>

                          </div>
                     <hr />
                          <asp:Button ID="Button1" runat="server" Text="Continue" OnClick="Button1_Click" />
                          </div>
                      </div>
                </div>
                </div>
    <br />
</asp:Content>

