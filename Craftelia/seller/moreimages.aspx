<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="moreimages.aspx.cs" Inherits="seller_moreimages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="min-height">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-div form">
                        <h3>
                          Add More Images
                        </h3>
               <br />
                    <div class="form-horizontal">
                        <div class="form-group">
                             Select Image:
                                  <asp:FileUpload ID="FileUpload1" runat="server" />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="This Field is Required" ValidationGroup="vendor" ControlToValidate="FileUpload1" CssClass="required"></asp:RequiredFieldValidator>
                            <br />
                             <asp:Button ID="Button1" ValidationGroup="vendor" runat="server" Text="Add Product" /> 
                            </div>
                         </div>
                     
                         </div>
                     </div>
             
                
                 <div class="col-md-8">
                    <div class="form-div form">
                        <h3>
                          Image Preview
                        </h3>
               <br />
                        </div>
                
                
                    </div>
             </div>
         </div>
</asp:Content>

