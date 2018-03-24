using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucvendor_contactdetails : System.Web.UI.UserControl
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
                    string Telephone = (string)dview.Table.Rows[0]["Telephone"];
                    string Mobile = (string)dview.Table.Rows[0]["Mobile"];
                    string Email = (string)dview.Table.Rows[0]["Email"];


                    TextBox1.Text = Telephone.ToString();
                    TextBox2.Text = Mobile.ToString();
                    TextBox3.Text = Email.ToString();


                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource5.Update();
        savediv.Visible = true;
        
    }
}