using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seller_Myorders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {



        string orderno = ((Label)e.Item.FindControl("Label9")).Text;
        string username = ((Label)e.Item.FindControl("Label1")).Text;
        string pid = ((Label)e.Item.FindControl("Label6")).Text;
        if (e.CommandName == "contact")
        {

            Response.RedirectToRoute("contact", new { username = pid });
        }


        if (e.CommandName == "deliver")
        {

            Session["Type"] = "Seller";

            Response.Redirect("~/Account/Deliver.aspx?OrderNo="+ orderno);
        }

        if (e.CommandName == "Invoice")
        {


            Session["cart"] = orderno;
            Response.Redirect("~/Customer/invoice.aspx?OrderNo=" + orderno);
        }


       
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label actstatus = ((Label)e.Item.FindControl("Label5"));

            if(actstatus.Text == "Active")
            {
                actstatus.Text = "Order";
            }

            if (actstatus.Text == "Pending")
            {
                actstatus.Text = "Shipped";
            }

            if (actstatus.Text == "Accept")
            {
                actstatus.Text = "Received";
            }

           


        }
    }
}