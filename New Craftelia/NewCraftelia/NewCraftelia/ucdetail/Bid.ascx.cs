using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_book : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;

        if(!IsPostBack)
        {
                  DataView dview = (DataView)SqlDataSource23.Select(DataSourceSelectArguments.Empty);


                  if (dview.Table.Rows.Count > 0)
                  {
                      int bidid = (int)dview.Table.Rows[0]["ProductBidId"];

                       DateTime bidexpiry = (DateTime)dview.Table.Rows[0]["ProductBidExpiry"];

                       decimal lastbidprice = (decimal)dview.Table.Rows[0]["LastBidPrice"];

                       Label1.Text = lastbidprice.ToString();
                       Label2.Text = bidid.ToString();

                       //Label3.Text = bidexpiry.ToString();

                       DateTime startDate = DateTime.Now;
                       DateTime endDate = bidexpiry;
                       Label3.Text = CalculateTimeDifference(startDate, endDate);

                  }

                 if(Label3.Text == "0")
                 {
                     Label4.Visible = true;
                     Label4.Text = "Bidding is closed for this product";
                     bidapply.Visible = false;
                     lastbid.Visible = false;
                 }



           

        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (HiddenField1.Value != "")
        {
            if (int.Parse(TextBox1.Text) > int.Parse(Label1.Text))
            {
                SqlDataSource23.Insert();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup2();", true);
            }
            else
            {

                Label4.Text = "Your Bid Amount should be greater than last Bid Amount.";
            }
        }

        else
        {
            Response.Redirect("~/Account/Login?Type" + "Bid");
        }
    }

    public string CalculateTimeDifference(DateTime startDate, DateTime endDate)
    {
        int days = 0; int hours = 0; int mins = 0; int secs = 0;
        string final = "0";
        if (endDate > startDate)
        {
            days = (endDate - startDate).Days;
            hours = (endDate - startDate).Hours;
            mins = (endDate - startDate).Minutes;
            secs = (endDate - startDate).Seconds;
            final = string.Format(" {0} hours {1} mins {2} secs", hours, mins, secs);





        }
        return final;


    }

}