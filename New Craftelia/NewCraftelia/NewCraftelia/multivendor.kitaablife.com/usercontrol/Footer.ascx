<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="usercontrol_Footer" %>
     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT MenuTitleId, MenuTitle, Status FROM MenuTitle WHERE (Status = N'Active') ORDER BY MenuTitleId"></asp:SqlDataSource>
     
          
                
                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" >
                <ItemTemplate>
<div class="col-md-4">
            <h5><asp:Label ID="Label4" runat="server" Text='<%# Eval("MenuTitle") %>' Enabled="false" CommandName="page"></asp:Label>
            
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("MenuTitleId") %>' Visible="False"></asp:Label>

                <br />  <br />
                 <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4"  OnItemCommand="ListView1_ItemCommand">
                     <ItemTemplate>
                   <small>
                          <asp:Label ID="Label3" runat="server" Text='<%# Eval("PageTitleId") %>' Visible="False"></asp:Label>
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("URL") %>' Visible="False"></asp:Label>
                         <asp:LinkButton runat="server" Text='<%# Bind("PageTitle") %>' ID="LinkButton4" CommandName="view"></asp:LinkButton> </small>   <br />
                     
                     </ItemTemplate>

                 </asp:ListView>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT PageTitleId, URL, PageTitle, MenuTitleId FROM PageTitle WHERE (MenuTitleId = @ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label2" DefaultValue="1" Name="ID" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource></h5>

                 
            
			
		</div>
           </ItemTemplate>
            </asp:ListView>


     