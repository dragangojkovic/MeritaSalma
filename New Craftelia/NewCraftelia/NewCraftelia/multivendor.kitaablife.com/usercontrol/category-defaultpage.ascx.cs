using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_category : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string cid = ((Label)e.Item.FindControl("Label12")).Text;
         string sid = ((Label)e.Item.FindControl("Label4")).Text;
         string sname = ((LinkButton)e.Item.FindControl("LinkButton1")).Text;
        if (e.CommandName == "Details")
        {

            Response.RedirectToRoute("Topssearch2", new { CID = cid, SID = sid, SCat = sname.Replace(" ", "-").Replace("/", "-").Replace("&", "").Replace(" ", "") });


           
        }

    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string cid = ((Label)e.Item.FindControl("Label2")).Text;

        string cname = ((Label)e.Item.FindControl("Label1")).Text;
        if (e.CommandName == "CDetails")
        {

            Response.RedirectToRoute("HeadSearch", new { CID = cid, Cat = cname.ToString().Replace(" ", "-").Replace("/", "-").Replace("&", "-") });


        }
    }
}