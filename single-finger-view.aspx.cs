using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class one_finger_view : System.Web.UI.Page
{
    string EncryptionKey = "futuretouchadmin123";
    string EncryptionKey2 = "future@adm@123";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    public void fillAnalystDetails()
    {
        SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select * from analysts where analyst_id=@analyst_id", con1);
        myCommand.Parameters.AddWithValue("@analyst_id", analyst_id.Value);
        myReader = myCommand.ExecuteReader();

        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                analyst_name.Text = myReader["analyst_name"].ToString();
                analyst_email_id.Text = myReader["analyst_email_id"].ToString();
                analyst_contact_no.Text = myReader["analyst_contact_no"].ToString();
                analyst_address.Text = myReader["analyst_address"].ToString();
                analyst_city.Text = myReader["analyst_city"].ToString();
                analyst_state.Text = myReader["analyst_state"].ToString();
            }
        }
        else
        {
        }
        con1.Close();
        con1.Dispose();
        myReader.Close();
    }

    public void fillDetails()
    {
        try
        {
            SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            DataTable dt = new DataTable();
            con1.Open();
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("select * from users where sr=@sr", con1);
            myCommand.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
            myReader = myCommand.ExecuteReader();

            if (myReader.HasRows)
            {
                while (myReader.Read())
                {
                    full_name.Text = myReader["full_name"].ToString();
                    father_husband_name.Text = myReader["father_husband_name"].ToString();
                    mother_name.Text = myReader["mother_name"].ToString();
                    address.Text = myReader["address"].ToString();
                    contact_no.Text = myReader["contact_no"].ToString();
                    email_id.Text = myReader["email_id"].ToString();
                    userid_plain_hf.Value = myReader["userid_plain"].ToString();
                    analyst_id.Value = myReader["analyst_id"].ToString();
                    if(Request.QueryString["sr"]==null)
                    {
                        Response.Redirect("users.aspx");
                        myReader.Close();
                        con1.Close();
                        con1.Dispose();
                    }
                    if (Request.QueryString["f"] == null)
                    {
                        Response.Redirect("users.aspx");
                        myReader.Close();
                        con1.Close();
                        con1.Dispose();
                    }
                    if(Request.QueryString["f"]=="r1")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["rh_t_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64,"+ myReader["rh_t_2"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["rh_t_3"].ToString();
                    }
                    if (Request.QueryString["f"] == "r2")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["rh_if_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["rh_if_2"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["rh_if_3"].ToString();
                    }
                    if (Request.QueryString["f"] == "r3")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["rh_mf_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["rh_mf_2"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["rh_mf_3"].ToString();
                    }
                    if (Request.QueryString["f"] == "r4")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["rh_rf_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["rh_rf_2"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["rh_rf_3"].ToString();
                    }
                    if (Request.QueryString["f"] == "r5")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["rh_lf_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["rh_lf_2"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["rh_lf_3"].ToString();
                    }

                    if (Request.QueryString["f"] == "l1")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["lh_t_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["lh_t_3"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["lh_t_2"].ToString();
                    }
                    if (Request.QueryString["f"] == "l2")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["lh_if_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["lh_if_3"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["lh_if_2"].ToString();
                    }
                    if (Request.QueryString["f"] == "l3")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["lh_mf_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["lh_mf_3"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["lh_mf_2"].ToString();
                    }
                    if (Request.QueryString["f"] == "l4")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["lh_rf_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["lh_rf_3"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["lh_rf_2"].ToString();
                    }
                    if (Request.QueryString["f"] == "l5")
                    {
                        center_img.ImageUrl = "data:image/png;base64," + myReader["lh_lf_1"].ToString();
                        left_img.ImageUrl = "data:image/png;base64," + myReader["lh_lf_3"].ToString();
                        right_img.ImageUrl = "data:image/png;base64," + myReader["lh_lf_2"].ToString();
                    }

                }
            }
            else
            {
                //Response.Redirect("dashboard.aspx");
            }

            myReader.Close();
            con1.Close();
            con1.Dispose();
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
        }
    }

    public void fillPatterns()
    {
        //try
        //{
            string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT pattern_short_name, pattern_query FROM patterns";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                pattern.DataTextField = "pattern_query";
                pattern.DataValueField = "pattern_short_name";
                pattern.DataSource = dataTable;
                pattern.DataBind();
                pattern.Items.Insert(0, new ListItem("Select Pattern..", ""));
            }
        //}
        //catch(Exception ex)
        //{ }
    }
    
    public void fillValuePatterns()
    {
        try
        {
            SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            DataTable dt = new DataTable();
            con1.Open();
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("select * from reports where userid_plain=@userid_plain", con1);
            myCommand.Parameters.AddWithValue("@userid_plain", userid_plain_hf.Value.ToString());
            myReader = myCommand.ExecuteReader();

            if (myReader.HasRows)
            {
                while (myReader.Read())
                {
                    if (Request.QueryString["f"] == null)
                    {
                        Response.Redirect("users.aspx");
                        myReader.Close();
                        con1.Close();
                        con1.Dispose();
                    }
                    if (Request.QueryString["f"] == "r1")
                    {
                        value.Text = myReader["r1_value"].ToString();
                        pattern.SelectedValue = myReader["r1_pattern"].ToString();
                    }
                    if (Request.QueryString["f"] == "r2")
                    {
                        value.Text = myReader["r2_value"].ToString();
                        pattern.SelectedValue = myReader["r2_pattern"].ToString();
                    }
                    if (Request.QueryString["f"] == "r3")
                    {
                        value.Text = myReader["r3_value"].ToString();
                        pattern.SelectedValue = myReader["r3_pattern"].ToString();
                    }
                    if (Request.QueryString["f"] == "r4")
                    {
                        value.Text = myReader["r4_value"].ToString();
                        pattern.SelectedValue = myReader["r4_pattern"].ToString();
                    }
                    if (Request.QueryString["f"] == "r5")
                    {
                        value.Text = myReader["r5_value"].ToString();
                        pattern.SelectedValue = myReader["r5_pattern"].ToString();
                    }

                    if (Request.QueryString["f"] == "l1")
                    {
                        value.Text = myReader["l1_value"].ToString();
                        pattern.SelectedValue = myReader["l1_pattern"].ToString();
                    }
                    if (Request.QueryString["f"] == "l2")
                    {
                        value.Text = myReader["l2_value"].ToString();
                        pattern.SelectedValue = myReader["l2_pattern"].ToString();
                    }
                    if (Request.QueryString["f"] == "l3")
                    {
                        value.Text = myReader["l3_value"].ToString();
                        pattern.SelectedValue = myReader["l3_pattern"].ToString();
                    }
                    if (Request.QueryString["f"] == "l4")
                    {
                        value.Text = myReader["l4_value"].ToString();
                        pattern.SelectedValue = myReader["l4_pattern"].ToString();
                    }
                    if (Request.QueryString["f"] == "l5")
                    {
                        value.Text = myReader["l5_value"].ToString();
                        pattern.SelectedValue = myReader["l5_pattern"].ToString();
                    }

                }
            }
            else
            {
                //Response.Redirect("dashboard.aspx");
            }

            myReader.Close();
            con1.Close();
            con1.Dispose();
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillDetails();
            fillAnalystDetails();
            fillPatterns();
            fillValuePatterns();
        }
    }

    public void updateData(string str_column_value, string str_column_pattern, string str_column_note, string str_pattern_short)
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "UPDATE reports SET "+ str_column_value + "=@"+ str_column_value + ", "+ str_column_pattern + "=@"+ str_column_pattern + ","+ str_column_note + "=@"+ str_column_note + ", "+ str_pattern_short + "=@"+ str_pattern_short + "  WHERE userid_plain= @userid_plain";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@"+ str_column_value, value.Text.Trim().ToString());
                command.Parameters.AddWithValue("@"+ str_column_pattern, pattern.SelectedItem.Text);
                command.Parameters.AddWithValue("@" + str_column_note, note.Text.Trim().ToString());
                command.Parameters.AddWithValue("@" + str_pattern_short, pattern.SelectedItem.Value);
                command.Parameters.AddWithValue("@userid_plain", userid_plain_hf.Value.ToString());
                command.ExecuteNonQuery();
            }
        }

    }

    protected void update_btn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        con.Open();
        SqlCommand cmdd = new SqlCommand("select * from reports where userid_plain=@userid_plain", con);
        cmdd.Parameters.AddWithValue("@userid_plain", userid_plain_hf.Value.ToString());
        SqlDataReader reader = cmdd.ExecuteReader();
        if (reader.HasRows)
        {
            if(Request.QueryString["f"]=="r1")
            {
                updateData("r1_value", "r1_pattern", "r1_note", "r1_pattern_short");
            }
            if (Request.QueryString["f"] == "r2")
            {
                updateData("r2_value", "r2_pattern", "r2_note", "r2_pattern_short");
            }
            if (Request.QueryString["f"] == "r3")
            {
                updateData("r3_value", "r3_pattern", "r3_note", "r3_pattern_short");
            }
            if (Request.QueryString["f"] == "r4")
            {
                updateData("r4_value", "r4_pattern", "r4_note", "r4_pattern_short");
            }
            if (Request.QueryString["f"] == "r5")
            {
                updateData("r5_value", "r5_pattern", "r5_note", "r5_pattern_short");
            }

            if (Request.QueryString["f"] == "l1")
            {
                updateData("l1_value", "l1_pattern", "l1_note", "l1_pattern_short");
            }
            if (Request.QueryString["f"] == "l2")
            {
                updateData("l2_value", "l2_pattern", "l2_note", "l2_pattern_short");
            }
            if (Request.QueryString["f"] == "l3")
            {
                updateData("l3_value", "l3_pattern", "l3_note", "l3_pattern_short");
            }
            if (Request.QueryString["f"] == "l4")
            {
                updateData("l4_value", "l4_pattern", "l4_note", "l4_pattern_short");
            }
            if (Request.QueryString["f"] == "l5")
            {
                updateData("l5_value", "l5_pattern", "l5_note", "l5_pattern_short");
            }

            con.Close();
            con.Dispose();
            reader.Close();
        }
        else
        {
            SqlConnection con3 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd3 = new SqlCommand("Insert into reports (userid_plain) values(@userid_plain)", con3);
            cmd3.Parameters.AddWithValue("@userid_plain", userid_plain_hf.Value.ToString());
            con3.Open();
            int count3 = cmd3.ExecuteNonQuery();
            con3.Close();
            con3.Dispose();

            if (Request.QueryString["f"] == "r1")
            {
                updateData("r1_value", "r1_pattern", "r1_note", "r1_pattern_short");
            }
            if (Request.QueryString["f"] == "r2")
            {
                updateData("r2_value", "r2_pattern", "r2_note", "r2_pattern_short");
            }
            if (Request.QueryString["f"] == "r3")
            {
                updateData("r3_value", "r3_pattern", "r3_note", "r3_pattern_short");
            }
            if (Request.QueryString["f"] == "r4")
            {
                updateData("r4_value", "r4_pattern", "r4_note", "r4_pattern_short");
            }
            if (Request.QueryString["f"] == "r5")
            {
                updateData("r5_value", "r5_pattern", "r5_note", "r5_pattern_short");
            }

            if (Request.QueryString["f"] == "l1")
            {
                updateData("l1_value", "l1_pattern", "l1_note", "l1_pattern_short");
            }
            if (Request.QueryString["f"] == "l2")
            {
                updateData("l2_value", "l2_pattern", "l2_note", "l2_pattern_short");
            }
            if (Request.QueryString["f"] == "l3")
            {
                updateData("l3_value", "l3_pattern", "l3_note", "l3_pattern_short");
            }
            if (Request.QueryString["f"] == "l4")
            {
                updateData("l4_value", "l4_pattern", "l4_note", "l4_pattern_short");
            }
            if (Request.QueryString["f"] == "l5")
            {
                updateData("l5_value", "l5_pattern", "l5_note", "l5_pattern_short");
            }

            con.Close();
            con.Dispose();
            reader.Close();
        }
    }

}