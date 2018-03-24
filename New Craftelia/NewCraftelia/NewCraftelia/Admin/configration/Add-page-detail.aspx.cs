using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_pagessetup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
        {
           
        }

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dview = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        if (dview.Table.Rows.Count > 0)
        {

            SqlDataSource2.Update();
            Label1.Text = "Updated Successfully";
        }

        else
        {

            SqlDataSource2.Insert();
            Label1.Text = "Updated Successfully";

        }
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Redirect("~/Admin/pagessetup.aspx");

        DataView dview = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

        if (dview.Table.Rows.Count > 0)
        {


            string PBody = (string)dview.Table.Rows[0]["PageBody"];
            TextBox2.Text= PBody.ToString();
        }
       
    }
}