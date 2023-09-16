<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-page-5.aspx.cs" Inherits="view_page_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page 5</title>
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
        /* CSS */
        .button-82-pushable {
            position: relative;
            border: none;
            background: transparent;
            padding: 0;
            cursor: pointer;
            outline-offset: 4px;
            transition: filter 250ms;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
        }

        .button-82-shadow {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 12px;
            background: hsl(0deg 0% 0% / 0.25);
            will-change: transform;
            transform: translateY(2px);
            transition: transform 600ms cubic-bezier(.3, .7, .4, 1);
        }

        .button-82-edge {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 12px;
            background: linear-gradient( to left, hsl(340deg 100% 16%) 0%, hsl(340deg 100% 32%) 8%, hsl(340deg 100% 32%) 92%, hsl(340deg 100% 16%) 100% );
        }

        .button-82-front {
            display: block;
            position: relative;
            padding: 8px 23px;
            border-radius: 12px;
            font-size: 16px;
            color: white;
            background: hsl(345deg 100% 47%);
            will-change: transform;
            transform: translateY(-4px);
            transition: transform 600ms cubic-bezier(.3, .7, .4, 1);
        }

        @media (min-width: 768px) {
            .button-82-front {
                font-size: 14px;
                padding: 8px 8px;
                font-weight: 600;
            }
        }

        .button-82-pushable:hover {
            filter: brightness(110%);
            -webkit-filter: brightness(110%);
        }

            .button-82-pushable:hover .button-82-front {
                transform: translateY(-6px);
                transition: transform 250ms cubic-bezier(.3, .7, .4, 1.5);
            }

        .button-82-pushable:active .button-82-front {
            transform: translateY(-2px);
            transition: transform 34ms;
        }

        .button-82-pushable:hover .button-82-shadow {
            transform: translateY(4px);
            transition: transform 250ms cubic-bezier(.3, .7, .4, 1.5);
        }

        .button-82-pushable:active .button-82-shadow {
            transform: translateY(1px);
            transition: transform 34ms;
        }

        .button-82-pushable:focus:not(:focus-visible) {
            outline: none;
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
                                <span style="font-style: italic; text-align: justify; font-family: cursive; text-shadow: 1px 1px 4px #c6c1c1;">All humans possess 8 types intelligences in varying amount and each person has different intellectual composition. Intelligence depends majorly on four factors, i.e,Nature,Nurture,Time & Place.</span>
                            </div>
                            <div class="col-lg-12 mt-2 p-1 text-center text-white" style="background: #00AF50">
                                <span style="font-size: 20px; font-family: monospace; font-weight: 900">The Theory Of Multiple Intelligences (MI)</span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-7 pt-2 pb-3 text-center">
                                <div style="text-align: justify"><span>The Theory of Multiple Intelligence is designed & developed by Professor <span class="text-danger">Dr.Howard Gardner.</span> He is a renowned Psychologist, educationist and professor of cognition & education at Harvard graduate school.</span></div>
                                <div style="text-align: justify"><span>Gardner is best known in education circles for his Theory of Multiple Intelligences. In 1983 he wrote his world famous book</span></div>
                                <div class="text-center text-danger"><span>"FRAMES OF MIND"</span></div>
                                <div style="text-align: justify"><span>The Multiple Intelligence theory aroused and attracted warm response worldwide from all spheres of education & psychology. According to gardner all humans possess all 8 intelligences in varying amount and each person has different intellectual composition.</span></div>

                            </div>
                        </div>
                        <div style="border-bottom: 2px solid green"></div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Self Connection</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability to Reason, Calculate, Recognize & Explore Patterns. Understanding Relation Between Cause & Effects. Analyzing & Solving Problems.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Understanding</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Facial & Sensual</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Expressions</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Observations</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Connection With Strangers</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Imaginations</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Physical & Sexual</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Emotions</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-3 text-center p-2">
                                <button class="button-82-pushable col-12" role="button">
                                    <span class="button-82-shadow"></span>
                                    <span class="button-82-edge"></span>
                                    <span class="button-82-front text">Interpretations</span>
                                </button>
                            </div>
                            <div class="col-9" style="border-bottom: 2px solid green">
                                <div><span>The Ability To Interpret, Create Visual  Images, Pictorial Imagination. Mental Manipulation Of Space, Objects, Pictures & Colors In Visual Display.</span></div>
                            </div>
                        </div>

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
