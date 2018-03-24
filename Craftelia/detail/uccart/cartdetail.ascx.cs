using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uccart_cartdetail : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("Label6")).Text;
        string qty = ((TextBox)e.Item.FindControl("TextBox1")).Text;

        string amount = ((Label)e.Item.FindControl("Label4")).Text;
        
        if (e.CommandName == "delete")
        {
           

            SqlDataSource1.DeleteParameters.Add("ID", id);
            SqlDataSource1.Delete();
            ListView1.DataBind();
            ListView2.DataBind();

            Response.Redirect("~/checkout.aspx");
        }

        if (e.CommandName == "refresh")
        {

            SqlDataSource1.UpdateParameters.Add("Amount", amount);
            SqlDataSource1.UpdateParameters.Add("Quantity", qty);
            SqlDataSource1.UpdateParameters.Add("ID", id);
            SqlDataSource1.Update();
            SqlDataSource1.UpdateParameters.Clear();
            ListView1.DataBind();
            ListView2.DataBind();
           
        }

       
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            LinkButton refresh = ((LinkButton)e.Item.FindControl("LinkButton1"));
            LinkButton delete = ((LinkButton)e.Item.FindControl("LinkButton2"));
            Label SalesType = ((Label)e.Item.FindControl("Label7"));
            Label wholesaleqty = ((Label)e.Item.FindControl("Label8"));
            Label wholeprice = ((Label)e.Item.FindControl("Label9"));

               TextBox selectedqty = ((TextBox)e.Item.FindControl("TextBox1"));
              Label orderid = ((Label)e.Item.FindControl("Label6"));

              string id = ((Label)e.Item.FindControl("Label6")).Text;
              string qty = ((TextBox)e.Item.FindControl("TextBox1")).Text;

              string amount = ((Label)e.Item.FindControl("Label4")).Text;

              Label ActualPrice = ((Label)e.Item.FindControl("Label10"));

         if(Session["customer"] != null)
            {

                refresh.Visible=false;
                delete.Visible=false;
            }

         if (SalesType.Text == "Wholesale")
         {

             if (int.Parse(selectedqty.Text) >= int.Parse(wholesaleqty.Text))
             {
                 amount = wholeprice.Text;


                 SqlDataSource1.UpdateParameters.Add("Amount", amount);
                 SqlDataSource1.UpdateParameters.Add("Quantity", qty);
                 SqlDataSource1.UpdateParameters.Add("ID", id);
                 SqlDataSource1.Update();
                 SqlDataSource1.UpdateParameters.Clear();
                 ListView2.DataBind();
                 ListView1.DataBind();


             }

             else
             {
                 amount = ActualPrice.Text;


                 SqlDataSource1.UpdateParameters.Add("Amount", amount);
                 SqlDataSource1.UpdateParameters.Add("Quantity", qty);
                 SqlDataSource1.UpdateParameters.Add("ID", id);
                 SqlDataSource1.Update();
                 SqlDataSource1.UpdateParameters.Clear();
                 ListView2.DataBind();
                 ListView1.DataBind();


             }

            }
                

        }
    }
}