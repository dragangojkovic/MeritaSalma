<%@ Control Language="C#" AutoEventWireup="true" CodeFile="category-defaultpage.ascx.cs" Inherits="usercontrol_category" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName, Icon, FrontBanner, Status FROM Category WHERE (Status = N'Active') ORDER BY CategoryName"></asp:SqlDataSource>
<div class="menu">
                    <ul id="menu" style="padding-top:8px">
                      
 

         <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
    <ItemTemplate>
 <li>
   
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>
       <%--  <a class="dropdown-toggle" data-toggle="dropdown" href="#">--%>

         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="CDetails" >
        

      
        &nbsp;    <asp:Image ID="Image8" runat="server" ImageUrl='<%# Eval("Icon") %>' Height="15px" ImageAlign="AbsMiddle" /> 
      &nbsp; <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
        <i class="fa fa-angle-right pull-right margintop" style="margin-top:-16px; -webkit-margin-before: 0px; font-size:11px;" aria-hidden="true"></i>
             <div class="clearfix"></div>
    </asp:LinkButton>
    <%--  </a>--%>

         
       
         <ul> 
           <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="ListView2_ItemCommand">

              <ItemTemplate>
             <asp:Label ID="Label12" runat="server" Text='<%# Eval("CategoryId") %>' Visible="False"></asp:Label>
                 <li><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Details" Text='<%# Eval("SCategoryname") %>'></asp:LinkButton></li>    <asp:Label ID="Label4" runat="server" Text='<%# Eval("ScategoryId") %>' Visible="False"></asp:Label>
    
                     
  
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


