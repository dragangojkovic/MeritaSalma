<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="LocalImages.aspx.cs" Inherits="Admin_configration_LocalImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-3 form form-div">
            <h3>
                Upload Image
            </h3>
  <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        <asp:ListItem>File (PDF, Word etc)</asp:ListItem>
        <asp:ListItem Selected="True">Image</asp:ListItem>
        <asp:ListItem>Video</asp:ListItem>
    </asp:RadioButtonList>
    <br />

    <asp:FileUpload ID="FileUpload1" runat="server" />
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="File is required" CssClass="required"></asp:RequiredFieldValidator> 
            <br /> <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />

        <script type="text/javascript">
            function UploadFile(fileUpload) {
                if (fileUpload.value != '') {
                    document.getElementById("<%=btnUpload.ClientID %>").click();
                                        }
                                    }
        </script>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
   
        <div class="col-md-9">
            <div class="form form-div">
                <h3>
                    List
                </h3>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LocalImagesId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="LocalImagesId" HeaderText="LocalImagesId" InsertVisible="False" ReadOnly="True" SortExpression="LocalImagesId" />
            <asp:BoundField DataField="filetype" HeaderText="filetype" SortExpression="filetype" />
            <asp:BoundField DataField="file" HeaderText="file" ReadOnly="True" SortExpression="file" />
        </Columns>
    </asp:GridView>
            </div>
        </div>
        
         </div>
  
    
    
   

    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO LocalImages([File], filetype) VALUES ( @File , @Filetype)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT 'http://www.onlinehcs.com' + Replace([File],'~','') AS [file], LocalImagesId, filetype FROM LocalImages ORDER BY LocalImagesId DESC">
        <InsertParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="Filetype" PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>

  
    

</asp:Content>

