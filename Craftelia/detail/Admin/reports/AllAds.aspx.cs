using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.Collections.Generic;
using System.IO;

public partial class Admin_reports_AllAds : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (ZipFile zip = new ZipFile())
        {
            zip.AlternateEncodingUsage = ZipOption.AsNecessary;
            zip.AddDirectoryByName("DynamicImage");
            foreach (GridViewRow row in GridView1.Rows)
            {
                if ((row.FindControl("chkSelect") as CheckBox).Checked)
                {
                    string filePath = (row.FindControl("lblFilePath") as Label).Text;
                    zip.AddFile(filePath, "DynamicImage");
                }
            }
            Response.Clear();
            Response.BufferOutput = false;
            string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
            Response.ContentType = "application/zip";
            Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
            zip.Save(Response.OutputStream);
            Response.End();
        }
    }
}