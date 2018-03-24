using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using alibabu;
using System.Net;
using Newtonsoft.Json;
using System.Text;

public partial class Account_Register : Page
{
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

                var apiKey = "18525532b34f4e2bd21a4d7b8005e43f-us15";
                var listId = "ee340c567b";
                var email = UserName.Text;

                using (var wc = new System.Net.WebClient())
                {
                    // Data to be posted to add email address to list
                    var data = new { email_address = email, status = "subscribed" };

                    // Serialize to JSON using Json.Net
                    var json = JsonConvert.SerializeObject(data);

                    // Base URL to MailChimp API
                    string apiUrl = "https://us15.api.mailchimp.com/3.0/";

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

                 

                  
                        SqlDataSource1.InsertParameters.Add("AdminApproval", "Pending");
                        SqlDataSource1.InsertParameters.Add("IP", Request.UserHostAddress.ToString());
                        SqlDataSource1.Insert();
                       
                        Response.Redirect("~/Account/ConfirmEmail.aspx");
                   

                   
                }

            }
            catch (Exception ex)
            {

                //ErrorMessage.Text = ex.Message;
             


                SqlDataSource1.InsertParameters.Add("AdminApproval", "Pending");
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
}