using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_EmailSent : System.Web.UI.UserControl
{

    DataView dview;
    string SMTP;
    string BCC;
    string EmailFrom;
    string Password;
    string Port;
    string To;
    protected void Page_Load(object sender, EventArgs e)





    {


        To = Session["ToEmail"].ToString();

        DataView EmailType = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);

        string EmailTypes = (string)EmailType.Table.Rows[0]["EmailType"];
        string Subject = (string)EmailType.Table.Rows[0]["Subject"];
        string EmailText = (string)EmailType.Table.Rows[0]["EmailText"];

        dview = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);




        SMTP = (string)dview.Table.Rows[0]["SMTP"];
        BCC = (string)dview.Table.Rows[0]["BCC"];
        EmailFrom = (string)dview.Table.Rows[0]["EmailFrom"];
        Password = (string)dview.Table.Rows[0]["Password"];
        Port = (string)dview.Table.Rows[0]["Port"];

     

        

        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient(SMTP.ToString());
        mail.From = new MailAddress(EmailFrom.ToString());
        //Email acpe = new Email();
        mail.To.Add(To.ToString());
        mail.Bcc.Add(BCC.ToString());

        //StreamReader reader = new StreamReader(Server.MapPath("~/email/DonationNotify.html"));
        //string readFile = reader.ReadToEnd();
        string myString = "";
        myString = EmailText.ToString();
        //string name = HttpUtility.UrlEncode(Encrypt(Session["UserName"].ToString().Trim()));
        //string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));

        //myString = myString.Replace("{#memberid}", name.ToString());
        //myString = myString.Replace("{#Password}", Session["Password"].ToString());


        mail.Subject = Subject.ToString() + " " + DateTime.Now.ToString("dd/MMM/yyyy hh:mm:ss tt");
        mail.IsBodyHtml = true;
        mail.Body = myString.ToString();
        SmtpServer.Port = int.Parse(Port);
        SmtpServer.Credentials = new System.Net.NetworkCredential(EmailFrom.ToString(), Password.ToString());
        SmtpServer.EnableSsl = false;
        object userState = mail;
        SmtpServer.SendCompleted += new SendCompletedEventHandler(SMTPClientForAsy.SmtpClient_OnCompleted);
        SmtpServer.SendAsync(mail, userState);
    }
}