using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Addpages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        TextBox1.Text = string.Empty;


        GridView1.DataBind();
       
    }

    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(RadioButtonList2.SelectedValue == "Yes")
        {

            TextBox2.Visible = true;
        }
        else
        {
            TextBox2.Text = "NO";
            TextBox2.Visible = false;
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Footer")
        {

            footercat.Visible = true;
            RequiredFieldValidator2.Enabled = true;
        }
        else
        {
            footercat.Visible = false;
            RequiredFieldValidator2.Enabled = false;
        }
    }
}