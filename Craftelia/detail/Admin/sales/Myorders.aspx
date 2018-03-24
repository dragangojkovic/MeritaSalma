<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="Myorders.aspx.cs" Inherits="seller_Myorders" %>

<%@ Register Src="~/uccart/shippingdetail.ascx" TagPrefix="uc1" TagName="shippingdetail" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
  
              <div class="form-div form" style="border:none;">  
                 
                   <div class="row"> 
                       
                          <div class="col-md-2">  <h3>
         
All Sales </h3>
                              </div>
                                <div class="col-md-2">    <br /> Order #:
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                             </div>
                       <div class="col-md-2">
                           <br />
                           Buyer:
                           <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                       </div>
                         <div class="col-md-2">
                             <br />
                             Seller: 
                         <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                             </div>
                         <div class="col-md-2">
                             <br />
                             Product Name: 
                         <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                             </div>
                         <div class="col-md-2">
                             <br /> <br />
                             <asp:Button ID="Button2" runat="server" Text="Refresh"  />
                             </div>
                   </div>

        </div> 

                 
                        
                  <br />    
                    
                       <ul class="nav nav-pills" role="tablist">
  <li class="nav-item">
    <a class="nav-link active"  href="../sales//Myorders.aspx" >
        <asp:Label ID="Label4" runat="server" Text="Order" Font-Bold="True"></asp:Label></a>
  </li>

                            <li class="nav-item">
    <a class="nav-link"  href="../sales/Myorders.aspx?status=Pending" >
        <asp:Label ID="Label15" runat="server" Text="Shipped" Font-Bold="True"></asp:Label></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"  href="../sales/Myorders.aspx?status=Accept" >
        <asp:Label ID="Label2" runat="server" Text="Received" Font-Bold="True"></asp:Label></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"  href="../sales/Myorders.aspx?status=Cancel" >
        <asp:Label ID="Label3" runat="server" Text="Cancelled Orders" Font-Bold="True"></asp:Label></a>
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
                 <div class="form-div form row">

                      <div class="col-md-4">
                            <asp:Label ID="Label16" runat="server" Text="Product: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                            <asp:Image ID="Image2" runat="server" Height="50px" Width="50px" ImageAlign="Top" ImageUrl='<%# Eval("CoverImage") %>' /> 
                          <asp:LinkButton ID="LinkButton1" Text='<%# Eval("ProductName") %>' runat="server" Enabled="True"></asp:LinkButton>
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>
                       <div class="col-md-1">
                            <asp:Label ID="Label18" runat="server" Text="Price: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                              <asp:Label ID="Label14" runat="server" Text='<%# Eval("Currency" ) %>' /> <asp:Label ID="Label8" runat="server" Text='<%# Eval("Amount" , "{0:n}" ) %>' />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>
                       <div class="col-md-1">
                            <asp:Label ID="Label20" runat="server" Text="Qty: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                           <asp:Label ID="Label11" runat="server" Text='<%# Eval("Quantity" ) %>' />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>

                       <div class="col-md-1">
                            <asp:Label ID="Label22" runat="server" Text="Total: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                           <asp:Label ID="Label7" runat="server" Text='<%# Eval("Currency" ) %>' /><asp:Label ID="Label13" runat="server" Text='<%# Eval("TotalAmount" , "{0:n}" ) %>' />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>

                       <div class="col-md-5">
                            <asp:Label ID="Label24" runat="server" Text="Details: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                        
                              <h6> Seller Name :
                 <small>
                     <asp:Label ID="Label10" runat="server" Text='<%# Eval("SellerName") %>' /> <br />
                    
                 </small>
                      
             </h6>    

                              <h6> Buyer Name :
                 <small>
                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("BuyerName") %>' /> <br />
                    
                 </small>
                      
             </h6>    
                           
                           
                            <h6> Order ID:  

                     <small>

                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("OrderNo") %>' />   </small> </h6>


<h6>


Order Date: 
                       <small>

                       <asp:Label ID="ServiceDeliveryDaysLabel" runat="server" Text='<%# Eval("OrderDate") %>' /> </small>

</h6>
<h6>


Order/Delivery Accept Status: 
                       <small>

                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("ActionStatus") %>' />   </small></h6>

                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>


<div style="text-align:right">
<asp:LinkButton ID="LinkButton2" runat="server" CommandName="Invoice" CssClass="btn btn-info btn-xs">Invoice</asp:LinkButton> 
<asp:Button ID="Button2" runat="server" Text="Contact" CommandName="contact"  CssClass="btn btn-success btn-xs" Visible="False" /> 
<asp:Button ID="Button1"  runat="server" Text="Deliver" CommandName="deliver"  CssClass="btn btn-warning btn-xs" Visible="False" />  
</div>
                        </div>

                   





         
             
            </div>

      
            </ItemTemplate>
        </asp:ListView>

        

         
      




      
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AspNetUsers_1.UserName AS BuyerUserName, [Order].OrderNo, [Order].OrderDate, [Order].Amount, [Order].Status, [Order].Requirement, Products.CoverImage, Products.ProductName, Products.Currency, [Order].Quantity, [Order].Quantity * [Order].Amount AS TotalAmount, ISNULL(Delivery.ActionStatus, [Order].Status) AS ActionStatus, Profile.ProfileId, Profile.VendorName AS BuyerName, Profile_1.VendorName AS sellername FROM [Order] INNER JOIN AspNetUsers ON [Order].SellerId = AspNetUsers.Id INNER JOIN AspNetUsers AS AspNetUsers_1 ON [Order].BuyerId = AspNetUsers_1.Id INNER JOIN Profile ON AspNetUsers_1.UserName = Profile.UserName INNER JOIN Products ON [Order].ProductKey = Products.ProductKey INNER JOIN Profile AS Profile_1 ON AspNetUsers.UserName = Profile_1.UserName LEFT OUTER JOIN Delivery ON [Order].OrderNo = Delivery.OrderNo WHERE ([Order].Status &lt;&gt; N'Pending') AND (ISNULL(Delivery.ActionStatus, [Order].Status) LIKE N'%' + @status + N'%') AND ([Order].OrderNo LIKE N'%' + @OrderNo + N'%') AND (Profile.VendorName LIKE N'%' + @BuyerName + N'%') AND (Profile_1.VendorName LIKE N'%' + @SellerName + N'%') AND (Products.ProductName LIKE N'%' + @ProductName + N'%')">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="Active" Name="status" QueryStringField="Status" />
            <asp:ControlParameter ControlID="TextBox1" Name="OrderNo" PropertyName="Text" DefaultValue="%" />
            <asp:ControlParameter ControlID="TextBox2" DefaultValue="%" Name="BuyerName" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" DefaultValue="%" Name="SellerName" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox4" DefaultValue="%" Name="ProductName" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>

