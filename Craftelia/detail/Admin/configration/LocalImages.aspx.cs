using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_configration_LocalImages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUpload1.Attributes["onchange"] = "UploadFile(this)";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

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
        if (FileUpload1.HasFile)
        {
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
           

                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);

                //if (height != 600 && width != 560)
                //{
                //    Label2.Visible = true;
                //    Label2.Text =  "Image dimension should be height = 600 && width = 560";

                //}

                //else
                //{
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/LocalFiles"), uploadFileName);
                try
                {
                    FileUpload1.SaveAs(uploadFilePath);

                    SqlDataSource1.InsertParameters.Add("File", "~/LocalFiles/"+ uploadFileName);
                    SqlDataSource1.Insert();


                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
                //}
            

          

        }


    }
}