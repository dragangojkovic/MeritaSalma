using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucproduct_Auction : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            TextBox1.Text = DateTime.Now.ToString("dd/MMM/yyyy");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        Response.Redirect("~/Seller/addproductstep2.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
}