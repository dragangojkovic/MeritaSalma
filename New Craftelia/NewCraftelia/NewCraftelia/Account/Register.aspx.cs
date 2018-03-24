using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using alibabu;
using System.Net;
using Newtonsoft.Json;
using System.Text;
using System.Activities;
using System.Web.Script.Serialization;

public partial class Account_Register : Page
{
    string postcode;
    protected void CreateUser_Click(object sender, EventArgs e)
    {
       
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            Session["UserName"] = UserName.Text;
            Session["Password"] = Password.Text;
            Session["Type"] = RadioButtonList1.SelectedValue;

            try
            {

                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                ServicePointManager.DefaultConnectionLimit = 9999;

                var apiKey = "40ec1c94906389ccd7ec7e3a2781b00e-us17";
                var listId = "6c3f7acdc5";
                var email = UserName.Text;

                using (var wc = new System.Net.WebClient())
                {
                    // Data to be posted to add email address to list
                    var data = new { email_address = email, status = "subscribed" };

                    // Serialize to JSON using Json.Net
                    var json = JsonConvert.SerializeObject(data);

                    // Base URL to MailChimp API
                    string apiUrl = "https://us17.api.mailchimp.com/3.0/";

                    // Construct URL to API endpoint being used
                    var url = string.Concat(apiUrl, "lists/", listId, "/members");

                    // Set content type
                    wc.Headers.Add("Content-Type", "application/json");

                    // Generate authorization header
                    string credentials = Convert.ToBase64String(Encoding.ASCII.GetBytes(":" + apiKey));

                    // Set authorization header
                    wc.Headers[HttpRequestHeader.Authorization] = string.Format("Basic {0}", credentials);

                    // Post and get JSON response
                    //string result = wc.UploadString(url, json);


                    string myresult = wc.UploadString(url, json);
                    string ipAddress;
                    ipAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                    if (ipAddress == "" || ipAddress == null)
                        ipAddress = Request.ServerVariables["REMOTE_ADDR"];

                  
                    string urll = string.Format("http://freegeoip.net/json/{0}", ipAddress);
                    using (WebClient client = new WebClient())
                    {
                        string jsonn = client.DownloadString(urll);
                        Location location = new Location();
                        location = new JavaScriptSerializer().Deserialize<Location>(jsonn);
                         postcode= location.Zip_Code;
                    }

                    SqlDataSource1.InsertParameters.Add("postcode", "00");
                        SqlDataSource1.InsertParameters.Add("AdminApproval", "Active");
                        SqlDataSource1.InsertParameters.Add("IP", Request.UserHostAddress.ToString());
                        SqlDataSource1.Insert();
                       
                        Response.Redirect("~/Account/ConfirmEmail.aspx");
                   

                   
                }

            }
            catch (Exception ex)
            {

                //ErrorMessage.Text = ex.Message;


                SqlDataSource1.InsertParameters.Add("postcode", "00");
                SqlDataSource1.InsertParameters.Add("AdminApproval", "Active");
                SqlDataSource1.InsertParameters.Add("IP", Request.UserHostAddress.ToString());
                SqlDataSource1.Insert();

                Response.Redirect("~/Account/ConfirmEmail.aspx");
            }

            


         
            //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }



    public class Location
    {
        public string IP { get; set; }
        public string Country_Code { get; set; }
        public string Country_Name { get; set; }
        public string Region_Code { get; set; }
        public string Region_Name { get; set; }
        public string City { get; set; }
        public string Zip_Code { get; set; }
        public string Time_Zone { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Metro_Code { get; set; }
    }
}