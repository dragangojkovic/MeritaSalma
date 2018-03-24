<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="jobs.aspx.cs" Inherits="seller_jobs" ValidateRequest="false" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <script type="text/javascript" src="../tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
     <script type="text/javascript">
         tinyMCE.init({
             mode: "textareas",
             theme: "advanced",
             plugins: "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",
             theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
             theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
             theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
             theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
             theme_advanced_toolbar_location: "top",
             theme_advanced_toolbar_align: "left",
             theme_advanced_statusbar_location: "bottom",
             theme_advanced_resizing: false,
             template_external_list_url: "js/template_list.js",
             external_link_list_url: "js/link_list.js",
             external_image_list_url: "js/image_list.js",
             media_external_list_url: "js/media_list.js"
         });
    </script>
    <div class="min-height">

       
    <div class="container">
            <div class="row">
               
                  <div class="col-md-8 col-md-offset-2 form-div form"> 
                        <uc1:savediv runat="server" ID="savediv" Visible="false" />
                      <h3>
                         Job Details<asp:Button ID="Button2" runat="server" Text="View all jobs" Font-Size="11px" PostBackUrl="~/seller/alljobs.aspx" CausesValidation="False" />
                      </h3>
                      <div class="form-horizontal">
                          <div class="form-group">
                              Title:
                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" ControlToValidate="TextBox1" CssClass="required"></asp:RequiredFieldValidator>
                          </div>
                           <div class="form-group">
                              Description:
                              <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
                          </div>
                            <div class="form-group">
                              Expiry Date:
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                  <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" BehaviorID="TextBox3_CalendarExtender" Format="dd/MMM/yyyy" TargetControlID="TextBox3">
                                </ajaxToolkit:CalendarExtender>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required" ControlToValidate="TextBox3" CssClass="required"></asp:RequiredFieldValidator>
                        
                          </div> 
                           <div class="form-group">
                               <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                               </div>


                      </div>
                      </div>
                
           
            
            </div>
        </div>
        </div>

   <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [JobList] WHERE [JobListId] = @JobListId" InsertCommand="INSERT INTO [JobList] ([JobTitle], [JobDescription], [ExpiryDate], [UserName]) VALUES (@JobTitle, @JobDescription, @ExpiryDate, @UserName)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT [JobListId], [JobTitle], [JobDescription], [ExpiryDate], [UserName] FROM [JobList]" UpdateCommand="UPDATE [JobList] SET [JobTitle] = @JobTitle, [JobDescription] = @JobDescription, [ExpiryDate] = @ExpiryDate, [UserName] = @UserName WHERE [JobListId] = @JobListId">
          <DeleteParameters>
              <asp:Parameter Name="JobListId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlID="TextBox1" Name="JobTitle" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="TextBox2" Name="JobDescription" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="TextBox3" Name="ExpiryDate" PropertyName="Text" Type="DateTime" />
              <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="JobTitle" Type="String" />
              <asp:Parameter Name="JobDescription" Type="String" />
              <asp:Parameter Name="ExpiryDate" Type="DateTime" />
              <asp:Parameter Name="UserName" Type="String" />
              <asp:Parameter Name="JobListId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>

    <br />
</asp:Content>

