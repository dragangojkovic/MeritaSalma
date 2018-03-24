using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_SellerDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;

        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
      


    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
       
        
    }
}