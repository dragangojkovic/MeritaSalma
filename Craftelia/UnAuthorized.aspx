<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UnAuthorized.aspx.cs" Inherits="unauthorizedpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href='http://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister' rel='stylesheet' type='text/css'/>
    <style type="text/css">

.un-page{
	margin:0 auto;font-family: 'Love Ya Like A Sister', cursive;
    background:#eaeaea;
	width:100%
}
.text-des{
	text-align:center;
padding:60px 0px;
}

.text-des p{
	color:#272727;
	font-size:50px;
	margin-top:1px;
}	
.text-des p i{
	color:lightgreen;
}	
.sub a{
	color:#fff;
	background:#272727;
	text-decoration:none;
	padding:10px 20px;
	font-size:13px;
	font-family: arial, serif;
	font-weight:bold;
	-webkit-border-radius:.5em;
	-moz-border-radius:.5em;
	-border-radius:.5em;
}	

</style>

    <div class="un-page">
	<div class="text-des">
        <i class="fa fa-exclamation-triangle fa-5x text text-danger"></i>
    <br />
			<p>OOPS! - unauthorized operation</p>
				
			<div class="sub">
			  <p><a href="Default.aspx">Click here to try again </a></p>
			</div>
	</div>
 </div>
</asp:Content>

