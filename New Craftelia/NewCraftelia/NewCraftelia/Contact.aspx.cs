using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{

   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string SMTP = "mail.craftelia.co.uk";
        string BCC = "imtiaz.makhani@gmail.com";
        string EmailFrom = "order@craftelia.co.uk";
        string Password = "Software@1";

       


        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient(SMTP.ToString());
        mail.From = new MailAddress(EmailFrom.ToString());
        //Email acpe = new Email();
        mail.To.Add(TextBox2.Text);
        mail.Bcc.Add(BCC.ToString());

        StreamReader reader = new StreamReader(Server.MapPath("~/email/Contact.html"));
        string readFile = reader.ReadToEnd();
        string myString = "";
        myString = readFile;
        //string name = HttpUtility.UrlEncode(Encrypt(Session["UserName"].ToString().Trim()));
        //string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));

        myString = myString.Replace("{#Name}", TextBox1.Text);
        myString = myString.Replace("{#Email}", TextBox2.Text);
        myString = myString.Replace("{#Message}", TextBox3.Text);
        //myString = myString.Replace("{#message}", TextBox4.Text);


        mail.Subject = "New Contact";
        mail.IsBodyHtml = true;
        mail.Body = myString.ToString();
        SmtpServer.Port = 25;
        SmtpServer.Credentials = new System.Net.NetworkCredential(EmailFrom.ToString(), Password.ToString());
        SmtpServer.EnableSsl = false;
        object userState = mail;
        SmtpServer.SendCompleted += new SendCompletedEventHandler(SMTPClientForAsy.SmtpClient_OnCompleted);
        SmtpServer.SendAsync(mail, userState);

        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox3.Text = string.Empty;

        Label5.Text = "Submitted Successfully";

    }
}