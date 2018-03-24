<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="EmailSetup.aspx.cs" Inherits="Admin_EmailSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="mainbg">
    <div class="container">
        <div>
<asp:FormView ID="FormView1" runat="server" CellPadding="4" 
    DataKeyNames="EmailSetupId" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
    ForeColor="#333333">
    <EditItemTemplate>
        <div class="box">
            <h2>Email Setup</h2>
           <div class="box-bottom">
<table style="width: 100%;" >
            <tr>
                <td>
                  EmailSetupId:</td>
                <td>
                    <asp:Label ID="EmailSetupIdLabel1" runat="server" 
                        Text='<%# Eval("EmailSetupId") %>' />
                </td>
            </tr>
            <tr>
                <td>
                    SMTP:
                </td>
                <td>
                <div class="textbox">   <asp:TextBox ID="SMTPTextBox" runat="server" Text='<%# Bind("SMTP") %>' CssClass="form-control" /></div> 
                </td>
            </tr>
            <tr>
                <td>
                    BCC:
                </td>
                <td>
                   <div class="textbox">   <asp:TextBox ID="BCCTextBox" runat="server" Text='<%# Bind("BCC") %>' /> </div>
                </td>
            </tr>
            <tr>
                <td>
                    EmailFrom:
                </td>
                <td>
              <div class="textbox">        <asp:TextBox ID="EmailFromTextBox" runat="server" 
                        Text='<%# Bind("EmailFrom") %>' /> </div>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
            <div class="textbox">          <asp:TextBox ID="PasswordTextBox" runat="server" 
                        Text='<%# Bind("Password") %>' /> </div>
                </td>
            </tr>

     <tr>
                <td>
                    Port:
                </td>
                <td>
            <div class="textbox">          <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Port") %>' /> </div>
                </td>
            </tr>
        </table>
              
        
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Update" CssClass="btn btn-default" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-color" />
    </EditItemTemplate>
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <InsertItemTemplate>
        SMTP:
        <asp:TextBox ID="SMTPTextBox" runat="server" Text='<%# Bind("SMTP") %>' />
        <br />
        BCC:
        <asp:TextBox ID="BCCTextBox" runat="server" Text='<%# Bind("BCC") %>' />
        <br />
        EmailFrom:
        <asp:TextBox ID="EmailFromTextBox" runat="server" 
            Text='<%# Bind("EmailFrom") %>' />
        <br />
        Password:
        <asp:TextBox ID="PasswordTextBox" runat="server" 
            Text='<%# Bind("Password") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        EmailSetupId:
        <asp:Label ID="EmailSetupIdLabel" runat="server" 
            Text='<%# Eval("EmailSetupId") %>' />
        <br />
        SMTP:
        <asp:Label ID="SMTPLabel" runat="server" Text='<%# Bind("SMTP") %>' />
        <br />
        BCC:
        <asp:Label ID="BCCLabel" runat="server" Text='<%# Bind("BCC") %>' />
        <br />
        EmailFrom:
        <asp:Label ID="EmailFromLabel" runat="server" Text='<%# Bind("EmailFrom") %>' />
        <br />
        Password:
        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
            CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
            CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
            CommandName="New" Text="New" />
    </ItemTemplate>
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
</asp:FormView>
        </div>

    </div>
    </div>
<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
    DeleteCommand="DELETE FROM [EmailSetup] WHERE [EmailSetupId] = @EmailSetupId" 
    InsertCommand="INSERT INTO [EmailSetup] ([SMTP], [BCC], [EmailFrom], [Password]) VALUES (@SMTP, @BCC, @EmailFrom, @Password)" 
    ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" 
    SelectCommand="SELECT EmailSetupId, SMTP, BCC, Emailfrom, Password, Port FROM EmailSetup" 
    UpdateCommand="UPDATE EmailSetup SET SMTP = @SMTP, BCC = @BCC, Emailfrom = @EmailFrom, Password = @Password, Port = @Port WHERE (EmailSetupId = @EmailSetupId)">
    <DeleteParameters>
        <asp:Parameter Name="EmailSetupId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="SMTP" Type="String" />
        <asp:Parameter Name="BCC" Type="String" />
        <asp:Parameter Name="EmailFrom" Type="String" />
        <asp:Parameter Name="Password" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="SMTP" Type="String" />
        <asp:Parameter Name="BCC" Type="String" />
        <asp:Parameter Name="EmailFrom" Type="String" />
        <asp:Parameter Name="Password" Type="String" />
        <asp:Parameter Name="EmailSetupId" Type="Int32" />
        <asp:Parameter Name="Port" />
    </UpdateParameters>
</asp:SqlDataSource> </div>
        </div>
</asp:Content>
