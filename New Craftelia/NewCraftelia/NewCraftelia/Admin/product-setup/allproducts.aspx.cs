using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_product_setup_allproducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("Label8")).Text;
        string featurestatus = ((Label)e.Item.FindControl("Label7")).Text;
         string adminapproval = ((Label)e.Item.FindControl("Label6")).Text;


         if (e.CommandName == "Auction")
         {

             Response.Redirect("~/admin/product-setup/AllAuctions?ID=" + id);
         }

       
        if (e.CommandName == "Feature")
        {
            string fs;
            if(featurestatus == "Yes")
            {

                fs = "No";
            }

            else
            {

                fs = "Yes";
            }
            SqlDataSource3.UpdateParameters.Add("FeatureStatus", fs.ToString());
            SqlDataSource3.UpdateParameters.Add("ID", id);

            SqlDataSource3.Update();
            ListView1.DataBind();
          
        }

        if (e.CommandName == "Approval")
        {
            string AA;
            if (adminapproval == "Active")
            {

                AA = "Reject";
            }

            else
            {

                AA = "Active";
            }
            SqlDataSource4.UpdateParameters.Add("Approval", AA.ToString());
            SqlDataSource4.UpdateParameters.Add("ID", id);

            SqlDataSource4.Update();
            ListView1.DataBind();

        }

        if (e.CommandName == "Edit")
        {

            Response.Redirect("~/Seller/addproduct.aspx?ID=" + id);
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add(new ListItem("All", "%"));


        DropDownList2.DataBind();
    }



    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label salestype = ((Label)e.Item.FindControl("Label9"));
            LinkButton auctionview = ((LinkButton)e.Item.FindControl("LinkButton2"));


            if (salestype.Text == "Auction")
            {
                auctionview.Visible = true;

                auctionview.Text = "View Auction Details";
            }


            if (salestype.Text == "Tender")
            {
                auctionview.Visible = true;
                auctionview.Text = "View Tender Details";
            }


        }
    }
}