using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_home11nov2017 : System.Web.UI.UserControl
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
        string id = ((Label)e.Item.FindControl("Label8")).Text;
        string pid = ((Label)e.Item.FindControl("Label7")).Text;
        if (e.CommandName == "Details")
        {

            Response.RedirectToRoute("ServiceDetails", new { ID = id, PID = pid });
        }

        if (e.CommandName == "favorite")
        {

            if (Page.User.Identity.Name == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }

            else
            {
                SqlDataSource4.InsertParameters.Add("UserName", Page.User.Identity.Name);
                SqlDataSource4.InsertParameters.Add("ProductId", id);

                SqlDataSource4.Insert();


                ListView1.DataBind();

            }
        }
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label favstatus = ((Label)e.Item.FindControl("Label3"));
            LinkButton lnkView = ((LinkButton)e.Item.FindControl("LinkButton2"));
            Label discountoffer = ((Label)e.Item.FindControl("Label12"));
            Label percentsign = ((Label)e.Item.FindControl("Label13"));
            Label strikeprice = ((Label)e.Item.FindControl("Label11"));
            Label salestype = ((Label)e.Item.FindControl("Label5"));
            Label price = ((Label)e.Item.FindControl("Label9"));
            Label enabledeal = ((Label)e.Item.FindControl("Label15"));
            Label demotime = ((Label)e.Item.FindControl("Label16"));
            Label demotime2 = ((Label)e.Item.FindControl("Label17"));

            Label expirylabel = ((Label)e.Item.FindControl("Label19"));

            Label offerepiry = ((Label)e.Item.FindControl("Label20"));

            Label bidexpired = ((Label)e.Item.FindControl("Label21"));
            //EmailAddressLabel.Font.Italic = true;

            //if (discountoffer.Text != "0")
            //{

            //    int prices = int.Parse(price.Text)/ (1- int.Parse(discountoffer.Text)/100);

            //    //int calcper = prices / 100;

            //    int actualprice = prices;


            //    strikeprice.Text = actualprice.ToString();
            //}



            if (favstatus.Text != "0")
            {
                lnkView.Text = "Saved";
                lnkView.Enabled = false;
            }

            if (discountoffer.Text == "0")
            {
                strikeprice.Visible = false;
                percentsign.Visible = false;




            }


            if (salestype.Text == "Auction")
            {
                salestype.CssClass = "label label-info";
            }

            if (salestype.Text == "Offer-Deals" || salestype.Text == "Auction" || salestype.Text == "Tender")
            {
                salestype.CssClass = "label label-danger";

                enabledeal.Visible = true;
                expirylabel.Visible = true;
                offerepiry.Visible = true;

                if (DateTime.Parse(expirylabel.Text) < DateTime.Now)
                {

                    bidexpired.Visible = true;
                }
            }
            if (enabledeal.Text == "Demo")
            {

                demotime.Visible = true;
                demotime2.Visible = true;

                if (price.Text == "0")
                {

                    enabledeal.Text = "Demo";
                }

                else
                {

                    enabledeal.Text = "Leasing";
                }
            }



        }
    }

}