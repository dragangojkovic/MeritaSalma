<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="applied.aspx.cs" Inherits="BuyerRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <div class="mainbg">

     <script>
                 $(document).ready(function () {
                     (function () {
                         var showChar = 200;
                         var ellipsestext = "...";

                         $('.truncate').each(function () {
                             var content = $(this).html();
                             if (content.length > showChar) {

                                 var c = content.substr(0, showChar);
                                 var h = content;
                                 var html = '<div class="truncate-text" style="display:block">' + c + '<span class="moreellipses">' + ellipsestext + '&nbsp;&nbsp;<a href="" class="moreless more" style="color:#f6bc28; font-weight:bold; font-style:normal;">more</a></span></span></div><div class="truncate-text" style="display:none">' + h + '<a href="" class="moreless less" style="color:#f6bc28; font-weight:bold; font-style:normal;">Less</a></span></div>';

                                 $(this).html(html);
                             }

                         });

                         $(".moreless").click(function () {
                             var thisEl = $(this);
                             if (thisEl.hasClass("less")) {
                                 thisEl.closest('.truncate-text').prev('.truncate-text').toggle();
                                 thisEl.closest('.truncate-text').slideToggle();
                             } else {
                                 thisEl.closest('.truncate-text').toggle();
                                 thisEl.closest('.truncate-text').next('.truncate-text').fadeToggle();
                             }
                             return false;
                         });
                         /* end iffe */
                     }());

                     /* end ready */
                 });
    </script>

   
        <div class="container">
               <div class="form-div">   <h3>              
      <asp:Label ID="Label1" runat="server" Text="Applied Items"></asp:Label></h3></div> 
            <br />
        <asp:LinkButton ID="LinkButton1" runat="server"  ForeColor="#333333">Total Offer Sent </asp:LinkButton> <asp:LinkButton ID="LinkButton2" runat="server"  ForeColor="white" CssClass="badge badge-success"></asp:LinkButton>
          
            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="pull-right text-color" PostBackUrl="~/postreq/BuyerRequest.aspx" CausesValidation="False" Font-Bold="True">View Wanted Item</asp:LinkButton>
              <br />
               <br />
            <div class="row form form-div visible-lg" style=" font-size:small; font-weight:bold;">
                <div class="col-md-2">
                    Buyer
                </div>
                 <div class="col-md-7">
                  Request
                </div>
                  <div class="col-md-1">
                  Offers
                </div>
                  <div class="col-md-1">
                 Duration
                </div>
                  <div class="col-md-1">
                Budget $
                </div>
                 
            </div>

            


        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
            <EmptyDataTemplate>
                <br />
                <div class="alert alert-info">
                No Record Found
</div>
                 <br />
            </EmptyDataTemplate>

            <ItemTemplate>
                
                <div class="row inbox">
                <div class="col-md-2">
                       <asp:Label ID="Label2" runat="server" Text='<%# Eval("PostARequestId") %>' Visible="False" />
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("AppliedStatus") %>' Visible="False" />
                              <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' Visible="false" />
                      <asp:Label ID="Label9" runat="server" Text='<%# Eval("VendorName") %>'  /><br />
                              <asp:Label ID="Label3" runat="server" Text='<%# Eval("Date","{0:MMM dd}") %>' />
              <div class="hidden-lg" style="padding:3px; border-bottom:1px solid #ccc; margin-bottom:10px;"></div>  </div>
                 <div class="col-md-7">
                     <asp:Label ID="Label4" runat="server" Text="Title: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>  
                     <div class="truncate">  
                               <p>   <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                   </p>
                         </div>
               <div class="hidden-lg" style="padding:3px; border-bottom:1px solid #ccc; margin-bottom:10px;"></div>  </div>
                  <div class="col-md-1">
                 <asp:Label ID="Label5" runat="server" Text="Offers: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Offer") %>' />
                </div>
                  <div class="col-md-1">
                 <asp:Label ID="Label6" runat="server" Text="Duration: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>  <asp:Label ID="ServiceDeliveryDaysLabel" runat="server" Text='<%# Eval("ServiceDeliveryDays") %>' />
              <div class="hidden-lg" style="padding:3px; border-bottom:1px solid #ccc; margin-bottom:10px;"></div>   </div>
                  <div class="col-md-1">
               <asp:Label ID="Label7" runat="server" Text="Budget $: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>   <asp:Label ID="BudgetForTheServiceLabel" runat="server" Text='<%# Eval("BudgetForTheService") %>' />
             <div class="hidden-lg" style="padding:3px; border-bottom:1px solid #ccc; margin-bottom:10px;"></div>    </div>
              
                  <asp:Button ID="Button1" runat="server" Text="Send Offer" CommandName="SendOffer"  CssClass="btn btn-color" Width="100%" Visible="False" />
              
            </div>
      
            </ItemTemplate>
        </asp:ListView>

        

         
      




       </div>
   </div>
       
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AllProject.Offer, AllProject.PostARequestId, AllProject.UserName, AllProject.Title, AllProject.BudgetForTheService, AllProject.ServiceDeliveryDays, AllProject.Date, ISNULL(appliedrequest.Status, 'Not Applied') AS appliedstatus, Profile.VendorName FROM (SELECT COUNT(ApplyRequest.Status) AS Offer, PostARequest.PostARequestId, PostARequest.UserName, PostARequest.Title, PostARequest.BudgetForTheService, PostARequest.ServiceDeliveryDays, CAST(PostARequest.InsertDate AS date) AS Date FROM PostARequest LEFT OUTER JOIN ApplyRequest ON PostARequest.PostARequestId = ApplyRequest.PostARequestId GROUP BY ApplyRequest.Status, PostARequest.PostARequestId, PostARequest.UserName, PostARequest.Title, PostARequest.BudgetForTheService, PostARequest.ServiceDeliveryDays, PostARequest.InsertDate) AS AllProject INNER JOIN (SELECT ApplyRequestId, PostARequestId, UserName, ApplyDate, Status FROM ApplyRequest AS ApplyRequest_1 WHERE (UserName = @username)) AS appliedrequest ON AllProject.PostARequestId = appliedrequest.PostARequestId INNER JOIN Profile ON AllProject.UserName = Profile.UserName">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="username" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO ApplyRequest(PostARequestId, UserName, ApplyDate, Status) VALUES (@PostARequestId, @UserName, GETDATE(), @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(Status) AS Offer FROM ApplyRequest WHERE (UserName = @UserName)">
            <InsertParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="Nauna" Name="UserName" PropertyName="Value" />
                <asp:Parameter DefaultValue="Apply" Name="Status" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="Nauna" Name="UserName" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        

</asp:Content>

