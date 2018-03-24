using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.Insert();

            Response.Redirect("~/postreq/projectconfirmation.aspx");
        }
        catch (Exception message)
        {

            //Session["Exception"]=  message.Message;
          
            //Response.Redirect("~/ErrorPage?Page"+"PostRequest");
        }
    }
}