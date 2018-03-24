using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seller_Withdraw : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            HiddenField1.Value = Page.User.Identity.Name;

            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);


            if (dview.Table.Rows.Count > 0)
            {
                decimal funds = (decimal)dview.Table.Rows[0]["availablefunds"];

                Label2.Text = funds.ToString();
            }


            DataView dview2 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);


            if (dview2.Table.Rows.Count > 0)
            {
                string paypal = (string)dview2.Table.Rows[0]["paypal"];

                TextBox1.Text = paypal.ToString();
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (decimal.Parse( Label2.Text) > 0)
        {

            paypalclaim();
           
           
        }
        else
        {

            Label3.Text = "You do not have sufficient balance to withdraw";
        }
    }


    protected void paypalclaim()
    {
        var apiContext = Configuration.GetAPIContext();

        // Initialize a new `Payout` object with details of the batch payout to be created.
        var payout = new Payout
        {


            // #### sender_batch_header
            // Describes how the payments defined in the `items` array are to be handled.
            sender_batch_header = new PayoutSenderBatchHeader
            {
                sender_batch_id = "batch_" + System.Guid.NewGuid().ToString().Substring(0, 8),
                email_subject = "Craftelia.co.uk revenue claim."


            },
            // #### items
            // The `items` array contains the list of payout items to be included in this payout.
            // If `syncMode` is set to `true` when calling `Payout.Create()`, then the `items` array must only
            // contain **one** item.  If `syncMode` is set to `false` when calling `Payout.Create()`, then the `items`
            // array can contain more than one item.
            items = new List<PayoutItem>
                {
                    new PayoutItem
                    {
                        recipient_type = PayoutRecipientType.EMAIL,
                        amount = new Currency
                        {
                            value = Label2.Text,
                            currency = "USD"
                        },
                        receiver = TextBox1.Text,
                        note = "Craftelia.co.uk revenue claim.",
                        sender_item_id = "item_1"
                    }
                    //new PayoutItem
                    //{
                    //    recipient_type = PayoutRecipientType.EMAIL,
                    //    amount = new Currency
                    //    {
                    //        value = "0.10",
                    //        currency = "USD"
                    //    },
                    //    receiver = "villap@gmail.com",
                    //    note = "Thank you.",
                    //    sender_item_id = "item_2"
                    //},
                    //new PayoutItem
                    //{
                    //    recipient_type = PayoutRecipientType.EMAIL,
                    //    amount = new Currency
                    //    {
                    //        value = "0.10",
                    //        currency = "USD"
                    //    },
                    //    receiver = "villap@gmail.com",
                    //    note = "Thank you.",
                    //    sender_item_id = "item_3"
                    //}
                }
        };

        // ^ Ignore workflow code segment
        //#region Track Workflow
        //this.flow.AddNewRequest("Create payout", payout);
        //#endregion

        // ### Payout.Create()
        // Creates the batch payout resource.
        // `syncMode = false` indicates that this call will be performed **asynchronously**,
        // and will return a `payout_batch_id` that can be used to check the status of the payouts in the batch.
        // `syncMode = true` indicates that this call will be performed **synchronously** and will return once the payout has been processed.
        // > **NOTE**: The `items` array can only have **one** item if `syncMode` is set to `true`.
        var createdPayout = payout.Create(apiContext, true);

        Label4.Text = createdPayout.batch_header.payout_batch_id;



        var payoutBatchId = Label4.Text;



        var payoutt = Payout.Get(apiContext, payoutBatchId);
        //var payoutItemId = Label1.Text;

        //var payoutItemDetails = PayoutItem.Get(apiContext, payoutItemId);
        Label5.Text = payoutt.batch_header.batch_status;

        if (Label5.Text == "SUCCESS")
        {

            SqlDataSource3.Insert();
            Response.Redirect("~/Seller/Withdrawsuccess.aspx");
        }


        else
        {

            Label3.Text = "We have some problem please try again later or report to support@craftelia.co.uk";
        }
    }
}