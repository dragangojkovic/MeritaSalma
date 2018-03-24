using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucvendor_accountdetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;


            if (HiddenField1.Value != "")
            {

                DataView dview = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);


                if (dview.Table.Rows.Count > 0)
                {

                  
                    int ProfileTypeId = (int)dview.Table.Rows[0]["ProfileTypeId"];
                    int ProfileCategoryID = (int)dview.Table.Rows[0]["ProfileCategoryID"];
                    int ProfileSpecialityID = (int)dview.Table.Rows[0]["ProfileSpecialityID"];
                    string ProfileSubSpecialityID = (string)dview.Table.Rows[0]["ProfileSubSpecialityID"];
                    string tagline = (string)dview.Table.Rows[0]["tagline"];


                    DropDownList1.SelectedValue = ProfileTypeId.ToString();
                    DropDownList2.SelectedValue = ProfileCategoryID.ToString();
                    DropDownList3.SelectedValue = ProfileSpecialityID.ToString();
                    TextBox1.Text = tagline.ToString();

                    Label3.Text = ProfileSubSpecialityID.ToString().Replace(",", "<br/>");  

                 
                    CheckBoxList1.DataBind();
                    foreach (ListItem item in CheckBoxList1.Items)
                    {
                        item.Selected = ProfileSubSpecialityID.Split(',').Contains(item.Value);
                    }
                }

            }
        }

    }
    protected string addcomma(List<string> stuff)
    {
        string s = "";
        foreach (string i in stuff)
        {
            s += i;
            s += ',';
        }
        return s;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int c = 0;

        List<string> selectedValues = new List<string>();

        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                selectedValues.Add(li.Value);
            }
        }
        string speciality = addcomma(selectedValues);


        int a = speciality.Split(',').Length - 1;

        if (a > 5)
        {
            Label7.Text = "You can only select upto 5 speciality.";
        }
      
           
       
        else
        {
            SqlDataSource5.UpdateParameters.Add("ProfileSubSpecialityID", speciality);
            SqlDataSource5.Update();
            Label7.Text = "";

            savediv.Visible = true;
        }
        
        
    }
}