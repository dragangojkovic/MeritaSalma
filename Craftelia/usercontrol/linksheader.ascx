<%@ Control Language="C#" AutoEventWireup="true" CodeFile="linksheader.ascx.cs" Inherits="usercontrol_links" %>

   <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT PageTitleId, PageTitle, URL, HFData FROM PageTitle WHERE (HFData = N'Header') ORDER BY PageTitleId, PageTitle"></asp:SqlDataSource>
       
 <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView3_ItemCommand">
                <ItemTemplate>
           <li>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("URL") %>' Visible="False"></asp:Label>
               <asp:Label ID="Label2" runat="server" Text='<%# Eval("PageTitleId") %>' Visible="False"></asp:Label>
<asp:LinkButton ID="LinkButton4" runat="server" Text='<%# Eval("PageTitle") %>' CommandName="page" ></asp:LinkButton></li>
                </ItemTemplate>
            </asp:ListView>