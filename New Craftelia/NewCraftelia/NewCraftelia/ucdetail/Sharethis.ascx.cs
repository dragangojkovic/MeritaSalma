using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ucdetail_Sharethis : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
                DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                if (dview.Table.Rows.Count > 0)
                {
                    string host = HttpContext.Current.Request.Url.Host;
                    string ProductName = (string)dview.Table.Rows[0]["ProductName"];
                    string Description = (string)dview.Table.Rows[0]["Description"];
                    string Image = (string)dview.Table.Rows[0]["CoverImage"];

                    Label1.Text = Description.ToString();

                    //Add Page Title
                    this.Page.Title = ProductName.ToString();

                    //Add Keywords Meta Tag
                    HtmlMeta keywords = new HtmlMeta();
                    keywords.HttpEquiv = "keywords";
                    keywords.Name = "keywords";
                    keywords.Content = Label1.Text;
                    this.Page.Header.Controls.Add(keywords);

                    //Add Description Meta Tag
                    //HtmlMeta description = new HtmlMeta();
                    //description.HttpEquiv = "description";
                    //description.Name = "description";
                    //description.Content = Label1.Text;
                    //this.Page.Header.Controls.Add(description);

                }
    }
}