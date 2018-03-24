<%@ Control Language="C#" AutoEventWireup="true" CodeFile="category-sitemaster.ascx.cs" Inherits="usercontrol_category" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName, Icon, FrontBanner, Status FROM Category WHERE (Status = N'Active') ORDER BY CategoryName"></asp:SqlDataSource>



 <div class="dropdown">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-list" style="font-size: 22px;"></i></a>
    		<ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
           
         <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" >
    <ItemTemplate>
  <li class="dropdown-submenu">
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>

     <asp:LinkButton ID="LinkButton11" runat="server" CausesValidation="False" CommandName="CDetails" Text='<%# Eval("CategoryName") %>'></asp:LinkButton>


        <ul class="dropdown-menu">  
                
           <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="ListView2_ItemCommand">

              <ItemTemplate>

                   <asp:Label ID="Label12" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>
               <asp:Label ID="Label4" runat="server" Text='<%# Eval("ScategoryId") %>' Visible="False"></asp:Label>
     <li>
           <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Details" Text='<%# Eval("SCategoryname") %>'></asp:LinkButton>
           
      </li>
          
                    </ItemTemplate>
        </asp:ListView>
            
           
    </ul>

  </li>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ScategoryId, CategoryId, SCategoryname, Status FROM SCategory WHERE (Status = N'Active') AND (CategoryId = @CategoryId)">
    <SelectParameters>
        <asp:ControlParameter ControlID="Label2" Name="CategoryId" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
    </ItemTemplate>
</asp:ListView>    
                
            
            </ul>
        </div>





