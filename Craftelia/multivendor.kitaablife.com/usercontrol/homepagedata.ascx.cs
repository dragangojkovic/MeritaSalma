using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_homepagedata : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView3_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("Label8")).Text;
        string pid = ((Label)e.Item.FindControl("Label7")).Text;
        if (e.CommandName == "Details")
        {

            Response.RedirectToRoute("ServiceDetails", new { ID = id, PID = pid });
        }
    }



    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

        string cid = ((Label)e.Item.FindControl("Label12")).Text;
        string sid = ((Label)e.Item.FindControl("Label4")).Text;
        string sname = ((LinkButton)e.Item.FindControl("LinkButton5")).Text;
        if (e.CommandName == "Details")
        {

            Response.RedirectToRoute("Topssearch2", new { CID = cid, SID = sid, SCat = sname.Replace(" ", "-") });



        }

    }
}