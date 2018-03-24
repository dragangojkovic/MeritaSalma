<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="logo.aspx.cs" Inherits="Admin_Addpages" %>

<%@ Register Src="~/Admin/usercontrol/save-div.ascx" TagPrefix="uc1" TagName="savediv" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     

            
       

                     <div class="row">    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <div class="col-md-12">
              
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>


                </div>
                <div class="col-md-4">
                    <uc1:savediv runat="server" ID="savediv" Visible="false" />
                    <div class="form form-div">
                        <h3>
           
Logo</h3>
                        <div>
                          <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-12">
                                    
                          <asp:Label ID="Label3" runat="server" Text="logo:"></asp:Label><br />
                               
                               
                               <div>
                                   <asp:FileUpload ID="FU1" runat="server" Width="100%" />
                                    <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />

                                <script type="text/javascript">
                                    function UploadFile(fileUpload) {
                                        if (fileUpload.value != '') {
                                            document.getElementById("<%=btnUpload.ClientID %>").click();
                                }
                            }
</script>
                                 
                               </div> 

                                      
                                 <asp:Label ID="Label1" runat="server" Text="Width:"></asp:Label>&nbsp;Logo Width should not be more then 250px(Preferred)<br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="text text-danger" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                   <div class="textbox"> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
                                
                                     <asp:Label ID="Label4" runat="server" Text="Height:"></asp:Label>&nbsp;<br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="text text-danger" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                   <div class="textbox">  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </div>
                                
                                     <asp:Label ID="Label5" runat="server" Text="Company Name:"></asp:Label>&nbsp;( To Print on invoice )<br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="text text-danger" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                  <div class="textbox">   <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> </div>

                                     <asp:Label ID="Label6" runat="server" Text="Address:"></asp:Label>&nbsp;( To Print on invoice )<br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="text text-danger" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                                   <div class="textbox">  <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox> </div>

                                     <asp:Label ID="Label7" runat="server" Text="Support Contact:"></asp:Label>&nbsp;( To Print on invoice )<br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Feild Required" ValidationGroup="a" CssClass="text text-danger" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                                   <div class="textbox">  <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox> </div>
                              <hr />
                                <asp:Button ID="Button2" runat="server" Text="Save" CssClass="btn btn-color" Width="100%" ValidationGroup="a" OnClick="Button1_Click" />
                           </div> </div>
                        </div></div>
                    </div>
                </div>
            
                <div class="col-md-8">
                    
                    <div class="form form-div">
                          <h3>
                Preview</h3>
                        <div>
                            <asp:Image ID="Image2" runat="server" Width="200px" />
          </div>
                    </div>
                </div>
            </div>
      
    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO Slider(SliderImage, Status) VALUES (@Image, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Logo, logowidth, logoheight, CompanyName, Address, SupportContact FROM Logo" UpdateCommand="UPDATE Logo SET Logo = @Image, logowidth = @logowidth, logoheight = @logoheight, CompanyName = @companyname, Address = @address, SupportContact = @support">
          <InsertParameters>
              <asp:ControlParameter ControlID="RadioButtonList1" Name="Status" PropertyName="SelectedValue" />
          </InsertParameters>
          <UpdateParameters>
              <asp:ControlParameter ControlID="TextBox1" Name="logowidth" PropertyName="Text" />
              <asp:ControlParameter ControlID="TextBox2" Name="logoheight" PropertyName="Text" />
              <asp:ControlParameter ControlID="TextBox3" Name="companyname" PropertyName="Text" />
              <asp:ControlParameter ControlID="TextBox4" Name="address" PropertyName="Text" />
              <asp:ControlParameter ControlID="TextBox5" Name="support" PropertyName="Text" />
          </UpdateParameters>
      </asp:SqlDataSource>
</asp:Content>

