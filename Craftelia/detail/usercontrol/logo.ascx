<%@ Control Language="C#" AutoEventWireup="true" CodeFile="logo.ascx.cs" Inherits="usercontrol_logo" %>
      
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Logo, logowidth, logoheight, CompanyName, Address, SupportContact FROM Logo"></asp:SqlDataSource>


 <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource7">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("Logo") %>' CssClass="img visible-lg" Width='<%# System.Web.UI.WebControls.Unit.Parse(Eval("logowidth").ToString()) %>' CausesValidation="False" PostBackUrl="~/Default.aspx" Height='<%# System.Web.UI.WebControls.Unit.Parse(Eval("logoheight").ToString()) %>' ImageAlign="AbsMiddle" />
                                <asp:ImageButton ID="ImageButton2" runat="server" CssClass="img hidden-lg img-responsive" ImageUrl='<%# Eval("Logo") %>' CausesValidation="False" PostBackUrl="~/Default.aspx"/>
                            </ItemTemplate>
                        </asp:ListView>