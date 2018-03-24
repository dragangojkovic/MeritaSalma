using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BuyAd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("Label4")).Text;
        if (e.CommandName == "show")
        {

            Response.Redirect("~/advertform.aspx?ID=" + id);
        }
    }
}