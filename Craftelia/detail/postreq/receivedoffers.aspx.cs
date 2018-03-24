using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BuyerRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;


        DataView dview = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        int count = (int)dview.Table.Rows[0]["Offer"];
        string value = count.ToString();
        LinkButton2.Text = value.ToString();


     

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

       
        

        string PostARequestId = ((Label)e.Item.FindControl("Label2")).Text;
        string appliedby = ((LinkButton)e.Item.FindControl("LinkButton4")).Text;

        string pid = ((Label)e.Item.FindControl("Label11")).Text;

        string username = ((LinkButton)e.Item.FindControl("LinkButton4")).Text;
     

        if (e.CommandName == "contact")
        {
           
                SqlDataSource2.UpdateParameters.Add("ID", PostARequestId);
                SqlDataSource2.UpdateParameters.Add("status", "read");
                SqlDataSource2.Update();
                Session["username"] = username;
                Response.RedirectToRoute("contact", new { username = pid });
              
           
        }

        if (e.CommandName == "Remove")
        {

            SqlDataSource2.UpdateParameters.Add("ID", PostARequestId);
            SqlDataSource2.UpdateParameters.Add("status", "remove");
            SqlDataSource2.Update();
            Response.Redirect("~/postreq/receivedoffers.aspx");


        }

        if (e.CommandName == "profile")
        {

            Response.RedirectToRoute("profile", new { username = appliedby });

        }


        if (e.CommandName == "order")
        {

            Response.RedirectToRoute("ServiceDetails", new { ID = pid, username = username });
        }


    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.
           
            Label readstatus = ((Label)e.Item.FindControl("Label10"));
            //EmailAddressLabel.Font.Italic = true;
            


                if (readstatus.Text == "unread")
            {
                readstatus.Font.Bold = true;
                readstatus.ForeColor = System.Drawing.Color.Purple;
               
            }
            
        }
    }
}