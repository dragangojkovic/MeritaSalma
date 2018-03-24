<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="advertform.aspx.cs" Inherits="advertform" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="whitebg">
   <div class="container">
       <div class="row">
        <br />  
           
               
            <div style="text-align:center;" class="hidden-lg">
            <img src="images/AdvertiseWithUsToday.png" width="200px" />    </div>
           
            <div class="col-md-offset-3 col-md-6">
               <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
               <div class="form form-div" style="border:none;">
                   <h3>
                   Advertise With us Today
                   </h3>
                   <br />
                   <div class="form-horizontal" style="padding: 0px 13px">
                       <div class="form-group">
                           <div class="col-md-3">
                               Name:
                           </div>
                           <div class="col-md-9">
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" Display="Dynamic" CssClass="required" ControlToValidate="TextBox1" ValidationGroup="ad"></asp:RequiredFieldValidator>
                           </div>
                       </div>

                       <div class="form-group">
                           <div class="col-md-3">
                              Email:

                           </div>
                           <div class="col-md-9">
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" Display="Dynamic" CssClass="required" ControlToValidate="TextBox2" ValidationGroup="ad"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid Email Required" ControlToValidate="TextBox2" CssClass="text-danger" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                       </div>

                       <div class="form-group">
                           <div class="col-md-3">
                               Contact #:

                           </div>
                           <div class="col-md-9">
<asp:TextBox ID="TextBox3" runat="server" TextMode="SingleLine"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" Display="Dynamic" CssClass="required" ControlToValidate="TextBox3" ValidationGroup="ad"></asp:RequiredFieldValidator>
                           </div>
                       </div>
                       <div class="form-group">
                           <div class="col-md-3">
                              Zip file

                               (make all your images for advert as zip file and upload here)</div>
                           <div class="col-md-9">
                               <asp:FileUpload ID="FileUpload1" runat="server" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" Display="Dynamic" CssClass="required" ControlToValidate="FileUpload1" ValidationGroup="ad"></asp:RequiredFieldValidator>
                           </div>
                       </div>
                       <div class="form-group">
                           <div class="col-md-4 col-md-offset-8">
                               <asp:Button ID="Button1" runat="server" Text="Send" Width="100%" ValidationGroup="ad" OnClick="Button1_Click"  />
                             
                      
                           </div>
                         
                       </div>
                   </div>
                   

                 
               </div>

           </div>
      
          <div class="col-md-2">

           <img src="images/AdvertiseWithUsToday.png" class="img-responsive visible-lg" />
              
           </div>
           
            </div>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Advertisement(Advertisesetupid, ZipFile, Name, Email, Contact, InsertDate, Status) VALUES (@ID, @ZipFile, @Name, @Email, @Contact, GETDATE(), @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
           <InsertParameters>
               <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
               <asp:ControlParameter ControlID="TextBox1" Name="Name" PropertyName="Text" />
               <asp:ControlParameter ControlID="TextBox2" Name="Email" PropertyName="Text" />
               <asp:ControlParameter ControlID="TextBox3" Name="Contact" PropertyName="Text" />
               <asp:Parameter DefaultValue="Pending" Name="Status" />
           </InsertParameters>
       </asp:SqlDataSource>
       <br />
   </div></div>
</asp:Content>

