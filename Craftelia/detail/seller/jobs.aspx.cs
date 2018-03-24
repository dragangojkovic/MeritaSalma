using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seller_jobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        savediv.Visible = true;
    }
}