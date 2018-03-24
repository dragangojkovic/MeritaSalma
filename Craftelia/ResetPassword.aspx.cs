using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using alibabu;

public partial class Account_ResetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            string user = Request.QueryString["MemberId"].ToString();

            UserManager<IdentityUser> userManager =
    new UserManager<IdentityUser>(new UserStore<IdentityUser>());

            userManager.RemovePassword(user);

            userManager.AddPassword(user, TextBox2.Text);

            Response.Redirect("~/Account/login");
        }
    }




}