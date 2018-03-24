using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seller_AllAuctions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        Session["PBID"] = GridView1.SelectedDataKey.Value;
        Response.Redirect("~/admin/product-setup/BidsShow.aspx?ID=" + GridView1.SelectedDataKey.Value);
    }
}