using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucvendor_otherdetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HiddenField1.Value = Page.User.Identity.Name;

            if (HiddenField1.Value != "")
            {
                DataView dview = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);

                if (dview.Table.Rows.Count > 0)
                {
                    string DeliveryId = (string)dview.Table.Rows[0]["DeliveryID"];
                    string PaymentId = (string)dview.Table.Rows[0]["PaymentID"];

                    CheckBoxList1.DataBind();
                    CheckBoxList2.DataBind();

                    foreach (ListItem item in CheckBoxList1.Items)
                    {
                        item.Selected = DeliveryId.Split(',').Contains(item.Value);
                    }


                    foreach (ListItem item in CheckBoxList2.Items)
                    {
                        item.Selected = PaymentId.Split(',').Contains(item.Value);
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

        List<string> selectedValues = new List<string>();

        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                selectedValues.Add(li.Value);
            }
        }
        string DeliveryId = addcomma(selectedValues);


        List<string> selectedValuess = new List<string>();

        foreach (ListItem lii in CheckBoxList2.Items)
        {
            if (lii.Selected)
            {
                selectedValuess.Add(lii.Value);
            }
        }
        string PaymentID = addcomma(selectedValuess);


        SqlDataSource7.UpdateParameters.Add("DeliveryId", DeliveryId);
        SqlDataSource7.UpdateParameters.Add("PaymentID", PaymentID);


        SqlDataSource7.Update();

        savediv.Visible = true;
    }
}