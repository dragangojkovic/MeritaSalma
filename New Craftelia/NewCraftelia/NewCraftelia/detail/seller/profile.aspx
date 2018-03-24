<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="profile.aspx.cs" Inherits="seller_profile" %>

<%@ Register Src="~/ucvendor/accountdetails.ascx" TagPrefix="uc1" TagName="accountdetails" %>
<%@ Register Src="~/ucvendor/addressdetails.ascx" TagPrefix="uc1" TagName="addressdetails" %>
<%@ Register Src="~/ucvendor/contactdetails.ascx" TagPrefix="uc1" TagName="contactdetails" %>
<%@ Register Src="~/ucvendor/Identificationdetails.ascx" TagPrefix="uc1" TagName="Identificationdetails" %>
<%@ Register Src="~/ucvendor/otherdetails.ascx" TagPrefix="uc1" TagName="otherdetails" %>
<%@ Register Src="~/ucvendor/buyer.ascx" TagPrefix="uc1" TagName="buyer" %>
<%@ Register Src="~/ucvendor/SellerNonApprovalMessage.ascx" TagPrefix="uc1" TagName="SellerNonApprovalMessage" %>











<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    

    <div class="mainbg">
        <div class="container">
            <div class="row">
             
                <div class="col-md-offset-2 col-md-8"> <br />  <uc1:SellerNonApprovalMessage runat="server" ID="SellerNonApprovalMessage" />
                    <div class="form-div nopadding" style="border:none; background-color:transparent;">
                        <h3>
                            Vendor Details
                        </h3>
                    </div>

               <br />
               
                    <uc1:accountdetails runat="server" ID="accountdetails" />
                 
 
                     

                    
<uc1:addressdetails runat="server" ID="addressdetails" />
                    
                    <uc1:contactdetails runat="server" ID="contactdetails" />
   
              
                   <uc1:Identificationdetails runat="server" ID="Identificationdetails" />
                    <uc1:otherdetails runat="server" ID="otherdetails" />
<uc1:buyer runat="server" ID="buyer" />  
                    
                    
                     
                </div>
            </div>
        </div>
      <br />  </div>


                         
                        

                        </asp:Content>

