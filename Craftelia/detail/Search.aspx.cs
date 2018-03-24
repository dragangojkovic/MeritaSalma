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

            HiddenField1.Value = Page.User.Identity.Name;


            if (Page.RouteData.Values["CID"] == null && Page.RouteData.Values["SID"] == null)
            {
                BreadCrumbSearch.Visible = true;
            }


            if(Page.RouteData.Values["CID"] != null )
            {

                BreadCrumbSearchCategory.Visible = true;
                BreadCrumbSearch.Visible = false;
            }


            if (Page.RouteData.Values["SID"] != null)
            {

                BreadCrumbSearchCategory.Visible = false;
                BreadCrumbSearch.Visible = true;
            }


          

           

            if(Page.RouteData.Values["Sort"] != null)
            {
                if (Page.RouteData.Values["Sort"].ToString() == "TopView")
                {
                    DropDownList2.SelectedValue = "V";
                }
            }
             if(Page.RouteData.Values["OfferType"] != null)
            {
                DropDownList3.DataBind();
                DropDownList3.SelectedValue = Page.RouteData.Values["OfferType"].ToString();
               
               
            }

             if (Page.RouteData.Values["Condition"] != null)
             {
                
                 CheckBoxList1.DataBind();
                 List<string> selectedValues = new List<string>();
                 string Condition = Page.RouteData.Values["Condition"].ToString();
                 foreach (ListItem items in CheckBoxList1.Items)
                 {


                     if (items.ToString().Equals(Condition.ToString()))
                     {
                         items.Selected = false;
                     }

                     else
                     {

                         items.Selected = true;
                     }

                        
                 }

                 foreach (ListItem li in CheckBoxList1.Items)
                 {
                     if (li.Selected)
                     {
                         selectedValues.Add(li.Value);

                     }
                 }
                 Label14.Text += addcomma(selectedValues);
                
               

             }

             else
             {

                 CheckBoxList1.DataBind();



                 for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                 {
                     CheckBoxList1.Items[i].Selected = true;
                 }


                 List<string> selectedValuess = new List<string>();

                 foreach (ListItem li in CheckBoxList1.Items)
                 {
                     if (li.Selected)
                     {
                         selectedValuess.Add(li.Value);

                     }
                 }
                 Label14.Text += addcomma(selectedValuess);
                


             }

             

             ListView2.DataBind();
             chckbinding();
             ListView1.DataBind();
        }
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
        //string commaDelimitedString = "";
        //List<string> CategoryIDList = new List<string>();
        ////for (int k = 0; k <= CheckBoxList1.Items.Count - 1; k++)
        ////{
        ////    if (CheckBoxList1.Items[k].Selected)
        ////    {
        ////        //The Category was "checked"; add it's CategoryID value to CategoryIDList
        ////        CategoryIDList.Add(CheckBoxList1.Items[k].Value);
        ////    }
        ////}

        ////Create a comma-delimited string from CategoryIDList
        //commaDelimitedString = Label10.Text;
        //Response.Write(commaDelimitedString);

        //////Set the parameter value
        //e.Command.Parameters["@CategoryID"].Value = commaDelimitedString;
    }
   
   
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label favstatus = ((Label)e.Item.FindControl("Label3"));
            LinkButton lnkView = ((LinkButton)e.Item.FindControl("LinkButton2"));
            Label discountoffer = ((Label)e.Item.FindControl("Label12"));
            Label percentsign = ((Label)e.Item.FindControl("Label13"));
            Label strikeprice = ((Label)e.Item.FindControl("Label11"));
            Label salestype = ((Label)e.Item.FindControl("Label5"));
            Label price = ((Label)e.Item.FindControl("Label9"));
            Label enabledeal = ((Label)e.Item.FindControl("Label15"));
            Label demotime = ((Label)e.Item.FindControl("Label16"));
            Label demotime2 = ((Label)e.Item.FindControl("Label17"));

            Label expirylabel = ((Label)e.Item.FindControl("Label19"));

            Label offerepiry = ((Label)e.Item.FindControl("Label20"));

            Label bidexpired = ((Label)e.Item.FindControl("Label21"));
            //EmailAddressLabel.Font.Italic = true;

            //if (discountoffer.Text != "0")
            //{

            //    int prices = int.Parse(price.Text)/ (1- int.Parse(discountoffer.Text)/100);

            //    //int calcper = prices / 100;

            //    int actualprice = prices;


            //    strikeprice.Text = actualprice.ToString();
            //}

         

            if (favstatus.Text != "0")
            {
                lnkView.Text = "Saved";
                lnkView.Enabled = false;
            }

            if(discountoffer.Text == "0")
            {
                strikeprice.Visible = false;
                percentsign.Visible = false;

               


            }


            if (salestype.Text == "Auction")
            {
                salestype.CssClass = "label label-info";
            }

            if (salestype.Text == "Offer-Deals" || salestype.Text == "Auction" || salestype.Text == "Tender")
            {
                salestype.CssClass = "label label-danger";

                enabledeal.Visible = true;
                expirylabel.Visible = true;
                offerepiry.Visible = true;

                if (DateTime.Parse(expirylabel.Text) < DateTime.Now)
                {

                    bidexpired.Visible = true;
                }
            }
            if(enabledeal.Text== "Demo")
            {

                demotime.Visible = true;
                demotime2.Visible = true;

                if(price.Text== "0")
                {

                    enabledeal.Text = "Demo";
                }

                else
                {

                    enabledeal.Text = "Leasing";
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
    protected void chckbinding()
    {
        foreach (ListViewItem item in ListView2.Items)
        {

            CheckBoxList chk = (CheckBoxList)item.FindControl("CheckBoxList2");
            Label categoryid = (Label)item.FindControl("Label2");

            if (Page.RouteData.Values["SID"] != null)
            {


                List<string> selectedValues = new List<string>();
                string subcategory = Page.RouteData.Values["SID"].ToString();
                foreach (ListItem items in chk.Items)
                {
                   

                    if (subcategory.Contains(items.Value))
                    {
                        items.Selected = true;
                    }
                }
                
                
            }
            if (Page.RouteData.Values["SID"] == null && Page.RouteData.Values["CID"] != null)
            {
                if (categoryid.Text == Page.RouteData.Values["CID"].ToString())
                {
                    for (int i = 0; i < chk.Items.Count; i++)
                    {
                        chk.Items[i].Selected = true;
                    }
                }
                

            }


            if (Page.RouteData.Values["SID"] == null && Page.RouteData.Values["CID"] == null)
            {
                for (int i = 0; i < chk.Items.Count; i++)
                {
                    chk.Items[i].Selected = true;
                }

            }

         
            List<string> selectedValuess = new List<string>();
        
            foreach (ListItem li in chk.Items)
            {
                if (li.Selected)
                {
                    selectedValuess.Add(li.Value);

                }
            }

            if (selectedValuess.Count > 0)
            {
                Label10.Text += addcomma(selectedValuess);

            }

        }

        ListView1.DataBind();
    }

    string schk;
    protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
    {

        ListView1.DataBind();
        Label10.Text = string.Empty;
        foreach (ListViewItem item in ListView2.Items)
        {
           
            CheckBoxList chk = (CheckBoxList)item.FindControl("CheckBoxList2");
           

            
            List<string> selectedValues = new List<string>();
        

            foreach (ListItem li in chk.Items)
            {
                if (li.Selected)
                {
                    selectedValues.Add(li.Value);
                    
                }
            }

            if (selectedValues.Count > 0)
            {
                Label10.Text += addcomma(selectedValues);
               
            }
            //Label10.Text = schk;
        }
        //ListView2.DataBind();
        ListView1.DataBind();
       
       
    }
   
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label14.Text = string.Empty;
        List<string> selectedValuess = new List<string>();

        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                selectedValuess.Add(li.Value);

            }
        }
        Label14.Text += addcomma(selectedValuess);
        ListView1.DataBind();
    }
  
}