using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class settings : System.Web.UI.Page
{
    string EncryptionKey = "futuretouchadmin123";
    string EncryptionKey2 = "future@adm@123";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    public void fillDetails()
    {
        //try
        //{
        SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select * from admin where sr=@sr", con1);
        myCommand.Parameters.AddWithValue("@sr", "1");
        myReader = myCommand.ExecuteReader();
        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                admin_organisation.Text = myReader["admin_organisation"].ToString();
                admin_organisation_tag_line.Text = myReader["admin_organisation_tag_line"].ToString();
                admin_name.Text = myReader["admin_name"].ToString();
                admin_email.Text = myReader["admin_email"].ToString();
                admin_contact.Text = myReader["admin_contact"].ToString();
                admin_address.Text = myReader["admin_address"].ToString();
                report_footer.Text = myReader["report_footer"].ToString();

                Image1.ImageUrl = "../admin_logo/" + myReader["admin_logo"].ToString();
                current_logo_hf.Value = myReader["admin_logo"].ToString();
            }
        }
        else
        {
            //Response.Redirect("dashboard.aspx");
        }
        con1.Close();
        con1.Dispose();
        myReader.Close();
        //}
        //catch (Exception ex)
        //{
        //    //Response.Write(ex.Message);
        //}
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillDetails();
        }
    }

    protected void updatebtn_Click(object sender, EventArgs e)
    {
        try
        {
            error_panel.Visible = false;
            success_panel.Visible = false;


            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("update admin set admin_organisation=@admin_organisation,admin_organisation_tag_line=@admin_organisation_tag_line,admin_name=@admin_name,admin_email=@admin_email,admin_contact=@admin_contact,admin_address=@admin_address,report_footer=@report_footer where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@admin_organisation", admin_organisation.Text.ToString());
            cmd2.Parameters.AddWithValue("@admin_organisation_tag_line", admin_organisation_tag_line.Text.ToString());
            cmd2.Parameters.AddWithValue("@admin_name", admin_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@admin_email", admin_email.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@admin_contact", admin_contact.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@admin_address", admin_address.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@report_footer", report_footer.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@sr", "1");

            con2.Open();
            int count = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            success_panel.Visible = true;
            successlbl.Text = "Admin Details Updated Sucessfully";
            error_panel.Visible = false;
            success_panel.Focus();

        }
        catch (Exception ex)
        {
            error_panel.Visible = true;
            errorlbl.Text = ex.Message;
            error_panel.Focus();
        }
    }


    protected void upload_logo_btn_Click(object sender, EventArgs e)
    {
        errordiv_upload.Visible = false;
        successdiv_upload.Visible = false;
        string oldFileName = current_logo_hf.Value;
        if (oldFileName != "no-photo.png")
        {
            try
            {
                string file_name = oldFileName;
                string path = Server.MapPath("~/admin_logo/" + file_name);
                FileInfo file = new FileInfo(path);
                if (file.Exists)//check file exsit or not  
                {
                    file.Delete();
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
                return;
            }
        }

        Response.AddHeader("X-XSS-Protection", "0");
        string[] validFileTypes = { "png", "jpg", "jpeg", "gif" };
        string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
        bool isValidFile = false;
        for (int i = 0; i < validFileTypes.Length; i++)
        {
            if (ext == "." + validFileTypes[i])
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile)
        {
            errordiv_upload.Visible = true;
            errorlbl_upload_lbl.Text = "Invalid File. Please upload a File with extension " + string.Join(",", validFileTypes);
            return;
        }
        if (FileUpload1.FileBytes.Length > 1024000)
        {
            errorlbl_upload_lbl.Text = "Large file not allowed";
            errordiv_upload.Visible = true;
            return;
        }
        try
        {
            if (FileUpload1.HasFile)
            {
                string exten = Path.GetExtension(FileUpload1.PostedFile.FileName);
                string filename_part2 = DateTime.Now.ToString("yyyyMMddhhmmssffffff");
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/admin_logo/") + filename_part2 + exten);
                SqlConnection con = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
                SqlCommand cmd = new SqlCommand("update admin set admin_logo=@admin_logo", con);
                cmd.Parameters.AddWithValue("@admin_logo", filename_part2 + exten);
                con.Open();
                int count = cmd.ExecuteNonQuery();
                con.Close();
                con.Dispose();
                successlbl_upload_lbl.Text = "Analyst Logo Updated Sucessfully";
                successdiv_upload.Visible = true;
                fillDetails();
            }
        }
        catch (Exception ex)
        {
        }
    }

}