using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class advertform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload1.HasFile)
        {
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (ext == ".jpg" || ext == ".JPG" || ext == ".png" || ext == ".PNG")
            {

               
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload1.SaveAs(uploadFilePath);


                    SqlDataSource2.InsertParameters.Add("ZipFile", "~/DynamicImage/" + uploadFileName);
                    SqlDataSource2.Insert();

                    TextBox1.Text = string.Empty;
                    TextBox2.Text = string.Empty;
                    TextBox3.Text = string.Empty;
                    Label1.Text = "We have received your request. will contact you in 24 to 48 hours.";

                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
                //}
            }

            else
            {
                Label1.Text = "Only .zip allowed";

            }

        }
    }
}