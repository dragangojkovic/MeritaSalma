<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Async="true" CodeFile="Deliver.aspx.cs" Inherits="Order_Deliver" %>

<%@ Register Src="~/usercontrol/rating.ascx" TagPrefix="uc1" TagName="rating" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="container">
          <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div style="text-align:right">
 <asp:LinkButton ID="LinkButton2" runat="server" CssClass="text-color" Font-Size="12px" CausesValidation="False">Contact</asp:LinkButton> | 
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-danger" Font-Size="12px" data-toggle="modal" data-target="#myModal1" CausesValidation="False">Request Cancellation</asp:LinkButton> 
</div>  
 <div class="sctn__hdr">   <h3>              
      <asp:Label ID="Label1" runat="server" Text="Order"></asp:Label>

 <%--    <small style="float:right">
          <asp:LinkButton ID="Button4" runat="server" CssClass="btn icon-btn btn-danger" Font-Size="10px" data-toggle="modal" data-target="#myModal"><span class="glyphicon btn-glyphicon glyphicon-export img-circle text-danger"></span>Request Modification</asp:LinkButton>  
 
<asp:LinkButton ID="Button2" runat="server" CssClass="btn icon-btn btn-success" Font-Size="10px" Visible="True"><span class="glyphicon btn-glyphicon glyphicon-ok img-circle text-success"></span>Accept Delivery</asp:LinkButton>
        
     </small>--%>
         </h3>
          
 </div>
                   
                    

     <br />
          
            
              <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource23" OnItemDataBound="ListView2_ItemDataBound" OnItemCommand="ListView2_ItemCommand">
                
                  <EmptyDataTemplate>
                    <div class="alert alert-warning">
Awaiting Delivery
                    </div>
                  </EmptyDataTemplate>
                  
                    <ItemTemplate>
<div class="form-div" style="background-color:white; padding:10px;">
             <div class="sctn__hdr">   <h3>              
      <asp:Label ID="Label6" runat="server" Text="Delivery"></asp:Label>
                 <br />
                 <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Accept Cancellation" Visible="false" Font-Size="Small" CssClass="btn btn-success btn-xs">Accept Cancellation</asp:LinkButton>
                 
                 <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Decline Cancellation" Font-Size="Small" CssClass="btn btn-danger btn-xs" Visible="false">Decline Cancellation</asp:LinkButton>


  <asp:LinkButton ID="Button2" runat="server" CssClass="btn icon-btn btn-info pull-right" CommandName="contact" Font-Size="10px" Visible="True"><span class="glyphicon btn-glyphicon glyphicon-envelope img-circle text-info"></span>Contact</asp:LinkButton>

                  <asp:LinkButton ID="Button4" runat="server" CssClass="btn icon-btn btn-danger pull-right" Font-Size="10px" data-toggle="modal" data-target="#myModal" CommandName="Modify" Visible="False"><span class="glyphicon btn-glyphicon glyphicon-export img-circle text-danger"></span>Request Modification</asp:LinkButton>  
  <asp:LinkButton ID="Button3" runat="server" CssClass="btn icon-btn btn-success pull-right" Font-Size="10px" CommandName="Accept"><span class="glyphicon btn-glyphicon glyphicon-ok img-circle text-success"></span>Accept Delivery</asp:LinkButton> 
                                       </h3>

             </div>
             

                      <div class="row">
                          <div class="col-md-8">
                         <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Gray" Font-Size="X-Small" Text='<%# Eval("username") %>'></asp:Label>   
                              <br />  <asp:Label ID="Label5" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                              
                               <asp:Label ID="Label10" runat="server" Text='<%# Eval("DeliveryId") %>' Visible="False"></asp:Label>
                              
                               
                          
                          </div>
                           <div class="col-md-4" style="text-align:center;">
                               <%--<asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("Attachment") %>'></asp:LinkButton>--%>
  
                               <br /> <asp:Label ID="Label7" runat="server" Text='<%# Eval("ActionStatus") %>' Visible="false"></asp:Label> 
                              <br />
                               <br />
                              

                                   <asp:LinkButton ID="lnkDownload" class="btn icon-btn btn-default" CommandArgument = '<%# Eval("Attachment") %>' runat="server" OnClick = "DownloadFile"> <span class="glyphicon btn-glyphicon glyphicon-save img-circle text-muted"></span> Download Attachment</asp:LinkButton>
                                   
                           </div>
                      </div>
                     
                    
                    <hr />
 </div>
                        <br />
                  </ItemTemplate>
              </asp:ListView>
         
       <div id="seller" runat="server" visible="false">
              <div class="form">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="TextBox1" CssClass="text text-danger" ValidationGroup="del"></asp:RequiredFieldValidator>
                   <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
                 <asp:FileUpload ID="FileUpload1" runat="server" />
                   <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="FileUpload1" CssClass="text text-danger" ValidationGroup="del"></asp:RequiredFieldValidator>
               
                  <asp:Button ID="Button1" runat="server" Text="Deliver Item" OnClick="Button1_Click" ValidationGroup="del" /> 
          </div>
          </div> 
                  <br/>
                  
                     

                  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content" style="background:#fff; color:white; text-align:center; padding:0px 30px;"><button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: #000000">
										&times;</button>
							<br />	
                               
								<div class="modal-body">
								<div class="btn-color"><div class="modal-header">
									<h3 class="modal-title" id="myModalLabel" style="font-weight:bold;">
										Request Modification</h3>
								</div></div>
                             <div id="buyer" runat="server" visible="false">
              <div class="form">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="TextBox1" CssClass="text text-danger" ValidationGroup="buy"></asp:RequiredFieldValidator>
                   <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" ValidationGroup="buy"></asp:TextBox>
                 <asp:FileUpload ID="FileUpload2" runat="server" />
                   <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="FileUpload1" CssClass="text text-danger" ValidationGroup="buy"></asp:RequiredFieldValidator>
               
                  <asp:Button ID="Button5" runat="server" Text="Request Modification"  ValidationGroup="buy" OnClick="Button5_Click" CssClass="pull-right" />
          </div>
          </div>  

								</div>
							</div>
						</div>
					</div>

                  <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content" style="background:#fff; color:white; text-align:center; padding:0px 30px;"><button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: #000000">
										&times;</button>
							<br />	
                               
								<div class="modal-body" style="min-height:350px">
								
                             
              <div class="form">
                  <h4><asp:Label ID="Label12" runat="server" Text="Reason of Cancellation" ForeColor="#333333"></asp:Label></h4>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Reason of Cancellation is Required" ControlToValidate="TextBox3" CssClass="text text-danger" ValidationGroup="cancel"></asp:RequiredFieldValidator>
                   <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" ValidationGroup="cancel"></asp:TextBox>
             
                  <asp:Button ID="Button6" runat="server" Text="Request Cancellation"  ValidationGroup="cancel"  CssClass="pull-right" OnClick="Button6_Click" />
          </div>
         

								</div>
							</div>
						</div>
					</div>
         <div runat="server" id="ordercompleted" visible="false">

        
                  <div id="complete" class="alert alert-success">
                      <h1 style="text-align:center">ORDER COMPLETED</h1>
                  </div>
                  <br />
                  <uc1:rating runat="server" ID="rating" />
                   </div>
                    
                
                  
                     </div>
          </div>
              </div> 



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT AspNetUsers_1.UserName AS BuyerUserName, [Order].OrderNo, [Order].OrderDate, [Order].Amount, [Order].Status, [Order].Requirement, Profile_1.UserName AS SellerUserName FROM [Order] INNER JOIN AspNetUsers ON [Order].SellerId = AspNetUsers.Id INNER JOIN AspNetUsers AS AspNetUsers_1 ON [Order].BuyerId = AspNetUsers_1.Id INNER JOIN Profile ON AspNetUsers_1.UserName = Profile.UserName INNER JOIN Profile AS Profile_1 ON AspNetUsers.UserName = Profile_1.UserName WHERE ([Order].OrderNo = @OrderNo)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="OrderNo" QueryStringField="OrderNo" />
        </SelectParameters>
    </asp:SqlDataSource>
    
       <asp:HiddenField ID="HiddenField1" runat="server" />

      <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Delivery(OrderNo, Attachment, Message, DeliveryDate, Status, UserName, Type, ActionDate, ActionStatus) VALUES (@OrderNo, @Attachment, @Message, GETDATE(), @Status, @UserName, @Type, GETDATE(), @ActionStatus)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT OrderNo, Attachment, Message, DeliveryDate, Status, UserName, Type, ActionDate, ActionStatus, DeliveryId FROM Delivery WHERE (OrderNo = @OrderNo)" UpdateCommand="UPDATE Delivery SET ActionDate = GETDATE(), ActionStatus = @ActionStatus, Status = @Status WHERE (DeliveryId = @DeliveryID)">
          <InsertParameters>
              <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
              <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="UserName" PropertyName="Value" />
          </InsertParameters>
          <SelectParameters>
              <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
          </SelectParameters>
      </asp:SqlDataSource>

      <asp:HiddenField ID="HiddenField2" runat="server" />

      <asp:SqlDataSource ID="SqlDataSource24" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" UpdateCommand="UPDATE [Order] SET ActionDate = GETDATE(), Status = @Status, DeliveryId = @DeliveryId, Comments = @Comments WHERE (OrderNo = @OrderNo)">
          <UpdateParameters>
              <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
          </UpdateParameters>
      </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SMTP, BCC, Emailfrom, Port, Password FROM EmailSetup"></asp:SqlDataSource>

        </asp:Content>

