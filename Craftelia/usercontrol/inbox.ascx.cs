using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class usercontrol_inbox : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        

        HiddenField1.Value = Page.User.Identity.Name;
       
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string chatid = ((Label)e.Item.FindControl("Label1")).Text;

        string profileid = ((Label)e.Item.FindControl("Label5")).Text;
        string username = ((Label)e.Item.FindControl("Label8")).Text;

        if (e.CommandName == "chat")
        {


            Session["username"] = username;
            Response.RedirectToRoute("contactInbox", new { username = profileid, ChatID = chatid });


            
        }
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {


            Label status = ((Label)e.Item.FindControl("Label6"));


            // Display the e-mail address in italics.

            // Here, lblProdID contains your data ProductID as text, change to "My Text"
            if (status.Text == "unread")
            {

                status.Font.Bold = true;
                status.ForeColor = System.Drawing.Color.Purple;

            }








            // Here, you can access your data
        }
    }
}