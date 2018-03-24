using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_chat : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {


        


        HiddenField1.Value = Page.User.Identity.Name;

        //Label4.Text = Page.User.Identity.Name;
        //Label22.Text = HttpContext.Current.Request.RequestContext.RouteData.Values["ChatID"].ToString();

        if (!IsPostBack &&  Session["username"] != null)
            {

                HiddenField2.Value = Session["username"].ToString();
                SqlDataSource7.Update();
                //Label4.Text = HttpContext.Current.Request.RequestContext.RouteData.Values["username"].ToString();
            }

        
            DataView dview = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);


            if (dview.Table.Rows.Count > 0)
            {
                string ChattId = (string)dview.Table.Rows[0]["ChatId"];

                Label22.Text = ChattId.ToString();
               
            }

            else
            {
                Random rand = new Random(100);
                int ccc = rand.Next(000000000, 999999999);

                var bytes = new byte[4];
                var rng = System.Security.Cryptography.RandomNumberGenerator.Create();
                rng.GetBytes(bytes);
                uint random = BitConverter.ToUInt32(bytes, 0) % 100000000;




                Label22.Text = String.Format("{0:D8}", random) + DateTime.Now.ToString("ddMMyyyyhhmmss");
            }

      
           
            
        }

        
        



    
    protected void SqlDataSource7_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        //if (HttpContext.Current.Request.RequestContext.RouteData.Values["username"] != null)
        //{

        //    string username = HttpContext.Current.Request.RequestContext.RouteData.Values["username"].ToString();
        //    Response.RedirectToRoute("Keyword", new { UserName = username });

            ListView3.DataBind();
            mydiv.Visible = true;
            Label21.Text = "Message Sent";

            TextBox1.Text = string.Empty;
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource7.Insert();
    }
    protected void ListView3_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label favstatus = ((Label)e.Item.FindControl("Label3"));
        }
    }
}