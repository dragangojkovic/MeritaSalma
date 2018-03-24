using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucproduct_productfeature : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUpload1.Attributes["onchange"] = "UploadFile(this)";

        HiddenField1.Value = Page.User.Identity.Name;
        if (!IsPostBack)
        {

            if (Request.QueryString["ID"] == null)
            {
                Random rand = new Random(100);
                int ccc = rand.Next(000000000, 999999999);

                var bytes = new byte[4];
                var rng = RandomNumberGenerator.Create();
                rng.GetBytes(bytes);
                uint random = BitConverter.ToUInt32(bytes, 0) % 100000000;


                Label1.Text = String.Format("{0:D8}", random) + DateTime.Now.ToString("ddMMyyyyhhmmss");
            }

            else
            {
                Label1.Text = Request.QueryString["ID"].ToString();
                DataView dview = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);


                if (dview.Table.Rows.Count > 0)
                {
                    string ProductKey = (string)dview.Table.Rows[0]["ProductKey"];
                    string CoverImage = (string)dview.Table.Rows[0]["CoverImage"];
                    string ProductName = (string)dview.Table.Rows[0]["ProductName"];

                    int SizeId = (int)dview.Table.Rows[0]["SizeId"];
                    int CategoryId = (int)dview.Table.Rows[0]["CategoryId"];
                    int SubCategoryId = (int)dview.Table.Rows[0]["SubCategoryId"];
                    int SaleTypeId = (int)dview.Table.Rows[0]["SaleTypeId"];

                    DateTime StartDate = (DateTime)dview.Table.Rows[0]["StartDate"];
                    DateTime ExpiryDate = (DateTime)dview.Table.Rows[0]["ExpiryDate"];

                    string Currency = (string)dview.Table.Rows[0]["Currency"];

                    int AvailableQuantity = (int)dview.Table.Rows[0]["AvailableQuantity"];

                    decimal Price = (decimal)dview.Table.Rows[0]["Price"];

                    int WarrantyId = (int)dview.Table.Rows[0]["WarrantyId"];
                    int ConditionId = (int)dview.Table.Rows[0]["ConditionId"];

                    string Brand = (string)dview.Table.Rows[0]["Brand"];
                    string CountryofOrigin = (string)dview.Table.Rows[0]["CountryofOrigin"];
                    string Model = (string)dview.Table.Rows[0]["Model"];
                    string Serial = (string)dview.Table.Rows[0]["Serial"];
                    string Certificate = (string)dview.Table.Rows[0]["Certificate"];

                    int DeliveryId = (int)dview.Table.Rows[0]["DeliveryId"];

                    string Description = (string)dview.Table.Rows[0]["Description"];

                    string Feature = (string)dview.Table.Rows[0]["Feature"];
                    
                    int discountoffer = (int)dview.Table.Rows[0]["discountoffer"];

                    decimal ActualPrice = (decimal)dview.Table.Rows[0]["ActualPrice"];
                    DateTime offerexpiry = (DateTime)dview.Table.Rows[0]["offerexpiry"];

                      int wholesaleqty = (int)dview.Table.Rows[0]["wholesaleqty"];

                      int wholesaleprice = (int)dview.Table.Rows[0]["wholesaleprice"];
                      string offerdealtype = (string)dview.Table.Rows[0]["offerdealtype"];
                      string demotime = (string)dview.Table.Rows[0]["demotime"];

                    

                    Label7.Text = ActualPrice.ToString();
                    Label1.Text = ProductKey.ToString();
                    Image1.ImageUrl = CoverImage.ToString();
                    TextBox1.Text = ProductName.ToString();
                    DropDownList1.SelectedValue = SizeId.ToString();
                    DropDownList2.SelectedValue = CategoryId.ToString();
                    DropDownList3.SelectedValue = SubCategoryId.ToString();
                    TextBox2.Text = StartDate.ToString();
                    TextBox3.Text = ExpiryDate.ToString();
                    DropDownList8.SelectedValue = Currency.ToString();
                    TextBox5.Text = AvailableQuantity.ToString();
                    TextBox4.Text = Price.ToString();
                   
                    DropDownList5.SelectedValue = ConditionId.ToString();

                    TextBox6.Text = Brand.ToString();
                    TextBox7.Text = CountryofOrigin.ToString();
                    TextBox8.Text = Model.ToString();
                    TextBox9.Text = Serial.ToString();
                    TextBox10.Text = Certificate.ToString();

                    DropDownList6.SelectedValue = ConditionId.ToString();
                    DropDownList7.SelectedValue = DeliveryId.ToString();

                    TextBox12.Text = Description.ToString();
                    TextBox13.Text = Feature.ToString();

                    TextBox14.Text = discountoffer.ToString();

                    DropDownList4.DataBind();
                    DropDownList4.SelectedValue = SaleTypeId.ToString();
                    TextBox11.Text = offerexpiry.ToString();
                    TextBox15.Text = wholesaleqty.ToString();
                    TextBox16.Text = wholesaleprice.ToString();
                    RadioButtonList1.SelectedValue = offerdealtype.ToString();
                    TextBox17.Text = demotime.ToString();

                    salestype();

                    if(RadioButtonList1.SelectedValue == "Demo")
                    {
                        demo.Visible = true;
                    }
                }


            }
        }
    }


    protected void Upload(object sender, EventArgs e)
    {
        //if (GridView1.Rows.Count > 0)
        //{
        //    Label7.Visible = true;
        //}

        // Upload Original Image Here
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload1.HasFile)
        {
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {

                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);

                //if (height != 600 && width != 560)
                //{
                //    Label2.Visible = true;
                //    Label2.Text =  "Image dimension should be height = 600 && width = 560";

                //}

                //else
                //{
                    uploadFileName = Guid.NewGuid().ToString() + ext;
                    uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                    try
                    {
                        FileUpload1.SaveAs(uploadFilePath);
                        Image1.ImageUrl = "~/DynamicImage/" + uploadFileName;



                    }
                    catch (Exception ex)
                    {
                        Label2.Text = ex.Message;
                    }
                //}
            }

            else
            {
                Label2.Text = "Only .jpg allowed";

            }

        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        

        if (Image1.ImageUrl == "~/DynamicImage/NoImage.jpg" || TextBox12.Text == string.Empty || TextBox13.Text == String.Empty)
        {

            if (Image1.ImageUrl == "~/DynamicImage/NoImage.jpg")
            {
                Label2.Visible = true;
                Label2.Text = "Cover Image is required. Image dimension should be height = 600 && width = 560";
            }

            if (TextBox12.Text == string.Empty)
            {
                Label3.Visible = true;
                Label3.Text = "Description is required";
            }

            if (TextBox13.Text == string.Empty)
            {
                Label4.Visible = true;
                Label4.Text = "Feature is required";
            }
           
           
          
        }
        else
        {
            DateTime startDate = Convert.ToDateTime(TextBox2.Text.Trim());
            DateTime endDate = Convert.ToDateTime(TextBox3.Text.Trim());
            if (startDate < endDate)
            {
                try
                {
                    Session["Save"] = "Save";
                    if (Request.QueryString["ID"] == null || Session["Save"] == null)
                    {
                        SqlDataSource8.InsertParameters.Add("CoverImage", Image1.ImageUrl);
                        SqlDataSource8.Insert();
                    }

                    else
                    {

                        SqlDataSource8.UpdateParameters.Add("CoverImage", Image1.ImageUrl);
                        SqlDataSource8.Update();
                    }

                    if (DropDownList4.SelectedItem.Text == "Auction" ||  DropDownList4.SelectedItem.Text == "Tender")
                    {
                        Response.Redirect("~/Seller/addproductstep5.aspx?ID=" + Label1.Text);
                    }

                    else
                    {

                        Response.Redirect("~/Seller/addproductstep2.aspx?ID=" + Label1.Text);
                    }

                }
                catch (Exception)
                {
                    SqlDataSource8.UpdateParameters.Add("CoverImage", Image1.ImageUrl);
                    SqlDataSource8.Update();

                    if (DropDownList4.SelectedItem.Text == "Auction" || DropDownList4.SelectedItem.Text == "Tender")
                    {
                        Response.Redirect("~/Seller/addproductstep5.aspx?ID=" + Label1.Text);
                    }

                    else
                    {

                        Response.Redirect("~/Seller/addproductstep2.aspx?ID=" + Label1.Text);
                    }
                }
            }

            else
            {
               Label23.Text = "Expiry should be Greater than Start date";
            }
           
        }
        
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        DropDownList3.DataBind();
    }

    protected void sum()
    {
        if (TextBox4.Text != string.Empty && TextBox14.Text != string.Empty)
        {

            Label7.Text = TextBox4.Text;
            int per = int.Parse(TextBox4.Text) * int.Parse(TextBox14.Text)/100;
            int bal = int.Parse(TextBox4.Text) - per;

            TextBox4.Text = bal.ToString();
        }
    }

    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        salestype();
    }
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {
        sum();
    }
    protected void TextBox14_TextChanged(object sender, EventArgs e)
    {
        sum();
    }

    protected void salestype()
    {
        if (DropDownList4.SelectedItem.Text == "Offer-Deals")
        {
            Label6.Visible = true;
            Label6.Text = "Offer/Deal selected as Sales Type. Please add Discount offer in %. It will deduct from your actual product price and will be displaly on website. If you want to sale it on actual price please select other Sales Type.";
            discount.Visible = true;




        }

        else
        {



            Label6.Visible = false;
            discount.Visible = false;
            TextBox14.Text = "0";



        }


        if (DropDownList4.SelectedItem.Text == "Auction" || DropDownList4.SelectedItem.Text == "Tender")
        {
            Label24.Text = "Bid Start Price";
        }

        else
        {

            Label24.Text = "Price";
        }



        if (DropDownList4.SelectedItem.Text == "Wholesale")
        {
            Label6.Visible = true;
            Label6.Text = "Wholesale selected as Sales Type. Please add Wholesale Quantity and Wholesale Price. If you want to sale it on actual price please select other Sales Type.";
            wholesale.Visible = true;




        }

        else
        {



            Label6.Visible = false;
            wholesale.Visible = false;
            TextBox15.Text = "0";
            TextBox16.Text = "0";



        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Discount")
        {

            Label25.Text = "Discount Offer";
        }

        if (RadioButtonList1.SelectedValue == "Clearance")
        {

            Label25.Text = "Clearance Offer";
        }


        if (RadioButtonList1.SelectedValue == "Demo")
        {
            demo.Visible = true;
            Label25.Text = "Demo Leasing Price Discount";
        }
    }
}