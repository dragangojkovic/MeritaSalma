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


        string ID = ((Label)e.Item.FindControl("Label22")).Text;
        string License = ((Label)e.Item.FindControl("Label25")).Text;
        string Permission = ((Label)e.Item.FindControl("Label26")).Text;
        string Reg = ((Label)e.Item.FindControl("Label27")).Text;


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


        if (e.CommandName == "License")
        {
            Response.Redirect(License);
        }

        if (e.CommandName == "Permission")
        {
            Response.Redirect(Permission);
        }

        if (e.CommandName == "Reg")
        {
            Response.Redirect(Reg);
        }

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
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            string ID = ((Label)e.Item.FindControl("Label22")).Text;
            string License = ((Label)e.Item.FindControl("Label25")).Text;
            string Permission = ((Label)e.Item.FindControl("Label26")).Text;
            string Reg = ((Label)e.Item.FindControl("Label27")).Text;

            LinkButton LID = ((LinkButton)e.Item.FindControl("LinkButton1"));
            LinkButton LLicense = ((LinkButton)e.Item.FindControl("LinkButton2"));
            LinkButton LPermission = ((LinkButton)e.Item.FindControl("LinkButton3"));
            LinkButton LReg = ((LinkButton)e.Item.FindControl("LinkButton4"));


            if(ID == "NA")
            {

                LID.Enabled = false;
                LID.ToolTip = "PDF has not uplaoded as yet";
                LID.Text = "PDF Not Uploaded Yet";
                LID.ForeColor = System.Drawing.Color.Red;
            }

            if (License == "NA")
            {

                LLicense.Enabled = false;
                LLicense.ToolTip = "PDF has not uplaoded as yet";

                LLicense.Text = "PDF Not Uploaded Yet";
                LLicense.ForeColor = System.Drawing.Color.Red;
            }

            if (Permission == "NA")
            {

                LPermission.Enabled = false;
                LPermission.ToolTip = "PDF has not uplaoded as yet";

                LPermission.Text = "PDF Not Uploaded Yet";
                LPermission.ForeColor = System.Drawing.Color.Red;
            }

            if (Reg == "NA")
            {

                LReg.Enabled = false;
                LReg.ToolTip = "PDF has not uplaoded as yet";

                LReg.Text = "PDF Not Uploaded Yet";
                LReg.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}