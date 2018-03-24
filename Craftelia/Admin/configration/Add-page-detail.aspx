<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" validateRequest="false" CodeFile="Add-page-detail.aspx.cs" EnableEventValidation="false" Inherits="admin_pagessetup" %>














<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
 


        <div class="form form-div">
            <div>

         <div class="form-horizontal">
             <div class="form-group">

           
                <asp:Label ID="Label2" runat="server" Text="    Select Page:"></asp:Label>
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="PageTitle" DataValueField="PageTitleId" AppendDataBoundItems="True">
                <asp:ListItem Value="0">Select Page</asp:ListItem>
               
            </asp:DropDownList>
                 
                 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please Select Page"  InitialValue="0" CssClass="required"></asp:RequiredFieldValidator>
          </div>
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/configration/LocalImages.aspx" Target="_blank">Click here to upload files (image, pdf, word etc) than passed the link in your content.</asp:HyperLink>
            <br />
            Body:
&nbsp;<asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
            

           
            <br />
            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
  </div> </div>  
            &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [PageTitle] WHERE [PageTitleId] = @PageTitleId" InsertCommand="INSERT INTO [PageTitle] ([PageTitle]) VALUES (@PageTitle)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [PageTitleId], [PageTitle] FROM [PageTitle]" UpdateCommand="UPDATE [PageTitle] SET [PageTitle] = @PageTitle WHERE [PageTitleId] = @PageTitleId">
                <DeleteParameters>
                    <asp:Parameter Name="PageTitleId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PageTitle" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PageTitle" Type="String" />
                    <asp:Parameter Name="PageTitleId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT PageBody, PageTitle FROM PageData WHERE (PageTitle = @Title)" UpdateCommand="UPDATE PageData SET PageBody = @Body WHERE (PageTitle = @Title)" InsertCommand="INSERT INTO PageData(PageTitle, PageBody) VALUES (@title, @body)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="title" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TextBox2" Name="body" PropertyName="Text" />
                        </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="Title" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="Body" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="Title" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>

            </div>
         
</asp:Content>

