<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PostRequest.aspx.cs" Inherits="PostRequest" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


   

    
   
        <div class="container">
       
 

  <div class="row">

   <div class="col-sm-8  col-md-offset-2 form-div">
        
     
        <div class="form">
  <h3>              
      <asp:Label ID="Label9" runat="server" Text="Post a Request"></asp:Label></h3><br />
              <div class="row">
                  <div class="col-md-6">
                      Product Name: <br />
                      <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is Rquired" ValidationGroup="post" ControlToValidate="TextBox2" CssClass="required"></asp:RequiredFieldValidator>
                  </div>
                    <div class="col-md-6">
                      Required Quantity:<br />
                      <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="TextBox3_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox3_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="TextBox3">
                        </ajaxToolkit:FilteredTextBoxExtender>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is Rquired" ValidationGroup="post" ControlToValidate="TextBox3" CssClass="required"></asp:RequiredFieldValidator>
                  </div>

                   <div class="col-md-12">
                      <asp:Label ID="Label1" runat="server" Text="Describe the service you're looking for - please be as detailed as possible. Write Brand, Size, Model any thing which is relevant to your wanted item so vendor can understand:"></asp:Label> <br />
         
              
                             <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title is required" ControlToValidate="TextBox1" CssClass="required" ValidationGroup="post"></asp:RequiredFieldValidator>
        
                </div>

                  <div class="col-md-12">
  <asp:Label ID="Label2" runat="server" Text="Choose a category: "></asp:Label> 
      
                      </div> 
                      
                     
                        <div class="col-xs-6">
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="Categoryid">
                                <asp:ListItem Value="0">Select Category</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Select Category" ControlToValidate="DropDownList1" CssClass="required" Display="Static" InitialValue="0" ValidationGroup="post"></asp:RequiredFieldValidator>
                        </div>
                       <div class="col-xs-6">
                          <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="SCategoryname" DataValueField="ScategoryId">
                              <asp:ListItem Value="0">Select Sub Category</asp:ListItem>
                                   </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Select SubCategory" ControlToValidate="DropDownList2" CssClass="required"  InitialValue="0" ValidationGroup="post"></asp:RequiredFieldValidator>
      
                            
                      
                    </div>
                   
               
                    
                       
                       
                        <div class="col-md-6">
                         
                                <asp:Label ID="Label3" runat="server" Text="Delivery in day (since order) "></asp:Label> <br />
                                 <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox> 
                                <ajaxToolkit:FilteredTextBoxExtender ID="TextBox5_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox5_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="TextBox5">
                                </ajaxToolkit:FilteredTextBoxExtender>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Days is required" ControlToValidate="TextBox5" CssClass="required"  ValidationGroup="post"></asp:RequiredFieldValidator>
          </div>
                        <div class="col-md-6 nopadding">
              <div class="row">   
                  <div class="col-md-12"><asp:Label ID="Label4" runat="server" Text="What is your budget for your requirement?"></asp:Label> </div>  
                        
                              <div class="col-md-6">
                                 
<asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource9" DataTextField="Currency" DataValueField="Currency" AppendDataBoundItems="True">
                                  <asp:ListItem Value="0">Select Currency</asp:ListItem>
                              </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Select Currency" ControlToValidate="DropDownList8" CssClass="required"  InitialValue="0" ValidationGroup="post"></asp:RequiredFieldValidator>
      
                              </div>
                              <div class="col-md-6">


                           
                                  
                          
                          <asp:TextBox ID="TextBox4" runat="server" placeholder="Price"></asp:TextBox>
                               <ajaxToolkit:FilteredTextBoxExtender ID="TextBox4_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox4_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="TextBox4">
                            </ajaxToolkit:FilteredTextBoxExtender>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Days is required" ControlToValidate="TextBox4" CssClass="required"  ValidationGroup="post"></asp:RequiredFieldValidator>
      </div>
                          </div>
                        </div>
                       
                    
                
                <p style="text-align:right">
                    <asp:Button ID="Button1" runat="server" Text="Post" OnClick="Button1_Click" ValidationGroup="post" OnClientClick="if (!Page_ClientValidate('post')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" /> </p>
                    
                  </div>



            </div>
       </div>
      </div>
        
            </div>
        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO PostARequest(FileUpload, SubCategoryId, ServiceDeliveryDays, BudgetForTheService, UserName, InsertDate, ApprovalStatus, Remarks, Title, productname, requiredqty, currency) VALUES (@Fileupload, @SubCategoryID, @DeliveryDays, @ServiceBudget, @UserName, GETDATE(), @ApprovalStatus, @Remarks, @Title, @productname, @requiredqty, @currency)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="SubCategoryID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox5" Name="DeliveryDays" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox4" Name="ServiceBudget" PropertyName="Text" />
                <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
                <asp:Parameter Name="ApprovalStatus" DefaultValue="Pending" />
                <asp:Parameter DefaultValue="NA" Name="Remarks" />
                <asp:Parameter DefaultValue="NR" Name="Fileupload" />
                <asp:ControlParameter ControlID="TextBox1" Name="Title" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="productname" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox3" Name="requiredqty" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList8" Name="currency" PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:HiddenField ID="HiddenField1" runat="server" />
       
    
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Categoryid, CategoryName, Status FROM Category WHERE (Status = N'Active') ORDER BY CategoryName"></asp:SqlDataSource>
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SCategory.ScategoryId, SCategory.SCategoryname, SCategory.Status, SCategory.CategoryId FROM Category INNER JOIN SCategory ON Category.CategoryId = SCategory.CategoryId WHERE (SCategory.Status = N'Active') AND (SCategory.CategoryId = @id)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" />
                           </SelectParameters>
                       </asp:SqlDataSource>
                              
    
<asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Currency, Status FROM Currency WHERE (Status = N'Active')"></asp:SqlDataSource>

    
</asp:Content>

