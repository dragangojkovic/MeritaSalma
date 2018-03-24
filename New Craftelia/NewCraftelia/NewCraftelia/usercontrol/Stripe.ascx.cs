using Stripe;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_Paypal : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            DataView dview10 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if (Request.QueryString["OrderNo"] != null)
            {
                HiddenField2.Value = Request.QueryString["OrderNo"].ToString();
            }
            if (dview10.Table.Rows.Count > 0)
            {
                decimal price = (decimal)dview10.Table.Rows[0]["Total"];

                TextBox4.Text = price.ToString();
            }
        }
    }

    private void stripe()
    {


        DataView dview10 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);


        if (dview10.Table.Rows.Count > 0)
        {
            decimal price = (decimal)dview10.Table.Rows[0]["Total"];

            TextBox4.Text = price.ToString();

            try
            {
                StripeCustomer current = GetCustomer();
                // int? days = getaTraildays();
                //if (days != null)
                //{
                int chargetotal = Convert.ToInt32(TextBox4.Text) * 100;//Convert.ToInt32((3.33*Convert.ToInt32(days)*100));
                var mycharge = new StripeChargeCreateOptions();
                mycharge.AmountInCents = chargetotal;
                mycharge.Currency = "GBP";
                mycharge.CustomerId = current.Id;
                string key = "sk_live_Wotk8MEIIdA98wYTcp4yUv0U";
                var chargeservice = new StripeChargeService(key);
                StripeCharge currentcharge = chargeservice.Create(mycharge);

               

                Response.Redirect("~/Customer/Invoice.aspx?OrderNo=" + HiddenField2.Value);
                //}
                
            }
            catch (Exception ex)
            {

                Label1.Text = ex.Message;
            }
           


        }





    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        stripe();
    }

    private StripeCustomer GetCustomer()
    {

        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;


        var mycust = new StripeCustomerCreateOptions();
        mycust.Email = Page.User.Identity.Name;
        mycust.Description = "Service Buy";
        mycust.CardNumber = TextBox1.Text;
        mycust.CardCvc = TextBox6.Text;
        mycust.CardExpirationMonth = TextBox2.Text;
        mycust.CardExpirationYear = TextBox3.Text;
        // mycust.PlanId = "100";
        mycust.CardName = TextBox5.Text;

        mycust.CardAddressCity = "ABC";
        mycust.CardAddressCountry = "USA";
        mycust.CardAddressLine1 = "asbcd";
        //mycust.TrialEnd = getrialend();

        var customerservice = new StripeCustomerService("sk_live_Wotk8MEIIdA98wYTcp4yUv0U");
        return customerservice.Create(mycust);
    }
}