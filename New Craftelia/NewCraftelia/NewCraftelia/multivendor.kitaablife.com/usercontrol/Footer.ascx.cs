using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_Footer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

        Label pgid = ((Label)e.Item.FindControl("Label3"));
        LinkButton pg = ((LinkButton)e.Item.FindControl("LinkButton4"));

        Label url = ((Label)e.Item.FindControl("Label1"));

        if (e.CommandName == "view")
        {

            if (url.Text == "NO")
            {
                Response.RedirectToRoute("page", new { pageid = pgid.Text, pagetitle = pg.Text.Replace(" ", "-").Replace("/", "-").Replace("&", "") });
            }

            else
            {

                Response.Redirect(url.Text);
            }
        }

        
    }
    
}