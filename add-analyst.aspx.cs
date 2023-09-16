using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_agent : System.Web.UI.Page
{
    string EncryptionKey = "futuretouchadmin123";
    string EncryptionKey2 = "future@adm@123";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    string inTitleCase(string inputText)
    {
        string outputCase = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(inputText.Trim());
        return outputCase;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            analyst_id.Text = DateTime.Now.ToString("yyMMddhhmmssff");
        }
    }

    public void keepPassword()
    {
        analyst_password.Attributes["value"] = analyst_password.Text;
        analyst_confirm_password.Attributes["value"] = analyst_confirm_password.Text;
        password_hf.Value = analyst_password.Text;
    }

    protected void addbtn_Click(object sender, EventArgs e)
    {

        error_panel.Visible = false;
        success_panel.Visible = false;
        if (analyst_organisation.Text.Trim() == "")
        {
            errorlbl.Text = "Organisation Name Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_id.Text.Trim() == "")
        {
            errorlbl.Text = "Invalid Analyst ID";
            error_panel.Visible = true;
            return;
        }
        if (analyst_name.Text.Trim() == "")
        {
            errorlbl.Text = "Name Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_email_id.Text.Trim() == "")
        {
            errorlbl.Text = "Email Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_email_id.Text.Trim() != "")
        {
            bool isEmail = Regex.IsMatch(analyst_email_id.Text.Trim(), @"\A(?:[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?)\Z");
            if (!isEmail)
            {
                errorlbl.Visible = true;
                errorlbl.Text = "Invalid Email Address";
                return;
            }
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
        if (analyst_password.Text.Trim() == "")
        {
            errorlbl.Text = "Password Required";
            error_panel.Visible = true;
            return;
        }
        if (analyst_confirm_password.Text.Trim() == "")
        {
            errorlbl.Text = "Password Confirmation Failed";
            error_panel.Visible = true;
            return;
        }

        //try
        //{
        SqlConnection con = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        con.Open();
        SqlCommand cmdd = new SqlCommand("select * from analysts where analyst_username_3des=@analyst_username_3des", con);
        cmdd.Parameters.AddWithValue("@analyst_username_3des", EncDec.EncryptString(analyst_email_id.Text.Trim().ToLower(), EncryptionKey));
        SqlDataReader reader = cmdd.ExecuteReader();
        if (reader.HasRows)
        {
            con.Close();
            con.Dispose();
            reader.Close();
            errorlbl.Text = "Email ID already exist";
            error_panel.Visible = true;
        }
        else
        {
            SqlConnection con3 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd3 = new SqlCommand("Insert into analysts (analyst_username_3des,analyst_password_3des,analyst_username_md5,analyst_password_md5,analyst_account_status,analyst_account_date,analyst_query_date,analyst_id,gender,analyst_name,analyst_email_id,analyst_contact_no,analyst_state,analyst_city,analyst_address,analyst_organisation) values(@analyst_username_3des,@analyst_password_3des,@analyst_username_md5,@analyst_password_md5,@analyst_account_status,@analyst_account_date,@analyst_query_date,@analyst_id,@gender,@analyst_name,@analyst_email_id,@analyst_contact_no,@analyst_state,@analyst_city,@analyst_address,@analyst_organisation)", con3);
            cmd3.Parameters.AddWithValue("@analyst_username_3des", EncDec.EncryptString(analyst_email_id.Text.Trim().ToLower(), EncryptionKey));
            cmd3.Parameters.AddWithValue("@analyst_password_3des", EncDec.EncryptString(analyst_password.Text, EncryptionKey));
            cmd3.Parameters.AddWithValue("@analyst_username_md5", EncDec.MD5Hash(analyst_email_id.Text.Trim().ToLower()));
            cmd3.Parameters.AddWithValue("@analyst_password_md5", EncDec.MD5Hash(analyst_password.Text.Trim()));
            cmd3.Parameters.AddWithValue("@analyst_account_status", "Running");
            cmd3.Parameters.AddWithValue("@analyst_account_date", indianTime.ToString("dd MMMM yyyy hh:mm:ss tt"));
            cmd3.Parameters.AddWithValue("@analyst_query_date", indianTime.ToString("yyyyMMdd"));
            cmd3.Parameters.AddWithValue("@analyst_id", analyst_id.Text.Trim().ToString());
            cmd3.Parameters.AddWithValue("@gender", inTitleCase(gender.Text.Trim()));
            cmd3.Parameters.AddWithValue("@analyst_name", inTitleCase(analyst_name.Text.Trim()));
            cmd3.Parameters.AddWithValue("@analyst_email_id", analyst_email_id.Text.Trim().ToLower());
            cmd3.Parameters.AddWithValue("@analyst_contact_no", analyst_contact_no.Text.Trim().ToString());
            cmd3.Parameters.AddWithValue("@analyst_state", inTitleCase(analyst_state.Text.Trim().ToString()));
            cmd3.Parameters.AddWithValue("@analyst_city", inTitleCase(analyst_city.Text.Trim().ToString()));
            cmd3.Parameters.AddWithValue("@analyst_address", inTitleCase(analyst_address.Text.Trim()));
            cmd3.Parameters.AddWithValue("@analyst_organisation", analyst_organisation.Text.Trim());
            con3.Open();
            int count = cmd3.ExecuteNonQuery();
            con3.Close();
            con3.Dispose();
            con.Close();
            con.Dispose();
            reader.Close();
            Response.Redirect("all-analysts.aspx");
        }
        //}
        //catch (Exception ex)
        //{
        //    error_panel.Visible = true;
        //    errorlbl.Text = ex.Message + " (1)";
        //    return;
        //}
    }

}