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

public partial class patterns : System.Web.UI.Page
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

    public void fillPatterns()
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM patterns";
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            fillPatterns();
        }
    }

    protected void add_btn_Click(object sender, EventArgs e)
    {
        error_panel.Visible = false;
        success_panel.Visible = false;
        if(pattern_short_name.Text.Trim()=="")
        {
            error_panel.Visible=true;
            errorlbl.Text = "Enter short form of pattern";
            return;
        }
        if (pattern_full_form.Text.Trim() == "")
        {
            error_panel.Visible = true;
            errorlbl.Text = "Enter full form of pattern";
            return;
        }
        SqlConnection con = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        con.Open();
        SqlCommand cmdd = new SqlCommand("select * from patterns where pattern_short_name=@pattern_short_name and pattern_full_form=@pattern_full_form", con);
        cmdd.Parameters.AddWithValue("@pattern_short_name", pattern_short_name.Text.ToUpper().Trim().ToString());
        cmdd.Parameters.AddWithValue("@pattern_full_form", inTitleCase(pattern_full_form.Text.Trim().ToString()));
        SqlDataReader reader = cmdd.ExecuteReader();
        if (reader.HasRows)
        {
            error_panel.Visible = true;
            errorlbl.Text = "Pattern already exist in database";
            con.Close();
            con.Dispose();
            reader.Close();
        }
        else
        {
            SqlConnection con3 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd3 = new SqlCommand("Insert into patterns (pattern_short_name,pattern_full_form,pattern_query) values(@pattern_short_name,@pattern_full_form,@pattern_query)", con3);
            cmd3.Parameters.AddWithValue("@pattern_short_name", pattern_short_name.Text.ToUpper().Trim().ToString());
            cmd3.Parameters.AddWithValue("@pattern_full_form", inTitleCase(pattern_full_form.Text.Trim().ToString()));
            cmd3.Parameters.AddWithValue("@pattern_query", pattern_short_name.Text.ToUpper().Trim().ToString()+" ("+ inTitleCase(pattern_full_form.Text.Trim().ToString())+")");
            con3.Open();
            int count3 = cmd3.ExecuteNonQuery();
            con3.Close();
            con3.Dispose();

            con.Close();
            con.Dispose();
            reader.Close();
            pattern_short_name.Text = "";
            pattern_full_form.Text = "";
            fillPatterns();
        }
    }

}