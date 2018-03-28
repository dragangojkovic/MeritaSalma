using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucproduct_images : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUpload1.Attributes["onchange"] = "UploadFile(this)";
    }

    protected void Upload(object sender, EventArgs e)
    {
        //if (GridView1.Rows.Count > 0)
        //{
        //    Label7.Visible = true;
        //}

        // Upload Original Image Here
        string uploadFileName = "";
        string uploadFilePath = "";
        if (FileUpload1.HasFile)
        {
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                uploadFileName = Guid.NewGuid().ToString() + ext;
                uploadFilePath = Path.Combine(Server.MapPath("~/DynamicImage"), uploadFileName);
                try
                {
                    FileUpload1.SaveAs(uploadFilePath);


                    SqlDataSource1.InsertParameters.Add("Images", "~/DynamicImage/" + uploadFileName);
                    SqlDataSource1.InsertParameters.Add("ProductKey", Request.QueryString["ID"].ToString());
                    SqlDataSource1.Insert();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Label4.Text = ex.Message;
                }
            }

        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Seller/ProductConfirmation" );
    }

	protected void lnkDelete_Click(object sender, EventArgs e)
	{
		var productImagesId = (sender as LinkButton).CommandArgument;

		SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
		con.Open();
		SqlCommand com = new SqlCommand("DELETE FROM [ProductImages] WHERE [ProductImagesId] = @ProductImagesId", con);
		com.Parameters.Add(new SqlParameter("@ProductImagesId", productImagesId));
		com.ExecuteNonQuery();
		con.Close();
		GridView1.DataBind();
	}

	protected void lnkRotateLeft_Click(object sender, EventArgs e)
	{
		var imageUrl = (sender as LinkButton).CommandArgument;
		var rotationType = RotateFlipType.Rotate90FlipXY;
		RotateImage(sender, imageUrl, rotationType);
	}

	protected void lnkRotateRight_Click(object sender, EventArgs e)
	{
		var imageUrl = (sender as LinkButton).CommandArgument;
		var rotationType = RotateFlipType.Rotate270FlipXY;
		RotateImage(sender, imageUrl, rotationType);
	}

	protected void lnkRotate180_Click(object sender, EventArgs e)
	{
		var imageUrl = (sender as LinkButton).CommandArgument;
		var rotationType = RotateFlipType.Rotate180FlipNone;
		RotateImage(sender, imageUrl, rotationType);
	}


	private void RotateImage(object sender, string imageUrl, RotateFlipType rotationType)
	{
		if (imageUrl.Contains("?"))
		{
			imageUrl = imageUrl.Substring(0, imageUrl.IndexOf("?"));
		}

		string path = string.Empty;
		List<string> pathItems = imageUrl.Split('?').ToList();
		if (pathItems.Count > 0)
		{
			path = Server.MapPath(pathItems[0]);
		}

		System.Drawing.Image i = System.Drawing.Image.FromFile(path);
		i.RotateFlip(rotationType);
		i.Save(path);
		i.Dispose();
		var image = ((sender as LinkButton).Parent.FindControl("Image1")) as System.Web.UI.WebControls.Image;
		if (image != null)
		{
			image.Attributes.Add("ImageUrl", path);
		}
		imageUrl = imageUrl + "?" + DateTime.Now.Millisecond.ToString();
	}

	protected void lnkResize_Click(object sender, EventArgs e)
	{
		var txtResizeHeight = ((sender as LinkButton).Parent.FindControl("txtResizeHeight")) as System.Web.UI.WebControls.TextBox;
		var txtResizeWidth = ((sender as LinkButton).Parent.FindControl("txtResizeWidth")) as System.Web.UI.WebControls.TextBox;
		var imageUrl = (sender as LinkButton).CommandArgument;

		string path = Server.MapPath(imageUrl);
		System.Drawing.Image img = System.Drawing.Image.FromFile(path);

		int width = int.Parse(txtResizeWidth.Text);
		int height = int.Parse(txtResizeHeight.Text);

		var resized = ResizeImage(img, width, height);
		img.Dispose();
		resized.Save(path);// (path);
		resized.Dispose();
		var image = ((sender as LinkButton).Parent.FindControl("Image1")) as System.Web.UI.WebControls.Image;
		if (image != null)
		{
			image.Attributes.Add("ImageUrl", path);
		}
	}

	public static Bitmap ResizeImage(System.Drawing.Image image, int width, int height)
	{
		var destRect = new Rectangle(0, 0, width, height);
		var destImage = new Bitmap(width, height);

		destImage.SetResolution(image.HorizontalResolution, image.VerticalResolution);

		using (var graphics = Graphics.FromImage(destImage))
		{
			graphics.CompositingMode = CompositingMode.SourceCopy;
			graphics.CompositingQuality = CompositingQuality.HighQuality;
			graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
			graphics.SmoothingMode = SmoothingMode.HighQuality;
			graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

			using (var wrapMode = new ImageAttributes())
			{
				wrapMode.SetWrapMode(WrapMode.TileFlipXY);
				graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, wrapMode);
			}
		}
		return destImage;
	}

}