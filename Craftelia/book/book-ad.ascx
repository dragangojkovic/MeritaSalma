<%@ Control Language="C#" AutoEventWireup="true" CodeFile="book-ad.ascx.cs" Inherits="usercontrol_book_ad" %>


   <div class="row">
        <div class="col-md-offset-3 col-md-6">
   <a>
  <div class="row" style="border:solid 1px #ccc; padding:5px; background:#fff;">
                <div class="col-md-2" style="text-align:center;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/book/book1.png" Height="100px" /> 
                </div>
      <div class="col-md-8" style="padding:0px;">
          <h2 style="font-family:Minion Pro SmBd; text-align:center">
          

            
              <asp:Label ID="Label1" runat="server" Text="What Brought Me $35,000 in 6 Months" Font-Size="35px" ForeColor="#f6bc28"></asp:Label>     </h2>
      
            <h6 style="font-family:Minion Pro SmBd; padding:0px 10px">

            <small>
                  <asp:Label ID="Label2" runat="server" Text="Secret Path of Online Millionaire " Font-Italic="True" Font-Size="20px"></asp:Label> <hr class="visible-xs" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="pull-right" Font-Size="14px" Font-Bold="True" Font-Names="Trajan Pro" ForeColor="#F829B2">Click Here for More Details</asp:LinkButton>
              </small>  </h6>
      
        
      </div>
        <div class="col-md-2 visible-lg">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/book/myphoto.jpg" Height="100px" CssClass="img-circle" /> 
                </div>    </div>   </a> 
        </div>
    </div>