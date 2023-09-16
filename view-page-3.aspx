﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-page-3.aspx.cs" Inherits="view_page_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page 3</title>
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

        /* Strength button */
        .button_strength {
            padding: 0.6em 2em;
            border: none;
            outline: none;
            color: rgb(255, 255, 255);
            background: #0EB35A;
            cursor: pointer;
            position: relative;
            z-index: 0;
            border-radius: 10px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            font-weight: bold;
            border:1px solid gray;
        }

            .button_strength:before {
                content: "";
                background: linear-gradient( 45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000 );
                position: absolute;
                top: -2px;
                left: -2px;
                background-size: 400%;
                z-index: -1;
                filter: blur(5px);
                -webkit-filter: blur(5px);
                width: calc(100% + 4px);
                height: calc(100% + 4px);
                animation: glowing-button_strength 20s linear infinite;
                transition: opacity 0.3s ease-in-out;
                border-radius: 10px;
            }

        @keyframes glowing-button_strength {
            0% {
                background-position: 0 0;
            }

            50% {
                background-position: 400% 0;
            }

            100% {
                background-position: 0 0;
            }
        }

        .button_strength:after {
            z-index: -1;
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: #0EB35A;
            left: 0;
            top: 0;
            border-radius: 10px;
        }

        
        /* Weaker button */
        .button_weaker {
            padding: 0.6em 2em;
            border: none;
            outline: none;
            color: rgb(255, 255, 255);
            background: #C50606;
            cursor: pointer;
            position: relative;
            z-index: 0;
            border-radius: 10px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            font-weight: bold;
            border:1px solid gray;
        }

            .button_weaker:before {
                content: "";
                background: linear-gradient( 45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000 );
                position: absolute;
                top: -2px;
                left: -2px;
                background-size: 400%;
                z-index: -1;
                filter: blur(5px);
                -webkit-filter: blur(5px);
                width: calc(100% + 4px);
                height: calc(100% + 4px);
                animation: glowing-button_weaker 20s linear infinite;
                transition: opacity 0.3s ease-in-out;
                border-radius: 10px;
            }

        @keyframes glowing-button_weaker {
            0% {
                background-position: 0 0;
            }

            50% {
                background-position: 400% 0;
            }

            100% {
                background-position: 0 0;
            }
        }

        .button_weaker:after {
            z-index: -1;
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: #C50606;
            left: 0;
            top: 0;
            border-radius: 10px;
        }

        
        /* Average button */
        .button_average {
            padding: 0.6em 2em;
            border: none;
            outline: none;
            color: #000;
            background: #FFBA03;
            cursor: pointer;
            position: relative;
            z-index: 0;
            border-radius: 10px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            font-weight: bold;
            border:1px solid gray;
        }

            .button_average:before {
                content: "";
                background: linear-gradient( 45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000 );
                position: absolute;
                top: -2px;
                left: -2px;
                background-size: 400%;
                z-index: -1;
                filter: blur(5px);
                -webkit-filter: blur(5px);
                width: calc(100% + 4px);
                height: calc(100% + 4px);
                animation: glowing-button_average 20s linear infinite;
                transition: opacity 0.3s ease-in-out;
                border-radius: 10px;
            }

        @keyframes glowing-button_average {
            0% {
                background-position: 0 0;
            }

            50% {
                background-position: 400% 0;
            }

            100% {
                background-position: 0 0;
            }
        }

        .button_average:after {
            z-index: -1;
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: #FFBA03;
            left: 0;
            top: 0;
            border-radius: 10px;
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
                        <div class="row">
                            <div class="col-4 text-center">
                                <img src='<%= report_logo %>' style="width: 100px" />
                                <div class="text-center">
                                    <span style="background-image: linear-gradient(130deg,#ff7a18,#af002d 41.07%,#319197 76.05%); -webkit-text-fill-color: transparent; -webkit-background-clip: text; font-size: 16px; font-weight: 900;"><strong><%= report_organisation %></strong></span>
                                </div>
                            </div>
                            <div class="col-8 pt-4">
                                <span style="font-style: italic; text-align: justify; font-family: cursive; text-shadow: 1px 1px 4px #c6c1c1;">Congratulations for taking the first step towards the decision of knowing your inborn potential through our advance dermatoglyphics analysis report. Hope you will have a transformative experience.</span>
                            </div>
                        </div>

                        <table class="table table-bordered table-hover text-center" style="border: 4px ridge gray">
                            <tr style="border-bottom: 3px inset gray">
                                <td colspan="2" class="text-center" style="background: #FFFF99; text-shadow: 1px 1px 4px #c6c1c1;"><strong>LEFT BRAIN</strong></td>
                                <td colspan="6"></td>
                                <td colspan="2" class="text-center" style="background: #FFFF99; text-shadow: 1px 1px 4px #c6c1c1;"><strong>RIGHT BRAIN</strong></td>
                            </tr>
                            <tr style="border-bottom: 3px inset gray">
                                <td style="background: #F1F1F1; font-size: 13px; font-weight: 500;" colspan="2">Print Type & % RC</td>
                                <td style="background: #F1F1F1; font-size: 13px; font-weight: 500;" colspan="2">Functions</td>
                                <td style="background: #F1F1F1; font-size: 13px; font-weight: 500;" colspan="2">ZONES</td>
                                <td style="background: #F1F1F1; font-size: 13px; font-weight: 500;" colspan="2">Functions</td>
                                <td style="background: #F1F1F1; font-size: 13px; font-weight: 500;" colspan="2">Print Type & % RC</td>
                            </tr>
                            <%-- part 1 --%>
                            <tr>
                                <td style="width: 10%" class="pd_25"><b>R-1</b></td>
                                <td style="vertical-align: bottom; width: 10%"><b>
                                    <asp:Label ID="r1_percent" runat="server" Text="0%"></asp:Label></b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="r1_pattern" runat="server" Style="font-weight: 800;" Font-Italic="true" Font-Names="calibri" Text="Self Connection"></asp:Label></td>
                                <td style="width: 20%" colspan="2"><b>Power to Take Decisions</b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="l1_pattern" runat="server" Style="font-weight: 800;" Font-Italic="true" Font-Names="calibri" Text="Connection With Strangers"></asp:Label></td>
                                <td style="vertical-align: bottom;">
                                    <asp:Label ID="l1_percent" Font-Bold="true" runat="server" Text="0%"></asp:Label></td>
                                <td style="width: 10%" class="pd_25"><b>L-1</b></td>
                            </tr>
                            <tr style="border-bottom: 3px ridge gray" class="pd_25">
                                <td><b>
                                    <asp:Label ID="r1_short_pattern" runat="server" Text=""></asp:Label></b></td>
                                <td id="bg_r1" runat="server" style="background: #000">
                                    <asp:Label ID="r1_position" Font-Bold="true" ForeColor="#4F81BC" runat="server" Text=""></asp:Label></td>
                                <td colspan="2" style="background: #DDD9C4"><b>Action Zone</b></td>
                                <td id="bg_l1" runat="server" style="background: #000">
                                    <asp:Label ID="l1_position" Font-Bold="true" ForeColor="#0EB35A" runat="server" Text=""></asp:Label></td>
                                <td><b>
                                    <asp:Label ID="l1_short_pattern" runat="server" Text=""></asp:Label></b></td>
                            </tr>

                            <%-- part 2 --%>
                            <tr class="pd_25" style="border-top: 2px solid gray">
                                <td style="width: 10%" class="pd_25"><b>R-2</b></td>
                                <td style="vertical-align: bottom; width: 10%"><b>
                                    <asp:Label ID="r2_percent" runat="server" Text="0%"></asp:Label></b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="r2_pattern" Font-Italic="true" Style="font-weight: 800;" Font-Names="calibri" runat="server" Text="Understanding"></asp:Label></td>
                                <td style="width: 20%" colspan="2"><b>Way of Thinking</b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="l2_pattern" Font-Italic="true" Style="font-weight: 800;" Font-Names="calibri" runat="server" Text="Imaginations"></asp:Label></td>
                                <td style="vertical-align: bottom;">
                                    <asp:Label ID="l2_percent" Font-Bold="true" runat="server" Text="0%"></asp:Label></td>
                                <td style="width: 10%" class="pd_25"><b>L-2</b></td>
                            </tr>
                            <tr style="border-bottom: 3px ridge gray" class="pd_25">
                                <td><b>
                                    <asp:Label ID="r2_short_pattern" runat="server" Text=""></asp:Label></b></td>
                                <td id="bg_r2" runat="server" style="background: #000">
                                    <asp:Label ID="r2_position" Font-Bold="true" ForeColor="#000" runat="server" Text=""></asp:Label></td>
                                <td colspan="2" style="background: #DDD9C4"><b>Thoughts Zone</b></td>
                                <td id="bg_l2" runat="server" style="background: #000">
                                    <asp:Label ID="l2_position" Font-Bold="true" ForeColor="#000" runat="server" Text=""></asp:Label></td>
                                <td><b>
                                    <asp:Label ID="l2_short_pattern" runat="server" Text=""></asp:Label></b></td>
                            </tr>

                            <%-- part 3 --%>
                            <tr class="pd_25" style="border-top: 2px solid gray">
                                <td style="width: 10%" class="pd_25"><b>R-3</b></td>
                                <td style="vertical-align: bottom; width: 10%"><b>
                                    <asp:Label ID="r3_percent" runat="server" Text="0%"></asp:Label></b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="r3_pattern" Font-Italic="true" Style="font-weight: 800;" Font-Names="calibri" runat="server" Text="Facial & Sensual"></asp:Label></td>
                                <td style="width: 20%" colspan="2"><b>Fighting Physically With Situations or People</b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="l3_pattern" Font-Italic="true" Style="font-weight: 800;" Font-Names="calibri" runat="server" Text="Physical & Sexual"></asp:Label></td>
                                <td style="vertical-align: bottom;">
                                    <asp:Label ID="l3_percent" Font-Bold="true" runat="server" Text="0%"></asp:Label></td>
                                <td style="width: 10%" class="pd_25"><b>L-3</b></td>
                            </tr>
                            <tr style="border-bottom: 3px ridge gray" class="pd_25">
                                <td><b>
                                    <asp:Label ID="r3_short_pattern" runat="server" Text=""></asp:Label></b></td>
                                <td id="bg_r3" runat="server" style="background: #000">
                                    <asp:Label ID="r3_position" Font-Bold="true" ForeColor="#000" runat="server" Text=""></asp:Label></td>
                                <td colspan="2" style="background: #DDD9C4"><b>Physical & Sexual Zone</b></td>
                                <td id="bg_l3" runat="server" style="background: #000">
                                    <asp:Label ID="l3_position" Font-Bold="true" ForeColor="#000" runat="server" Text=""></asp:Label></td>
                                <td><b>
                                    <asp:Label ID="l3_short_pattern" runat="server" Text=""></asp:Label></b></td>
                            </tr>

                            <%-- part 4 --%>
                            <tr class="pd_25" style="border-top: 2px solid gray">
                                <td style="width: 10%" class="pd_25"><b>R-4</b></td>
                                <td style="vertical-align: bottom; width: 10%"><b>
                                    <asp:Label ID="r4_percent" runat="server" Text="0%"></asp:Label></b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="r4_pattern" Font-Italic="true" Style="font-weight: 800;" Font-Names="calibri" runat="server" Text="Expressions"></asp:Label></td>
                                <td style="width: 20%" colspan="2"><b>Feelings and Expressions</b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="l4_pattern" Font-Italic="true" Style="font-weight: 800;" Font-Names="calibri" runat="server" Text="Emotions"></asp:Label></td>
                                <td style="vertical-align: bottom;">
                                    <asp:Label ID="l4_percent" Font-Bold="true" runat="server" Text="0%"></asp:Label></td>
                                <td style="width: 10%" class="pd_25"><b>L-4</b></td>
                            </tr>
                            <tr style="border-bottom: 3px ridge gray" class="pd_25">
                                <td><b>
                                    <asp:Label ID="r4_short_pattern" runat="server" Text=""></asp:Label></b></td>
                                <td id="bg_r4" runat="server" style="background: #000">
                                    <asp:Label ID="r4_position" Font-Bold="true" ForeColor="#000" runat="server" Text=""></asp:Label></td>
                                <td colspan="2" style="background: #DDD9C4"><b>Emotional Zone</b></td>
                                <td id="bg_l4" runat="server" style="background: #000">
                                    <asp:Label ID="l4_position" Font-Bold="true" ForeColor="#000" runat="server" Text=""></asp:Label></td>
                                <td><b>
                                    <asp:Label ID="l4_short_pattern" runat="server" Text=""></asp:Label></b></td>
                            </tr>
                            <%-- part 5 --%>
                            <tr class="pd_25" style="border-top: 2px solid gray">
                                <td style="width: 10%" class="pd_25"><b>R-5</b></td>
                                <td style="vertical-align: bottom; width: 10%"><b>
                                    <asp:Label ID="r5_percent" runat="server" Text="0%"></asp:Label></b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="r5_pattern" Font-Italic="true" Style="font-weight: 800;" Font-Names="calibri" runat="server" Text="Observations"></asp:Label></td>
                                <td style="width: 20%" colspan="2"><b>Understanding of Surroundings</b></td>
                                <td style="width: 20%; background-color:#f1e4d882;" colspan="2" rowspan="2">
                                    <asp:Label ID="l5_pattern" Font-Italic="true" Style="font-weight: 800;" Font-Names="calibri" runat="server" Font-Bold="true" Text="Interpretations"></asp:Label></td>
                                <td style="vertical-align: bottom;">
                                    <asp:Label ID="l5_percent" Font-Bold="true" runat="server" Text="0%"></asp:Label></td>
                                <td style="width: 10%" class="pd_25"><b>L-5</b></td>
                            </tr>
                            <tr style="border-bottom: 3px ridge gray" class="pd_25">
                                <td><b>
                                    <asp:Label ID="r5_short_pattern" runat="server" Text=""></asp:Label></b></td>
                                <td id="bg_r5" runat="server" style="background: #000">
                                    <asp:Label ID="r5_position" Font-Bold="true" ForeColor="#000" runat="server" Text=""></asp:Label></td>
                                <td colspan="2" style="background: #DDD9C4"><b>Visual Zone</b></td>
                                <td id="bg_l5" runat="server" style="background: #000">
                                    <asp:Label ID="l5_position" Font-Bold="true" ForeColor="#000" runat="server" Text=""></asp:Label></td>
                                <td><b>
                                    <asp:Label ID="l5_short_pattern" runat="server" Text=""></asp:Label></b></td>
                            </tr>
                        </table>

                    </div>
                    <div class="col-lg-6 offset-lg-3 text-center">
                        <button class="button_strength" role="button">Strength</button>&nbsp;&nbsp;
                        <button class="button_average" role="button">Average</button>&nbsp;&nbsp;
                        <button class="button_weaker" role="button">Weaker</button>&nbsp;&nbsp;
                    </div>
                    <div class="col-lg-6 offset-lg-3 mt-2 p-1 text-center text-white" style="background: #00AF50">
                        <span style="font-size: 14px; font-family: monospace; font-weight: 900"><%= report_footer %></span>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
