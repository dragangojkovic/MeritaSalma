<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rating.ascx.cs" Inherits="usercontrol_rating" %>

  <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
  <style>
        .ratingEmpty {
            background-image: url(../Starrating/ratingStarEmpty.gif);
           width:18px;
            height: 18px;
        }
.ratingFilled
{
background-image: url(../Starrating/ratingStarFilled.gif);
width:18px;
height:18px;
}
.ratingSaved
{
 background-image: url(../Starrating/ratingStarSaved.gif);
width:18px;
height:18px;
}

    </style>

<div class="form-div">
    <div class="form">
        <h3>
            Leave a review
        </h3>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine">Good Work</asp:TextBox>
        
 <div class="row lead">
        <ajaxToolkit:Rating ID="Rating1" runat="server" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled" CurrentRating="3"></ajaxToolkit:Rating>
	
     <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="pull-right" OnClick="Button1_Click" />
 </div>
      
    </div>
</div>

<br />
     
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
<div class="form-div">
    <div class="form">
      
               <h4>

          <asp:Label ID="Label4" runat="server" Text='<%# Eval("InsertBy") %>'></asp:Label> :  <asp:Label ID="Label1" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                   <small class="pull-right">
<ajaxToolkit:Rating ID="Rating1" runat="server" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled" CurrentRating='<%#Eval("Star") %>' Enabled="False" ReadOnly="True"></ajaxToolkit:Rating>
                        
                       <br />
 <asp:Label ID="Label3" runat="server" Text='<%# Eval("FeedbackDate") %>'></asp:Label> 
                   </small> </h4> 
          </div>
     </div>   </ItemTemplate>
        </asp:ListView>

       

    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Feedback(OrderNo, InsertBy, Type, FeedbackDate, Star, Comments) VALUES (@OrderNo, @InsertBy, @Type, GETDATE(), @Star, @Comments)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Star, FeedbackDate, Comments, OrderNo, InsertBy FROM Feedback WHERE (OrderNo = @OrderNo)">
    <InsertParameters>
        <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
        <asp:ControlParameter ControlID="HiddenField1" Name="InsertBy" PropertyName="Value" />
        <asp:SessionParameter Name="Type" SessionField="Type" />
        <asp:ControlParameter ControlID="TextBox1" Name="Comments" PropertyName="Text" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="OrderNo" QueryStringField="OrderNo" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />


    
