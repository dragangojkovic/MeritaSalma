using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_BreadCrumbDetail : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string cid = ((Label)e.Item.FindControl("Label12")).Text;
     
        string cname = ((Label)e.Item.FindControl("Label1")).Text;
        if (e.CommandName == "cat")
        {
            Response.RedirectToRoute("HeadSearch", new { CID = cid, Cat = cname.ToString().Replace(" ", "-").Replace("/", "-").Replace("&", "-") });
        }
    }
}