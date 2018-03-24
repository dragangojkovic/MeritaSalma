using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_SellerDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;

        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string Status = ((RadioButtonList)e.Item.FindControl("RadioButtonList1")).SelectedValue;
        string Description = ((TextBox)e.Item.FindControl("TextBox1")).Text;


        //string ID = ((Label)e.Item.FindControl("Label22")).Text;
        //string License = ((Label)e.Item.FindControl("Label25")).Text;
        //string Permission = ((Label)e.Item.FindControl("Label26")).Text;
        //string Reg = ((Label)e.Item.FindControl("Label27")).Text;


        if (e.CommandName == "Update")
        {

            SqlDataSource1.UpdateParameters.Add("Description", Description);
            SqlDataSource1.UpdateParameters.Add("Approval", Status);
            SqlDataSource1.Update();
            savediv.Visible = true;
            
        }


        if (e.CommandName == "ID")
        {

            Response.Redirect(ID);
        }


        //if (e.CommandName == "License")
        //{
        //    Response.Redirect(License);
        //}

        //if (e.CommandName == "Permission")
        //{
        //    Response.Redirect(Permission);
        //}

        //if (e.CommandName == "Reg")
        //{
        //    Response.Redirect(Reg);
        //}

        //if (e.CommandName == "contact")
        //{
        //    if (Page.User.Identity.Name == "")
        //    {
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        //    }

        //    else
        //    {
        //        Session["username"] = username;
        //        Response.RedirectToRoute("contact", new { username = pid});
        //    }
        //}
    }
    
}