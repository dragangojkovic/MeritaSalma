using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Addpages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       

            FileUpload1.Attributes["onchange"] = "UploadFile(this)";
      

      

        FileUpload2.Attributes["onchange"] = "UploadFile2(this)";
       

        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {

                

                DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);


                string CategoryName = (string)dview.Table.Rows[0]["CategoryName"];
                string Icon = (string)dview.Table.Rows[0]["Icon"];
                string FrontBanner = (string)dview.Table.Rows[0]["FrontBanner"];

                TextBox1.Text = CategoryName.ToString();
             Image1.ImageUrl= Icon.ToString();
             Image2.ImageUrl = FrontBanner.ToString();


            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {





        if (Request.QueryString["ID"] == null)
        {


            SqlDataSource1.InsertParameters.Add("Icon",  Image1.ImageUrl);

            SqlDataSource1.InsertParameters.Add("FrontBanner", Image2.ImageUrl);


            SqlDataSource1.Insert();

            savediv.Visible = true;

        }
        else
        {
            SqlDataSource1.UpdateParameters.Add("Icon", Image1.ImageUrl);

            SqlDataSource1.UpdateParameters.Add("FrontBanner", Image2.ImageUrl);


            SqlDataSource1.Update();

            savediv.Visible = true;

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
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload1.SaveAs(uploadFilePath);
                    Image1.ImageUrl = "~/DynamicImage/" + uploadFileName;



                }
                catch (Exception ex)
                {
                    Label5.Text = ex.Message;
                }
            }
           
        }
      

    }


    protected void Upload2(object sender, EventArgs e)
    {
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload2.HasFile)
        {
            string ext = Path.GetExtension(FileUpload2.FileName).ToLower();
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload2.SaveAs(uploadFilePath);
                    Image2.ImageUrl = "~/DynamicImage/" + uploadFileName;



                }
                catch (Exception ex)
                {
                    Label5.Text = ex.Message;
                }
            }

        }


    }
}