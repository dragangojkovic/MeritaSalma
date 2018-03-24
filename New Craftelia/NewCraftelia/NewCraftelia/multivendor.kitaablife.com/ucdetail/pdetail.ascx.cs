using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_detail : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label salestype = ((Label)e.Item.FindControl("Label6"));
            Panel pnldeal = ((Panel)e.Item.FindControl("Panel1"));
            Label offerexpiry = ((Label)e.Item.FindControl("Label24"));
                Label wholesaleprice = ((Label)e.Item.FindControl("Label25"));

            DateTime offexp = Convert.ToDateTime(offerexpiry.Text.Trim());

            Label enabledeal = ((Label)e.Item.FindControl("Label27"));
            Label demotime = ((Label)e.Item.FindControl("Label26"));
            Label demotime2 = ((Label)e.Item.FindControl("Label28"));
            

            if (enabledeal.Text == "Demo")
            {
                demotime.Visible = true;
                demotime2.Visible = true;


            }

            if(salestype.Text == "Offer-Deals")
            {
                pnldeal.Visible = true;

                enabledeal.Visible = true;
                
            }

            else
            {

                pnldeal.Visible = false;
            }

            if (salestype.Text == "Offer-Deals" && offexp < Convert.ToDateTime(DateTime.Now.ToString()))
            {
                book.Visible = false;
                Label4.Text = "This offer is closed";
                Label4.Visible = true;

            }

            if (salestype.Text == "Auction")
            {

                Bid.Visible = true;
                book.Visible = false;
            }

           if (salestype.Text == "Wholesale")
            {

                wholesaleprice.Visible = true;
            }

           if (salestype.Text == "Tender")
           {

               Tender.Visible = true;
               book.Visible = false;
           }


           if (salestype.Text == "Wanted")
           {

               Tender.Visible = false;
               book.Visible = false;
           }

            
        }
    }
}