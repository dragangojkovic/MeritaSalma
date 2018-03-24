using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class paymentgateway : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["customer"] = "Customer";
        Response.Redirect("~/Customer/invoice.aspx?OrderNo=" + Request.QueryString["OrderNo"].ToString());
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Paypal")
        {

            Paypal.Visible = true;
            Stripe.Visible = false;
        }

        if (RadioButtonList1.SelectedValue == "Credit Card")
        {

            Paypal.Visible = false;
            Stripe.Visible = true;
        }

        SqlDataSource1.Update();
    }
}