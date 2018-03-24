using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucvendor_addressdetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;
            if (HiddenField1.Value != "")
            {

                DataView dview = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);

                if (dview.Table.Rows.Count > 0)
                {

                    DropDownList1.DataBind();
                    DropDownList2.DataBind();
                    int Country = (int)dview.Table.Rows[0]["Country"];
                    int City = (int)dview.Table.Rows[0]["City"];
                    string District = (string)dview.Table.Rows[0]["District"];
                    string Street = (string)dview.Table.Rows[0]["Street"];
                    string Building = (string)dview.Table.Rows[0]["Building"];
                    string googlemap = (string)dview.Table.Rows[0]["googlemap"];
                    TextBox1.Text = googlemap.ToString();




                   DropDownList1.SelectedValue = Country.ToString();
                   DropDownList2.SelectedValue = City.ToString();
                    TextBox3.Text = District.ToString();
                    TextBox4.Text = Street.ToString();
                    TextBox5.Text = Building.ToString();

                    //string name = Request.Form["txtPlaces"];

                   

                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

       
       
        SqlDataSource5.Update();
        savediv.Visible = true;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.DataBind();
    }
}