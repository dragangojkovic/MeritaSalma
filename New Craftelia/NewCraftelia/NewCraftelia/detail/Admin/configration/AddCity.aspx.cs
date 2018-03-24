using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_AddCategory : System.Web.UI.Page
{
    string MakeKeyID;
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
        if (!IsPostBack)
        {

            MakeKeyID = DateTime.Now.ToString("ddMMyyyyhhmmss") + Request.UserHostAddress.ToString().Replace(".", "");

            Label1.Text = MakeKeyID.ToString();
           



        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        //string filename = Label1.Text + Path.GetFileName(FileUpload1.PostedFile.FileName);
        ////Save images into Images folder
        //FileUpload1.SaveAs(Server.MapPath("~/CategoryImage/" + filename));


        ////Getting dbconnection from web.config connectionstring
        SqlDataSource CategoryData = SqlDataSource1;
        //CategoryData.InsertParameters.Add("Icon", "~/CategoryImage/" + filename);
        CategoryData.Insert();


        
    }
    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label2.Text = "Save Successfully";
        GridView1.DataBind();
       
        TextBox1.Text = string.Empty;

        savediv.Visible = true;
    }
}