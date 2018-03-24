<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rating.ascx.cs" Inherits="usercontrol_rating" %>

  <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
  <style>
      .ratingEmpty {
          background-image: url('/Starrating/ratingStarEmpty.gif');
          width: 18px;
          height: 18px;
      }
.ratingFilled
{
background-image: url('/Starrating/ratingStarFilled.gif');
width:18px;
height:18px;
}
.ratingSaved
{
    background-image: url('/Starrating/ratingStarSaved.gif');
width:18px;
height:18px;
}

    </style>
 <div >
<div class="form" >

    <div runat="server" visible="false">
        <h4 class="title">
            Leave a review
        </h4> <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="rate" runat="server" ErrorMessage="Your Name is Required" ControlToValidate="TextBox2" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:TextBox ID="TextBox2" placeholder="Your Name" runat="server" Width="200px" ValidationGroup="rate"></asp:TextBox> <br />
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Your Comment" ValidationGroup="rate" TextMode="SingleLine"></asp:TextBox>

    
 <div class="row lead">
        <ajaxToolkit:Rating ID="Rating1" runat="server" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled" CurrentRating="3"></ajaxToolkit:Rating>
	
     <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="pull-right" ValidationGroup="rate" OnClick="Button1_Click" Font-Size="13px" />
 </div>
      </div>
 <br /> <br />
   



     <div class="row">

 
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">

           <EmptyDataTemplate>

                No Review available
           </EmptyDataTemplate>
            <ItemTemplate>
             

      <div class="col-md-6">

  
               <div class=" row form-div">
                   <div class="col-md-3">
  <asp:Label ID="Label4" runat="server" Text='<%# Eval("InsertBy") %>' Font-Size="12px" Font-Bold="True"></asp:Label> <br />
                   <asp:Label ID="Label3" runat="server" Text='<%# Eval("FeedbackDate") %>' Font-Size="10px"></asp:Label> <br />
                  <small>
<ajaxToolkit:Rating ID="Rating1" runat="server" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled" CurrentRating='<%#Eval("Star") %>' Enabled="False" ReadOnly="True"></ajaxToolkit:Rating>
                        
                    
 
                   </small> </div>
<div class="col-md-9"><asp:Label ID="Label1" runat="server" Text='<%# Eval("Comments") %>' Font-Bold="False" Font-Size="12px" ForeColor="#666666"></asp:Label>   </div>
                     
          
                 </div>     </div>
            </ItemTemplate>
        </asp:ListView>    </div>
   </div>
   </div> 

    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Feedback(OrderNo, InsertBy, Type, FeedbackDate, Star, Comments) VALUES (@OrderNo, @InsertBy, @Type, GETDATE(), @Star, @Comments)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Feedback.Star, Feedback.FeedbackDate, Feedback.Comments, Feedback.OrderNo, [Order].BuyerId, Profile.VendorName AS InsertBy FROM Feedback INNER JOIN [Order] ON Feedback.OrderNo = [Order].OrderNo INNER JOIN Profile ON Feedback.InsertBy = Profile.UserName">
    <InsertParameters>
        <asp:RouteParameter Name="OrderNo" RouteKey="ID" DefaultValue="5530700810042017112336" />
        <asp:ControlParameter ControlID="TextBox2" Name="InsertBy" PropertyName="Text" />
        <asp:Parameter DefaultValue="NA" Name="Type" />
        <asp:ControlParameter ControlID="TextBox1" Name="Comments" PropertyName="Text" />
    </InsertParameters>
    <SelectParameters>
        <asp:RouteParameter Name="OrderNo" RouteKey="ID" DefaultValue="5530700810042017112336" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />


    
