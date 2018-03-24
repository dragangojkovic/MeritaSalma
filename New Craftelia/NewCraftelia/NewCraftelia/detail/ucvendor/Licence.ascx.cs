using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucvendor_Identificationdetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //FileUpload1.Attributes["onchange"] = "UploadFile(this)";
        //FileUpload2.Attributes["onchange"] = "UploadFile2(this)";
        //FileUpload3.Attributes["onchange"] = "UploadFile3(this)";
        //FileUpload4.Attributes["onchange"] = "UploadFile4(this)";


        if (!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;
            if (HiddenField1.Value != "")
            {

                DataView dview = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);

                if (dview.Table.Rows.Count > 0)
                {
                  
                    string License = (string)dview.Table.Rows[0]["License"];

                    string LicenseFile = (string)dview.Table.Rows[0]["LicenseFile"];




                  
                    TextBox2.Text = License.ToString();
                  


                    if (Label23.Text == "NA")
                    {
                        LinkButton2.Enabled = false;
                        LinkButton2.ToolTip = "You have not uploaded the file as yet";
                    }


                  
                }
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

       
        Upload2();
       
        SqlDataSource7.UpdateParameters.Add("LicenseFile", Label23.Text);
      
        SqlDataSource7.Update();
    }




  


    protected void Upload2()
    {
        //if (GridView1.Rows.Count > 0)
        //{
        //    Label7.Visible = true;
        //}

        // Upload Original Image Here
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload2.HasFile)
        {
            string ext = Path.GetExtension(FileUpload2.FileName).ToLower();
            if (ext == ".pdf" || ext == ".PDF" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload2.SaveAs(uploadFilePath);
                    Label23.Text = "~/DynamicImage/" + uploadFileName;



                }
                catch (Exception ex)
                {
                    Label21.Text = ex.Message;
                }
            }

        }


    }

    protected void Upload3()
    {
        //if (GridView1.Rows.Count > 0)
        //{
        //    Label7.Visible = true;
        //}

        // Upload Original Image Here
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload3.HasFile)
        {
            string ext = Path.GetExtension(FileUpload3.FileName).ToLower();
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload3.SaveAs(uploadFilePath);
                    Label24.Text = "~/DynamicImage/" + uploadFileName;



                }
                catch (Exception ex)
                {
                    Label21.Text = ex.Message;
                }
            }

        }


    }

    protected void Upload4()
    {
        //if (GridView1.Rows.Count > 0)
        //{
        //    Label7.Visible = true;
        //}

        // Upload Original Image Here
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload4.HasFile)
        {
            string ext = Path.GetExtension(FileUpload4.FileName).ToLower();
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload4.SaveAs(uploadFilePath);
                    Label25.Text = "~/DynamicImage/" + uploadFileName;



                }
                catch (Exception ex)
                {
                    Label21.Text = ex.Message;
                }
            }

        }


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(Label22.Text);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect(Label23.Text);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect(Label24.Text);
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect(Label25.Text);
    }
}