<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="alljobs.aspx.cs" Inherits="seller_alljobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container">

   
    <div class="row">

   
     <div class="col-md-10 col-md-offset-1">
                <div class="form form-div" style="border:none">
                    <h3>
                        Job List
                    </h3>
                    <div class="table-responsive grid">

                   
<asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="JobListId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
          <Columns>
              <asp:CommandField ShowDeleteButton="True" />
              <asp:BoundField DataField="JobListId" HeaderText="JobListId" ReadOnly="True" SortExpression="JobListId" />
              <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
              <asp:BoundField DataField="JobDescription" HeaderText="JobDescription" SortExpression="JobDescription" />
              <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />
              <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
          </Columns>
      </asp:GridView> </div>
                </div>
            </div>

 </div>
 </div>


      <asp:HiddenField ID="HiddenField1" runat="server" />
      <br />
      
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [JobList] WHERE [JobListId] = @JobListId" InsertCommand="INSERT INTO [JobList] ([JobTitle], [JobDescription], [ExpiryDate], [UserName]) VALUES (@JobTitle, @JobDescription, @ExpiryDate, @UserName)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [JobListId], [JobTitle], [JobDescription], [ExpiryDate], [UserName] FROM [JobList]
where UserName=@UserName" UpdateCommand="UPDATE [JobList] SET [JobTitle] = @JobTitle, [JobDescription] = @JobDescription, [ExpiryDate] = @ExpiryDate, [UserName] = @UserName WHERE [JobListId] = @JobListId">
          <DeleteParameters>
              <asp:Parameter Name="JobListId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlID="TextBox1" Name="JobTitle" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="TextBox2" Name="JobDescription" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="TextBox3" Name="ExpiryDate" PropertyName="Text" Type="DateTime" />
              <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" Type="String" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="JobTitle" Type="String" />
              <asp:Parameter Name="JobDescription" Type="String" />
              <asp:Parameter Name="ExpiryDate" Type="DateTime" />
              <asp:Parameter Name="UserName" Type="String" />
              <asp:Parameter Name="JobListId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
</asp:Content>

