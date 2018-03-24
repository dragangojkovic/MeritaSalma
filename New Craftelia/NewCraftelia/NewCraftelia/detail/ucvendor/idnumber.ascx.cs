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
                    string ID = (string)dview.Table.Rows[0]["ID"];
                    string IDFile = (string)dview.Table.Rows[0]["IDFile"];
                  



                    TextBox1.Text = ID.ToString();
                  



                    if(Label22.Text == "NA")
                    {
                        LinkButton1.Enabled = false;
                        LinkButton1.ToolTip = "You have not uploaded the file as yet";
                    }



                }
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Upload();
       
        SqlDataSource7.UpdateParameters.Add("IDFile", Label22.Text);
      
        SqlDataSource7.Update();
    }




    protected void Upload()
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
            if (ext == ".pdf" || ext == ".PDF" )
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload1.SaveAs(uploadFilePath);
                    Label22.Text = "~/DynamicImage/" + uploadFileName;



                }
                catch (Exception ex)
                {
                    Label22.Text = ex.Message;
                }
            }

        }


    }


   
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(Label22.Text);
    }
   
}