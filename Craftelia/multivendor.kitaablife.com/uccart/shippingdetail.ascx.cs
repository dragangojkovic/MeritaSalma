using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uccart_shippingdetail : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
    }
}