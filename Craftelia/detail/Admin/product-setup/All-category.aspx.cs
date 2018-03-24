using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_usercontrol_Allcategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/product-setup/Add-Category.aspx?ID=" + GridView1.SelectedDataKey.Value);
    }
}