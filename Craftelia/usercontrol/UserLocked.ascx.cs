using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_UserLocked : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            HiddenField1.Value = Page.User.Identity.Name;

            if (HiddenField1.Value != "")
            {
                DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);


                if (dview.Table.Rows.Count > 0)
                {

                    string status = (string)dview.Table.Rows[0]["Status"];

                    if (status.ToString().Equals("InActive"))
                    {

                        Response.Redirect("~/disable.aspx");
                    }

                }
            }
        }

    }
}