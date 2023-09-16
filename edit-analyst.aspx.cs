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

public partial class edit_analyst : System.Web.UI.Page
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
        SqlCommand myCommand = new SqlCommand("select * from analysts where sr=@sr", con1);
        myCommand.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
        myReader = myCommand.ExecuteReader();
        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                analyst_id.Text = myReader["analyst_id"].ToString();
                gender.Text = myReader["gender"].ToString();
                analyst_name.Text = myReader["analyst_name"].ToString();
                analyst_contact_no.Text = myReader["analyst_contact_no"].ToString();
                analyst_state.Text = myReader["analyst_state"].ToString();
                analyst_city.Text = myReader["analyst_city"].ToString();
                analyst_address.Text = myReader["analyst_address"].ToString();
                analyst_email_id.Text = EncDec.DecryptString(myReader["analyst_username_3des"].ToString(), EncryptionKey);
                Image1.ImageUrl = "../analyst_logo/" + myReader["analyst_logo"].ToString();
                current_logo_hf.Value = myReader["analyst_logo"].ToString();
                analyst_organisation.Text = myReader["analyst_organisation"].ToString();
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
        if(!IsPostBack)
        {
            fillDetails();
        }
    }

    protected void updatebtn_Click(object sender, EventArgs e)
    {
        if (analyst_organisation.Text.Trim() == "")
        {
            errorlbl.Text = "Organisation Name Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_name.Text.Trim() == "")
        {
            errorlbl.Text = "Name Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_contact_no.Text.Trim() == "")
        {
            errorlbl.Text = "Contact No. Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_state.Text.Trim() == "")
        {
            errorlbl.Text = "State Name Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_city.Text.Trim() == "")
        {
            errorlbl.Text = "City Name Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_address.Text.Trim() == "")
        {
            errorlbl.Text = "Address Required";
            error_panel.Visible = true;
            return;
        }
        try
        {
            error_panel.Visible = false;
            success_panel.Visible = false;


            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("update analysts set gender=@gender,analyst_name=@analyst_name,analyst_contact_no=@analyst_contact_no,analyst_state=@analyst_state,analyst_city=@analyst_city,analyst_address=@analyst_address,analyst_organisation=@analyst_organisation where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@gender", gender.Text.ToString());
            cmd2.Parameters.AddWithValue("@analyst_name", analyst_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@analyst_contact_no", analyst_contact_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@analyst_state", analyst_state.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@analyst_city", analyst_city.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@analyst_address", analyst_address.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@analyst_organisation", analyst_organisation.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());

            con2.Open();
            int count = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            success_panel.Visible = true;
            successlbl.Text = "Analyst Details Updated Sucessfully";
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
        errordiv_upload.Visible=false;
        successdiv_upload.Visible = false;
        string oldFileName = current_logo_hf.Value;
        if (oldFileName != "no-photo.png")
        {
            try
            {
                string file_name = oldFileName;
                string path = Server.MapPath("~/analyst_logo/" + file_name);
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
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/analyst_logo/") + filename_part2 + exten);
                SqlConnection con = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
                SqlCommand cmd = new SqlCommand("update analysts set analyst_logo=@analyst_logo", con);
                cmd.Parameters.AddWithValue("@analyst_logo", filename_part2 + exten);
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