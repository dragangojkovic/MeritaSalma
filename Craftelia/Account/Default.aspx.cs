using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PayPal.Api;
using System.Configuration;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void Button1_Click1(object sender, EventArgs e)
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
                email_subject = "You have a payment"


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
                            value = "5",
                            currency = "USD"
                        },
                        receiver = "harrycruse1@gmail.com",
                        note = "Thank you.",
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

        Label1.Text = createdPayout.batch_header.payout_batch_id;



        var payoutBatchId = Label1.Text;



        var payoutt = Payout.Get(apiContext, payoutBatchId);
        //var payoutItemId = Label1.Text;

        //var payoutItemDetails = PayoutItem.Get(apiContext, payoutItemId);
        Label2.Text = payoutt.batch_header.batch_status;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        string redirecturl = "";
        //Mention URL to redirect content to paypal site
        redirecturl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" +
                       ConfigurationManager.AppSettings["paypalemail"].ToString();

        //First name i assign static based on login details assign this value
        redirecturl += "&first_name=xyz";

        //City i assign static based on login user detail you change this value
        redirecturl += "&city=bhubaneswar";

        //State i assign static based on login user detail you change this value
        redirecturl += "&state=Odisha";

        redirecturl += "&invoice=" + "009";

        //Product Name
        redirecturl += "&item_name=Add Fund";

        //Product Name
        redirecturl += "&amount=" + 10.00;

        //Phone No
        redirecturl += "&night_phone_a=6789";

        //Product Name
        redirecturl += "&item_name=" + "";

        //Address 
        redirecturl += "&address1=" + "";

        //Business contact id
        // redirecturl += "&business=k.tapankumar@gmail.com";

        //Shipping charges if any
        redirecturl += "&shipping=0";

        //Handling charges if any
        redirecturl += "&handling=0";

        //Tax amount if any
        redirecturl += "&tax=0";

        //Add quatity i added one only statically 
        redirecturl += "&quantity=1";

        //Currency code 
        redirecturl += "&currency=" + "USD";
        redirecturl += "&tx=" + "009";
        redirecturl += "&at=" + ConfigurationManager.AppSettings["token"].ToString();

        //Success return page url
        redirecturl += "&return=http://intearn.com/Successaddfund.aspx?txid=" + "009";


        //Failed return page url
        redirecturl += "&cancel_return=" +
          ConfigurationManager.AppSettings["FailedURL"].ToString();



        //notify url

        redirecturl += "&notify_url=" +
         ConfigurationManager.AppSettings["PAYPAL_NOTIFICATION_URL"].ToString();

        Response.Redirect(redirecturl);
    }
}