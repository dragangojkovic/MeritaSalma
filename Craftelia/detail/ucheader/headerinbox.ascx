﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="headerinbox.ascx.cs" Inherits="ucheader_headerinbox" %>
 <%@ Register src="../usercontrol/UnReadMessages.ascx" tagname="UnReadMessages" tagprefix="uc1" %>
 <div class="col-xs-3 col-md-2"> <asp:LinkButton ID="LinkButton9" runat="server" Font-Bold="True" PostBackUrl="~/Account/myinbox.aspx"><i class="fa fa-envelope" aria-hidden="true"></i>     <uc1:UnReadMessages ID="UnReadMessages1" runat="server" /> <br /> Inbox </asp:LinkButton>

</div> 