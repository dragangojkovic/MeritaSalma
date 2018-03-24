using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_Deliver : System.Web.UI.Page
{
    DataView dview;
    string SMTP;
    string BCC;
    string EmailFrom;
    string Password;
    int Ports;
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Page.User.Identity.Name;

        if(!IsPostBack)
        {

            if(Session["Type"] !=null)
            {

                HiddenField2.Value = Session["Type"].ToString();
            }

            if(HiddenField2.Value == "Seller")
            {

                seller.Visible = true;
            }

            if (HiddenField2.Value == "Buyer")
            {

                buyer.Visible = true;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload1.HasFile)
        {
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
           
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/Delivery"), uploadFileName);
                try
                {
                    FileUpload1.SaveAs(uploadFilePath);
                    SqlDataSource23.InsertParameters.Add("Message", TextBox1.Text);
                    SqlDataSource23.InsertParameters.Add("Status", "Deliver");
                    SqlDataSource23.InsertParameters.Add("ActionStatus", "Pending");
                    SqlDataSource23.InsertParameters.Add("Type", "Seller");
                    SqlDataSource23.InsertParameters.Add("Attachment", "~/Delivery/" + FileUpload1.FileName);
                    SqlDataSource23.Insert();

                  DataView  dvieww = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                  string sellerusername = (string)dvieww.Table.Rows[0]["SellerUserName"];
                 string buyerusername = (string)dvieww.Table.Rows[0]["BuyerUserName"];

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
                    mail.To.Add(buyerusername.ToString());
                    mail.Bcc.Add(BCC.ToString());

                    StreamReader reader = new StreamReader(Server.MapPath("~/email/ordership.html"));
                    string readFile = reader.ReadToEnd();
                    string myString = "";
                    myString = readFile;
                    //string name = HttpUtility.UrlEncode(Encrypt(Session["UserName"].ToString().Trim()));
                    //string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));

                    myString = myString.Replace("{#Order}", Request.QueryString["OrderNo"].ToString());
                    myString = myString.Replace("{#OrderDate}", DateTime.Now.ToString());


                    mail.Subject = "Order Shipped " + DateTime.Now.ToString("dd/MMM/yyyy hh:mm:ss tt");
                    mail.IsBodyHtml = true;
                    mail.Body = myString.ToString();
                    SmtpServer.Port = 8889;
                    SmtpServer.Credentials = new System.Net.NetworkCredential(EmailFrom.ToString(), Password.ToString());
                    SmtpServer.EnableSsl = false;
                    object userState = mail;
                    SmtpServer.SendCompleted += new SendCompletedEventHandler(SMTPClientForAsy.SmtpClient_OnCompleted);
                    SmtpServer.SendAsync(mail, userState);











                    TextBox1.Text = string.Empty;



                }
                catch (Exception ex)
                {
                    Response.Write ( ex.Message);
                }
           
        }
        else
        {
            //lblMsg.Text = "Save Successfully";
        }

       
    }
    protected void ListView2_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            Label ActionStatus = ((Label)e.Item.FindControl("Label7"));

            Label msg = ((Label)e.Item.FindControl("Label6"));
            

            LinkButton btncontact = ((LinkButton)e.Item.FindControl("Button2"));
            LinkButton btnaccept = ((LinkButton)e.Item.FindControl("Button3"));
            LinkButton btnmodify = ((LinkButton)e.Item.FindControl("Button4"));



            LinkButton acceptcancellation = ((LinkButton)e.Item.FindControl("LinkButton3"));
            LinkButton declinecancellation = ((LinkButton)e.Item.FindControl("LinkButton5"));
            

            if (ActionStatus.Text != "Pending")
            {

                btncontact.Visible = false;
                btnaccept.Visible = false;
                btnmodify.Visible = false;

            }


            if (ActionStatus.Text == "Modification")
            {

                btncontact.Visible = false;
                btnaccept.Visible = false;
                btnmodify.Visible = false;


                msg.Text = "Modification Request";



            }


            if (ActionStatus.Text == "Cancel")
            {

                btncontact.Visible = false;
                btnaccept.Visible = false;
                btnmodify.Visible = false;


                msg.Text = "Cancellation";


                acceptcancellation.Visible = true;

                declinecancellation.Visible = true;
            }

            if (ActionStatus.Text == "Accept Cancellation")
            {

                btncontact.Visible = false;
                btnaccept.Visible = false;
                btnmodify.Visible = false;


            


                msg.Text = "Cancelled";


                acceptcancellation.Visible = false;
                declinecancellation.Visible = false;
            }


            

            if(ActionStatus.Text == "Accept")
            {
                seller.Visible = false;

                ordercompleted.Visible = true;
            }

            if(HiddenField2.Value == "Seller")
            {
                btnaccept.Visible = false;
                btnmodify.Visible = false;

            }

            //else
            //{

            //    btnaccept.Visible = true;
            //    btnmodify.Visible = true;
            //}

        }
    }
    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string deliveryid = ((Label)e.Item.FindControl("Label10")).Text;
        string username = ((Label)e.Item.FindControl("Label11")).Text;


        if (e.CommandName == "Accept Cancellation")
        {

            SqlDataSource23.UpdateParameters.Add("ActionStatus", "Accept Cancellation");
                 SqlDataSource23.UpdateParameters.Add("Status", "Cancel");
            SqlDataSource23.UpdateParameters.Add("DeliveryId", deliveryid);
            SqlDataSource23.Update();




            SqlDataSource24.UpdateParameters.Add("Status", "Cancelled");
            SqlDataSource24.UpdateParameters.Add("DeliveryId", deliveryid);
            SqlDataSource24.UpdateParameters.Add("Comments", Page.User.Identity.Name);
            SqlDataSource24.Update();
        }

        if (e.CommandName == "Decline Cancellation")
        {

            SqlDataSource23.UpdateParameters.Add("ActionStatus", "Decline Cancellation");
            SqlDataSource23.UpdateParameters.Add("Status", "Decline Cancellation");
            SqlDataSource23.UpdateParameters.Add("DeliveryId", deliveryid);
            SqlDataSource23.Update();




          
        }






        if (e.CommandName == "Accept")
        {

            SqlDataSource23.UpdateParameters.Add("ActionStatus", "Accept");
            SqlDataSource23.UpdateParameters.Add("Status", "Accept");
            SqlDataSource23.UpdateParameters.Add("DeliveryId", deliveryid);
            SqlDataSource23.Update();




            SqlDataSource24.UpdateParameters.Add("Status", "Complete");
            SqlDataSource24.UpdateParameters.Add("DeliveryId", deliveryid);
            SqlDataSource24.UpdateParameters.Add("Comments", Page.User.Identity.Name);
            SqlDataSource24.Update();




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
            mail.To.Add(username);
            mail.Bcc.Add(BCC.ToString());

            StreamReader reader = new StreamReader(Server.MapPath("~/email/orderconfirmed.html"));
            string readFile = reader.ReadToEnd();
            string myString = "";
            myString = readFile;
            //string name = HttpUtility.UrlEncode(Encrypt(Session["UserName"].ToString().Trim()));
            //string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));

            myString = myString.Replace("{#Order}", Request.QueryString["OrderNo"].ToString());
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

        if (e.CommandName == "Modify")
        {

            SqlDataSource23.UpdateParameters.Add("ActionStatus", "Modify");
            SqlDataSource23.UpdateParameters.Add("Status", "Modify");
            SqlDataSource23.UpdateParameters.Add("DeliveryId", deliveryid);
            SqlDataSource23.Update();
        }

        if (e.CommandName == "contact")
        {
            Response.RedirectToRoute("contact", new { username = username });
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload2.HasFile)
        {
            string ext = Path.GetExtension(FileUpload2.FileName).ToLower();

            uploadFileName = Guid.NewGuid().ToString() + ext;
            uploadFilePath = Path.Combine(Server.MapPath("~/Delivery"), uploadFileName);
            try
            {
                FileUpload2.SaveAs(uploadFilePath);
                SqlDataSource23.InsertParameters.Add("Message", TextBox2.Text);
                SqlDataSource23.InsertParameters.Add("Status", "Modification");
                SqlDataSource23.InsertParameters.Add("ActionStatus", "Modification");
                SqlDataSource23.InsertParameters.Add("Type", "Buyer");
                SqlDataSource23.InsertParameters.Add("Attachment", "~/Delivery/" + FileUpload2.FileName);
                SqlDataSource23.Insert();
                TextBox2.Text = string.Empty;



            }
            catch (Exception ex)
            {
                //lblMsg.Text = ex.Message;
            }

        }
        else
        {
            //lblMsg.Text = "Save Successfully";
        }
    }



    protected void DownloadFile(object sender, EventArgs e)
    {
        string filePath = (sender as LinkButton).CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }


    protected void Button6_Click(object sender, EventArgs e)
    {
        
            try
            {
                
                SqlDataSource23.InsertParameters.Add("Message", TextBox3.Text);
                SqlDataSource23.InsertParameters.Add("Status", "Pending");
                SqlDataSource23.InsertParameters.Add("ActionStatus", "Cancel");
                SqlDataSource23.InsertParameters.Add("Type", "Buyer");
                SqlDataSource23.InsertParameters.Add("Attachment", "~/Delivery/" + "");
                SqlDataSource23.Insert();
                TextBox3.Text = string.Empty;



            }
            catch (Exception ex)
            {
                //lblMsg.Text = ex.Message;
            }

        
       
    }
}