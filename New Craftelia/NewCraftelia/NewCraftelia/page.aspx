<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="page.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
  
 <div class="container">
   
 <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
     <br /> <br />


                 <div class="offers" style="text-transform:uppercase">

	 <h3>
               
                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("PageTitle") %>'></asp:Label></h3>
                  </div>
              
       
      

     

      
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("PageBody") %>'></asp:Label>
   
                </ItemTemplate>
            </asp:ListView>
        


    

           
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT PageData.PageBody, PageTitle.PageTitle, PageTitle.PageTitleId FROM PageData INNER JOIN PageTitle ON PageData.PageTitle = PageTitle.PageTitleId WHERE (PageTitle.PageTitleId = @PageTitle)">
                <SelectParameters>
                    <asp:RouteParameter Name="PageTitle" RouteKey="pageid" />
                </SelectParameters>
</asp:SqlDataSource>
    
        </div>

</asp:Content>
