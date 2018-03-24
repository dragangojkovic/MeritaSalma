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
        if(!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;

        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string pid = ((Label)e.Item.FindControl("Label1")).Text;
        string username = ((Label)e.Item.FindControl("Label3")).Text;



        string ID = ((Label)e.Item.FindControl("Label26")).Text;
        string License = ((Label)e.Item.FindControl("Label27")).Text;
        string Permission = ((Label)e.Item.FindControl("Label28")).Text;
        string Reg = ((Label)e.Item.FindControl("Label29")).Text;
        if (e.CommandName == "Details")
        {

            Response.Redirect("~/sellershop.aspx?PID=" + pid);
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


        if (e.CommandName == "ID")
        {

            Response.Redirect(ID);
        }


        if (e.CommandName == "License")
        {
            Response.Redirect(License);
        }

        if (e.CommandName == "Permission")
        {
            Response.Redirect(Permission);
        }

        if (e.CommandName == "Reg")
        {
            Response.Redirect(Reg);
        }
    }

  
}