<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pdetail.ascx.cs" Inherits="ucdetail_detail" %>
<%@ Register Src="~/ucdetail/book.ascx" TagPrefix="uc1" TagName="book" %>
<%@ Register Src="~/ucdetail/Bid.ascx" TagPrefix="uc1" TagName="Bid" %>
<%@ Register Src="~/ucdetail/Tender.ascx" TagPrefix="uc1" TagName="Tender" %>



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Products.ProductName, isnull(enabledeal,'discount') as enabledeal, Size.Size, Category.CategoryName, SCategory.SCategoryname, SalesType.SalesType, Products.StartDate, Products.ExpiryDate, Products.Currency, Products.Price, Warranty.Warranty, Condition.Condition, Products.Brand, Products.CountryofOrigin, Products.Model, Products.Serial, Products.Certificate, Deliverable.Deliverable, Products.ProductKey, ISNULL(Views.Totalview, 0) AS Totalview, Products.discountoffer, Products.actualprice, Products.actualprice - Products.Price AS yousaveprice, ISNULL(Products.offerexpiry, GETDATE()) AS offerexpiry, ISNULL(Products.wholesaleqty, 0) AS wholesaleqty, ISNULL(Products.wholesaleprice, 0) AS wholesaleprice, Products.demotime FROM SCategory INNER JOIN SalesType INNER JOIN Products INNER JOIN Size ON Products.SizeId = Size.SizeID ON SalesType.SalesTypeID = Products.SaleTypeId INNER JOIN Warranty ON Products.WarrantyId = Warranty.WarrantyId INNER JOIN Condition ON Products.ConditionId = Condition.ConditionID INNER JOIN Deliverable ON Products.DeliveryId = Deliverable.DeliveryID INNER JOIN Category ON Products.CategoryId = Category.CategoryId ON SCategory.ScategoryId = Products.SubCategoryId LEFT OUTER JOIN (SELECT BusineessId, COUNT(*) AS Totalview FROM BusinessViews GROUP BY BusineessId) AS Views ON Products.ProductKey = Views.BusineessId WHERE (Products.ProductKey = @ID)">
    <SelectParameters>
        <asp:RouteParameter DefaultValue="5530700810042017112336" Name="ID" RouteKey="ID" />
    </SelectParameters>
</asp:SqlDataSource>

<div class="row">
    
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound">
    <ItemTemplate>
        
       
     
 <div class="col-md-10 nopadding"> 
                                  
                                    <h1>
                              <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                           </h1>
                           <h5>
                               <small>    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label> /   <asp:Label ID="Label3" runat="server" Text='<%# Eval("SCategoryname") %>'></asp:Label>  
                                    </small>
                           </h5></div>
                                  <div class="col-md-2 nopadding">
                                <h5>

                              
                                      <small>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Brand") %>'></asp:Label> 
                                      </small> </h5> <a>

                            <i class="fa fa-eye"></i> <asp:Label ID="Label5" runat="server" Text='<%# Eval("totalview") %>'></asp:Label> </a>
                                
                                   
                                  
                                  </div>
                          
                         
                         <div class="col-md-12 nopadding">

                       
                       <small>

                           <br />
                 
                              <table style="width:100%;" class="table-bordered">
                                 
                                  <tr>
                                      <td class="col-xs-4">Type : </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label6" runat="server" Text='<%# Eval("SalesType") %>'></asp:Label>   <asp:Label ID="Label27" CssClass="text-danger" runat="server" Text='<%# Eval("enabledeal") %>' Visible="false" Font-Bold="True"></asp:Label></td>
                                   
                                  </tr>
                                    <tr>
                                      <td class="col-xs-4">Size/Volume/Capacity/Range : </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label7" runat="server" Text='<%# Eval("Size") %>'></asp:Label></td>
                                   
                                  </tr>
                                    <tr>
                                      <td class="col-xs-4">Production / Start date: </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label8" runat="server" Text='<%# Eval("StartDate") %>'></asp:Label></td>
                                   
                                  </tr>
                                     <tr>
                                      <td class="col-xs-4">Expiry / End date : </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label9" runat="server" Text='<%# Eval("ExpiryDate") %>'></asp:Label></td>
                                   
                                  </tr>
                                     <tr>
                                      <td class="col-xs-4">Warranty : </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label10" runat="server" Text='<%# Eval("Warranty") %>'></asp:Label></td>
                                   
                                  </tr>
                                  <tr>
                                      <td class="col-xs-4">Condition : </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label11" runat="server" Text='<%# Eval("Condition") %>'></asp:Label></td>
                                   
                                  </tr>
                                  <tr>
                                      <td class="col-xs-4">Model : </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label12" runat="server" Text='<%# Eval("Model") %>'></asp:Label></td>
                                   
                                  </tr>
                                   <tr>
                                      <td class="col-xs-4"> Serial # : </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label13" runat="server" Text='<%# Eval("Serial") %>'></asp:Label></td>
                                   
                                  </tr>
                                   <tr>
                                      <td class="col-xs-4"> Certificate : </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label14" runat="server" Text='<%# Eval("Certificate") %>'></asp:Label></td>
                                   
                                  </tr>
                                      <tr>
                                      <td class="col-xs-4"> Country of Origin :
                                      </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label15" runat="server" Text='<%# Eval("CountryofOrigin") %>'></asp:Label></td>
                                   
                                  </tr>
                                      <tr>
                                      <td class="col-xs-4"> Delivery Option :
                                      </td>
                                      <td class="col-xs-8">  <asp:Label ID="Label16" runat="server" Text='<%# Eval("Deliverable") %>'></asp:Label></td>
                                   
                                  </tr>
                                 
                              </table>    

                            <br />
                       </small>
             
                                </div>
                    
               <div class="col-md-6">
                   
  <h3>
                                      <asp:Label ID="Label26" Visible="false" runat="server" Font-Size="10px"> The leasing price is </asp:Label> <asp:Label ID="Label17" runat="server" Text='<%# Eval("Currency") %>'></asp:Label><asp:Label ID="Label18" runat="server" Text='<%# Eval("Price") %>'></asp:Label>   <asp:Label ID="Label28" Visible="false" runat="server" Font-Size="10px" >Per <%# Eval("demotime") %> week(s) </asp:Label>
   <br />  <br /> <small style="font-size:11px;" > <asp:Label ID="Label25" CssClass="alert alert-info" Visible="false" runat="server"> Buy <%# Eval("wholesaleqty") %> Quantity in just <%# Eval("Currency") %> <%# Eval("wholesaleprice") %> </asp:Label>  </small>
                            </h3>  
                   
                   <br /> <div>

                

      

                       <asp:Panel ID="Panel1" runat="server" Visible="false">

 
         <small>   You Save <asp:Label ID="Label21" runat="server" Text='<%# Eval("Currency") %>'></asp:Label> <asp:Label ID="Label20" runat="server" Text='<%# Eval("yousaveprice") %>'></asp:Label>
                             </small> 
                           <br />
                           
                             <small >      <asp:Label ID="Label22" runat="server" Text='<%# Eval("Currency") %>' Font-Strikeout="True"></asp:Label> <asp:Label ID="Label19" runat="server" Text='<%# Eval("ActualPrice") %>' Font-Strikeout="True"></asp:Label>
                                  </small>
                        <small >     <asp:Label ID="Label23" runat="server"  CssClass="discount">-<%# Eval("discountoffer") %></asp:Label>   </small> <br />

                           <div class="form form-div">
                               <h6>

                            
                          
                          Offer Expiry:  <asp:Label ID="Label24" runat="server"  CssClass="text-danger" Text='<%# Eval("offerexpiry") %>'> </asp:Label>    </div>
                       </h5>   </asp:Panel>

 </div>  
                        </div>
           
                        
                              
    </ItemTemplate>
</asp:ListView>
     <uc1:book runat="server" ID="book"  />  <asp:Label ID="Label4" runat="server" Visible="false" CssClass="alert alert-warning col-md-6" ForeColor="Red" Font-Size="10px"></asp:Label> 
              </div>   <uc1:Bid runat="server" ID="Bid" Visible="false" /> <uc1:Tender runat="server" id="Tender" Visible="false" />
