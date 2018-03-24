<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="receivedoffers.aspx.cs" Inherits="BuyerRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


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
            <div class="form-div">
                <h3>
                    <asp:Label ID="Label1" runat="server" Text="Offers Received"></asp:Label></h3>
            </div>
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#333333">Total Offers</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="white" CssClass="badge badge-success"></asp:LinkButton>
            <%--   <asp:LinkButton ID="LinkButton3" runat="server" CssClass="pull-right" PostBackUrl="~/seller/applied.aspx" CausesValidation="False">Applied Projects</asp:LinkButton> --%><br />
            <br />
            <div class="row form form-div visible-lg" style="font-size: small; font-weight: bold;">

                <div class="col-md-4">
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
                <div class="col-md-5" style="text-align: center;">
                    Applied by
                </div>
            </div>




            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
                <ItemTemplate>

                    <div class="row inbox">

                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("PostARequestId") %>' Visible="False" />
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("AppliedStatus") %>' Visible="False" />



                        <div class="col-md-4">
                            <asp:Label ID="Label4" runat="server" Text="Title: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                            <div class="truncate">
                                <p class="nomargin">
                                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />

                                </p>
                            </div>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Date","{0:MMM dd}") %>' Font-Size="X-Small" Font-Bold="True" ForeColor="#666666" />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>
                        <div class="col-md-1">
                            <asp:Label ID="Label5" runat="server" Text="Offers: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Offer") %>' />
                        </div>
                        <div class="col-md-1">
                            <asp:Label ID="Label6" runat="server" Text="Duration: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                            <asp:Label ID="ServiceDeliveryDaysLabel" runat="server" Text='<%# Eval("ServiceDeliveryDays") %>' />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>
                        <div class="col-md-1">
                            <asp:Label ID="Label7" runat="server" Text="Budget $: " Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" CssClass="hidden-lg"></asp:Label>
                            <asp:Label ID="BudgetForTheServiceLabel" runat="server" Text='<%# Eval("BudgetForTheService") %>' />
                            <div class="hidden-lg" style="padding: 3px; border-bottom: 1px solid #ccc; margin-bottom: 10px;"></div>
                        </div>
                        <div class="col-md-5" style="border-left: solid #ccc 1px;">
                          

                                <asp:Image ID="Image1" runat="server" Height="30px" Width="30px" CssClass="img-circle" ImageAlign="AbsMiddle" ImageUrl='<%# Eval("profileimage") %>' />
                                <asp:LinkButton ID="LinkButton4" Text='<%# Eval("appliedby") %>' runat="server" Visible="false"></asp:LinkButton>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("VendorName") %>'></asp:Label>
                                <%--      <asp:Button ID="Button2" runat="server" Text="Contact" CommandName="contact" CssClass="btn btn-success btn-xs pull-right" />--%>
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Remove" CssClass="pull-right text text-danger pull-right"> &nbsp; <i class="fa fa-close"></i> Remove </asp:LinkButton>   
                                      <asp:LinkButton ID="LinkButton3" runat="server" CommandName="contact" CssClass="pull-right text text-success  pull-right">   <i class="fa fa-envelope"></i> Contact </asp:LinkButton>
                               
                               
                              

                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false"></asp:Label>
                                
<asp:Button ID="Button3" runat="server" Text="View Profile" Visible="false" CommandName="profile" CssClass="btn btn-color" />
                          
                                <asp:Button ID="Button1" runat="server" Text="Accept Offer" Visible="false" CommandName="order" CssClass="btn btn-info" />
                                <br /> 
 <asp:Label ID="Label10" runat="server" Text='<%# Eval("readstatus") %>' Font-Size="X-Small" Font-Bold="True" ForeColor="#666666" CssClass="pull-right"></asp:Label>
                         





                        </div>
                    </div>

                </ItemTemplate>
            </asp:ListView>









        </div>
<br />
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AllProject.Offer, AllProject.PostARequestId, AllProject.Title, AllProject.BudgetForTheService, AllProject.ServiceDeliveryDays, AllProject.Date, ISNULL(appliedrequest.Status, N'Not Applied') AS appliedstatus, ISNULL(Profile.VendorLogo, CAST(Profile.VendorName AS nvarchar(1))) AS ProfileImage, Profile.VendorName, appliedrequest.UserName AS appliedby, appliedrequest.ReadStatus, Profile.ProfileId FROM (SELECT COUNT(ApplyRequest.Status) AS Offer, PostARequest.PostARequestId, PostARequest.UserName, PostARequest.Title, PostARequest.BudgetForTheService, PostARequest.ServiceDeliveryDays, CAST(PostARequest.InsertDate AS date) AS Date FROM PostARequest LEFT OUTER JOIN ApplyRequest ON PostARequest.PostARequestId = ApplyRequest.PostARequestId GROUP BY ApplyRequest.Status, PostARequest.PostARequestId, PostARequest.UserName, PostARequest.Title, PostARequest.BudgetForTheService, PostARequest.ServiceDeliveryDays, PostARequest.InsertDate) AS AllProject INNER JOIN (SELECT ApplyRequestId, PostARequestId, UserName, ApplyDate, Status, ReadStatus FROM ApplyRequest AS ApplyRequest_1) AS appliedrequest ON AllProject.PostARequestId = appliedrequest.PostARequestId INNER JOIN Profile ON appliedrequest.UserName = Profile.UserName WHERE (AllProject.UserName = @UserName) AND (appliedrequest.ReadStatus &lt;&gt; N'remove') ORDER BY appliedrequest.ReadStatus DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT COUNT(ApplyRequest.Status) AS Offer FROM ApplyRequest INNER JOIN PostARequest ON ApplyRequest.PostARequestId = PostARequest.PostARequestId WHERE (PostARequest.UserName = @Username) AND (ApplyRequest.ReadStatus &lt;&gt; N'remove')" UpdateCommand="UPDATE ApplyRequest SET ReadStatus = @status WHERE (PostARequestId = @ID) ">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="Username" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />


</asp:Content>

