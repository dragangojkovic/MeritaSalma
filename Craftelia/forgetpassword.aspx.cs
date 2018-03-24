using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgetpassword : System.Web.UI.Page
{
    DataView dview;
    string SMTP;
    string BCC;
    string EmailFrom;
    string Password;
    int Ports;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = string.Empty;
        string password = string.Empty;
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT dbo.Profile.UserName, dbo.AspNetUsers.Id FROM     dbo.Profile INNER JOIN dbo.AspNetUsers ON dbo.Profile.UserName = dbo.AspNetUsers.UserName WHERE  (dbo.Profile.UserName = @Email)"))
            {
                cmd.Parameters.AddWithValue("@Email", TextBox1.Text.Trim());
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    if (sdr.Read())
                    {
                        id = sdr["Id"].ToString();
                        //password = sdr["Password"].ToString();
                    }
                }
                con.Close();
            }
        }
        if (!string.IsNullOrEmpty(id))
        {
     


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
            mail.To.Add(TextBox1.Text);
            mail.Bcc.Add(BCC.ToString());

            StreamReader reader = new StreamReader(Server.MapPath("~/email/PasswordRecovery.html"));
            string readFile = reader.ReadToEnd();
            string myString = "";
            myString = readFile;
            myString = myString.Replace("{#memberid}", id.ToString());
            myString = myString.Replace("{#URL}", host.ToString());


            mail.Subject = "Recover Password" + " " + DateTime.Now.ToString("dd/MMM/yyyy hh:mm:ss tt");
            mail.IsBodyHtml = true;
            mail.Body = myString.ToString();
            SmtpServer.Port = 25;
            SmtpServer.Credentials = new System.Net.NetworkCredential(EmailFrom.ToString(), Password.ToString());
            SmtpServer.EnableSsl = false;
            object userState = mail;
            SmtpServer.SendCompleted += new SendCompletedEventHandler(SMTPClientForAsy.SmtpClient_OnCompleted);
            SmtpServer.SendAsync(mail, userState);


            Label1.ForeColor = Color.Green;
            Label1.Text = "Password Reset link has been sent to your email address";
        }
        else
        {
            Label1.ForeColor = Color.Red;
            Label1.Text = "This email/username address does not match our records.";
        }
    }


    //protected void SendEmail(object sender, EventArgs e)
    //{
    //    string id = string.Empty;
    //    string password = string.Empty;
    //    string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("SELECT UserName, Id FROM Users WHERE UserName = @Email"))
    //        {
    //            cmd.Parameters.AddWithValue("@Email", TextBox1.Text.Trim());
    //            cmd.Connection = con;
    //            con.Open();
    //            using (SqlDataReader sdr = cmd.ExecuteReader())
    //            {
    //                if (sdr.Read())
    //                {
    //                    id = sdr["Id"].ToString();
    //                    password = sdr["Password"].ToString();
    //                }
    //            }
    //            con.Close();
    //        }
    //    }
    //    if (!string.IsNullOrEmpty(password))
    //    {
    //        MailMessage mail = new MailMessage();
    //        SmtpClient SmtpServer = new SmtpClient("mail.globeali.com");
    //        mail.From = new MailAddress("alert@globeali.com");
    //        //Email acpe = new Email();
    //        mail.To.Add(TextBox1.Text);
    //        //mail.Bcc.Add("imtiaz.makhani@gmail.com");

    //        StreamReader reader = new StreamReader(Server.MapPath("~/email/PasswordRecovery.html"));
    //        string readFile = reader.ReadToEnd();
    //        string myString = "";
    //        myString = readFile;
    //        //string name = HttpUtility.UrlEncode(Encrypt(Session["UserName"].ToString().Trim()));
    //        //string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));

    //        myString = myString.Replace("{#memberid}", id.ToString());
    //        //myString = myString.Replace("{#Password}", Session["Password"].ToString());


    //        mail.Subject = "Recover Password" + " " + DateTime.Now.ToString("dd/MMM/yyyy hh:mm:ss tt");
    //        mail.IsBodyHtml = true;
    //        mail.Body = myString.ToString();
    //        SmtpServer.Port = 25;
    //        SmtpServer.Credentials = new System.Net.NetworkCredential("alert@globeali.com", "Software1.");
    //        SmtpServer.EnableSsl = false;
    //        object userState = mail;
    //        SmtpServer.SendCompleted += new SendCompletedEventHandler(SMTPClientForAsy.SmtpClient_OnCompleted);
    //        SmtpServer.SendAsync(mail, userState);


    //        Label1.ForeColor = Color.Green;
    //        Label1.Text = "Password Reset link has been sent to your email address";
    //    }
    //    else
    //    {
    //        Label1.ForeColor = Color.Red;
    //        Label1.Text = "This email/username address does not match our records.";
    //    }
    //}

}