using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_SellerDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string pid = ((Label)e.Item.FindControl("Label1")).Text;
        string username = ((Label)e.Item.FindControl("Label3")).Text;
        if (e.CommandName == "Details")
        {

            Response.Redirect("~/Account/viewprofile.aspx?PID=" + pid);
        }


     

        if (e.CommandName == "contact")
        {
            if (Page.User.Identity.Name == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }

            else
            {
                Session["username"] = username;
                Response.RedirectToRoute("contact", new { username = pid});
            }
        }
    }
}