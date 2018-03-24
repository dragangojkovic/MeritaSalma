using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Page.RouteData.Values["SID"] != null)
            {

                BreadCrumbSearchCategory.Visible = false;
            }

            else
            {

                BreadCrumbSearchCategory.Visible = true;
            }
        }
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        for (int k = 0; k <= CheckBoxList1.Items.Count - 1; k++)
        {
            if (CheckBoxList1.Items[k].Selected)
            {
                //The Category was "checked"; add it's CategoryID value to CategoryIDList
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    CheckBoxList1.Items[i].Selected = false;
                }

            }

            else
            {

                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    CheckBoxList1.Items[i].Selected = true;
                }

            }
        }
    }
   
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
       

       
    }
   

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("Label8")).Text;
        string pid = ((Label)e.Item.FindControl("Label7")).Text;
        if (e.CommandName == "Details")
        {

            Response.RedirectToRoute("ServiceDetails", new { ID = id, PID = pid });
        }

        if (e.CommandName == "favorite")
        {

            if (Page.User.Identity.Name == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }

            else
            {
                SqlDataSource4.InsertParameters.Add("UserName", Page.User.Identity.Name);
                SqlDataSource4.InsertParameters.Add("ProductId", id);

                SqlDataSource4.Insert();


                ListView1.DataBind();

            }
        }
    }
    protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        string commaDelimitedString = "";
        List<string> CategoryIDList = new List<string>();
        for (int k = 0; k <= CheckBoxList1.Items.Count - 1; k++)
        {
            if (CheckBoxList1.Items[k].Selected)
            {
                //The Category was "checked"; add it's CategoryID value to CategoryIDList
                CategoryIDList.Add(CheckBoxList1.Items[k].Value);
            }
        }

        //Create a comma-delimited string from CategoryIDList
        commaDelimitedString = string.Join(",", CategoryIDList.ToArray());
        //Response.Write(commaDelimitedString);

        ////Set the parameter value
        e.Command.Parameters["@CategoryID"].Value = commaDelimitedString;
    }
    protected void CheckBoxList1_DataBound(object sender, EventArgs e)
    {
        
            if (Page.RouteData.Values["SID"] != null)
            {
                //for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                //{
                //    CheckBoxList1.Items[i].Selected = true;
                //}

                string subcategory = Page.RouteData.Values["SID"].ToString();
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    if (subcategory.Contains(item.Value))
                    {
                        item.Selected = true;
                    }
                }
            }

            else
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    CheckBoxList1.Items[i].Selected = true;
                }

            }
        
    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}