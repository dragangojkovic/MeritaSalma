using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucvendor_vendor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUpload11.Attributes["onchange"] = "UploadFile(this)";

        if (!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;
            if (HiddenField1.Value != "")
            {

                DataView dview = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);

                if (dview.Table.Rows.Count > 0)
                {
                    string VendorName = (string)dview.Table.Rows[0]["VendorName"];
                    string VendorLogo = (string)dview.Table.Rows[0]["VendorLogo"];



                    TextBox1.Text = VendorName.ToString();
                    Image111.ImageUrl = VendorLogo.ToString();



                }
            }
        }
    }


    protected void Upload(object sender, EventArgs e)
    {
        //if (GridView1.Rows.Count > 0)
        //{
        //    Label7.Visible = true;
        //}

        // Upload Original Image Here
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload11.HasFile)
        {
            string ext = Path.GetExtension(FileUpload11.FileName).ToLower();
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload11.SaveAs(uploadFilePath);
                    Image111.ImageUrl = "~/DynamicImage/" + uploadFileName;



                }
                catch (Exception ex)
                {
                    Label28.Text = ex.Message;
                }
            }

        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlDataSource5.UpdateParameters.Add("VendorLogo", Image111.ImageUrl);
        SqlDataSource5.Update();
        savediv.Visible = true;
    }
}