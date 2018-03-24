using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uccart_TotalCart : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string carttotal = ((Label)e.Item.FindControl("Label1")).Text;
        if (e.CommandName == "cart")
        {
            if (carttotal != "0")
            {
                Response.Redirect("~/checkout.aspx");
            }

            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup12();", true);

            }
        }
    }
}