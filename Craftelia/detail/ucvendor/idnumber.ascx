<%@ Control Language="C#" AutoEventWireup="true" CodeFile="idnumber.ascx.cs" Inherits="ucvendor_Identificationdetails" %>

    <div class="form-group">

        <div class="col-md-12">
            <asp:Label ID="Label17" runat="server" Text="ID#"></asp:Label>
        </div>

        <div class="col-md-4">

            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="TextBox1" CssClass="required"></asp:RequiredFieldValidator>

        </div>
        <div class="col-md-4">
            <asp:FileUpload ID="FileUpload1" runat="server" />

            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="This Field is Required" ValidationGroup="id" ControlToValidate="FileUpload1" CssClass="required"></asp:RequiredFieldValidator>


        </div>
         <div class="col-md-2 center nopadding">
             <asp:LinkButton ID="LinkButton2" runat="server" ValidationGroup="id">Update</asp:LinkButton>
             </div>
        <div class="col-md-2 center nopadding">
            <%--<asp:Image ID="Image1" runat="server" Height="75px" ImageUrl="~/DynamicImage/NoImage.jpg" Width="75px" />--%>
            <asp:Label ID="Label22" Visible="False" runat="server" Text="NA"></asp:Label>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">View PDF</asp:LinkButton>
        </div>

    </div>

 
<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(ID, '') AS ID, ISNULL(IDFile, 'NA') AS IDFile, ISNULL(License, '') AS License, ISNULL(LicenseFile, 'NA') AS LicenseFile, ISNULL(Permission, '') AS Permission, ISNULL(PermissionFile, 'NA') AS PermissionFile, ISNULL(Reg, '') AS Reg, ISNULL(RegFile, 'NA') AS RegFile FROM Profile WHERE (UserName = @UserName)" UpdateCommand="UPDATE Profile SET ID = @ID, IDFile = @IDFile WHERE (UserName = @UserName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        <asp:ControlParameter ControlID="TextBox1" Name="ID" PropertyName="Text" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
