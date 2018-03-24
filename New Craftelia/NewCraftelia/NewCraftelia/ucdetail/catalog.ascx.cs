using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_catalog : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {


            string id = ((Label)e.Item.FindControl("Label2")).Text;
            //string ltrl = ((Literal)e.Item.FindControl("ltEmbed")).Text;

            Response.Redirect(id);
        }
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label id = ((Label)e.Item.FindControl("Label2"));
            LinkButton lnkView = ((LinkButton)e.Item.FindControl("lnkView"));
            //EmailAddressLabel.Font.Italic = true;

            

            if (id.Text == "NA" || id.Text == "View File")
            {
                lnkView.Visible = false;
            }

            else
            {

                lnkView.Visible = true;
            }
        }
    }
}