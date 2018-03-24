using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_configration_meta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {

            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if (dview.Table.Rows.Count > 0)
            {


                string MetaTitle = (string)dview.Table.Rows[0]["MetaTitle"];
                string MetaKey = (string)dview.Table.Rows[0]["MetaKey"];
                string MetaDescription = (string)dview.Table.Rows[0]["MetaDescription"];
                TextBox1.Text = MetaTitle.ToString();
                TextBox2.Text = MetaKey.ToString();
                TextBox3.Text = MetaDescription.ToString();
            }
        }

    }
}