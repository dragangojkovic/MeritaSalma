using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_invoice : System.Web.UI.Page
{

    DataView dview;
    string SMTP;
    string BCC;
    string EmailFrom;
    string Password;
    int Ports;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Request.QueryString["OrderNo"] != null)
            {
                Session.Abandon();
                Label2.Text = Request.QueryString["OrderNo"].ToString();

                SqlDataSource1.Update();



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

                StreamReader reader = new StreamReader(Server.MapPath("~/email/orderreceive.html"));
                string readFile = reader.ReadToEnd();
                string myString = "";
                myString = readFile;
                //string name = HttpUtility.UrlEncode(Encrypt(Session["UserName"].ToString().Trim()));
                //string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));

                myString = myString.Replace("{#Order}", Label2.Text);
                myString = myString.Replace("{#OrderDate}", DateTime.Now.ToString());


                mail.Subject = "Order Receipt " + DateTime.Now.ToString("dd/MMM/yyyy hh:mm:ss tt");
                mail.IsBodyHtml = true;
                mail.Body = myString.ToString();
                SmtpServer.Port = 8889;
                SmtpServer.Credentials = new System.Net.NetworkCredential(EmailFrom.ToString(), Password.ToString());
                SmtpServer.EnableSsl = false;
                object userState = mail;
                SmtpServer.SendCompleted += new SendCompletedEventHandler(SMTPClientForAsy.SmtpClient_OnCompleted);
                SmtpServer.SendAsync(mail, userState);
            }


        }
    }
}