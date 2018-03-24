using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_Shipping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;

        if (!IsPostBack)
        {

            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dview.Table.Rows.Count > 0)
            {
                string FullName = (string)dview.Table.Rows[0]["FullName"];
                string ContactNumber = (string)dview.Table.Rows[0]["ContactNumber"];
                string Shippingaddress = (string)dview.Table.Rows[0]["Shippingaddress"];
                string City = (string)dview.Table.Rows[0]["City"];
                string PostCode = (string)dview.Table.Rows[0]["PostCode"];
                string Country = (string)dview.Table.Rows[0]["Country"];


                TextBox1.Text = FullName.ToString();
                TextBox2.Text = ContactNumber.ToString();
                TextBox3.Text = Country.ToString();
                TextBox4.Text = City.ToString();
                TextBox5.Text = Shippingaddress.ToString();
                TextBox6.Text = PostCode.ToString();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        

            SqlDataSource1.Insert();
        

        Response.Redirect("~/Customer/paymentgateway.aspx?OrderNo=" + Session["cart"].ToString());
    }
}