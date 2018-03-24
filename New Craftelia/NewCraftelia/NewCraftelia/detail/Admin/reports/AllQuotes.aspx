<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AllQuotes.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="Admin_reports_AllQuotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="form form-div">

 <h3>
     All Quotes
 </h3>
<div class="row">
    <div class="col-md-1"> Status:</div>
        <div class="col-md-2"><asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
        <asp:ListItem Selected="True">Pending</asp:ListItem>
        <asp:ListItem>Closed</asp:ListItem>
    </asp:RadioButtonList></div>
</div>
   
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GetQuoteID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:CommandField ShowEditButton="True" EditText="Change Quote Status" />
            <asp:BoundField DataField="GetQuoteID" HeaderText="GetQuoteID" ReadOnly="True" SortExpression="GetQuoteID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" ReadOnly="True" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" ReadOnly="True" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" ReadOnly="True" />
            <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" ReadOnly="True" />
            <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" SortExpression="ContactNumber" ReadOnly="True" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True" />
            <asp:BoundField DataField="Specifiication" HeaderText="Specifiication" SortExpression="Specifiication" ReadOnly="True" />
            <asp:BoundField DataField="Pricemin" HeaderText="Pricemin" SortExpression="Pricemin" ReadOnly="True" />
            <asp:BoundField DataField="Pricemax" HeaderText="Pricemax" SortExpression="Pricemax" ReadOnly="True" />
            <asp:BoundField DataField="InsertDate" HeaderText="InsertDate" SortExpression="InsertDate" ReadOnly="True" />
            <asp:TemplateField HeaderText="status" SortExpression="status">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("status") %>'>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Closed</asp:ListItem>
                    </asp:RadioButtonList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [GetQuote] WHERE [GetQuoteID] = @GetQuoteID" InsertCommand="INSERT INTO [GetQuote] ([FirstName], [LastName], [CountryId], [CityId], [ContactNumber], [Email], [Specifiication], [Pricemin], [Pricemax], [InsertDate], [status]) VALUES (@FirstName, @LastName, @CountryId, @CityId, @ContactNumber, @Email, @Specifiication, @Pricemin, @Pricemax, @InsertDate, @status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT GetQuote.GetQuoteID, GetQuote.FirstName, GetQuote.LastName, GetQuote.CountryId, GetQuote.CityId, GetQuote.ContactNumber, GetQuote.Email, GetQuote.Specifiication, GetQuote.Pricemin, GetQuote.Pricemax, GetQuote.InsertDate, GetQuote.status, Country.Country, City.CityName FROM GetQuote INNER JOIN Country ON GetQuote.CountryId = Country.Countryid INNER JOIN City ON GetQuote.CityId = City.CityID WHERE (GetQuote.status = @status) ORDER BY GetQuote.GetQuoteID DESC" UpdateCommand="UPDATE GetQuote SET status = @status WHERE (GetQuoteID = @GetQuoteID)">
        <DeleteParameters>
            <asp:Parameter Name="GetQuoteID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="CountryId" Type="Int32" />
            <asp:Parameter Name="CityId" Type="Int32" />
            <asp:Parameter Name="ContactNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Specifiication" Type="String" />
            <asp:Parameter Name="Pricemin" Type="Int32" />
            <asp:Parameter Name="Pricemax" Type="Int32" />
            <asp:Parameter Name="InsertDate" Type="DateTime" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="status" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="GetQuoteID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>   </div>
</asp:Content>

