<%@ Control Language="C#" AutoEventWireup="true" CodeFile="slider.ascx.cs" Inherits="ucdetail_slider" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT CoverImage AS Image FROM Products WHERE (ProductKey = @ID) UNION ALL SELECT Images AS Image FROM ProductImages WHERE (ProductKey = @ID)">
    <SelectParameters>
        <asp:RouteParameter DefaultValue="5530700810042017112336" Name="ID" RouteKey="ID" />
    </SelectParameters>
</asp:SqlDataSource>

   <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/js/jquery.min.js")%>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/js/tiksluscarousel.js")%>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/js/rainbow.min.js")%>"></script>
    <link rel="stylesheet"   type='text/css' href="<%= Page.ResolveClientUrl("~/css/normalize.css")%>"/> 
    <link rel="stylesheet"  type='text/css' href="<%= Page.ResolveClientUrl("~/css/tiksluscarousel.css")%>" /> 
    <link rel="stylesheet"  type='text/css' href="<%= Page.ResolveClientUrl("~/css/github.css")%>"/> 
    <link rel="stylesheet"  type='text/css' href="<%= Page.ResolveClientUrl("~/css/animate.css")%>" /> 

    <style>
     
    

        #wrapper {
            margin: auto;
            width: 100%;
        }

        a {
            text-decoration: none;
            
        }

            a:hover {
                text-decoration: underline;
            }

        #fruits {
            border: 10px solid #000;
        }
    </style>


<div id="wrapper">

  <div id="carousel1">
                <ul>
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">

                        
                        <ItemTemplate>
                     <li>        <asp:Image ID="Image1" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "Image") %>' Width="100%" />  </li>
                        </ItemTemplate>
                    </asp:ListView>
                    

                       
                  
                        
               
                
                </ul>
            </div>

            <script language="javascript">
                $(document).ready(function () {
                    $("#carousel1").tiksluscarousel({ width: 750, height: 480, nav: 'thumbnails', type: "slide" });
                });
		</script>


        	</div>