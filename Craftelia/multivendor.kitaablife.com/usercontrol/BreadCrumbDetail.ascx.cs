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
        string sid = ((Label)e.Item.FindControl("Label4")).Text;
        string sname = ((LinkButton)e.Item.FindControl("LinkButton1")).Text;
        if (e.CommandName == "scat")
        {

            Response.RedirectToRoute("Topssearch2", new { CID = cid, SID = sid, SCat = sname.Replace(" ", "-").Replace("/", "-").Replace("&", "-") });



        }

        if (e.CommandName == "cat")
        {

            Response.RedirectToRoute("HeadSearch", new { CID = cid, Cat = sname.ToString().Replace(" ", "-").Replace("/", "-").Replace("&", "-") });



        }
    }
}