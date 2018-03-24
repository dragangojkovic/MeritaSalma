<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BuyAd.aspx.cs" Inherits="BuyAd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="mainbg">
    <div class="container">
        <div class="row">
            
        
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="ListView1_ItemCommand">
        <ItemTemplate>

             <asp:Label ID="Label4" runat="server" Text='<%# Eval("AdvertisingSetupId") %>' Visible="false"></asp:Label>
<div class="col-md-3">
                <div class="form form-div nopadding">
                    <div class="plan">
                        <h3>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("PackageName") %>'></asp:Label>
                        </h3>
                    </div>
                
             
                   
                    <h2 class="center">
                   <asp:Label ID="Label3" runat="server" Text='<%# Eval("PackagePrice") %>'></asp:Label>
                </h2>
                    <hr />
              <div style="padding:10px; min-height:170px;">

         <br /><br />
                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("PackageDetails") %>'></asp:Label>     </div>
                   <br />
                   <div class="center">

                       <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-color" CommandName="show">Buy Now</asp:LinkButton>
                   </div>
            <br />
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <br />  </div></div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AdvertisingSetupId, PackageName, PackagePrice, PackageDetails, status FROM AdSetup WHERE (status = N'Active') ORDER BY PackagePrice"></asp:SqlDataSource>


</asp:Content>

