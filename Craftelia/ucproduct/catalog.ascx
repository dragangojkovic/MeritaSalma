<%@ Control Language="C#" AutoEventWireup="true" CodeFile="catalog.ascx.cs" Inherits="ucproduct_catalog" %>
  <div class="title">

       <script type="text/javascript">
           window.onsubmit = function () {
               if (Page_IsValid) {
                   var updateProgress = $find("<%= UpdateProgress2.ClientID %>");
                window.setTimeout(function () {
                    updateProgress.set_visible(true);
                }, 100);
            }
        }
</script>

                             <asp:Label ID="Label1" runat="server" Text="Catalogue/ brochure/manual:"></asp:Label>
                              
                         </div>       <br />      <div class="form-group whitebg">

<asp:Label ID="Label2" runat="server" ForeColor="#009900"></asp:Label>

                                 <br />   

                              <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
           
           <asp:Image ID="Image2" runat="server" ImageUrl="~/loader.gif" Height="50" Width="50" /> File Uploading in process...
        
            
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">

        <ContentTemplate>
                             <div class="col-md-6">
                                PDF 
                                 <asp:FileUpload ID="FileUpload1" runat="server" />
                                          
                               <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=btnUpload.ClientID %>").click();
                                        }
                                    }
</script>

                               

                            </div>
                             <div class="col-md-6 center">
                                 <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
                                 <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">View File</asp:LinkButton>
                                 </div>
                 
                           </ContentTemplate>

        <Triggers>
    <asp:PostBackTrigger ControlID="btnUpload" />
</Triggers>
    </asp:UpdatePanel>
                             
                             </div>
<div class="form-group">


<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Next" /></div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" UpdateCommand="UPDATE Products SET CatalogPDF = @PDF WHERE (ProductKey = @ProductKey)" SelectCommand="SELECT isnull(CatalogPDF,'NA') as CatalogPDF FROM Products WHERE (ProductKey = @ID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
    </SelectParameters>
</asp:SqlDataSource>
