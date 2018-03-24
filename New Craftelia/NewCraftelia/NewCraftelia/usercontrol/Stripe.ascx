<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Stripe.ascx.cs" Inherits="usercontrol_Paypal" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SUM(Amount + deliverycostperitem) AS Total FROM dbo.[Order] WHERE (OrderNo = @OrderNo) GROUP BY deliverycostperitem">
    <SelectParameters>
        <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:HiddenField ID="HiddenField2" runat="server" />
<p>
     <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
     <div class="form-group">
                                    Full Name <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please Enter Full Name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
        CARD NUMBER  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Card Number" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                       <asp:TextBox ID="TextBox1" runat="server" placeholder="Valid Card Number" CssClass="form-control" Text="4242424242424242"></asp:TextBox> 

                                    </div> 

      CVC  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please Enter CVC" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                       <asp:TextBox ID="TextBox6" runat="server" placeholder="Valid Card Number" CssClass="form-control" Text="234"></asp:TextBox> 

                                    </div> 
                                 
                                    <div class="form-group">
                                   EXPIRATION DATE <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Month" ForeColor="Red"  Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please Enter Year" ForeColor="Red"  ></asp:RequiredFieldValidator>
                                    <div>
                                        <asp:TextBox ID="TextBox2" runat="server" placeholder="MM" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div>
                                        <br />
                                        <asp:TextBox ID="TextBox3" runat="server" placeholder="YYYY" CssClass="form-control"></asp:TextBox>
                                    </div> 
                                      <br /> 
                                </div> 

                                     <div class="form-group">
                                    Amount<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please Enter Full Name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="True">0</asp:TextBox>
                                </div>
   <asp:Button ID="Button1" runat="server" Text="Pay Now" Width="100%" OnClick="Button1_Click" />


    