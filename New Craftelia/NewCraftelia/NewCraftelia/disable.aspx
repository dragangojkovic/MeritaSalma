<%@ Page Language="C#" AutoEventWireup="true" CodeFile="disable.aspx.cs" Inherits="disable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>

        .overlap {
    position: absolute;
    width: 100%;
    height: 620px;
    z-index: 2;
    background-color: #080d15;
    opacity: .7;
}

.overlap-div {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 3;
    color: #fff;
    text-align: center;
    text-transform: uppercase;
    text-shadow: 1px 1px 0 rgba(0,0,0,.75);
      -webkit-transform: translate3d(-50%,-50%,0);
         -moz-transform: translate3d(-50%,-50%,0);
          -ms-transform: translate3d(-50%,-50%,0);
           -o-transform: translate3d(-50%,-50%,0);
              transform: translate3d(-50%,-50%,0);
}



    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="overlap">
       <div class="overlap-div">
           <div class="alert alert-danger">
               Your account is restricted to access the website content due to one of the following reason: <br /><br />

               1. You created multiple account on onlinehcs.com from same location. <br /><br />
               2. Your account does not follow one of our Terms and Conditions.  <br /><br />
               3. Please contact support to activate your account. <br /><br />

              

           </div>
           <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/Account/Login.aspx" LogoutText="Click here to confirm the message" OnLoggingOut="Unnamed_LoggingOut" />
       </div>
    </div>
    </form>
</body>
</html>
