using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_chat : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {


        


        HiddenField1.Value = Page.User.Identity.Name;

        //Label4.Text = Page.User.Identity.Name;
        //Label22.Text = HttpContext.Current.Request.RequestContext.RouteData.Values["ChatID"].ToString();

        if (!IsPostBack &&  Session["username"] != null)
            {

                HiddenField2.Value = Session["username"].ToString();
                SqlDataSource7.Update();
                //Label4.Text = HttpContext.Current.Request.RequestContext.RouteData.Values["username"].ToString();
            }

        
            DataView dview = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);


            if (dview.Table.Rows.Count > 0)
            {
                string ChattId = (string)dview.Table.Rows[0]["ChatId"];

                Label22.Text = ChattId.ToString();
               
            }

            else
            {
                Random rand = new Random(100);
                int ccc = rand.Next(000000000, 999999999);

                var bytes = new byte[4];
                var rng = System.Security.Cryptography.RandomNumberGenerator.Create();
                rng.GetBytes(bytes);
                uint random = BitConverter.ToUInt32(bytes, 0) % 100000000;




                Label22.Text = String.Format("{0:D8}", random) + DateTime.Now.ToString("ddMMyyyyhhmmss");
            }

      
           
            
        }






    DataView dview;
    string SMTP;
    string BCC;
    string EmailFrom;
    string Password;
    int Ports;
    protected void SqlDataSource7_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        //if (HttpContext.Current.Request.RequestContext.RouteData.Values["username"] != null)
        //{

        //    string username = HttpContext.Current.Request.RequestContext.RouteData.Values["username"].ToString();
        //    Response.RedirectToRoute("Keyword", new { UserName = username });



        DataView dview2 = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
             string  username = (string)dview2.Table.Rows[0]["UserName"];

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
        mail.To.Add(username.ToString());
        mail.Bcc.Add(BCC.ToString());

        StreamReader reader = new StreamReader(Server.MapPath("~/email/chat.html"));
        string readFile = reader.ReadToEnd();
        string myString = "";
        myString = readFile;
        //string name = HttpUtility.UrlEncode(Encrypt(Session["UserName"].ToString().Trim()));
        //string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));

        //myString = myString.Replace("{#UserName}", Page.User.Identity.Name);
        //myString = myString.Replace("{#Password}", Session["Password"].ToString());


        mail.Subject = ("New Message from" + Page.User.Identity.Name);
        mail.IsBodyHtml = true;
        mail.Body = myString.ToString();
        SmtpServer.Port = 25;
        SmtpServer.Credentials = new System.Net.NetworkCredential(EmailFrom.ToString(), Password.ToString());
        SmtpServer.EnableSsl = false;
        object userState = mail;
        SmtpServer.SendCompleted += new SendCompletedEventHandler(SMTPClientForAsy.SmtpClient_OnCompleted);
        SmtpServer.SendAsync(mail, userState);


            ListView3.DataBind();
            mydiv.Visible = true;
            Label21.Text = "Message Sent";

            TextBox1.Text = string.Empty;
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource7.Insert();
    }
    protected void ListView3_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.

            Label favstatus = ((Label)e.Item.FindControl("Label3"));
        }
    }
}