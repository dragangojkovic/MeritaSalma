<%@ Control Language="C#" AutoEventWireup="true" CodeFile="otherdetails.ascx.cs" Inherits="ucvendor_otherdetails" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>

<div class="title">
    <uc1:savediv runat="server" ID="savediv" Visible="false" />
                             <asp:Label ID="Label21" runat="server" Text="Other Details:"></asp:Label>
                              
                         </div>  
                    
                       <div class="form form-div form-horizontal">
                     <div class="form-group">   
                         
                          <div class="col-md-6">
                       
                           <asp:Label ID="Label22" runat="server" Text="Delivery / Shipping"></asp:Label>
                              <br /><br />
                              <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Vertical" ValidationGroup="od" DataSourceID="SqlDataSource6" DataTextField="ProfileShipping" DataValueField="ProfileShipping" RepeatColumns="0">
                                 
                              </asp:CheckBoxList>
            </div>    

                         <div class="col-md-6">
                       
                           <asp:Label ID="Label23" runat="server" Text="Payment"></asp:Label> 
          <br /><br />
                             <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Vertical" ValidationGroup="od" DataSourceID="SqlDataSource5" DataTextField="ProfilePayment" DataValueField="ProfilePayment">
                                 
                              </asp:CheckBoxList>
                       </div>

                   
                   
                   </div>  

 <div class="form-group">
                             <div class="col-md-12">

                          
                             <asp:Button ID="Button1" runat="server" ValidationGroup="od" Text="Save" OnClick="Button1_Click" OnClientClick="if (!Page_ClientValidate('od')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />   </div>
                         </div>

                    </div>
               <br /> 

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProfilePayment] WHERE [ProfilePaymentID] = @ProfilePaymentID" InsertCommand="INSERT INTO [ProfilePayment] ([ProfilePayment], [Status]) VALUES (@ProfilePayment, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfilePaymentID, ProfilePayment, Status FROM dbo.ProfilePayment WHERE (Status = N'Active') ORDER BY ProfilePayment" UpdateCommand="UPDATE [ProfilePayment] SET [ProfilePayment] = @ProfilePayment, [Status] = @Status WHERE [ProfilePaymentID] = @ProfilePaymentID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProfilePaymentID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ProfilePayment" PropertyName="Text" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProfilePayment" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ProfilePaymentID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProfileShipping] WHERE [ProfileShippingID] = @ProfileShippingID" InsertCommand="INSERT INTO [ProfileShipping] ([ProfileShipping], [Status]) VALUES (@ProfileShipping, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfileShippingID, ProfileShipping, Status FROM dbo.ProfileShipping WHERE (Status = N'Active') ORDER BY ProfileShipping" UpdateCommand="UPDATE [ProfileShipping] SET [ProfileShipping] = @ProfileShipping, [Status] = @Status WHERE [ProfileShippingID] = @ProfileShippingID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProfileShippingID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ProfileShipping" PropertyName="Text" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProfileShipping" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ProfileShippingID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
<%--<p>
    &nbsp;</p>
<p>
    &nbsp;</p>--%>
                       <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(DeliveryID, 0) AS DeliveryID, ISNULL(PaymentID, 0) AS PaymentID FROM Profile WHERE (UserName = @UserName)" UpdateCommand="UPDATE Profile SET DeliveryID = @DeliveryId, PaymentID = @PaymentId WHERE (UserName = @UserName)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                           </SelectParameters>
                           <UpdateParameters>
                               <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                           </UpdateParameters>
                       </asp:SqlDataSource>
                       <asp:HiddenField ID="HiddenField1" runat="server" />
                                      