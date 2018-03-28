<%@ Control Language="C#" AutoEventWireup="true" CodeFile="productfeature.ascx.cs" Inherits="ucproduct_productfeature"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<div class="alert alert-warning">

    ‘’PLEASE NOTE: 10% Transaction fees does not include any financial transaction fees from PayPal and
creditcard standard payment processing fees. It is under responsibility of the account
holder.’’
</div> 

<div class="title">
    <asp:Label ID="Label21" runat="server" Text="Product Features:"></asp:Label>

</div>
<br />
<div onkeypress="return WebForm_FireDefaultButton(event, '<%= Button2.ClientID %>')">

<div class="form-group whitebg" style="margin-bottom: 0px;" >

    <br />
    <asp:Label ID="Label1" runat="server" Text="0" Visible="False"></asp:Label>

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

    <asp:Label ID="Label2" runat="server"  Visible="false" CssClass="alert alert-danger"></asp:Label> <br /> <br />
    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
           
           <asp:Image ID="Image2" runat="server" ImageUrl="~/loader.gif" Height="50" Width="50" />
        
            
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">

        <ContentTemplate>


       
    <div class="col-md-6">
        Cover Image:
		<asp:FileUpload ID="FileUpload1" runat="server" />  <asp:Label ID="Label22" runat="server" ForeColor="Red">Suggested image dimension height = 600 &amp; width = 560</asp:Label>
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
        <asp:Image ID="Image1" runat="server" ImageUrl="~/DynamicImage/NoImage.jpg" Width="100px" Height="80px" CssClass="img" /><br />
		<asp:Panel ID="pnlResizeActions" runat="server" CssClass="center" style="padding-top: 10px;">
			<div class="center">
				<asp:LinkButton runat="server" ID="lnkDelete" OnClick="lnkDelete_Click">Delete |</asp:LinkButton>
				<asp:LinkButton runat="server" ID="lnkRotateLeft" OnClick="lnkRotateLeft_Click">Rotate left |</asp:LinkButton>
				<asp:LinkButton runat="server" ID="lnkRotateRight" OnClick="lnkRotateRight_Click">Rotate right |</asp:LinkButton>
				<asp:LinkButton runat="server" ID="lnkRotate180" OnClick="lnkRotate180_Click">Rotate 180</asp:LinkButton>
			</div>
			<div class="row">
				<div class="col-md-2" style="padding-top: 8px;">
					<span>Resize:</span>
				</div>
				<div class="col-md-2 col-xs-6" style="padding-top: 8px;">
					<span >Width:</span>
				</div>
				<div class="col-md-2 col-xs-6">
					<asp:TextBox runat="server" ID="txtResizeWidth" Width="50" Height="25"></asp:TextBox>
				</div>
				<div class="col-md-2 col-xs-6" style="padding-top: 8px;">
					 <span>Height:</span>
				</div>
				<div class="col-md-2 col-xs-6">
					<asp:TextBox runat="server" ID="txtResizeHeight" Width="50" Height="25"></asp:TextBox>
				</div>
				<div class="col-md-2" style="padding-top: 8px;">
					<span><asp:LinkButton runat="server" OnClick="lnkResize_Click">Apply</asp:LinkButton></span>
				</div>
			</div>
		</asp:Panel>
    </div>
 </ContentTemplate>

        <Triggers>
    <asp:PostBackTrigger ControlID="btnUpload" />
</Triggers>
    </asp:UpdatePanel>
    <div class="col-md-6">
        Product Name:
		<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox1" CssClass="required"></asp:RequiredFieldValidator>
    </div>
    <div class="col-md-6" runat="server" visible="false">
        Size/Volume/Capacity/Range:
                              <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Size" DataValueField="SizeID">
                                  <asp:ListItem Value="0">Please Select</asp:ListItem>
                              </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="DropDownList1" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

    </div>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server" Text="Loading Sub Categories..." ForeColor="Green"></asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>


       <div class="col-md-6 visible-lg" style="padding:30px">
           <br />  
       </div>
    <div class="col-md-6">
        Category:
                              <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryId" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                  <asp:ListItem Value="0">Select Category</asp:ListItem>
                              </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="DropDownList2" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

    </div>

    <div class="col-md-6">
        Sub Category:
                              <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="SCategoryname" DataValueField="ScategoryId" AppendDataBoundItems="True">
                                  <asp:ListItem Value="0">Select Sub Category</asp:ListItem>
                              </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="DropDownList3" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

    </div>

     </ContentTemplate>
    </asp:UpdatePanel>
    


    <div class="col-md-6" runat="server" visible="false">
        Production / Start date:
                                  <asp:TextBox ID="TextBox2" runat="server">01/Jan/2017</asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" BehaviorID="TextBox2_CalendarExtender" Format="dd/MMM/yyyy" TargetControlID="TextBox2"></ajaxToolkit:CalendarExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox2" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="col-md-6" runat="server" visible="false">
        Expiry / End date:
                                  <asp:TextBox ID="TextBox3" runat="server">01/Jan/2050</asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" BehaviorID="TextBox3_CalendarExtender" DefaultView="Days" Format="dd/MMM/yyyy" PopupPosition="BottomLeft" TargetControlID="TextBox3"></ajaxToolkit:CalendarExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox3" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Label ID="Label23" runat="server" ForeColor="Red"></asp:Label>
    </div>
    </div>


  <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div class="form-group whitebg" style="margin-bottom: 0px;">
    <div class="col-md-6" runat="server" visible="false">
        Sales Type:
                              <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="SalesType" DataValueField="SalesTypeID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                  <asp:ListItem Value="0">Please Select</asp:ListItem>
                              </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="DropDownList4" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

    </div>
    <div class="col-md-2">
        Currency:
                                  <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource9" DataTextField="Currency" DataValueField="CurrencyId" AppendDataBoundItems="True">
                              </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="DropDownList8" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

    </div>


  

      
    <div class="col-md-4" >
        <asp:Label ID="Label24" runat="server" Text="Price"></asp:Label>
        : 
                                  <asp:TextBox ID="TextBox4" runat="server" AutoPostBack="True"></asp:TextBox> 
        <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox4_FilteredTextBoxExtender" TargetControlID="TextBox4" ID="TextBox4_FilteredTextBoxExtender" FilterType="Custom, Numbers" ValidChars="."></ajaxToolkit:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox4" CssClass="required"></asp:RequiredFieldValidator>
       
       

    </div>

               <div class="col-md-6">
                   Delivery Cost:
                   <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="TextBox18" CssClass="required" ErrorMessage="This Field is Required" ValidationGroup="vendor"></asp:RequiredFieldValidator>
                   <br />
               </div>
          </div> 
         
                <asp:Label ID="Label6" runat="server" Text="" Visible="false" CssClass="required alert alert-danger"></asp:Label>
                 
         
           
  <div runat="server" id="discount" visible="false" class="alert alert-success" style="margin:5px;"> 
  <div class="form-group form-div form">
      <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True">Discount</asp:ListItem>
          <asp:ListItem>Clearance</asp:ListItem>
          <asp:ListItem Value="Demo">Demo-Leasing</asp:ListItem>
      </asp:RadioButtonList>
      <div class="col-md-2">
          <br />
          <asp:Label ID="Label25" runat="server" Text="Discount Offer"></asp:Label>
          &nbsp;</div>
      <div class="col-md-1 col-xs-4 nopadding">
<asp:TextBox ID="TextBox14" runat="server" MaxLength="3">0</asp:TextBox>
        <ajaxToolkit:FilteredTextBoxExtender ID="TextBox14_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox14_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="TextBox14" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="TextBox14" CssClass="required" ErrorMessage="This Field is Required" ValidationGroup="vendor" Display="Dynamic"></asp:RequiredFieldValidator>
    <h6>
        <small>

       
  Actual Price: <asp:Label ID="Label7" runat="server" Text="0"></asp:Label> </small>   </h6> 
      </div>
      <div class="col-xs-2"> <br />  %</div>

      <div class="col-md-1 nopadding">
          <br />
  Offer Expiry
      </div>
    <div class="col-md-2">
        <asp:TextBox ID="TextBox11" runat="server">01/Jan/2050</asp:TextBox>

        <ajaxToolkit:CalendarExtender runat="server" BehaviorID="TextBox11_CalendarExtender" TargetControlID="TextBox11" ID="TextBox11_CalendarExtender" Format="dd/MMM/yyyy"></ajaxToolkit:CalendarExtender>
    </div>

      <div id="demo" runat="server" visible="false">
       <div class="col-md-1 nopadding">
          <br />
  Demo/leasing Week
      </div>
    <div class="col-md-2">
        <asp:TextBox ID="TextBox17" runat="server" Text="1"></asp:TextBox>

        <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox17_FilteredTextBoxExtender" TargetControlID="TextBox17" ID="TextBox17_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
    </div>
</div>

</div>   </div>
     
<div runat="server" id="wholesale" visible="false" class="alert alert-warning" style="margin:5px;"> 
  <div class="form-group form-div form">  

      <div class="col-md-2 col-xs-6">
          <br />
          Wholesale Quantity
      </div>
      <div class="col-md-2 col-xs-6">
<asp:TextBox ID="TextBox15" runat="server" >0</asp:TextBox>
          <ajaxToolkit:FilteredTextBoxExtender runat="server" BehaviorID="TextBox15_FilteredTextBoxExtender" TargetControlID="TextBox15" ID="TextBox15_FilteredTextBoxExtender" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox15" CssClass="required" ErrorMessage="This Field is Required" ValidationGroup="vendor" Display="Dynamic"></asp:RequiredFieldValidator>
    
      </div>
      

      <div class="col-md-2 col-xs-6">
          <br />
          Wholesale Price
      </div>
    <div class="col-md-2 col-xs-6">
        <asp:TextBox ID="TextBox16" runat="server">0</asp:TextBox>
             <ajaxToolkit:FilteredTextBoxExtender ID="TextBox16_FilteredTextBoxExtender" runat="server" BehaviorID="TextBox16_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="TextBox16" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBox16" CssClass="required" ErrorMessage="This Field is Required" ValidationGroup="vendor" Display="Dynamic"></asp:RequiredFieldValidator>
         </div>

</div>  





</div>



              </ContentTemplate>

    </asp:UpdatePanel>
 <div class="form-group whitebg" style="margin-bottom: 0px;">

    <div class="col-md-6" runat="server" visible="false">
        Available Qty:
                         <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox5" CssClass="required"></asp:RequiredFieldValidator>

    </div>


    <div class="col-md-6" runat="server" visible="false">
        Warranty:
                              <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="Warranty" DataValueField="WarrantyId" AppendDataBoundItems="True">
                                  <asp:ListItem Value="0">Please Select</asp:ListItem>
                              </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="DropDownList5" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

    </div>


    <div class="col-md-6">
        Condition:
                              <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource6" DataTextField="Condition" DataValueField="ConditionID" AppendDataBoundItems="True">
                                  <asp:ListItem Value="0">Please Select</asp:ListItem>
                              </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="DropDownList6" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

    </div>

    <div class="col-md-6" runat="server" visible="false">
        Brand:
                                  <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox6" CssClass="required"></asp:RequiredFieldValidator>

    </div>




    <div class="col-md-6" runat="server" visible="false">
        Country of origin:
                                  <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox7" CssClass="required"></asp:RequiredFieldValidator>

    </div>
    <div class="col-md-6" runat="server" visible="false">
        Model:
                                  <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox8" CssClass="required"></asp:RequiredFieldValidator>

    </div>
    <div class="col-md-6" runat="server" visible="false">
        Serial #:
                                  <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox9" CssClass="required"></asp:RequiredFieldValidator>

    </div>


    <div class="col-md-6" runat="server" visible="false">
        Certificate ( SFDA/CE/USFDA/others):
                                  <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="TextBox10" CssClass="required"></asp:RequiredFieldValidator>

    </div>
    <div class="col-md-6">
        Delivery options:
                              <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource7" DataTextField="Deliverable" DataValueField="DeliveryID" AppendDataBoundItems="True">
                                  <asp:ListItem Value="0">Please Select</asp:ListItem>
                              </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="DropDownList7" CssClass="required" InitialValue="0"></asp:RequiredFieldValidator>

    </div>
    <div class="col-md-6">
    </div>

</div>
<div class="form-group whitebg">

    <div class="col-md-12">
        Description <asp:Label ID="Label3" runat="server" Text=""  CssClass="alert alert-danger" Visible="false"></asp:Label>
                                 <asp:TextBox ID="TextBox12" runat="server" TextMode="MultiLine"></asp:TextBox>
       

    </div>

    <div class="col-md-12">
        Features and details <asp:Label ID="Label4" runat="server" Text=""  CssClass="alert alert-danger" Visible="false"></asp:Label>

        <asp:TextBox ID="TextBox13" runat="server" TextMode="MultiLine"></asp:TextBox>

    </div>





</div>
<div class="form-group">
 <asp:Button ID="Button2" runat="server" ValidationGroup="vendor" Text="Next" OnClick="Button2_Click" OnClientClick="if (!Page_ClientValidate('vendor')){ return false; } this.disabled = true; this.value = 'Processing...';" UseSubmitBehavior="False" />
</div>
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Size] WHERE [SizeID] = @SizeID" InsertCommand="INSERT INTO [Size] ([Size], [Status]) VALUES (@Size, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SizeID, Size, Status FROM dbo.Size WHERE (Status = N'Active') ORDER BY Size" UpdateCommand="UPDATE [Size] SET [Size] = @Size, [Status] = @Status WHERE [SizeID] = @SizeID">
    <DeleteParameters>
        <asp:Parameter Name="SizeID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="Size" PropertyName="Text" Type="String" />
        <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Size" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="SizeID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>


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



<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [SCategory] WHERE [ScategoryId] = @ScategoryId" InsertCommand="INSERT INTO [SCategory] ([CategoryId], [SCategoryname]) VALUES (@CategoryId, @SCategoryname)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ScategoryId, CategoryId, SCategoryname, Status FROM dbo.SCategory WHERE (Status = N'Active') AND (CategoryId = @ID) ORDER BY SCategoryname" UpdateCommand="UPDATE SCategory SET CategoryId = @CategoryId, SCategoryname = @SCategoryname, Status = @Status WHERE (ScategoryId = @ScategoryId)">
    <DeleteParameters>
        <asp:Parameter Name="ScategoryId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CategoryId" Type="Int32" />
        <asp:Parameter Name="SCategoryname" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList2" Name="ID" PropertyName="SelectedValue" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="CategoryId" Type="Int32" />
        <asp:Parameter Name="SCategoryname" Type="String" />
        <asp:Parameter Name="ScategoryId" Type="Int32" />
        <asp:Parameter Name="Status" />
        <asp:Parameter Name="ScatImage" />
    </UpdateParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [SalesType] WHERE [SalesTypeID] = @SalesTypeID" InsertCommand="INSERT INTO [SalesType] ([SalesType], [Status]) VALUES (@SalesType, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT SalesTypeID, SalesType, Status FROM dbo.SalesType WHERE (Status = N'Active') ORDER BY SalesType" UpdateCommand="UPDATE [SalesType] SET [SalesType] = @SalesType, [Status] = @Status WHERE [SalesTypeID] = @SalesTypeID">
    <DeleteParameters>
        <asp:Parameter Name="SalesTypeID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="SalesType" PropertyName="Text" Type="String" />
        <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="SalesType" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="SalesTypeID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Warranty] WHERE [WarrantyId] = @WarrantyId" InsertCommand="INSERT INTO [Warranty] ([Warranty], [Status]) VALUES (@Warranty, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT WarrantyId, Warranty, Status FROM dbo.Warranty WHERE (Status = N'Active') ORDER BY Warranty" UpdateCommand="UPDATE [Warranty] SET [Warranty] = @Warranty, [Status] = @Status WHERE [WarrantyId] = @WarrantyId">
    <DeleteParameters>
        <asp:Parameter Name="WarrantyId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="Warranty" PropertyName="Text" Type="String" />
        <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Warranty" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="WarrantyId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Condition] WHERE [ConditionID] = @ConditionID" InsertCommand="INSERT INTO [Condition] ([Condition], [Status]) VALUES (@Condition, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ConditionID, Condition, Status FROM dbo.Condition WHERE (Status = N'Active') ORDER BY Condition" UpdateCommand="UPDATE [Condition] SET [Condition] = @Condition, [Status] = @Status WHERE [ConditionID] = @ConditionID">
    <DeleteParameters>
        <asp:Parameter Name="ConditionID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="Condition" PropertyName="Text" Type="String" />
        <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Condition" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="ConditionID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Deliverable] WHERE [DeliveryID] = @DeliveryID" InsertCommand="INSERT INTO [Deliverable] ([Deliverable], [Status]) VALUES (@Deliverable, @Status)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT DeliveryID, Deliverable, Status FROM dbo.Deliverable WHERE (Status = N'Active') ORDER BY Deliverable" UpdateCommand="UPDATE [Deliverable] SET [Deliverable] = @Deliverable, [Status] = @Status WHERE [DeliveryID] = @DeliveryID">
    <DeleteParameters>
        <asp:Parameter Name="DeliveryID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="Deliverable" PropertyName="Text" Type="String" />
        <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Deliverable" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="DeliveryID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<p>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO dbo.Products(CoverImage, ProductName, SizeId, CategoryId, SubCategoryId, SaleTypeId, StartDate, ExpiryDate, Price, WarrantyId, ConditionId, Brand, CountryofOrigin, Model, Serial, Certificate, DeliveryId, Description, Feature, InsertDate, UserApproval, AdminApproval, UserName, Currency, AvailableQuantity, ProductKey, featurestatus, discountoffer, actualprice, offerexpiry, wholesaleqty, wholesaleprice, enabledeal, demotime, deliverycost) VALUES (@CoverImage, @ProductName, @SizeId, @CategoryId, @SubCategoryId, @SaleTypeId, @StartDate, @ExpiryDate, @Price, @WarrantyId, @ConditionId, @Brand, @CountryOrigin, @Model, @Serial, @Certificate, @DeliveryId, @Description, @Feature, GETDATE(), @UserApproval, @AdminApproval, @UserName, @Currency, @AvailableQuantity, @ProductKey, @FeatureStatus, @discountoffer, @ActualPrice, @offerexpiry, @wholesaleqty, @wholesaleprice, @enabledeal, @demotime, @deliverycost)" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT ProductKey, CoverImage, ProductName, SizeId, CategoryId, SubCategoryId, SaleTypeId, StartDate, ExpiryDate, Currency, AvailableQuantity, Price, WarrantyId, ConditionId, Brand, CountryofOrigin, Model, Serial, Certificate, DeliveryId, Description, Feature, discountoffer, actualprice, ISNULL(offerexpiry, GETDATE()) AS offerexpiry, ISNULL(wholesaleqty, 0) AS wholesaleqty, ISNULL(wholesaleprice, 0) AS wholesaleprice, ISNULL(enabledeal, 'Discount') AS offerdealtype, isnull(demotime,'1') as demotime, deliverycost FROM Products WHERE (ProductKey = @ProductKey)" UpdateCommand="UPDATE dbo.Products SET CoverImage = @CoverImage, ProductName = @ProductName, SizeId = @SizeId, CategoryId = @CategoryId, SubCategoryId = @SubCategoryId, SaleTypeId = @SaleTypeId, StartDate = @StartDate, ExpiryDate = @ExpiryDate, Currency = @Currency, AvailableQuantity = @AvailableQuantity, Price = @Price, WarrantyId = @WarrantyId, ConditionId = @ConditionId, Brand = @Brand, CountryofOrigin = @CountryofOrigin, Model = @Model, Serial = @Serial, Certificate = @Certificate, DeliveryId = @DeliveryId, Description = @Description, Feature = @Feature, discountoffer = @discountoffer, actualprice = @ActualPrice, offerexpiry = @offerexpiry, wholesaleqty = @wholesaleqty, wholesaleprice = @wholesaleprice, enabledeal = @enabledeal, demotime = @demotime, deliverycost = @deliverycost WHERE (ProductKey = @ProductKey)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="ProductName" PropertyName="Text" />
            <asp:Parameter DefaultValue="1" Name="SizeId" />
            <asp:ControlParameter ControlID="DropDownList2" Name="CategoryId" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList3" Name="SubCategoryId" PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="1" Name="SaleTypeId" />
            <asp:Parameter DefaultValue="01/Jan/2017" Name="StartDate" />
            <asp:Parameter DefaultValue="01/Jan/2050" Name="ExpiryDate" />
            <asp:ControlParameter ControlID="TextBox4" Name="Price" PropertyName="Text" />
            <asp:Parameter DefaultValue="1" Name="WarrantyId" />
            <asp:ControlParameter ControlID="DropDownList6" Name="ConditionId" PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="NA" Name="Brand" />
            <asp:Parameter DefaultValue="NA" Name="CountryOrigin" />
            <asp:Parameter DefaultValue="NA" Name="Model" />
            <asp:Parameter DefaultValue="NA" Name="Serial" />
            <asp:Parameter DefaultValue="NA" Name="Certificate" />
            <asp:ControlParameter ControlID="DropDownList7" Name="DeliveryId" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TextBox12" Name="Description" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox13" Name="Feature" PropertyName="Text" />
            <asp:Parameter DefaultValue="Active" Name="UserApproval" />
            <asp:Parameter DefaultValue="Active" Name="AdminApproval" />
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="UserName" PropertyName="Value" />
            <asp:ControlParameter ControlID="DropDownList8" Name="Currency" PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="1" Name="AvailableQuantity" />
            <asp:ControlParameter ControlID="Label1" Name="ProductKey" PropertyName="Text" />
            <asp:Parameter DefaultValue="No" Name="FeatureStatus" />
            <asp:ControlParameter ControlID="TextBox14" Name="discountoffer" PropertyName="Text" />
            <asp:ControlParameter ControlID="Label7" Name="ActualPrice" PropertyName="Text" />
            <asp:Parameter DefaultValue="01/Jan/2050" Name="offerexpiry" />
            <asp:ControlParameter ControlID="TextBox15" Name="wholesaleqty" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox16" Name="wholesaleprice" PropertyName="Text" />
            <asp:ControlParameter ControlID="RadioButtonList1" Name="enabledeal" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TextBox17" Name="demotime" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox18" Name="deliverycost" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="ProductKey" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="ProductName" PropertyName="Text" />
            <asp:Parameter DefaultValue="1" Name="SizeId" />
            <asp:ControlParameter ControlID="DropDownList2" Name="CategoryId" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList3" Name="SubCategoryId" PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="1" Name="SaleTypeId" />
            <asp:Parameter DefaultValue="01/Jan/2017" Name="StartDate" />
            <asp:Parameter DefaultValue="01/Jan/2050" Name="ExpiryDate" />
            <asp:ControlParameter ControlID="DropDownList8" Name="Currency" PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="1" Name="AvailableQuantity" />
            <asp:ControlParameter ControlID="TextBox4" Name="Price" PropertyName="Text" />
            <asp:Parameter DefaultValue="1" Name="WarrantyId" />
            <asp:ControlParameter ControlID="DropDownList6" Name="ConditionId" PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="NA" Name="Brand" />
            <asp:Parameter DefaultValue="NA" Name="CountryofOrigin" />
            <asp:Parameter DefaultValue="NA" Name="Model" />
            <asp:Parameter DefaultValue="Na" Name="Serial" />
            <asp:Parameter DefaultValue="NA" Name="Certificate" />
            <asp:ControlParameter ControlID="DropDownList7" Name="DeliveryId" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TextBox12" Name="Description" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox13" Name="Feature" PropertyName="Text" />
            <asp:ControlParameter ControlID="Label1" Name="ProductKey" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox14" Name="discountoffer" PropertyName="Text" />
            <asp:ControlParameter ControlID="Label7" Name="ActualPrice" PropertyName="Text" />
            <asp:Parameter DefaultValue="01/Jan/2050" Name="offerexpiry" />
            <asp:ControlParameter ControlID="TextBox15" Name="wholesaleqty" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox16" Name="wholesaleprice" PropertyName="Text" />
            <asp:ControlParameter ControlID="RadioButtonList1" Name="enabledeal" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TextBox17" Name="demotime" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox18" Name="deliverycost" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT Currency, Status, CurrencyId FROM dbo.Currency WHERE (Status = N'Active')"></asp:SqlDataSource>

