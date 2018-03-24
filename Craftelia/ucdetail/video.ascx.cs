using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_video : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if (dview.Table.Rows.Count > 0)
            {
                string video = (string)dview.Table.Rows[0]["VideoUpload"];

                if (video.ToString().Equals("NA"))
                {

                    ListView1.Visible = false;
                }
            }
        }
    }
}