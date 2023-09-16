<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-page-2.aspx.cs" Inherits="view_page_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page 2</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
    <link rel="stylesheet" type="text/css" href="assets/css/admin.css">
    <meta name="robots" content="noindex,nofollow" />
    <style>
        .pd_25 {
            padding-top: 30px !important;
            padding-bottom: 30px !important;
        }

        td {
            border: 2px ridge gray !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="report_by_hf" runat="server" />
        <asp:HiddenField ID="analyst_id_hf" runat="server" />
        <section>
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 offset-lg-3 pt-1 mt-1">
                        <div class="row">
                            <div class="col-4 text-center">
                                <img src='<%= report_logo %>' style="width: 100px" />
                                <div class="text-center">
                                    <span style="background-image: linear-gradient(130deg,#ff7a18,#af002d 41.07%,#319197 76.05%); -webkit-text-fill-color: transparent; -webkit-background-clip: text; font-size: 16px; font-weight: 900;"><strong><%= report_organisation %></strong></span>
                                </div>
                            </div>
                            <div class="col-8 pt-4">
                                <span style="font-style: italic; text-align:justify; font-family: cursive;">Congratulations for taking the first step towards the decision of knowing your inborn potential through our advance dermatoglyphics analysis report. Hope you will have a transformative experience.</span>
                            </div>
                        </div>
                        <div class="col-lg-12 mt-2 p-1 text-center text-white" style="background: #00AF50">
                            <span style="font-size: 20px; font-family: monospace; font-weight: 900">Client Personal Information</span>
                        </div>
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-9">
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Name :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= user_full_name %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Gender :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= user_gender %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Date Of Birth :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= user_date_of_birth %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Age In Years :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= user_age_in_years %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Father/Guardian :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= user_father_husband_name %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Contact Numbers :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= user_contact_no %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Email Id :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= user_email_id %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Residential Address :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= user_address %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Report Date :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= report_date %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                </div>
                                <div class="col-12">
                                    <div class="text-center pt-4">
                                        <span style="color: #FF0000; font-size: 21px; font-weight: 700;">CONSULTANT</span>
                                    </div>
                                </div>

                                <div class="col-9">
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Name  :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= report_analyst_name %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Email ID  :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= report_analyst_email %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Contact Numbers  :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= report_contact_no %>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-4 text-end">
                                            <span style="font-family: monospace; font-style: italic; font-weight: 600;">Centre Address  :</span>
                                        </div>
                                        <div class="col-8" style="border-bottom: 1px solid #A6A6A6">
                                            <%= report_analyst_address %>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="text-center pt-3">
                                <span style="color: #FF0000; font-size: 21px; font-weight: 700;">DISCLAIMER</span>
                            </div>
                            <div>
                                <p style="color: #FF0000; font-size: 13px; font-weight: 500;">By agreeing to use this product voluntarily,you are giving your biometrics for DMIT only. Information provided herein is confidential, privilege and protected by work product immunity and other legal rules. The contents of this publication reflect the evaluations derived upon by the way of Dermatoglyphics only. This publication is for information purposes only. Opnions expressed should not be construed as medical or astrological advice. The particular's of any person's concern and circumstances should be discussed with a qualified Psychologist prior to making any decision which may affect the health and welfare of the individual. It is based on scientific studies, clinical experience or traditional usage as cited in each article. Our organization accepts no liability for the consequences of any actions taken on the basis of information provided, unless that information is subsequently confirmed in writing. Factors that affect innate intelligences are 1) Genetics, 2) Disease, 3) Body injury that could influence health conditions, behavior, nutrition, medicine and stimulation during pregnancy.</p>
                            </div>
                        </div>

                        <div class="col-lg-12 mt-2 p-1 text-center text-white" style="background: #00AF50">
                            <span style="font-size: 14px; font-family: monospace; font-weight: 900"><%= report_footer %></span>
                        </div>

                    </div>

                </div>
            </div>
        </section>
    </form>
</body>
</html>
