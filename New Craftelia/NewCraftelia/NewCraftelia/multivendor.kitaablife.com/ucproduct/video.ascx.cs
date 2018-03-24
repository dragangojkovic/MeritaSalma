using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucproduct_video : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        FileUpload1.Attributes["onchange"] = "UploadFile(this)";
         
          if (!IsPostBack)
          {
              DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
              if (dview.Table.Rows.Count > 0)
              {
                  string video = (string)dview.Table.Rows[0]["Video"];

                  Label1.Text = video.ToString();
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
        if (FileUpload1.HasFile)
        {
             float bytesSize = FileUpload1.PostedFile.ContentLength;
            float sizeLimit = 3072 * 3072;
            if (bytesSize < sizeLimit)
            {
                string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
                if (ext == ".MP4" || ext == ".mp4")
                {
                    uploadFileName = Guid.NewGuid().ToString() + ext;
                    uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                    try
                    {
                        FileUpload1.SaveAs(uploadFilePath);
                        Label3.Text = "~/DynamicImage/" + uploadFileName;
                        Label4.Text = "Video Uploaded Successfully";

                      Label1.Text = Label3.Text.ToString().Replace('~',' ');
                    }
                    catch (Exception ex)
                    {
                        Label3.Text = ex.Message;
                    }
                }
            }
            else
            {
                Label3.Text = "Max 1 MB Video is allowed";
            }

        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateParameters.Add("Video", Label3.Text);
        SqlDataSource1.UpdateParameters.Add("ProductKey", Request.QueryString["ID"].ToString());
        SqlDataSource1.Update();


        Response.Redirect("~/Seller/addproductstep4.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
}