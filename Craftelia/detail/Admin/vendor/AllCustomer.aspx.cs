using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_vendor_AllVendor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ID"] = GridView1.SelectedDataKey.Value.ToString();


        DataView dview = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        int lockout = (int)dview.Table.Rows[0]["LockoutEnabled"];



        HiddenField1.Value = lockout.ToString();


        string i;

        if (HiddenField1.Value == "0")
        {
            i = "1";
        }

        else
        {

            i = "0";
        }


        //Response.Redirect("~/Admin/GroomerList.aspx?ID=" + GridView1.SelectedDataKey.Value);



        SqlDataSource2.UpdateParameters.Add("username", GridView1.SelectedDataKey.Value.ToString());
        SqlDataSource2.UpdateParameters.Add("Lockout", i.ToString());
        SqlDataSource2.Update();

        GridView1.DataBind();
    }
}