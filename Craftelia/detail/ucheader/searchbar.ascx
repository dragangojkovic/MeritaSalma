<%@ Control Language="C#" AutoEventWireup="true" CodeFile="searchbar.ascx.cs" Inherits="usercontrol_searchbar" %>
 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
 <div class="col-md-5">
                            <br />
                               <div class="input-group search" onkeypress="return WebForm_FireDefaultButton(event, '<%= LinkButton1.ClientID %>')">
                    <div class="input-group-btn">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Key word" ValidationGroup="search"></asp:TextBox>
                        



                      


                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryId" ValidationGroup="search" AppendDataBoundItems="True" Height="40px">
                            <asp:ListItem Value="%">All</asp:ListItem>
                        </asp:DropDownList>
                
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CausesValidation="false" OnClientClick="if (!Page_ClientValidate('b')){ return false; } this.disabled = true; this.value = 'Searching...';" ValidationGroup="search"><i class="fa fa-search"></i></asp:LinkButton>    </div>
                </div>

                      
                        </div>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Category(CategoryName, Status, Icon, FrontBanner) VALUES (@categoryname, @status, @Icon, @FrontBanner)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CategoryId, CategoryName, Icon, FrontBanner, Status FROM dbo.Category WHERE (Status = N'Active') ORDER BY CategoryName" UpdateCommand="UPDATE Category SET CategoryName = @CategorynName, Icon = @Icon, FrontBanner = @FrontBanner, Status = @Status
where CategoryID=@ID">
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="categoryname" PropertyName="Text" />
        <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="Active" Name="status" PropertyName="SelectedValue" />
    </InsertParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="CategorynName" PropertyName="Text" />
        <asp:ControlParameter ControlID="RadioButtonList1" Name="Status" PropertyName="SelectedValue" />
        <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
    </UpdateParameters>
</asp:SqlDataSource>