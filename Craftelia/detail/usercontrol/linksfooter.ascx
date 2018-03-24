<%@ Control Language="C#" AutoEventWireup="true" CodeFile="linksfooter.ascx.cs" Inherits="usercontrol_links" %>

   <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT PageTitleId, PageTitle, URL FROM PageTitle WHERE (HFData = N'Footer') ORDER BY PageTitleId, PageTitle"></asp:SqlDataSource>
       
 <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="ListView3_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-4 nopadding">
       <h5>
                        <small>
                        <asp:LinkButton ID="LinkButton4" runat="server" Text='<%# Eval("PageTitle") %>' CommandName="page" ></asp:LinkButton>     
                        </small>
                    </h5>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("URL") %>' Visible="False"></asp:Label>
               <asp:Label ID="Label2" runat="server" Text='<%# Eval("PageTitleId") %>' Visible="False"></asp:Label> 
</div>
                </ItemTemplate>
            </asp:ListView>