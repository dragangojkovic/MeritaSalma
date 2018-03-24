using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Data;


public partial class Account_ConfirmEmail : System.Web.UI.Page
{

    DataView dview;
    string SMTP ;
    string BCC ;
    string EmailFrom ;
    string Password ;
    int Ports;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
   
                   

                    //SqlDataSource3.Insert();

                   dview = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);

                   SMTP = (string)dview.Table.Rows[0]["SMTP"];
                   BCC = (string)dview.Table.Rows[0]["BCC"];
                   EmailFrom = (string)dview.Table.Rows[0]["EmailFrom"];
                   Password = (string)dview.Table.Rows[0]["Password"];
                   //Ports = (int)dview.Table.Rows[0]["Port"];

                   string host = HttpContext.Current.Request.Url.Host;
                   // localhost
                   MailMessage mail = new MailMessage();
                   SmtpClient SmtpServer = new SmtpClient(SMTP.ToString());
                   mail.From = new MailAddress(EmailFrom.ToString());
                   //Email acpe = new Email();
                   mail.To.Add(Page.User.Identity.Name);
                   mail.Bcc.Add(BCC.ToString());

                   StreamReader reader = new StreamReader(Server.MapPath("~/email/Registrationemail.html"));
                   string readFile = reader.ReadToEnd();
                   string myString = "";
                   myString = readFile;
                   //string name = HttpUtility.UrlEncode(Encrypt(Session["UserName"].ToString().Trim()));
                   //string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));

                   myString = myString.Replace("{#UserName}", Page.User.Identity.Name);
                   myString = myString.Replace("{#Password}", Session["Password"].ToString());


                   mail.Subject = "Welcome" + host.ToString() + " " + DateTime.Now.ToString("dd/MMM/yyyy hh:mm:ss tt");
                   mail.IsBodyHtml = true;
                   mail.Body = myString.ToString();
                   SmtpServer.Port = 25;
                   SmtpServer.Credentials = new System.Net.NetworkCredential(EmailFrom.ToString(), Password.ToString());
                   SmtpServer.EnableSsl = false;
                   object userState = mail;
                   SmtpServer.SendCompleted += new SendCompletedEventHandler(SMTPClientForAsy.SmtpClient_OnCompleted);
                   SmtpServer.SendAsync(mail, userState);

                   message.Visible = true;
                

       




        }

    }




       


   
   
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        if( Session["Type"] != "Buyer")
        {
            Response.Redirect("~/Seller/Profile.aspx");
        }

        else
        {

            Response.Redirect("~/Default.aspx");
        }
    }
}