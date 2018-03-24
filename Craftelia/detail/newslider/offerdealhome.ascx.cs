using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class thumbnailslider_offerdeal : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
    }
    //protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    string id = ((Label)e.Item.FindControl("Label8")).Text;
    //    string pid = ((Label)e.Item.FindControl("Label7")).Text;
    //    if (e.CommandName == "Details")
    //    {

    //        Response.RedirectToRoute("ServiceDetails", new { ID = id, PID = pid });
    //    }
    //}
}