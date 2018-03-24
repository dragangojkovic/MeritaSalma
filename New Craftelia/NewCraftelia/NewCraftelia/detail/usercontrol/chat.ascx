<%@ Control Language="C#" AutoEventWireup="true" ValidateRequestMode="Disabled"  CodeFile="chat.ascx.cs" Inherits="usercontrol_chat" %>
 
<div class="mainbg">



            <div class="container">   <div class="row">
                <div class="col-md-12">
                  
                    <div>
                        <div class="form-div" style="background:none; border:none">   <h3>              
     Chat Box </h3></div> 

                      
                      
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource6" OnItemDataBound="ListView3_ItemDataBound">
                                <ItemTemplate>
                                    <div class="row inbox"> 
                                        <div class="col-xs-1" >
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProfileImage") %>' Width="30px" Height="30px" CssClass="img-circle" />
                                        </div>
                                        <div class="col-xs-11" style="padding:0px;">
                                         <div> <asp:Label ID="Label19" runat="server" Text='<%# Eval("VendorName") %>' Font-Bold="True"></asp:Label>
                                            </div>
<asp:Label ID="Label18" runat="server" Text='<%# Eval("message") %>'></asp:Label>
                                            <br />
<div class="pull-right">
                                            <asp:Label ID="Label20" runat="server" Text='<%# Eval("senddate") %>' Font-Size="XX-Small" ForeColor="Gray"></asp:Label> 
                                        </div>
                                        </div>
                                     
                                      

                                    </div>
                              
                                </ItemTemplate>
                            </asp:ListView>
                         </div>

                     
                    <br />
       <div class="form">  
           <div class="alert alert-success" runat="server" id="mydiv" visible="false"> 
           <asp:Label ID="Label21" runat="server"></asp:Label></div>

           
           <asp:TextBox ID="TextBox1" runat="server"  placeholder="Type Your Message Here" TextMode="MultiLine"></asp:TextBox>
           <div style="text-align:right">
               
               <br />
               <asp:Button ID="Button2" runat="server" Text="SEND" CssClass="btn btn-color" OnClick="Button1_Click"  OnClientClick="if (!Page_ClientValidate('msg')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />  <br /> 
               <asp:Label ID="Label22" runat="server" Visible="False"></asp:Label>
              
           </div> 
      </div>  
   </div>
                          
                   
                </div>
                </div>
            <br />
      </div>
 <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Messages.message, Messages.senddate, Messages.id, AspNetUsers.UserName, ISNULL(Profile.VendorName, N'Anonymous') AS VendorName, ISNULL(Profile.VendorLogo, N'~/DynamicImage/nonimagefound.png') AS ProfileImage FROM Messages INNER JOIN AspNetUsers ON Messages.sender = AspNetUsers.Id INNER JOIN Profile ON AspNetUsers.UserName = Profile.UserName WHERE (Messages.ChatID = @ChatID) ORDER BY Messages.id">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label22" Name="ChatID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Messages SELECT Id AS sender, (SELECT AspNetUsers.Id FROM AspNetUsers INNER JOIN Profile ON AspNetUsers.UserName = Profile.UserName WHERE (Profile.ProfileId = @recipient)) AS recipient, @message AS message, GETDATE() AS senddate, @delivered AS delivered, GETDATE() AS received, @ChatId AS ChatID, @Status AS Status FROM AspNetUsers WHERE (UserName = @UserName)" oninserted="SqlDataSource7_Inserted" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" UpdateCommand="UPDATE dbo.Messages SET Status = N'read' WHERE        (recepient =
                             (SELECT        Id
                               FROM            dbo.AspNetUsers
                               WHERE        (UserName = @recepient)) OR
                         recepient =
                             (SELECT        Id
                               FROM            dbo.AspNetUsers AS AspNetUsers_2
                               WHERE        (UserName = @sender))) AND (sender =
                             (SELECT        Id
                               FROM            dbo.AspNetUsers AS AspNetUsers_1
                               WHERE        (UserName = @recepient)) OR
                         sender =
                             (SELECT        Id
                               FROM            dbo.AspNetUsers AS AspNetUsers_2
                               WHERE        (UserName = @sender)))
" SelectCommand="SELECT TOP (1) ChatID FROM dbo.Messages WHERE (recepient = (SELECT Id FROM dbo.AspNetUsers WHERE (UserName = @recepient)) OR recepient = (SELECT Id FROM dbo.AspNetUsers AS AspNetUsers_2 WHERE (UserName = @sender))) AND (sender = (SELECT Id FROM dbo.AspNetUsers AS AspNetUsers_1 WHERE (UserName = @recepient)) OR sender = (SELECT Id FROM dbo.AspNetUsers AS AspNetUsers_2 WHERE (UserName = @sender))) ORDER BY ChatID DESC">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="message" PropertyName="Text" />
            <asp:Parameter DefaultValue="0" Name="delivered" />
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="UserName" PropertyName="Value" />
            <asp:ControlParameter ControlID="Label22" Name="ChatId" PropertyName="Text" />
            <asp:QueryStringParameter Name="chat" QueryStringField="ChattID" />
            <asp:Parameter DefaultValue="unread" Name="Status" />
            <asp:RouteParameter DefaultValue="" Name="recipient" RouteKey="username" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="sender" PropertyName="Value" />
            <asp:ControlParameter ControlID="HiddenField2" Name="recepient" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="HiddenField2" Name="recepient" PropertyName="Value" />
            <asp:ControlParameter ControlID="HiddenField1" Name="sender" PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
<asp:HiddenField ID="HiddenField2" runat="server" />
