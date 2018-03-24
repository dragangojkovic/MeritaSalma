using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_Paypal : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            DataView dview = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

            if (dview.Table.Rows.Count > 0)
            {


                string paypal = (string)dview.Table.Rows[0]["paypal"];

                HiddenField1.Value  = paypal.ToString();

            }


            if (Request.QueryString["OrderNo"] != null)
            {
                HiddenField2.Value = Request.QueryString["OrderNo"].ToString();
            }
        }
    }

    private void paypalred()
    {


        DataView dview10 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);


        if (dview10.Table.Rows.Count > 0)
        {
            decimal price = (decimal)dview10.Table.Rows[0]["Total"];




            string redirecturl = "";
            //Mention URL to redirect content to paypal site
            //redirecturl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" + "harrycruse1@gmail.com";
            //ConfigurationManager.AppSettings["paypalemail"].ToString();


            redirecturl += "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" + HiddenField1.Value;

            //First name i assign static based on login details assign this value
            redirecturl += "&first_name=test";

            //City i assign static based on login user detail you change this value
            redirecturl += "&city=bhubaneswar";

            //State i assign static based on login user detail you change this value
            redirecturl += "&state=Odisha";

            //redirecturl += "&invoice=" + Session["orderId"].ToString();

            //Product Name
            redirecturl += "&item_name=" + Page.User.Identity.Name;

            //Product Name
            redirecturl += "&amount=" + price;

            //Phone No
            redirecturl += "&night_phone_a=6789";

            //Product Name
            redirecturl += "&custom=" + HiddenField2.Value ;

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
            //redirecturl += "&tx=" + Session["orderId"].ToString();
            redirecturl += "&at=" + ConfigurationManager.AppSettings["token"].ToString();

            //Success return page url



            redirecturl += "&return=http://multivendor.kitaablife.com/Customer/Invoice.aspx?OrderNo=" + HiddenField2.Value;


            //Failed return page url
            redirecturl += "&cancel_return=" +
              ConfigurationManager.AppSettings["FailedURL"].ToString();



            //notify url

            redirecturl += "&notify_url=" +
             ConfigurationManager.AppSettings["PAYPAL_NOTIFICATION_URL"].ToString();

            Response.Redirect(redirecturl);


        }





    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        paypalred();
    }
}