<%@ Application Language="C#" %>
<%@ Import Namespace="alibabu" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        RegisterRoutes(System.Web.Routing.RouteTable.Routes); //RouteTable stores the Url Routes for an application
    }

    void RegisterRoutes(System.Web.Routing.RouteCollection routes)
    {


        routes.MapPageRoute("ServiceDetails", "{ID}/{PID}/servicedetails", "~/detail.aspx");
        routes.MapPageRoute("Topssearch", "{CID}/{Keyword}/topsearch", "~/Search.aspx");
        routes.MapPageRoute("Topssearch2", "{CID}/{SID}/{SCat}/topsearches", "~/Search.aspx");
        routes.MapPageRoute("Topssearch3", "{Keyword}/key", "~/Search.aspx");
        
        
        routes.MapPageRoute("Topssearch4", "{Keyword}/{CID}/{Cat}/keytop", "~/Search.aspx");
        routes.MapPageRoute("HeadSearch", "{CID}/{Cat}/topsearches", "~/Search.aspx");
        routes.MapPageRoute("TopViews", "{Sort}/topview", "~/Search.aspx");
        routes.MapPageRoute("OfferType", "{OfferType}/offertype", "~/Search.aspx");

        routes.MapPageRoute("ConditionNot", "{Condition}/condition", "~/Search.aspx");
      
        routes.MapPageRoute("contact", "{username}/mychat", "~/account/mychat.aspx");
        //routes.MapPageRoute("subcategory", "{subcategory}/newsearch", "~/newsearch.aspx");
        //routes.MapPageRoute("category", "{ccategory}/newsearch", "~/newsearch.aspx");
        //routes.MapPageRoute("contact", "{username}/mychat", "~/account/mychat.aspx");
        routes.MapPageRoute("contactInbox", "{username}/{ChatID}/mychat", "~/account/mychat.aspx");
        //routes.MapPageRoute("profile", "{username}/profile", "~/profile.aspx");

        //routes.MapPageRoute("page", "{page}/page", "~/page.aspx");
        //routes.MapPageRoute("WantedDetails", "{ID}/{username}/wanteddetails", "~/wantedDetails.aspx");
        routes.MapPageRoute("page", "{pageid}/{pagetitle}/mypage", "~/page.aspx");
      





    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

        //Session.Timeout = 20;
        if (Session["cart"] == null)
        {


            Random rand = new Random(100);
            int ccc = rand.Next(000000000, 999999999);

            var bytes = new byte[4];
            var rng = System.Security.Cryptography.RandomNumberGenerator.Create();
            rng.GetBytes(bytes);
            uint random = BitConverter.ToUInt32(bytes, 0) % 100000000;




            Session["Cart"] = String.Format("{0:D8}", random) + DateTime.Now.ToString("ddmmyyyyhhmmss");




            string sqlStatment = "select websitecommission from websitesetup";
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(constr))
            {
                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sqlStatment, con))
                {
                    cmd.Connection.Open();

                    cmd.ExecuteNonQuery();

                    System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Session["comm"] = reader.GetInt32(0);

                    }

                    reader.Close();
                    cmd.Connection.Close();
                }
            }
        }


    }

    void Application_Error(object sender, EventArgs e)
    {


        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        string sqlStatment = "INSERT INTO ErrorLog VALUES(@Date,@Message)";
        using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(constr))
        {
            using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sqlStatment, con))
            {
                Exception ex = Server.GetLastError().GetBaseException();
                if (!(ex is HttpException))
                {
                    string exceptionMessage = ex.Message;
                    string StackTrace = ex.StackTrace.Replace(Environment.NewLine, string.Empty);
                    string source = ex.Source.Replace(Environment.NewLine, string.Empty);
                    string targetSite = ex.TargetSite.ToString().Replace(Environment.NewLine, string.Empty);
                    string userName = HttpContext.Current.User.Identity.Name;
                    string url = (HttpContext.Current.Request == null || HttpContext.Current.Request.Url == null) ? "" : HttpContext.Current.Request.Url.AbsoluteUri;
                    con.Open();
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Message", userName.ToString() + "" + exceptionMessage.ToString() + "" + StackTrace.ToString() + "" + source.ToString() + "" + targetSite.ToString() + "" + url + "" + ((System.Exception)(Server.GetLastError().InnerException)).Message.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }


    }

</script>
