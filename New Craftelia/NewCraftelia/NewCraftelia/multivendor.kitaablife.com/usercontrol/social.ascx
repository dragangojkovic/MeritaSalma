<%@ Control Language="C#" AutoEventWireup="true" CodeFile="social.ascx.cs" Inherits="usercontrol_social" %>


  <%--<script type = "text/javascript">

 function SetTarget() {

     document.target = "_blank";

 }--%>

<%--</script>--%>
  <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Icon, URL, Status FROM SocialMedia WHERE (Status = N'Active')"></asp:SqlDataSource>
    
   <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource6">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("URL") %>' Visible="false"></asp:Label>
                               <%-- <asp:ImageButton ID="ImageButton2" runat="server" OnClientClick="SetTarget();" CausesValidation="False" CommandName="view" ImageUrl='<%# Eval("icon") %>' />--%>
                            <a target="_blank" href='<%# Eval("URL") %>' runat="server"> <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("icon") %>' Height="32px" Width="32px" /></a>
                            </ItemTemplate>
                        </asp:ListView>