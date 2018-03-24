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
      



        if (e.CommandName == "SendOffer")
        {
            //try
            //{
                SqlDataSource2.InsertParameters.Add("PostARequestId", PostARequestId);
                SqlDataSource2.Insert();
                Response.Redirect("~/postreq/BuyerRequest.aspx");
              
            //}

            //catch (Exception message)
            //{

            //    Session["Exception"] = message.Message;

            //    Response.Redirect("~/ErrorPage?Page" + "BuyerRequest" );
            //}
        }
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.
            Button sendoffer = (Button)e.Item.FindControl("Button1");
            Label Appliedstatus = ((Label)e.Item.FindControl("Label8"));
            //EmailAddressLabel.Font.Italic = true;
            if (LinkButton2.Text == "10")
           {
           sendoffer.Enabled = false;
           sendoffer.Text = "No Offers Left";
           }

            if(Appliedstatus.Text =="Apply" )
            {

                sendoffer.Enabled = false;
                sendoffer.Text = "Applied";
            }
            
        }
    }
}