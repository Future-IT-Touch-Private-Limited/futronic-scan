<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-page-6.aspx.cs" Inherits="view_page_6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page 6</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
    <link rel="stylesheet" type="text/css" href="assets/css/admin.css">
    <meta name="robots" content="noindex,nofollow" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="report_by_hf" runat="server" />
        <asp:HiddenField ID="analyst_id_hf" runat="server" />
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 pt-3 mt-3">

                        <div class="row">
                            <div class="col-4 text-center">
                                <img src='<%= report_logo %>' style="width: 100px" />
                                <div class="text-center">
                                    <span style="background-image: linear-gradient(130deg,#ff7a18,#af002d 41.07%,#319197 76.05%); -webkit-text-fill-color: transparent; -webkit-background-clip: text; font-size: 16px; font-weight: 900;"><strong><%= report_organisation %></strong></span>
                                </div>
                            </div>
                            <div class="col-8 pt-4">
                                <span style="font-style: italic; text-align: justify; font-family: cursive; text-shadow: 1px 1px 4px #c6c1c1;">Intelligence is the ability to acquire, understand, learn and use knowledge. It's the capacity of reasoning & understanding aptitudes, relationships, facts & meanings & producing results.</span>
                            </div>
                            <div class="col-lg-12 mt-2 p-1 text-center text-white" style="background: #00AF50">
                                <span style="font-size: 20px; font-family: monospace; font-weight: 900">Synopsis Of Your Report Analysis</span>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-4">

                                <div class="row mb-2">
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Self Connection</span>
                                    </div>
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="r1_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Understanding</span>
                                    </div>
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="r2_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Facial & Sensual</span>
                                    </div>
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="r3_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Expressions</span>
                                    </div>
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="r4_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Observations</span>
                                    </div>
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="r5_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                </div>

                            </div>

                            <div class="col-4 text-center">
                                <img src="images/page-6-head.png" width="150" />
                            </div>

                            <div class="col-4">

                                <div class="row mb-2">
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="l1_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Stranger's Connection</span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="l2_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Imaginations</span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="l3_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Physical & Sexual</span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="l4_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Emotions</span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-4" style="border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">
                                            <asp:Label ID="l5_percent" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                    <div class="col-8 text-center" style="background: #8063A1; border: 1px solid black">
                                        <span class="text-white">Interpretations</span>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-4">
                                <div class="row mb-2">
                                    <div class="col-12 text-center" style="background: #FFFF00; border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">Brain Dominance</span>
                                    </div>
                                    <div class="col-12 text-center pt-2">
                                        <img src="images/page-6-brain.png" width="150" />
                                    </div>
                                </div>
                                <div class="row mb-5 mt-3">
                                    <div class="col-8 text-center p-1" style="background: #F9BE8F; border: 2px solid white">
                                        <span class="text-dark fw-bolder" style="font-size: 18px">Left Brain</span>
                                    </div>
                                    <div class="col-4 text-center p-1" style="border: 2px solid white; background: #F9BE8F">
                                        <span style="color: #000; font-weight: bold; font-size: 18px">
                                            <asp:Label ID="left_brain_percent" Font-Size="18px" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-8 text-center p-1" style="background: #F9BE8F; border: 2px solid white">
                                        <span class="text-dark fw-bolder" style="font-size: 18px">Right Brain</span>
                                    </div>
                                    <div class="col-4 text-center p-1" style="border: 2px solid white; background: #F9BE8F">
                                        <span style="color: #000; font-weight: bold; font-size: 18px">
                                            <asp:Label ID="right_brain_percent" Font-Size="18px" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4"></div>
                            <div class="col-4">
                                <div class="row mb-2">
                                    <div class="col-12 text-center" style="background: #FFFF00; border: 1px solid black">
                                        <span style="color: #C41111; font-weight: bold">Learning Styles</span>
                                    </div>
                                </div>
                                <div class="col-12 text-center pt-2">
                                    <img src="images/page-6-help.png" width="250" />
                                </div>

                                <div class="row mb-2">
                                    <div class="col-4 text-center p-1" style="border: 2px solid white; background: #8063A1">
                                        <span style="color: #fff; font-weight: bold; font-size: 18px">
                                            <asp:Label ID="visual_percent" Font-Size="18px" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                    <div class="col-8 text-center p-1" style="background: #8063A1; border: 2px solid white">
                                        <span class="text-white fw-bolder" style="font-size: 18px"><i>VISUAL</i></span>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-4 text-center p-1" style="border: 2px solid white; background: #E16B09">
                                        <span style="color: #fff; font-weight: bold; font-size: 18px">
                                            <asp:Label ID="auditory_percent" Font-Size="18px" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                    <div class="col-8 text-center p-1" style="background: #E16B09; border: 2px solid white">
                                        <span class="text-white fw-bolder" style="font-size: 18px"><i>AUDITORY</i></span>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-4 text-center p-1" style="border: 2px solid white; background: #00AF50">
                                        <span style="color: #fff; font-weight: bold; font-size: 18px">
                                            <asp:Label ID="kinesthetic_percent" Font-Size="18px" runat="server" Text="0%"></asp:Label></span>
                                    </div>
                                    <div class="col-8 text-center p-1" style="background: #00AF50; border: 2px solid white">
                                        <span class="text-white fw-bolder" style="font-size: 18px"><i>KINESTHETIC</i></span>
                                    </div>
                                </div>

                            </div>

                            <div class="col-12 text-center">
                                <span style="font-size: 15px; font-weight: bold">Know Your Personality</span>
                                <div class="text-center">
                                    <img src="images/page-6-mask.png" width="200" />
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-4 offset-4">
                                <div class="row mb-2">
                                    <div class="col-6 text-center" style="background: #94B3D6; border: 1px solid black">
                                        <span class="text-dark"><b>Primary</b></span>
                                    </div>
                                    <div class="col-6 text-center" style="border: 1px solid black">
                                        <span style="color: #000; font-weight: bold">DOVE</span>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-6 text-center" style="background: #F9BE8F; border: 1px solid black">
                                        <span class="text-dark"><b>Secondary</b></span>
                                    </div>
                                    <div class="col-6 text-center" style="border: 1px solid black">
                                        <span style="color: #000; font-weight: bold">STEADY</span>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>

                    <div class="col-lg-8 offset-lg-2 mt-2 p-1 text-center text-white" style="background: #00AF50">
                        <span style="font-size: 14px; font-family: monospace; font-weight: 900"><%= report_footer %></span>
                    </div>



                </div>
            </div>
        </section>
    </form>
</body>
</html>
