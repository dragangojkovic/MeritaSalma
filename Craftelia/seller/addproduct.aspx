<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" ValidateRequest="false" MaintainScrollPositionOnPostback="true" CodeFile="addproduct.aspx.cs" Inherits="seller_addproduct"  %>

<%@ Register Src="~/ucproduct/productfeature.ascx" TagPrefix="uc1" TagName="productfeature" %>
<%@ Register Src="~/ucproduct/catalog.ascx" TagPrefix="uc1" TagName="catalog" %>
<%@ Register Src="~/ucproduct/video.ascx" TagPrefix="uc1" TagName="video" %>
<%@ Register Src="~/ucproduct/images.ascx" TagPrefix="uc1" TagName="images" %>
<%@ Register Src="~/usercontrol/SellerApproval.ascx" TagPrefix="uc1" TagName="SellerApproval" %>






<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%-- <script type="text/javascript" src="../tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
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
    </script>--%>
    <uc1:SellerApproval runat="server" ID="SellerApproval" />
     <div class="min-height">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-1 col-md-10">
                    <div class="form-div form" style="background-color:whitesmoke">
                        <h3>
                            

                          Add Product <small> ( Step 1 ) </small>
                        </h3>
                   <br />   
                 
                    <div class="form-horizontal">
              
                        
                        
                     
                        <uc1:productfeature runat="server" ID="productfeature" />

                       

                         
                        </div>
                         
                            
                                    </div>
                    </div>

                    

                   <br />          </div> 
                  

                </div>  </div> 
    <br />

   

                        </asp:Content>

