using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_configration_SetupPayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if (dview.Table.Rows.Count > 0)
            {


                string paypal = (string)dview.Table.Rows[0]["paypal"];

                TextBox1.Text = paypal.ToString();
               
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Update();
        Response.Redirect("~/Admin/configration/SetupPayment.aspx");
    }
}