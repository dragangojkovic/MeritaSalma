using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_searchbar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        

    }

    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        if (DropDownList1.SelectedValue != "%" && TextBox1.Text != string.Empty)
        {

            Response.RedirectToRoute("Topssearch4", new {Keyword = TextBox1.Text, CID = DropDownList1.SelectedValue, Cat = DropDownList1.SelectedItem.ToString().Replace(" ", "-").Replace("/", "-").Replace("&", "-") });
        }


        if (TextBox1.Text != string.Empty && DropDownList1.SelectedValue == "%")
        {

            Response.RedirectToRoute("Topssearch3", new { Keyword = TextBox1.Text });
        }

        if (DropDownList1.SelectedValue != "%" && TextBox1.Text == string.Empty)
        {

            Response.RedirectToRoute("HeadSearch", new { CID = DropDownList1.SelectedValue, Cat = DropDownList1.SelectedItem.ToString().Replace(" ", "-").Replace("/", "-").Replace("&", "-") });
        }


        if (TextBox1.Text == string.Empty && DropDownList1.SelectedValue == "%")
        {

            Response.Redirect("~/Search");
        }
    }
}