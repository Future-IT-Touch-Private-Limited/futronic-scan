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
using System.Web.UI.HtmlControls;
using System.Linq;
using System.Collections.Generic;

public partial class view_page_1 : System.Web.UI.Page
{
    string EncryptionKey = "futuretouchadmin123";
    string EncryptionKey2 = "future@adm@123";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
    //-------------------------------------
    float total_numbers = 0;
    //--------------------------------------
    float float_r1_percent = 0;
    float float_r2_percent = 0;
    float float_r3_percent = 0;
    float float_r4_percent = 0;
    float float_r5_percent = 0;

    float float_l1_percent = 0;
    float float_l2_percent = 0;
    float float_l3_percent = 0;
    float float_l4_percent = 0;
    float float_l5_percent = 0;
    //---------------------------------------
    float float_r1_position = 0;
    float float_r2_position = 0;
    float float_r3_position = 0;
    float float_r4_position = 0;
    float float_r5_position = 0;

    float float_l1_position = 0;
    float float_l2_position = 0;
    float float_l3_position = 0;
    float float_l4_position = 0;
    float float_l5_position = 0;
    //-----------------------------------------

    float flt_r1_value = 0;
    float flt_r2_value = 0;
    float flt_r3_value = 0;
    float flt_r4_value = 0;
    float flt_r5_value = 0;

    float flt_l1_value = 0;
    float flt_l2_value = 0;
    float flt_l3_value = 0;
    float flt_l4_value = 0;
    float flt_l5_value = 0;
    //----------------------------------
    public void fillDetails()
    {
        SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select * from reports where userid_plain=@userid_plain", con1);
        myCommand.Parameters.AddWithValue("@userid_plain", Request.QueryString["uid"].ToString());
        myReader = myCommand.ExecuteReader();

        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                if(myReader["r1_value"].ToString() != "" || myReader["r1_value"].ToString() != null)
                {
                    flt_r1_value = float.Parse(myReader["r1_value"].ToString());
                }
                else
                {
                    flt_r1_value = 0;
                }

                if (myReader["r2_value"].ToString() != "" || myReader["r2_value"].ToString() != null)
                {
                    flt_r2_value = float.Parse(myReader["r2_value"].ToString());
                }
                else
                {
                    flt_r2_value = 0;
                }

                if (myReader["r3_value"].ToString() != "" || myReader["r3_value"].ToString() != null)
                {
                    flt_r3_value = float.Parse(myReader["r3_value"].ToString());
                }
                else
                {
                    flt_r3_value = 0;
                }

                if (myReader["r4_value"].ToString() != "" || myReader["r4_value"].ToString() != null)
                {
                    flt_r4_value = float.Parse(myReader["r4_value"].ToString());
                }
                else
                {
                    flt_r4_value = 0;
                }

                if (myReader["r5_value"].ToString() != "" || myReader["r5_value"].ToString() != null)
                {
                    flt_r5_value = float.Parse(myReader["r5_value"].ToString());
                }
                else
                {
                    flt_r5_value = 0;
                }
                //-------------
                if (myReader["l1_value"].ToString() != "" || myReader["l1_value"].ToString() != null)
                {
                    flt_l1_value = float.Parse(myReader["l1_value"].ToString());
                }
                else
                {
                    flt_l1_value = 0;
                }

                if (myReader["l2_value"].ToString() != "" || myReader["l2_value"].ToString() != null)
                {
                    flt_l2_value = float.Parse(myReader["l2_value"].ToString());
                }
                else
                {
                    flt_l2_value = 0;
                }

                if (myReader["l3_value"].ToString() != "" || myReader["l3_value"].ToString() != null)
                {
                    flt_l3_value = float.Parse(myReader["l3_value"].ToString());
                }
                else
                {
                    flt_l3_value = 0;
                }

                if (myReader["l4_value"].ToString() != "" || myReader["l4_value"].ToString() != null)
                {
                    flt_l4_value = float.Parse(myReader["l4_value"].ToString());
                }
                else
                {
                    flt_l4_value = 0;
                }

                if (myReader["l5_value"].ToString() != "" || myReader["l5_value"].ToString() != null)
                {
                    flt_l5_value = float.Parse(myReader["l5_value"].ToString());
                }
                else
                {
                    flt_l5_value = 0;
                }
                //------
                total_numbers = flt_r1_value + flt_r2_value + flt_r3_value + flt_r4_value + flt_r5_value + flt_l1_value + flt_l2_value + flt_l3_value + flt_l4_value + flt_l5_value;
                Response.Write("Total: "+total_numbers.ToString()+"<br>");

                //r1_pattern.Text = myReader["r1_pattern"].ToString();
                //r2_pattern.Text = myReader["r2_pattern"].ToString();
                //r3_pattern.Text = myReader["r3_pattern"].ToString();
                //r4_pattern.Text = myReader["r4_pattern"].ToString();
                //r5_pattern.Text = myReader["r5_pattern"].ToString();

                //l1_pattern.Text = myReader["l1_pattern"].ToString();
                //l2_pattern.Text = myReader["l2_pattern"].ToString();
                //l3_pattern.Text = myReader["l3_pattern"].ToString();
                //l4_pattern.Text = myReader["l4_pattern"].ToString();
                //l5_pattern.Text = myReader["l5_pattern"].ToString();



                r1_short_pattern.Text = myReader["r1_pattern_short"].ToString();
                r2_short_pattern.Text = myReader["r2_pattern_short"].ToString();
                r3_short_pattern.Text = myReader["r3_pattern_short"].ToString();
                r4_short_pattern.Text = myReader["r4_pattern_short"].ToString();
                r5_short_pattern.Text = myReader["r5_pattern_short"].ToString();

                l1_short_pattern.Text = myReader["l1_pattern_short"].ToString();
                l2_short_pattern.Text = myReader["l2_pattern_short"].ToString();
                l3_short_pattern.Text = myReader["l3_pattern_short"].ToString();
                l4_short_pattern.Text = myReader["l4_pattern_short"].ToString();
                l5_short_pattern.Text = myReader["l5_pattern_short"].ToString();
            }
        }
        else
        {
        }
        con1.Close();
        con1.Dispose();
        myReader.Close();
    }

    //============================================================

    // report details
    protected string report_logo { get; set; }
    protected string report_analyst_name { get; set; }
    protected string report_organisation { get; set; }
    protected string report_organisation_tagline { get; set; }
    protected string report_contact_no { get; set; }
    protected string report_analyst_email { get; set; }
    protected string report_analyst_address { get; set; }
    protected string report_date { get; set; }


    //user details
    protected string user_userid_plain { get; set; }
    protected string user_full_name { get; set; }
    protected string user_father_husband_name { get; set; }
    protected string user_mother_name { get; set; }
    protected string user_gender { get; set; }
    protected string user_address { get; set; }
    protected string user_date_of_birth { get; set; }
    protected string user_age_in_years { get; set; }
    protected string user_contact_no { get; set; }
    protected string user_email_id { get; set; }
    protected string user_report_by { get; set; }

    //analyst details
    protected string analyst_gender { get; set; }
    protected string analyst_name { get; set; }
    protected string analyst_email_id { get; set; }
    protected string analyst_contact_no { get; set; }
    protected string analyst_state { get; set; }
    protected string analyst_city { get; set; }
    protected string analyst_address { get; set; }
    protected string analyst_logo { get; set; }
    protected string analyst_organisation { get; set; }

    //admin details
    protected string admin_logo { get; set; }
    protected string admin_organisation { get; set; }
    protected string admin_name { get; set; }
    protected string admin_email { get; set; }
    protected string admin_contact { get; set; }
    protected string admin_address { get; set; }
    protected string report_footer { get; set; }
    protected string admin_organisation_tag_line { get; set; }


    //fill user details
    public void fillUserDetails()
    {
        //try
        //{
        SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select * from users where userid_plain=@userid_plain", con1);
        myCommand.Parameters.AddWithValue("@userid_plain", Request.QueryString["uid"].ToString());
        myReader = myCommand.ExecuteReader();
        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                user_userid_plain = myReader["userid_plain"].ToString();
                user_full_name = myReader["full_name"].ToString();
                user_father_husband_name = myReader["father_husband_name"].ToString();
                user_mother_name = myReader["mother_name"].ToString();
                user_gender = myReader["gender"].ToString();
                user_address = myReader["address"].ToString();
                user_date_of_birth = myReader["date_of_birth"].ToString();
                user_contact_no = myReader["contact_no"].ToString();
                user_email_id = myReader["email_id"].ToString();
                user_report_by = myReader["report_by"].ToString();
                analyst_id_hf.Value = myReader["analyst_id"].ToString();
                report_by_hf.Value = myReader["report_by"].ToString();
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

    //fill analyst details
    public void fillAnalystDetails()
    {
        //try
        //{
        SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select * from analysts where analyst_id=@analyst_id", con1);
        myCommand.Parameters.AddWithValue("@analyst_id", analyst_id_hf.Value);
        myReader = myCommand.ExecuteReader();
        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                analyst_gender = myReader["gender"].ToString();
                analyst_name = myReader["analyst_name"].ToString();
                analyst_email_id = myReader["analyst_email_id"].ToString();
                analyst_contact_no = myReader["analyst_contact_no"].ToString();
                analyst_state = myReader["analyst_state"].ToString();
                analyst_city = myReader["analyst_city"].ToString();
                analyst_address = myReader["analyst_address"].ToString();
                analyst_logo = myReader["analyst_logo"].ToString();
                analyst_organisation = myReader["analyst_organisation"].ToString();
                if (report_by_hf.Value == "Analyst")
                {
                    report_logo = "../analyst_logo/" + myReader["analyst_logo"].ToString();
                    report_analyst_name = myReader["analyst_name"].ToString();
                    report_organisation = myReader["analyst_organisation"].ToString();
                    report_organisation_tagline = myReader["analyst_organisation_tag_line"].ToString();
                    report_contact_no = myReader["analyst_contact_no"].ToString();
                    report_analyst_email = myReader["analyst_name"].ToString();
                    report_analyst_address = myReader["analyst_address"].ToString() + " " + myReader["analyst_city"].ToString() + " " + myReader["analyst_state"].ToString();
                }
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

    //fill analyst details
    public void fillAdminDetails()
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
                admin_logo = myReader["admin_logo"].ToString();
                admin_organisation = myReader["admin_organisation"].ToString();
                admin_name = myReader["admin_name"].ToString();
                admin_email = myReader["admin_email"].ToString();
                admin_contact = myReader["admin_contact"].ToString();
                admin_address = myReader["admin_address"].ToString();
                report_footer = myReader["report_footer"].ToString();
                admin_organisation_tag_line = myReader["admin_organisation_tag_line"].ToString();
                if (report_by_hf.Value == "Admin")
                {
                    report_logo = "../admin_logo/" + myReader["admin_logo"].ToString();

                    report_analyst_name = myReader["admin_name"].ToString();
                    report_organisation = myReader["admin_organisation"].ToString();
                    report_organisation_tagline = myReader["admin_organisation_tag_line"].ToString();
                    report_contact_no = myReader["admin_contact"].ToString();
                    report_analyst_email = myReader["admin_name"].ToString();
                    report_analyst_address = myReader["admin_address"].ToString();
                }

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

    public void fillPercentage()
    {
        float_r1_percent = (flt_r1_value / total_numbers) * 100;
        float_r1_percent = (float)Math.Round(float_r1_percent, 2);
        r1_percent.Text= float_r1_percent.ToString("0.00")+"%";

        float_r2_percent = (flt_r2_value / total_numbers) * 100;
        float_r2_percent = (float)Math.Round(float_r2_percent, 2);
        r2_percent.Text = float_r2_percent.ToString("0.00") + "%";

        float_r3_percent = (flt_r3_value / total_numbers) * 100;
        float_r3_percent = (float)Math.Round(float_r3_percent, 2);
        r3_percent.Text = float_r3_percent.ToString("0.00") + "%";

        float_r4_percent = (flt_r4_value / total_numbers) * 100;
        float_r4_percent = (float)Math.Round(float_r4_percent, 2);
        r4_percent.Text = float_r4_percent.ToString("0.00") + "%";

        float_r5_percent = (flt_r5_value / total_numbers) * 100;
        float_r5_percent = (float)Math.Round(float_r5_percent, 2);
        r5_percent.Text = float_r5_percent.ToString("0.00") + "%";


        float_l1_percent = (flt_l1_value / total_numbers) * 100;
        float_l1_percent = (float)Math.Round(float_l1_percent, 2);
        l1_percent.Text = float_l1_percent.ToString("0.00") + "%";

        float_l2_percent = (flt_l2_value / total_numbers) * 100;
        float_l2_percent = (float)Math.Round(float_l2_percent, 2);
        l2_percent.Text = float_l2_percent.ToString("0.00") + "%";

        float_l3_percent = (flt_l3_value / total_numbers) * 100;
        float_l3_percent = (float)Math.Round(float_l3_percent, 2);
        l3_percent.Text = float_l3_percent.ToString("0.00") + "%";

        float_l4_percent = (flt_l4_value / total_numbers) * 100;
        float_l4_percent = (float)Math.Round(float_l4_percent, 2);
        l4_percent.Text = float_l4_percent.ToString("0.00") + "%";

        float_l5_percent = (flt_l5_value / total_numbers) * 100;
        float_l5_percent = (float)Math.Round(float_l5_percent, 2);
        l5_percent.Text = float_l5_percent.ToString("0.00") + "%";




        float[] allPercentages = { float_r1_percent, float_r2_percent, float_r3_percent, float_r4_percent, float_r5_percent, float_l1_percent, float_l2_percent, float_l3_percent, float_l4_percent, float_l5_percent };
        for (int i = 0; i < allPercentages.Length; i++)
        {
            allPercentages[i] = (float)Math.Round(allPercentages[i], 2);
        }
        Array.Sort(allPercentages);
        float[] Strength = new float[3];
        float[] Weaker = new float[3];
        float[] Average = new float[4];

        // Step 3: Fill Strength with the three largest values
        for (int i = 0; i < 3; i++)
        {
            Strength[i] = allPercentages[allPercentages.Length - 1 - i];
        }

        // Step 4: Fill Weaker with the three smallest values
        for (int i = 0; i < 3; i++)
        {
            Weaker[i] = allPercentages[i];
        }

        // Step 5: Fill Average with the remaining values
        for (int i = 0; i < 4; i++)
        {
            Average[i] = allPercentages[i + 3];
        }

        // Remove values from Average that are also in Strength or Weaker
        Average = Average.Except(Strength).Except(Weaker).ToArray();

        //set color for R1
        if (Strength.Contains(float_r1_percent))
        {
            bg_r1.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_r1_percent))
        {
            bg_r1.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_r1.Style.Add("background-color", "#FFBA03");
        }
        //set color for R2
        if (Strength.Contains(float_r2_percent))
        {
            bg_r2.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_r2_percent))
        {
            bg_r2.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_r2.Style.Add("background-color", "#FFBA03");
        }
        //set color for R3
        if (Strength.Contains(float_r3_percent))
        {
            bg_r3.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_r3_percent))
        {
            bg_r3.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_r3.Style.Add("background-color", "#FFBA03");
        }
        //set color for R4
        if (Strength.Contains(float_r4_percent))
        {
            bg_r4.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_r4_percent))
        {
            bg_r4.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_r4.Style.Add("background-color", "#FFBA03");
        }
        //set color for R4
        if (Strength.Contains(float_r5_percent))
        {
            bg_r5.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_r5_percent))
        {
            bg_r5.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_r5.Style.Add("background-color", "#FFBA03");
        }

        //set color for L1
        if (Strength.Contains(float_l1_percent))
        {
            bg_l1.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_l1_percent))
        {
            bg_l1.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_l1.Style.Add("background-color", "#FFBA03");
        }
        //set color for L2
        if (Strength.Contains(float_l2_percent))
        {
            bg_l2.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_l2_percent))
        {
            bg_l2.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_l2.Style.Add("background-color", "#FFBA03");
        }
        //set color for L3
        if (Strength.Contains(float_l3_percent))
        {
            bg_l3.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_l3_percent))
        {
            bg_l3.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_l3.Style.Add("background-color", "#FFBA03");
        }
        //set color for L4
        if (Strength.Contains(float_l4_percent))
        {
            bg_l4.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_l4_percent))
        {
            bg_l4.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_l4.Style.Add("background-color", "#FFBA03");
        }
        //set color for L5
        if (Strength.Contains(float_l5_percent))
        {
            bg_l5.Style.Add("background-color", "#0EB35A");
        }
        else if (Weaker.Contains(float_l5_percent))
        {
            bg_l5.Style.Add("background-color", "#C50606");
        }
        else
        {
            bg_l5.Style.Add("background-color", "#FFBA03");
        }

        // Print the results
        Response.Write("Strength: " + string.Join(", ", Strength)+"<br>");
        Response.Write("Average: " + string.Join(", ", Average) + "<br>");
        Response.Write("Weaker: " + string.Join(", ", Weaker) + "<br>");

























    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            try
            {
                fillDetails();
                fillUserDetails();
                fillAnalystDetails();
                fillAdminDetails();

                fillPercentage();
            }
            catch (Exception ex)
            { }
        }
    }

}