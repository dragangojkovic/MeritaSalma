using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seller_BidsShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ID"] = GridView1.SelectedDataKey.Value;
        SqlDataSource1.Update();
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //If Salary is less than 10000 than set the row Background Color to Cyan  
            if (e.Row.Cells[3].Text == "Auction")
            {
                e.Row.Cells[0].Enabled = false;
                e.Row.Cells[0].ForeColor = Color.White;

                e.Row.Cells[0].Text = "";
            }
        }  
    }
}