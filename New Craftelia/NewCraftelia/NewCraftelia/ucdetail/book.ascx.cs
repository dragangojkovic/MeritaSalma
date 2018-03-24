using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_book : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource23.Insert();
        SqlDataSource23.Update();

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup1();", true);
    }
}