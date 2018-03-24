using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.Name == "")
        {

            Response.Redirect("~/Account/Login.aspx?Type=" + "Inbox");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        if (Page.User.Identity.Name != "") 
        
        { 
        Response.Redirect("~/customer/shipping.aspx");
        }
        else
        {

            Response.Redirect("~/Account/Login.aspx?Type=" + "No Login");
        }
    }
}