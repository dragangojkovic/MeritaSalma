using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_TopViewedProduct : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("Label8")).Text;
        string pid = ((Label)e.Item.FindControl("Label7")).Text;
        if (e.CommandName == "Details")
        {

            Response.RedirectToRoute("ServiceDetails", new { ID = id, PID = pid });
        }

        if (e.CommandName == "favorite")
        {

            if (Page.User.Identity.Name == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }

            else
            {
                SqlDataSource4.InsertParameters.Add("UserName", Page.User.Identity.Name);
                SqlDataSource4.InsertParameters.Add("ProductId", id);

                SqlDataSource4.Insert();


                ListView1.DataBind();

            }
        }
    }
}