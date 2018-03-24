<%@ Control Language="C#" AutoEventWireup="true" CodeFile="accountdetails.ascx.cs" Inherits="ucvendor_accountdetails" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>

<div class="title">
    <uc1:savediv runat="server" ID="savediv"  Visible="false"/>

                             <asp:Label ID="Label14" runat="server" Text="Account Details:"></asp:Label>
                              
                         </div>    
                    
                    
                     <div class="form form-div form-horizontal">
                     <div class="form-group">   
                         
                          <div class="col-md-6">
                       
                           <asp:Label ID="Label1" runat="server" Text="Account Type"></asp:Label> 
         <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="ProfileType" DataValueField="ProfileTypeId">
             <asp:ListItem Value="0">Select Account Type</asp:ListItem>
         </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ac" ControlToValidate="DropDownList1" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

                       </div>    

                         <div class="col-md-6">
                       
                           <asp:Label ID="Label4" runat="server" Text="Profile Type"></asp:Label> 
         <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="ProfileCategory" DataValueField="ProfileCategoryID">
             <asp:ListItem Value="0">Profile Type</asp:ListItem>
         </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ac" ControlToValidate="DropDownList2" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

                       </div>

                         <div class="col-md-6">
                       
                           <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label> 
         <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="ProfileSpeciality" DataValueField="ProfileSpecialityID">
             <asp:ListItem Value="0">Select Category</asp:ListItem>
         </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This Field is Required" ValidationGroup="ac" ControlToValidate="DropDownList3" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

                       </div>
                               <div class="col-md-6">
                       
                          


                                   <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         <asp:Label ID="Label6" runat="server" Text="Speciality"></asp:Label>
                                   
                                    <asp:Label ID="Label2" runat="server" Text="Select upto 5 speciality" ForeColor="Green"></asp:Label>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
          <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal" Height="150px">
  <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="ProfileSubSpeciality" DataValueField="ProfileSubSpeciality"></asp:CheckBoxList>

                   

          </asp:Panel>
        
        </div>
    </div>
       
  </div>
            <asp:Label ID="Label7" runat="server" Text="" ForeColor="Red"></asp:Label>                              Selected Specialities: <br /><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</div>







                                   </div>
                   
                   </div>  
                         <div class="form-group">
                             <div class="col-md-12">
                                 <asp:TextBox ID="TextBox1" runat="server" Height="150"></asp:TextBox>
                          
                                 <br />
                          
                             <asp:Button ID="Button1" runat="server" ValidationGroup="ac" Text="Save" OnClick="Button1_Click" OnClientClick="if (!Page_ClientValidate('ac')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False"  />   </div>
                         </div>
                    </div>
               <br />  
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProfileType] WHERE [ProfileTypeId] = @ProfileTypeId" InsertCommand="INSERT INTO [ProfileType] ([ProfileType], [Status]) VALUES (@ProfileType, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfileTypeId, ProfileType, Status FROM dbo.ProfileType WHERE (Status = N'Active') ORDER BY ProfileType" UpdateCommand="UPDATE [ProfileType] SET [ProfileType] = @ProfileType, [Status] = @Status WHERE [ProfileTypeId] = @ProfileTypeId">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProfileTypeId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ProfileType" PropertyName="Text" Type="String" />
                                    <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProfileType" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ProfileTypeId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProfileCategory] WHERE [ProfileCategoryID] = @ProfileCategoryID" InsertCommand="INSERT INTO [ProfileCategory] ([ProfileCategory], [Status]) VALUES (@ProfileCategory, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfileCategoryID, ProfileCategory, Status FROM dbo.ProfileCategory WHERE (Status = N'Active') ORDER BY ProfileCategory" UpdateCommand="UPDATE [ProfileCategory] SET [ProfileCategory] = @ProfileCategory, [Status] = @Status WHERE [ProfileCategoryID] = @ProfileCategoryID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProfileCategoryID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ProfileCategory" PropertyName="Text" Type="String" />
                                    <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProfileCategory" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ProfileCategoryID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProfileSpeciality] WHERE [ProfileSpecialityID] = @ProfileSpecialityID" InsertCommand="INSERT INTO [ProfileSpeciality] ([ProfileSpeciality], [Status]) VALUES (@ProfileSpeciality, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfileSpecialityID, ProfileSpeciality, Status FROM dbo.ProfileSpeciality WHERE (Status = N'Active') ORDER BY ProfileSpeciality" UpdateCommand="UPDATE [ProfileSpeciality] SET [ProfileSpeciality] = @ProfileSpeciality, [Status] = @Status WHERE [ProfileSpecialityID] = @ProfileSpecialityID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProfileSpecialityID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ProfileSpeciality" PropertyName="Text" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProfileSpeciality" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ProfileSpecialityID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [ProfileSubSpeciality] WHERE [ProfileSubSpecialityID] = @ProfileSubSpecialityID" InsertCommand="INSERT INTO [ProfileSubSpeciality] ([ProfileSubSpeciality], [ProfileSpecialityID], [Status]) VALUES (@ProfileSubSpeciality, @ProfileSpecialityID, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProfileSubSpecialityID, ProfileSubSpeciality, ProfileSpecialityID, Status FROM dbo.ProfileSubSpeciality WHERE (Status = N'Active') ORDER BY ProfileSubSpeciality" UpdateCommand="UPDATE [ProfileSubSpeciality] SET [ProfileSubSpeciality] = @ProfileSubSpeciality, [ProfileSpecialityID] = @ProfileSpecialityID, [Status] = @Status WHERE [ProfileSubSpecialityID] = @ProfileSubSpecialityID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProfileSubSpecialityID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ProfileSubSpeciality" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileSpecialityID" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProfileSubSpeciality" Type="String" />
                                    <asp:Parameter Name="ProfileSpecialityID" Type="Int32" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ProfileSubSpecialityID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
<p>
    &nbsp;</p>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ISNULL(ProfileTypeId, 0) AS ProfileTypeId, ISNULL(ProfileCategoryID, 0) AS ProfileCategoryID, ISNULL(ProfileSpecialityID, 0) AS ProfileSpecialityID, ISNULL(ProfileSubSpecialityID, 0) AS ProfileSubSpecialityID, UserName, ISNULL(tagline, '') AS tagline FROM Profile WHERE (UserName = @UserName)" UpdateCommand="UPDATE Profile SET ProfileTypeId = @ProfileTypeID, ProfileCategoryID = @ProfileCategoryID, ProfileSpecialityID = @ProfileSpecialityID, ProfileSubSpecialityID = @ProfileSubSpecialityID, tagline = @tagline WHERE (UserName = @UserName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="ProfileTypeID" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DropDownList2" Name="ProfileCategoryID" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DropDownList3" Name="ProfileSpecialityID" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
        <asp:ControlParameter ControlID="TextBox1" Name="tagline" PropertyName="Text" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
