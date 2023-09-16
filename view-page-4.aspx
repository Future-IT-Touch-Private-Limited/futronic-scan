<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-page-4.aspx.cs" Inherits="view_page_4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page 4</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
    <link rel="stylesheet" type="text/css" href="assets/css/admin.css">
    <meta name="robots" content="noindex,nofollow" />
    <link href="https://apexcharts.com/samples/assets/styles.css" rel="stylesheet" />
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
            border: 1px solid gray;
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
            border: 1px solid gray;
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
            border: 1px solid gray;
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

        .apexcharts-legend-text {
            font-size: 14px !important;
            font-weight: 600 !important;
        }

        .apexcharts-legend-series {
            line-height: 40px !important;
            border-bottom: 1px solid gray !important;
        }
    </style>
</head>
<body style="background: #fff">
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
                                <span style="font-style: italic; text-align: justify; font-family: cursive; text-shadow: 1px 1px 4px #c6c1c1;">The human intelligence & abilities can be divided into 4 major domains called quotients. Each quotient reflects a specific area of brain capabilities in dealing, handling & execution.</span>
                            </div>
                            <div class="col-lg-12 mt-2 p-1 text-center text-white" style="background: #00AF50">
                                <span style="font-size: 20px; font-family: monospace; font-weight: 900">Your Multiple Quotient Quadrants</span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 pt-2 pb-5 text-center">
                                <div id="page_4_chart"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <img src="images/page_4_img.png" width="150" />
                            </div>
                        </div>

                        <div class="row mb-2" style="border: 2px dashed gray">
                            <div class="col-1 text-center p-2" style="background: #0172c8; color: #fff; font-size: 24px">
                                <div class="text-white">IQ</div>
                            </div>
                            <div class="col-11" style="background: #008ffb1a; color: #000;">
                                <div>It is the ability responsible for Reasoning, Problem solving, Conceptual understanding, Judgement, Comprehension , Evaluation and Thinking.</div>
                            </div>
                        </div>

                        <div class="row mb-2" style="border: 2px dashed gray">
                            <div class="col-1 text-center p-2" style="background: #01ab71; color: #fff; font-size: 24px">
                                <div class="text-white">EQ</div>
                            </div>
                            <div class="col-11" style="background: #00e3963d; color: #000;">
                                <div>It is the ability to identify and manage your own emotions and the emotions of others. To handle social interactions judiciously and empathetically.</div>
                            </div>
                        </div>

                        <div class="row mb-2" style="border: 2px dashed gray">
                            <div class="col-1 text-center p-2" style="background: #eea008; color: #fff; font-size: 24px">
                                <div class="text-white">AQ</div>
                            </div>
                            <div class="col-11" style="background: #feb0193b; color: #000;">
                                <div>It is the ability to overcome a difficult or unpleasant situation, Courageous attitude & Adventure spirit. Quick or Instant response to the situation.</div>
                            </div>
                        </div>

                        <div class="row mb-3" style="border: 2px dashed gray">
                            <div class="col-1 text-center p-2" style="background: #e41231; color: #fff; font-size: 24px">
                                <div class="text-white">CQ</div>
                            </div>
                            <div class="col-11" style="background: #ff45602b; color: #000;">
                                <div>It is the ability to create something original. Imagination, Innovative ideas, Out of box thinking/solutions.</div>
                            </div>
                        </div>

                        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
                        <script>

                            var options = {
                                series: [44, 55, 13, 43],
                                chart: {
                                    width: 450,
                                    type: 'pie',
                                },
                                labels: ['Intelligent Quotient', 'Emotional Quotient', 'Adversity Quotient', 'Creativity Quotient'],
                                responsive: [{
                                    breakpoint: 380,
                                    options: {
                                        chart: {
                                            width: 450
                                        },
                                        legend: {
                                            position: 'bottom'
                                        }
                                    }
                                }]
                            };

                            var chart_page_4 = new ApexCharts(document.querySelector("#page_4_chart"), options);
                            chart_page_4.render();
                        </script>

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
