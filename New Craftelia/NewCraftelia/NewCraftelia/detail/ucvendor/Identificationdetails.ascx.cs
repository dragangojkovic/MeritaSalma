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
                    string License = (string)dview.Table.Rows[0]["License"];

                    string LicenseFile = (string)dview.Table.Rows[0]["LicenseFile"];

                    string Permission = (string)dview.Table.Rows[0]["Permission"];

                    string PermissionFile = (string)dview.Table.Rows[0]["PermissionFile"];

                    string Reg = (string)dview.Table.Rows[0]["Reg"];
                    string RegFile = (string)dview.Table.Rows[0]["RegFile"];



                    TextBox1.Text = ID.ToString();
                    TextBox2.Text = License.ToString();
                    TextBox3.Text = Permission.ToString();
                    TextBox4.Text = Reg.ToString();

                    Label22.Text = IDFile.ToString();
                    Label23.Text = LicenseFile.ToString();

                    Label24.Text = PermissionFile.ToString();

                    Label25.Text = RegFile.ToString();



                    if(Label22.Text == "NA")
                    {

                        RequiredFieldValidator12.Enabled = true;
                        LinkButton1.Enabled = false;
                        LinkButton1.ToolTip = "You have not uploaded the file as yet";
                       
                    }


                    if (Label23.Text == "NA")
                    {
                        RequiredFieldValidator22.Enabled = true;
                        LinkButton2.Enabled = false;
                        LinkButton2.ToolTip = "You have not uploaded the file as yet";
                      
                    }


                    if (Label24.Text == "NA")
                    {
                        RequiredFieldValidator23.Enabled = true;
                        LinkButton3.Enabled = false;
                        LinkButton3.ToolTip = "You have not uploaded the file as yet";
                       
                    }


                    if (Label25.Text == "NA")
                    {
                        RequiredFieldValidator24.Enabled = true;
                        LinkButton4.Enabled = false;
                        LinkButton4.ToolTip = "You have not uploaded the file as yet";
                        
                    }

                }
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Upload();
        Upload2();
        Upload3();
        Upload4();
        SqlDataSource7.UpdateParameters.Add("IDFile", Label22.Text);
        SqlDataSource7.UpdateParameters.Add("LicenseFile", Label23.Text);
        SqlDataSource7.UpdateParameters.Add("PermissionFile", Label24.Text);
        SqlDataSource7.UpdateParameters.Add("RegFile", Label25.Text);
        SqlDataSource7.Update();

        savediv.Visible = true;
    }




    protected void Upload()
    {
        //if (GridView1.Rows.Count > 0)
        //{
        //    Label7.Visible = true;
        //}

        // Upload Original Image Here

        if (FileUpload1.HasFile)
        {
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
                        Label22.Text = "~/DynamicImage/" + uploadFileName;



                    }
                    catch (Exception ex)
                    {
                        Label2.Text = "ID File Not Uploaded. Only PDF Allowed";

                    }
                }

                else
                {

                    Label2.Text = "ID File Not Uploaded. Only PDF Allowed";
                }

            }
        }

    }


    protected void Upload2()
    {
        //if (GridView1.Rows.Count > 0)
        //{
        //    Label7.Visible = true;
        //}

        // Upload Original Image Here
        if (FileUpload2.HasFile)
        {
            string uploadFileName = "";
            string uploadFilePath = "";
            if (FileUpload2.HasFile)
            {
                string ext = Path.GetExtension(FileUpload2.FileName).ToLower();
                if (ext == ".pdf" || ext == ".PDF")
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
                        Label3.Text = "License File Not Uploaded. Only PDF Allowed";

                    }
                }

                else
                {

                    Label3.Text = "License File Not Uploaded. Only PDF Allowed";
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
        if (FileUpload3.HasFile)
        {
            string uploadFileName = "";
            string uploadFilePath = "";
            if (FileUpload3.HasFile)
            {
                string ext = Path.GetExtension(FileUpload3.FileName).ToLower();
                if (ext == ".pdf" || ext == ".PDF")
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
                        Label4.Text = "Persmission File Not Uploaded. Only PDF Allowed";

                    }
                }

                else
                {
                    Label4.Text = "Permission File Not Uploaded. Only PDF Allowed";

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
        if (FileUpload4.HasFile)
        {
            string uploadFileName = "";
            string uploadFilePath = "";
            if (FileUpload4.HasFile)
            {
                string ext = Path.GetExtension(FileUpload4.FileName).ToLower();
                if (ext == ".pdf" || ext == ".PDF")
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
                        Label5.Text = "Registration File Not Uploaded. Only PDF Allowed";

                    }
                }

                else
                {
                    Label5.Text = "Registration File Not Uploaded. Only PDF Allowed";

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