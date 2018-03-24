using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_OfferNotifications : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {


            Label unread = ((Label)e.Item.FindControl("Label1"));


            // Display the e-mail address in italics.

            // Here, lblProdID contains your data ProductID as text, change to "My Text"
            if (unread.Text == "0")
            {

                unread.Visible = false;

            }

            else
            {

                unread.Visible = true;

            }
        }

    }

   
}