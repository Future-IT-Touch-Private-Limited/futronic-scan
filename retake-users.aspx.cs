﻿using System;
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

public partial class retake_users : System.Web.UI.Page
{
    string EncryptionKey = "futuretouchadmin123";
    string EncryptionKey2 = "future@adm@123";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    PagedDataSource pgsource = new PagedDataSource();
    int findex, lindex;
    DataRow dr;
    DataTable GetData()
    {
        DataTable dtable = new DataTable();
        SqlConnection con = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        string strcon = "select * from users where status_lh_lf_1='2' or status_lh_lf_2='2' or status_lh_lf_3='2' or status_lh_rf_1='2' or status_lh_rf_2='2' or status_lh_rf_3='2' or status_lh_mf_1='2' or status_lh_mf_2='2' or status_lh_mf_3='2' or status_lh_if_1='2' or status_lh_if_2='2' or status_lh_if_3='2' or status_lh_t_1='2' or status_lh_t_2='2' or status_lh_t_3='2' or status_rh_t_1='2' or status_rh_t_2='2' or status_rh_t_3='2' or status_rh_if_1='2' or status_rh_if_2='2' or status_rh_if_3='2' or status_rh_mf_1='2' or status_rh_mf_2='2' or status_rh_mf_3='2' or status_rh_rf_1='2' or status_rh_rf_2='2' or status_rh_rf_3='2' or status_rh_lf_1='2' or status_rh_lf_2='2' or status_rh_lf_3='2' ORDER BY sr DESC";
        SqlCommand cmd = new SqlCommand(strcon, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(dtable);
        con.Close();
        con.Dispose();
        return dtable;
    }

    private void BindDataList()
    {
        //try
        //{
        DataTable dt = GetData();
        pgsource.DataSource = dt.DefaultView;
        pgsource.AllowPaging = true;
        pgsource.PageSize = 50;
        pgsource.CurrentPageIndex = CurrentPage;
        ViewState["totpage"] = pgsource.PageCount;
        lblpage.Text = "Page " + (CurrentPage + 1) + " of " + pgsource.PageCount;
        lnkPrevious.Enabled = !pgsource.IsFirstPage;
        lnkNext.Enabled = !pgsource.IsLastPage;
        lnkFirst.Enabled = !pgsource.IsFirstPage;
        lnkLast.Enabled = !pgsource.IsLastPage;
        Repeater1.DataSource = pgsource;
        Repeater1.DataBind();
        doPaging();
        RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //}
        //catch (Exception ex)
        //{

        //}
    }

    private void doPaging()
    {
        //try
        //{
        DataTable dt = new DataTable();
        dt.Columns.Add("PageIndex");
        dt.Columns.Add("PageText");
        findex = CurrentPage - 5;
        if (CurrentPage > 5)
        {
            lindex = CurrentPage + 5;
        }
        else
        {
            lindex = 10;
        }
        if (lindex > Convert.ToInt32(ViewState["totpage"]))
        {
            lindex = Convert.ToInt32(ViewState["totpage"]);
            findex = lindex - 10;
        }
        if (findex < 0)
        {
            findex = 0;
        }
        for (int i = findex; i < lindex; i++)
        {
            DataRow dr = dt.NewRow();
            dr[0] = i;
            dr[1] = i + 1;
            dt.Rows.Add(dr);
        }
        RepeaterPaging.DataSource = dt;
        RepeaterPaging.DataBind();
        //}
        //catch (Exception ex)
        //{
        //}
    }

    private int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
            {
                return 0;
            }
            else
            {
                return ((int)ViewState["CurrentPage"]);
            }
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }
    protected void lnkFirst_Click(object sender, EventArgs e)
    {
        //try
        //{
        CurrentPage = 0;
        BindDataList();
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void lnkLast_Click(object sender, EventArgs e)
    {
        //try
        //{
        CurrentPage = (Convert.ToInt32(ViewState["totpage"]) - 1);
        BindDataList();
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        //try
        //{
        CurrentPage -= 1;
        BindDataList();
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void lnkNext_Click(object sender, EventArgs e)
    {
        //try
        //{
        CurrentPage += 1;
        BindDataList();
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void RepeaterPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //try
        //{
        if (e.CommandName.Equals("newpage"))
        {
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            BindDataList();
        }
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void RepeaterPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //try
        //{
        LinkButton lnkPage = (LinkButton)e.Item.FindControl("Pagingbtn");
        if (lnkPage.CommandArgument.ToString() == CurrentPage.ToString())
        {
            lnkPage.Enabled = false;
            lnkPage.BackColor = System.Drawing.Color.FromName("#FFCC01");
        }

        //}
        //catch (Exception ex)
        //{
        //    Response.Write(ex.Message);
        //}
    }

    public void total_clicks_count()
    {
        try
        {
            SqlConnection con01 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            string myScalarQuery01 = "select count(*) from users where status_lh_lf_1='2' or status_lh_lf_2='2' or status_lh_lf_3='2' or status_lh_rf_1='2' or status_lh_rf_2='2' or status_lh_rf_3='2' or status_lh_mf_1='2' or status_lh_mf_2='2' or status_lh_mf_3='2' or status_lh_if_1='2' or status_lh_if_2='2' or status_lh_if_3='2' or status_lh_t_1='2' or status_lh_t_2='2' or status_lh_t_3='2' or status_rh_t_1='2' or status_rh_t_2='2' or status_rh_t_3='2' or status_rh_if_1='2' or status_rh_if_2='2' or status_rh_if_3='2' or status_rh_mf_1='2' or status_rh_mf_2='2' or status_rh_mf_3='2' or status_rh_rf_1='2' or status_rh_rf_2='2' or status_rh_rf_3='2' or status_rh_lf_1='2' or status_rh_lf_2='2' or status_rh_lf_3='2'";
            SqlCommand myCommand01 = new SqlCommand(myScalarQuery01, con01);
            myCommand01.Connection.Open();
            int countuser01 = (int)myCommand01.ExecuteScalar();
            con01.Close();
            con01.Dispose();
            total_analysts_lbl.Text = countuser01.ToString();
        }
        catch (Exception ex)
        {
            total_analysts_lbl.Text = "0";
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataList();
            total_clicks_count();
        }
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label analyst_username_3des = (Label)e.Item.FindControl("analyst_username_3des");
        try
        {
            analyst_username_3des.Text = EncDec.DecryptString(analyst_username_3des.Text, EncryptionKey);
        }
        catch (Exception ex)
        { }
    }
}