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

public partial class view_user : System.Web.UI.Page
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
                analyst_name.Text=myReader["analyst_name"].ToString();
                analyst_email_id.Text = myReader["analyst_email_id"].ToString();
                analyst_contact_no.Text = myReader["analyst_contact_no"].ToString();
                analyst_address.Text = myReader["analyst_address"].ToString();
                analyst_city.Text=myReader["analyst_city"].ToString();
                analyst_state.Text=myReader["analyst_state"].ToString();
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
                    string[] imageColumns = { "rh_t", "rh_if", "rh_mf", "rh_rf", "rh_lf", "lh_t", "lh_if", "lh_mf", "lh_rf", "lh_lf" };

                    foreach (string columnPrefix in imageColumns)
                    {
                        for (int i = 1; i <= 3; i++)
                        {
                            string columnName = columnPrefix + "_" + i;
                            string imageUrl = myReader[columnName].ToString() != "" ? "data:image/png;base64," + myReader[columnName] : "../icons/loading.png";
                            var imageControl = (System.Web.UI.WebControls.Image)UpdatePanel1.FindControl(columnPrefix + "_" + i + "_img");

                            if (imageControl != null)
                            {
                                imageControl.ImageUrl = imageUrl;
                            }
                            else
                            {
                                //finger_lbl.Text += "<br>" + "Image control not found: " + columnPrefix + "_" + i + "_img";
                            }
                        }
                    }

                    full_name.Text = myReader["full_name"].ToString();
                    father_husband_name.Text = myReader["father_husband_name"].ToString();
                    mother_name.Text = myReader["mother_name"].ToString();
                    address.Text = myReader["address"].ToString();
                    contact_no.Text = myReader["contact_no"].ToString();
                    email_id.Text = myReader["email_id"].ToString();
                    customer_id_hf.Value = myReader["userid_plain"].ToString();
                    analyst_id.Value = myReader["analyst_id"].ToString();
                    if(myReader["report_by"].ToString()=="Admin")
                    {
                        report_by_admin_cb.Checked = true;
                    }
                    if (myReader["report_by"].ToString() == "Analyst")
                    {
                        report_by_analyst_cb.Checked = true;
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

    public void checkStatus(string str_column_name)
    {
        SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader = null;
        string str_command = "select * from users where sr=@sr ";
        SqlCommand myCommand = new SqlCommand(str_command, con1);
        myCommand.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
        //myCommand.Parameters.AddWithValue("@status_"+ str_column_name, "status_" + str_column_name);
        myReader = myCommand.ExecuteReader();

        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                string str_status=myReader["status_"+ str_column_name].ToString();
                if (str_status=="0")
                {
                    pending_btn.CssClass = "btn btn-sm btn-success";
                    submit_btn.CssClass = "btn btn-sm btn-light";
                    retake_btn.CssClass = "btn btn-sm btn-light";
                    buttons_div.Visible = true;
                }
                if (str_status == "1")
                {
                    pending_btn.CssClass = "btn btn-sm btn-light";
                    submit_btn.CssClass = "btn btn-sm btn-success";
                    retake_btn.CssClass = "btn btn-sm btn-light";
                    buttons_div.Visible = true;
                }
                if (str_status == "2")
                {
                    pending_btn.CssClass = "btn btn-sm btn-light";
                    submit_btn.CssClass = "btn btn-sm btn-light";
                    retake_btn.CssClass = "btn btn-sm btn-success";
                    buttons_div.Visible = true;
                }
            }
        }
        else
        {
        }
        con1.Close();
        con1.Dispose();
        myReader.Close();
    }

    public System.Drawing.Image ConvertBase64ToImage(string base64String)
    {
        byte[] imageBytes = Convert.FromBase64String(base64String);

        using (MemoryStream ms = new MemoryStream(imageBytes))
        {
            return System.Drawing.Image.FromStream(ms);
        }
    }

    public string fill_current_data(string query, string sr, string sql_con)
    {
        finger_lbl.Text = "Click view to show data";
        img_preview.ImageUrl = "";
        finger_hf.Value = "";

        string status = "false";
        SqlConnection con1 = new SqlConnection(sql_con);
        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select * from users where sr=@sr", con1);
        myCommand.Parameters.AddWithValue("@sr", sr);
        myReader = myCommand.ExecuteReader();
        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                if (myReader[query].ToString() == "" || myReader[query].ToString() == null)
                {
                    finger_lbl.ForeColor = System.Drawing.Color.Red;
                    img_preview.ImageUrl = "data:image/png;base64,"+myReader[query].ToString();
                }
                else
                {
                    finger_lbl.ForeColor = System.Drawing.Color.Black;
                    img_preview.ImageUrl = "data:image/png;base64," + myReader[query].ToString();
                }
                status = "true";
            }
        }
        else
        {
            status = "false";
        }
        con1.Close();
        con1.Dispose();
        myReader.Close();
        return status;
    }

    public void fillHL()
    {
        try
        {
            r1_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=r1";
            r2_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=r2";
            r3_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=r3";
            r4_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=r4";
            r5_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=r5";
            
            l1_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=l1";
            l2_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=l2";
            l3_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=l3";
            l4_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=l4";
            l5_hl.NavigateUrl = "single-finger-view.aspx?sr=" + Request.QueryString["sr"].ToString() + "&f=l5";
        }
        catch (Exception ex)
        { }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            fillDetails();
            fillAnalystDetails();
            fillHL();
        }
    }

    protected void rh_t_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_t_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Thumb (Center)";
            column_name_lbl.Text = "rh_t_1";
            checkStatus("rh_t_1");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_t_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_t_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Thumb (Left)";
            column_name_lbl.Text = "rh_t_2";
            checkStatus("rh_t_2");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_t_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_t_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Thumb (Right)";
            column_name_lbl.Text = "rh_t_3";
            checkStatus("rh_t_3");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_if_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_if_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Index Finger (Center)";
            column_name_lbl.Text = "rh_if_1";
            checkStatus("rh_if_1");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_if_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_if_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Index Finger (Left)";
            column_name_lbl.Text = "rh_if_2";
            checkStatus("rh_if_2");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_if_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_if_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Index Finger (Right)";
            column_name_lbl.Text = "rh_if_3";
            checkStatus("rh_if_3");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_mf_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_mf_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Middle Finger (Center)";
            column_name_lbl.Text = "rh_mf_1";
            checkStatus("rh_mf_1");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_mf_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_mf_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Middle Finger (Left)";
            column_name_lbl.Text = "rh_mf_2";
            checkStatus("rh_mf_2");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_mf_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_mf_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Middle Finger (Right)";
            column_name_lbl.Text = "rh_mf_3";
            checkStatus("rh_mf_3");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_rf_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_rf_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Ring Finger (Center)";
            column_name_lbl.Text = "rh_rf_1";
            checkStatus("rh_rf_1");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_rf_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_rf_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Ring Finger (Left)";
            column_name_lbl.Text = "rh_rf_2";
            checkStatus("rh_rf_2");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_rf_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_rf_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Ring Finger (Right)";
            column_name_lbl.Text = "rh_rf_3";
            checkStatus("rh_rf_3");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_lf_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_lf_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Little Finger (Center)";
            column_name_lbl.Text = "rh_lf_1";
            checkStatus("rh_lf_1");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_lf_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_lf_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Little Finger (Left)";
            column_name_lbl.Text = "rh_lf_2";
            checkStatus("rh_lf_2");
        }
        catch (Exception ex)
        { }
    }

    protected void rh_lf_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("rh_lf_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Right Hand - Little Finger (Right)";
            column_name_lbl.Text = "rh_lf_3";
            checkStatus("rh_lf_3");
        }
        catch (Exception ex)
        { }
    }


    protected void lh_t_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_t_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Thumb (Center)";
            column_name_lbl.Text = "lh_t_1";
            checkStatus("lh_t_1");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_t_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_t_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Thumb (Left)";
            column_name_lbl.Text = "lh_t_3";
            checkStatus("lh_t_3");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_t_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_t_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Thumb (Right)";
            column_name_lbl.Text = "lh_t_2";
            checkStatus("lh_t_2");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_if_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_if_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Index Finger (Center)";
            column_name_lbl.Text = "lh_if_1";
            checkStatus("lh_if_1");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_if_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_if_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Index Finger (Left)";
            column_name_lbl.Text = "lh_if_3";
            checkStatus("lh_if_3");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_if_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_if_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Index Finger (Right)";
            column_name_lbl.Text = "lh_if_2";
            checkStatus("lh_if_2");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_mf_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_mf_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Middle Finger (Center)";
            column_name_lbl.Text = "lh_mf_1";
            checkStatus("lh_mf_1");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_mf_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_mf_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Middle Finger (Left)";
            column_name_lbl.Text = "lh_mf_3";
            checkStatus("lh_mf_3");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_mf_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_mf_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Middle Finger (Right)";
            column_name_lbl.Text = "lh_mf_2";
            checkStatus("lh_mf_2");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_rf_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_rf_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Ring Finger (Center)";
            column_name_lbl.Text = "lh_rf_1";
            checkStatus("lh_rf_1");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_rf_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_rf_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Ring Finger (Left)";
            column_name_lbl.Text = "lh_rf_3";
            checkStatus("lh_rf_3");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_rf_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_rf_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Ring Finger (Right)";
            column_name_lbl.Text = "lh_rf_2";
            checkStatus("lh_rf_2");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_lf_1_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_lf_1", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Little Finger (Center)";
            column_name_lbl.Text = "lh_lf_1";
            checkStatus("lh_lf_1");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_lf_3_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_lf_3", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Little Finger (Left)";
            column_name_lbl.Text = "lh_lf_3";
            checkStatus("lh_lf_3");
        }
        catch (Exception ex)
        { }
    }

    protected void lh_lf_2_btn_Click(object sender, EventArgs e)
    {
        try
        {
            fill_current_data("lh_lf_2", Request.QueryString["Sr"], EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            finger_lbl.Text = "Left Hand - Little Finger (Right)";
            column_name_lbl.Text = "lh_lf_2";
            checkStatus("lh_lf_2");
        }
        catch (Exception ex)
        { }
    }

    protected void pending_btn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"],EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("update users set status_" + column_name_lbl.Text + "='0' where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            checkStatus(column_name_lbl.Text);
        }
        catch(Exception ex)
        {
        }
    }

    protected void submit_btn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("update users set status_" + column_name_lbl.Text + "='1' where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            checkStatus(column_name_lbl.Text);
        }
        catch (Exception ex)
        {
        }
    }

    protected void retake_btn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("update users set status_" + column_name_lbl.Text + "='2' where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            checkStatus(column_name_lbl.Text);
        }
        catch (Exception ex)
        {
        }
    }


    protected void report_by_admin_cb_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("update users set report_by='Admin' where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            report_by_analyst_cb.Checked = false;
        }
        catch (Exception ex)
        {
        }
    }

    protected void report_by_analyst_cb_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("update users set report_by='Analyst' where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            report_by_admin_cb.Checked = false;
        }
        catch (Exception ex)
        {
        }
    }
}