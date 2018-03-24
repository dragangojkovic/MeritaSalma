using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_ViewsInsert : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            SqlDataSource4.InsertParameters.Add("BusinessId", this.Page.RouteData.Values["ID"].ToString()  );
            SqlDataSource4.InsertParameters.Add("IP", Request.UserHostAddress.ToString());

            SqlDataSource4.InsertParameters.Add("UserName", Page.User.Identity.Name);

            SqlDataSource4.Insert();
        }
    }
}