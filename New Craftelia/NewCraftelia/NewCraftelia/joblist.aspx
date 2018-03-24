<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="joblist.aspx.cs" Inherits="joblist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <div class="mainbg">
       
   

             <script>
                 $(document).ready(function () {
                     (function () {
                         var showChar = 400;
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
           
                    <div class="form-div" style="background:none; border:none;">
                    <h3>
                      Healthcare  Jobs
                    </h3></div>
              
                   
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
<div class="form form-div">
                        
                                <h4>
                                  <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("logo") %>' CssClass="img-circle" Width="45px" Height="40px" /> <asp:Label ID="Label2" runat="server" Text='<%# Eval("JobTitle") %>' Font-Bold="True"></asp:Label>
                                </h4>
                                <h6> <small>

                                 
                                    <i class="fa fa-user"></i> <asp:Label ID="Label1" runat="server" Text='<%# Eval("vendorname") %>' ></asp:Label> | <i class="fa fa-clock-o"></i> <asp:Label ID="Label3" runat="server" Text='<%# Eval("ExpiryDate") %>' ></asp:Label> 
                                </small>    </h6>


                             <div class="truncate">  
                               <p>

                               <%# Eval("JobDescription") %>    </p> 
                               
                          </div>
                       
                     </div>
                     


                        </ItemTemplate>
                    </asp:ListView>
                    
                

              
        </div>
      <br /> </div>
 
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [JobList] WHERE [JobListId] = @JobListId" InsertCommand="INSERT INTO [JobList] ([JobTitle], [JobDescription], [ExpiryDate], [UserName]) VALUES (@JobTitle, @JobDescription, @ExpiryDate, @UserName)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT JobList.JobListId, JobList.JobTitle, JobList.JobDescription, JobList.ExpiryDate, JobList.UserName, Profile.VendorName, Profile.VendorLogo AS logo FROM JobList INNER JOIN Profile ON JobList.UserName = Profile.UserName WHERE (JobList.ExpiryDate &gt; GETDATE()) ORDER BY JobList.JobListId DESC" UpdateCommand="UPDATE [JobList] SET [JobTitle] = @JobTitle, [JobDescription] = @JobDescription, [ExpiryDate] = @ExpiryDate, [UserName] = @UserName WHERE [JobListId] = @JobListId">
          <DeleteParameters>
              <asp:Parameter Name="JobListId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlID="TextBox1" Name="JobTitle" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="TextBox2" Name="JobDescription" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="TextBox3" Name="ExpiryDate" PropertyName="Text" Type="DateTime" />
              <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="JobTitle" Type="String" />
              <asp:Parameter Name="JobDescription" Type="String" />
              <asp:Parameter Name="ExpiryDate" Type="DateTime" />
              <asp:Parameter Name="UserName" Type="String" />
              <asp:Parameter Name="JobListId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
</asp:Content>

