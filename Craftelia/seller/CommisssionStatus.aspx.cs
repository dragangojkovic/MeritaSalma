using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seller_CommisssionStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label salesamount = ((Label)e.Item.FindControl("Label4"));
            Label salescomiper = ((Label)e.Item.FindControl("Label5"));
            Label comamount = ((Label)e.Item.FindControl("Label6"));

            Label comstatus = ((Label)e.Item.FindControl("Label7"));

            LinkButton actionstatus = ((LinkButton)e.Item.FindControl("LinkButton1"));



            decimal per = decimal.Parse(salesamount.Text) * decimal.Parse(salescomiper.Text);
            decimal comd = per / 100;

         

                comamount.Text = comd.ToString();
          
            



        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string orderno = ((Label)e.Item.FindControl("Label1")).Text;
        string commissionamount = ((Label)e.Item.FindControl("Label6")).Text;
        if (e.CommandName == "received")
        {

            SqlDataSource2.UpdateParameters.Add("Commissionreceived", commissionamount);
            SqlDataSource2.UpdateParameters.Add("OrderNo", orderno);

            SqlDataSource2.Update();

        }
    }
}