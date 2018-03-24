using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seller_BidsShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
    }


    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("Label1")).Text;
        string pid = ((Label)e.Item.FindControl("Label6")).Text;
        string amount = ((Label)e.Item.FindControl("Label7")).Text;
         string bid = ((Label)e.Item.FindControl("Label2")).Text;
        if (e.CommandName == "Details")
        {

            Response.RedirectToRoute("ServiceDetails", new { ID = id, PID = pid });
        }

        if (e.CommandName == "Buy")
        {
            Session["sellerid"] = id;
            Session["productkey"] = pid;
            Session["Amount"] = amount;


            SqlDataSource23.InsertParameters.Add("sellerusername", pid);
            SqlDataSource23.InsertParameters.Add("ID", id);
            SqlDataSource23.InsertParameters.Add("Amount", amount);
            SqlDataSource23.InsertParameters.Add("Requirement", "Auction Win! Bid ID" + bid   );
            SqlDataSource23.Insert();

            Response.Redirect("~/checkout.aspx");
        }
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label status = ((Label)e.Item.FindControl("Label9"));
            LinkButton buy = ((LinkButton)e.Item.FindControl("LinkButton2"));

            if(status.Text != "Offer")
            {
                buy.Visible = false;

            }
            else
            {
                buy.Visible = false;
            }


        }
    }
}