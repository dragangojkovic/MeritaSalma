<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="ProductReviews.aspx.cs" Inherits="Admin_product_setup_ProductReviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="form form-div">
        <h3>
            All Product Reviews
        </h3>
        <div class="row">
            <div class="col-md-3">
 <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
             <div class="col-md-2">
<asp:Button ID="Button1" runat="server" Text="Refresh" />
             </div>
        </div>
        <br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FeedbackId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowSorting="True">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" />
        <asp:BoundField DataField="FeedbackId" HeaderText="FeedbackId" InsertVisible="False" ReadOnly="True" SortExpression="FeedbackId" />
        <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" SortExpression="OrderNo" />
        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
        <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
        <asp:BoundField DataField="Star" HeaderText="Star" SortExpression="Star" />
        <asp:BoundField DataField="FeedbackDate" HeaderText="FeedbackDate" SortExpression="FeedbackDate" />
        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        <asp:BoundField DataField="InsertBy" HeaderText="InsertBy" SortExpression="InsertBy" />
    </Columns>
</asp:GridView>
    </div>
    
   
    
    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Feedback] WHERE [FeedbackId] = @FeedbackId" InsertCommand="INSERT INTO [Feedback] ([OrderNo], [InsertBy], [Type], [FeedbackDate], [Star], [Comments]) VALUES (@OrderNo, @InsertBy, @Type, @FeedbackDate, @Star, @Comments)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Feedback.FeedbackId, Feedback.OrderNo, Feedback.InsertBy, Feedback.Type, Feedback.FeedbackDate, Feedback.Star, Feedback.Comments, Products.ProductName FROM Feedback INNER JOIN Products ON Feedback.OrderNo = Products.ProductKey

where Products.ProductName Like '%'+@Productname +'%'" UpdateCommand="UPDATE [Feedback] SET [OrderNo] = @OrderNo, [InsertBy] = @InsertBy, [Type] = @Type, [FeedbackDate] = @FeedbackDate, [Star] = @Star, [Comments] = @Comments WHERE [FeedbackId] = @FeedbackId">
    <DeleteParameters>
        <asp:Parameter Name="FeedbackId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="OrderNo" Type="String" />
        <asp:Parameter Name="InsertBy" Type="String" />
        <asp:Parameter Name="Type" Type="String" />
        <asp:Parameter Name="FeedbackDate" Type="DateTime" />
        <asp:Parameter Name="Star" Type="Int32" />
        <asp:Parameter Name="Comments" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" Name="Productname" PropertyName="Text" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="OrderNo" Type="String" />
        <asp:Parameter Name="InsertBy" Type="String" />
        <asp:Parameter Name="Type" Type="String" />
        <asp:Parameter Name="FeedbackDate" Type="DateTime" />
        <asp:Parameter Name="Star" Type="Int32" />
        <asp:Parameter Name="Comments" Type="String" />
        <asp:Parameter Name="FeedbackId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

