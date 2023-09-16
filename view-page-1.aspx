<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-page-1.aspx.cs" Inherits="view_page_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page 1</title>
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

                    <div class="col-lg-6 offset-lg-3 pt-3 mt-3">
                        <div class="col-lg-12 p-2 text-center text-white" style="background:#00AF50">
                            <span style="font-size:20px; font-family:monospace; font-weight:900">Advanced DermatoGlyphics Innate Intelligence Analysis</span>
                        </div>
                        <div class="text-center pt-4 pb-3">
                            <span style="font-size:20px; font-family:monospace; ">Innate Intelligence Assessment of</span>
                        </div>
                        <div class="text-center pb-4">
                            <span style="font-size:26px; font-family:cursive; font-weight:600"><%= report_analyst_name %></span>
                        </div>
                        <div class="text-center pt-5 pb-2">
                            <img src='<%= report_logo %>' style=" max-width:200px" class="img-fluid" />
                        </div>
                        <div class="text-center">
                            <span style="background-image:linear-gradient(130deg,#ff7a18,#af002d 41.07%,#319197 76.05%); -webkit-text-fill-color: transparent; -webkit-background-clip: text; font-size:40px; font-weight:900;"><strong><%= report_organisation %></strong></span>
                        </div>
                        <div class="text-center pb-3">
                            <span style="font-size:20px; font-family:monospace;"><%= report_organisation_tagline %></span>
                        </div>
                        <div class="text-center pt-5 pb-2">
                            <span style="font-size:15px; font-family:cursive; font-weight:600">Authorized Partner</span>
                        </div>
                        <div class="text-center">
                            <div style="display:flex; justify-content: center;">
                                <div style="height:200px; width:350px; border:3px solid #375F92; border-radius:25px">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 p-2 mt-4 text-center text-white" style="background:#00AF50">
                            <span style="font-size:20px; font-family:monospace; font-weight:900">Client Code #LP <%= user_userid_plain %></span>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </form>
</body>
</html>
