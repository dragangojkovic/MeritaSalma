using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucdetail_PostcodeCalculation : System.Web.UI.UserControl
{

    string postcode2;
    protected void Page_Load(object sender, EventArgs e)
    {
        
            HiddenField7.Value = Page.User.Identity.Name;

            calc();
        
    }


    protected void calc()
    {
        
            DataView dview = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);





            if (dview.Table.Rows.Count > 0)
            {


                decimal price = (decimal)dview.Table.Rows[0]["price"];
                string currency = (string)dview.Table.Rows[0]["currency"];
                decimal deliverycost = (decimal)dview.Table.Rows[0]["deliverycost"];
                

                Label2.Text = currency.ToString();
                Label1.Text = deliverycost.ToString();

                decimal total= price + deliverycost;
                Session["Deliverycost"] = deliverycost.ToString();

                Label6.Text = currency.ToString();
                Label7.Text = price.ToString();
                Label8.Text = currency.ToString();
                Label3.Text = total.ToString(); ;

            }




        
    }

   

    }


