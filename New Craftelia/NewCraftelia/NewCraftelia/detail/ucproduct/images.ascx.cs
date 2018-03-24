using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucproduct_images : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUpload1.Attributes["onchange"] = "UploadFile(this)";
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
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload1.SaveAs(uploadFilePath);


                    SqlDataSource1.InsertParameters.Add("Images", "~/DynamicImage/" + uploadFileName);
                    SqlDataSource1.InsertParameters.Add("ProductKey", Request.QueryString["ID"].ToString());
                    SqlDataSource1.Insert();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Label4.Text = ex.Message;
                }
            }

        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {



        Response.Redirect("~/Seller/ProductConfirmation" );
    }
}