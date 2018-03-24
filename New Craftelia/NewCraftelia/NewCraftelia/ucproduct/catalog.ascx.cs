using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucproduct_catalog : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        FileUpload1.Attributes["onchange"] = "UploadFile(this)";


        if (!IsPostBack)
        {
            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dview.Table.Rows.Count > 0)
            {
                string catalogue = (string)dview.Table.Rows[0]["CatalogPDF"];

                Label3.Text = catalogue.ToString();
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
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (ext == ".pdf" || ext == ".PDF")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload1.SaveAs(uploadFilePath);
                   Label3.Text = "~/DynamicImage/" + uploadFileName;
                    Label2.Text= "Catalogue Uploaded Successfully";


                }
                catch (Exception ex)
                {
                    Label2.Text = ex.Message;
                }
            }

            else
            {
                Label2.Text = "Only PDF Allowed";

            }

        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateParameters.Add("PDF", Label3.Text);
        SqlDataSource1.UpdateParameters.Add("ProductKey", Request.QueryString["ID"].ToString());
        SqlDataSource1.Update();


        Response.Redirect("~/Seller/addproductstep3.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if(Label3.Text == "" || Label3.Text == "NA")
        {
            Label2.Visible = true;
         
            Label2.Text = "PDFNot Uploaded as Yet";
        }

        else
        {
            Response.Redirect(Label3.Text);
        }
    }
}