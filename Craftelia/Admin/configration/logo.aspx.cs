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

        FU1.Attributes["onchange"] = "UploadFile(this)";
        if (!IsPostBack)
        {

            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            string img = (string)dview.Table.Rows[0]["Logo"];
            int width = (int)dview.Table.Rows[0]["logowidth"];
            int height = (int)dview.Table.Rows[0]["logoheight"];
            string companyname = (string)dview.Table.Rows[0]["companyname"];
            string address = (string)dview.Table.Rows[0]["address"];
            string supportcontact = (string)dview.Table.Rows[0]["supportcontact"];
            Image2.ImageUrl = img.ToString();
            TextBox1.Text = width.ToString();
            TextBox2.Text = height.ToString();

            TextBox3.Text = companyname.ToString();

            TextBox4.Text = address.ToString();

            TextBox5.Text = supportcontact.ToString();


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {


        SqlDataSource1.UpdateParameters.Add("Image", Image2.ImageUrl);
        SqlDataSource1.Update();
                       

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
        if (FU1.HasFile)
        {
            string ext = Path.GetExtension(FU1.FileName).ToLower();
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FU1.SaveAs(uploadFilePath);
                    Image2.ImageUrl = "~/DynamicImage/" + uploadFileName;



                }
                catch (Exception ex)
                {
                    //lblMsg.Text = ex.Message;
                }
            }
            else
            {
                //lblMsg.Text = "Selected file type not allowed!";
            }
        }
        else
        {
            //lblMsg.Text = "Save Successfully";
        }

    }
}