using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_SellerApproval : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        HiddenField1.Value = Page.User.Identity.Name;

        if(HiddenField1.Value != "")
        {

             DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);


             if (dview.Table.Rows.Count > 0)
             {
                 string adminapproval = (string)dview.Table.Rows[0]["adminapproval"];

                 if(adminapproval.Equals("Active"))
                 {

                 }
                 else
                 {
                     notify.Visible = true;
                 }
             }

           
        }

    }
}