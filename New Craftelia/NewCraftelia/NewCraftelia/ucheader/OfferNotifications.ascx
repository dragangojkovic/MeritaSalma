<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OfferNotifications.ascx.cs" Inherits="usercontrol_OfferNotifications" %>

        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(ApplyRequest.Status) AS Offer FROM ApplyRequest INNER JOIN PostARequest ON ApplyRequest.PostARequestId = PostARequest.PostARequestId WHERE (PostARequest.UserName = @Username) AND (ApplyRequest.ReadStatus = N'unread')" UpdateCommand="UPDATE ApplyRequest SET ReadStatus = @status WHERE (PostARequestId = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="Username" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
<div class="col-xs-3 col-md-2">
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="ListView1_ItemDataBound">
    <ItemTemplate>
<asp:LinkButton ID="LinkButton17" runat="server" Font-Bold="True" PostBackUrl="~/postreq/receivedoffers.aspx" CausesValidation="False"> <i class="fa fa-bell"></i><asp:Label ID="Label1" runat="server" Text='<%# Eval("Offer") %>'></asp:Label>
    <br /> Offers
                             </asp:LinkButton>


         
    </ItemTemplate>
</asp:ListView>
       
       </div>
