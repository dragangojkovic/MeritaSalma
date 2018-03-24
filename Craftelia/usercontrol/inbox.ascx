<%@ Control Language="C#" AutoEventWireup="true" CodeFile="inbox.ascx.cs" Inherits="usercontrol_inbox" %>


<div class="mainbg">



<div class="container">
  
        
         

                    

        <div class="form-div">   <h3>              
      <asp:Label ID="Label1" runat="server" Text="Inbox"></asp:Label></h3>

        </div> 

                 
                        
                  <br />    
                    
                       <ul class="nav nav-pills" role="tablist">
  <li class="nav-item">
    <a class="nav-link active"  href="../Account/myinbox.aspx" >
        <asp:Label ID="Label4" runat="server" Text="All" Font-Bold="True"></asp:Label></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"  href="../Account/myinbox.aspx?status=unread" >
        <asp:Label ID="Label2" runat="server" Text="Unread" Font-Bold="True"></asp:Label></a>
  </li>
  <li class="nav-item">
    <a class="nav-link"  href="../Account/myinbox.aspx?status=read" >
        <asp:Label ID="Label3" runat="server" Text="Read" Font-Bold="True"></asp:Label></a>
  </li>
 <%-- <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#settings" role="tab">Archived</a>
  </li>--%>
</ul>

                 
                   
                     
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource6" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
                        <ItemTemplate> 
                            
                             <asp:LinkButton ID="LinkButton2" CommandName="chat" runat="server" ForeColor="Gray"> 
<div class="row inbox">

                                <div class="col-md-1 col-xs-3">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("profileimage") %>' Width="100%" CssClass="img-circle" />
                                </div>

    <%--<asp:Label ID="Label2" runat="server" Text='<%# Eval("User_Id") %>' ForeColor="#333333" Visible="false"></asp:Label> --%>
     <asp:Label ID="Label1" runat="server" Text='<%# Eval("ChatID") %>' ForeColor="#333333" Visible="false"></asp:Label> 
                            <div class="col-md-9 col-xs-9"> 
                                 <asp:Label ID="Label8" runat="server" Text='<%# Eval("UserName") %>' Visible="false" ForeColor="#333333"></asp:Label>
                             <asp:Label ID="Label5" runat="server" Text='<%# Eval("ProfileId") %>' Visible="false" ForeColor="#333333"></asp:Label> <br />
                                  <asp:Label ID="Label7" runat="server" Text='<%# Eval("VendorName") %>' ForeColor="#333333"></asp:Label> <br />
                         <small>    <asp:Label ID="Label17" runat="server" Text='<%# Eval("Message") %>'></asp:Label>  </small> 

                            </div>
                                 <div class="col-md-2"> 
                                    <small><asp:Label ID="Label18" runat="server" Text='<%# Eval("SendDate") %>'></asp:Label></small> <br />
                                     <small><asp:Label ID="Label6" runat="server" Text='<%# Eval("Status") %>'></asp:Label></small>
                            </div>
                            </div>
                          
                                  
                           </asp:LinkButton> 
                            
                              
                        </ItemTemplate>
                    </asp:ListView>          
                    
                    
                     
            
             
                   
                           
                        
              
            <br />
        </div></div>

        <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT TopMessage.UserName, TopMessage.id, AllMessages.message, AllMessages.senddate, AllMessages.ChatID, AllMessages.Status, ISNULL(Profile_1.VendorName, N'Anonymous') AS VendorName, Profile_1.ProfileId, ISNULL(Profile_1.VendorLogo, N'~/DynamicImage/nonimagefound.png') AS profileimage FROM (SELECT MAX(Messages.id) AS id, AspNetUsers.UserName FROM Messages INNER JOIN AspNetUsers ON AspNetUsers.Id = CASE WHEN dbo.Messages.recepient = (SELECT Id FROM dbo.AspNetUsers AS SendUser WHERE (UserName = @Sender)) THEN dbo.Messages.sender ELSE dbo.Messages.recepient END INNER JOIN Profile ON AspNetUsers.UserName = Profile.UserName WHERE (Messages.sender = (SELECT Id FROM AspNetUsers AS SendUser WHERE (UserName = @Sender))) OR (Messages.recepient = (SELECT Id FROM AspNetUsers AS RecipentUser WHERE (UserName = @Sender))) GROUP BY AspNetUsers.UserName) AS TopMessage INNER JOIN (SELECT id, message, senddate, ChatID, Status FROM Messages AS Messages_1 WHERE (Status LIKE '%' + @status + '%')) AS AllMessages ON TopMessage.id = AllMessages.id INNER JOIN Profile AS Profile_1 ON TopMessage.UserName = Profile_1.UserName ORDER BY TopMessage.id DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="Sender" PropertyName="Value" />
            <asp:QueryStringParameter DefaultValue="%" Name="status" QueryStringField="status" />
        </SelectParameters>
    </asp:SqlDataSource>