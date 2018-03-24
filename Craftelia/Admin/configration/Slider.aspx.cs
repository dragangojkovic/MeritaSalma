using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Addpages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            //1350 500
           
                if (FileUpload1.HasFile)
                {

                    System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                    int height = img.Height;
                    int width = img.Width;
                    decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
                    //if (height != 440 && width != 880)
                    //{
                    //    lblMessage.Visible = true;
                    //    lblMessage.Text = "File size should be height = 880 & width = 440";
                    //}

                    //else
                    //{
                    FileUpload1.SaveAs(Server.MapPath("~/DynamicImage/" + Path.GetFileName(FileUpload1.FileName)));

                    SqlDataSource1.InsertParameters.Add("Image", "~/DynamicImage/" + FileUpload1.FileName);
                      
                        SqlDataSource1.Insert();
                        lblMessage.Visible = true;
                        GridView1.DataBind();
                        savediv.Visible = true;
                        
                    //}
                }
          
        }
        catch (Exception ex)
        {

            lblMessage.Visible = true;
            lblMessage.Text = "File size should be height = 900 & width = 250";
        }

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (RadioButtonList1.SelectedValue == "No")
        {

            dv.Visible = false;
            TextBox2.Text = "No";
        }

        else
        {

            dv.Visible = true;
            TextBox2.Text = string.Empty;
        }

    }
}