<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyPurchases.aspx.cs" Inherits="seller_Myorders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="mainbg">

  
    <div class="container">
              <div class="form-div" style="border:none;">   <h3>              
      <asp:Label ID="Label1" runat="server" Text="My Orders"></asp:Label></h3></div> 

                 
                        
                  <br />    
                    
                       <ul class="nav nav-pills" role="tablist">
  <li class="nav-item">
    <a class="nav-link active"  href="../customer/MyPurchases.aspx" >
        <asp:Label ID="Label4" runat="server" Text="Order" Font-Bold="True"></asp:Label></a>
  </li>

                              <li class="nav-item">
    <a class="nav-link"  href="../customer/MyPurchases.aspx?status=Pending"" >
        <asp:Label ID="Label5" runat="server" Text="Shipped" Font-Bold="True"></asp:Label></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"  href="../customer/MyPurchases.aspx?status=Accept" >
        <asp:Label ID="Label2" runat="server" Text="Received" Font-Bold="True"></asp:Label></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"  href="../customer/MyPurchases.aspx?status=Cancel"" >
        <asp:Label ID="Label3" runat="server" Text="Cancelled" Font-Bold="True"></asp:Label></a>
  </li>

                          

</ul>

           
        <br />
        <div class="row form form-div visible-lg" style="font-size: small; font-weight: bold;">

                <div class="col-md-4">
                    Product
                </div>
                <div class="col-md-1">
                    Price
                </div>
                <div class="col-md-1">
                 Qty
                </div>
                <div class="col-md-1">
                    Total
                </div>
                <div class="col-md-5" style="text-align: center;">
                    Details
                </div>
            </div>
            


        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
            <ItemTemplate>
                
     <asp:Label ID="Label6" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" /> 

                <div class="inbox row">

                      <div class="col-md-4">
                            <asp:Label ID="Label16" runat="server" Text="Product: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                            <asp:Image ID="Image2" runat="server" Height="50px" Width="50px" ImageAlign="Top" ImageUrl='<%# Eval("CoverImage") %>' /> 
                          <asp:LinkButton ID="LinkButton1" Text='<%# Eval("ProductName") %>' runat="server" Enabled="True"></asp:LinkButton>
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>
                       <div class="col-md-1">
                            <asp:Label ID="Label18" runat="server" Text="Price: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                              <asp:Label ID="Label15" runat="server" Text='<%# Eval("Currency" ) %>' /> <asp:Label ID="Label17" runat="server" Text='<%# Eval("Amount" , "{0:n}" ) %>' />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>
                       <div class="col-md-1">
                            <asp:Label ID="Label20" runat="server" Text="Qty: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                           <asp:Label ID="Label19" runat="server" Text='<%# Eval("Quantity" ) %>' />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>

                       <div class="col-md-1">
                            <asp:Label ID="Label22" runat="server" Text="Total: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                           <asp:Label ID="Label21" runat="server" Text='<%# Eval("Currency" ) %>' /><asp:Label ID="Label23" runat="server" Text='<%# Eval("TotalAmount" , "{0:n}" ) %>' />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>

                       <div class="col-md-5">
                            <asp:Label ID="Label24" runat="server" Text="Details: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                        
                              <h6> Vendor :
                 <small>
                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName") %>' /> <br />
                    
                 </small>
                      
             </h6>    
                           
                           
                            <h6> Order ID:  

                     <small>

                    <asp:Label ID="Label26" runat="server" Text='<%# Eval("OrderNo") %>' />   </small> </h6>


<h6>


Order Date: 
                       <small>

                       <asp:Label ID="Label27" runat="server" Text='<%# Eval("OrderDate") %>' /> </small>

</h6>
<h6>


Order/Delivery Accept Status: 
                       <small>

                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("Status") %>' />   </small></h6>

                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>


<div style="text-align:right">

<asp:Button ID="Button2" runat="server" Text="Contact" CommandName="contact" CssClass="btn btn-success btn-xs" />
                    <asp:Button ID="Button3" runat="server" Text="View Delivery" CommandName="delivery" CssClass="btn btn-warning btn-xs"  />
 
</div>
                        </div>

             
            </div>

                 



      
            </ItemTemplate>
        </asp:ListView>

        

         
      




       </div> 

        <br />

    </div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AspNetUsers_1.UserName AS BuyerUserName, [Order].OrderNo, [Order].OrderDate, [Order].Amount, [Order].Requirement, AspNetUsers.UserName, Products.ProductName, Products.CoverImage, [Order].Quantity, [Order].Quantity * [Order].Amount AS TotalAmount, Products.Currency, ISNULL(Delivery.ActionStatus, [Order].Status) AS Status, Profile.ProfileId FROM [Order] INNER JOIN AspNetUsers ON [Order].SellerId = AspNetUsers.Id INNER JOIN AspNetUsers AS AspNetUsers_1 ON [Order].BuyerId = AspNetUsers_1.Id INNER JOIN Profile ON AspNetUsers.UserName = Profile.UserName INNER JOIN Products ON [Order].ProductKey = Products.ProductKey LEFT OUTER JOIN Delivery ON [Order].OrderNo = Delivery.OrderNo WHERE (AspNetUsers_1.UserName = @UserName) AND (ISNULL(Delivery.ActionStatus, [Order].Status) LIKE N'%' + @status + N'%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
            <asp:QueryStringParameter DefaultValue="Active" Name="status" QueryStringField="Status" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

