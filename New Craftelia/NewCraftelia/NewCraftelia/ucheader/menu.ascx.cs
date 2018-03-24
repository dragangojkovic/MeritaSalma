using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucheader_menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //


        HiddenField1.Value = Page.User.Identity.Name;

        if (HiddenField1.Value != "")
        {

            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);


            if (dview.Table.Rows.Count > 0)
            {
                string accounttype = (string)dview.Table.Rows[0]["AccountMasterType"];


                if (accounttype.ToString().Equals("Both"))
                {

                    both.Visible = true;
                }

                if (accounttype.ToString().Equals("Seller"))
                {

                    vendor.Visible = true;
                }

                if (accounttype.ToString().Equals("Buyer"))
                {

                    buyer.Visible = true;
                }
            }

            if(Page.User.Identity.Name == "Admin" || Page.User.Identity.Name == "admin" )
            {

                admin.Visible = true;

                both.Visible = false;
                vendor.Visible = false;
                buyer.Visible = false;

            }

        } 
    }

    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
    }
}