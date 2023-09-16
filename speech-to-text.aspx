<%@ Page Title="Speech to Text" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="speech-to-text.aspx.cs" Inherits="speech_to_text" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .select-opt {
            padding: 5px 2px 5px 2px;
            font-size: 18px;
            border: 1px solid #ccc;
            height: 34px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: 0px;
            background-color: #fdd1d1;
            outline: none;
            min-width: 25px;
            border-radius: 4px;
            text-align: center;
        }

            .select-opt::-ms-expand {
                display: none;
            }

        @media screen and (min-width:0\0) {
            .select-opt {
                background: none\9;
                padding: 5px\9;
            }
        }

        .dspnone {
            display: none;
        }

        .tooltip2 {
            position: relative;
            display: inline-block;
        }

            .tooltip2 .tooltiptext {
                visibility: hidden;
                width: 140px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px;
                position: absolute;
                z-index: 1;
                bottom: 150%;
                left: 50%;
                margin-left: -75px;
                opacity: 0;
                transition: opacity 0.3s;
            }

                .tooltip2 .tooltiptext::after {
                    content: "";
                    position: absolute;
                    top: 100%;
                    left: 50%;
                    margin-left: -5px;
                    border-width: 5px;
                    border-style: solid;
                    border-color: #555 transparent transparent transparent;
                }

            .tooltip2:hover .tooltiptext {
                visibility: visible;
                opacity: 1;
            }

        .rt_box {
            border: 1px solid #e0e0e0;
            display: block;
            padding: 6px 8px;
            width: 100%;
            float: left;
            background: #fff;
            border-top: none;
        }

            .rt_box a {
                display: inline-block;
                padding-right: 15px;
                background: #F7FAFC;
                color: #505050;
                font-family: nunito_sansbold;
                border-left: 4px solid #4284F3;
                padding: 3px 10px;
                font-size: 12px;
                text-decoration: none;
                margin: 6px;
            }

        @media screen and (min-width: 600px) {
            #mobiletype {
                visibility: visible;
                display: none;
            }
        }

        .related_a {
            background-color: #f7f8f9;
            border-radius: 2px;
            box-shadow: 0 1px 5px 0 #cbd6e2;
            font-size: 0.95em;
            font-weight: 500;
            color: inherit;
            position: relative;
            display: inline-block;
            border-left: 5px solid #ff6a06;
            padding: 1em 1em 1em 1em;
            width: 100%;
            margin: 0;
            max-width: 350px;
            margin-bottom: 15px;
            text-decoration: none;
            font-weight: 600;
        }

            .related_a:hover {
                box-shadow: 0 10px 25px -5px #cbd6e2;
                transition: .3s ease-in-out;
                color: inherit;
                text-decoration: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-header-left">
                        <h3>Speech to Text
                            <small>Welcome to admin panel</small>
                        </h3>
                    </div>
                </div>
                <div class="col-sm-6">

                    <!-- Breadcrumb start -->
                    <ol class="breadcrumb pull-right">
                        <li class="breadcrumb-item">
                            <a href="dash.aspx">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item active">Speech to Text</li>
                    </ol>
                    <!-- Breadcrumb end -->

                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header pb-0">
                        <h5>Speech to Text</h5>
                    </div>
                    <div class="card-body admin-form">
                        <div class="row">
                            <div class="form-group col-md-12 col-sm-12">
                                <label>Input <span class="font-danger"></span></label>
                                <asp:TextBox ID="valuetxt" TextMode="MultiLine" Rows="15" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Panel runat="server" Visible="false" ID="error_panel" class="alert alert-danger alert-dismissible fade show" Style="background: #b41414" role="alert">
                                    <strong>
                                        <asp:Label ID="errorlbl" ForeColor="White" runat="server" Text="errsdf sdf"></asp:Label></strong>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </asp:Panel>
                                <asp:Panel runat="server" Visible="false" ID="success_panel" class="alert alert-success alert-dismissible fade show" Style="background: #0a9112" role="alert">
                                    <strong>
                                        <asp:Label ID="successlbl" ForeColor="White" runat="server" Text=""></asp:Label></strong>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </asp:Panel>
                            </div>
                        </div>

                        <div class="form-btn">
                            <span id="A3" onclick="dictEnglish()" class="btn btn-light mb-2 tooltip2">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-mic-fill" viewBox="0 0 16 16">
                                        <path d="M5 3a3 3 0 0 1 6 0v5a3 3 0 0 1-6 0V3z" />
                                        <path fill-rule="evenodd" d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z" />
                                    </svg><span class="tooltiptext" id="myTooltip7">Speak to English</span>&nbsp;&nbsp;English</span>
                            <span class="tooltip2">
                                <span onclick="copyFromResult()" onmouseout="copyFromSource()" class="btn btn-outline-primary btn-sm mb-2" style="padding-left: 10px; padding-right: 10px; color: black">
                                    <span class="tooltiptext" id="myTooltip03">Copy to clipboard</span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-break-fill" viewBox="0 0 16 16"><path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V9H2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3zM2 12h12v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-2zM.5 10a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H.5z" /></svg>
                                    Copy
                                </span>
                            </span>
                            <span id="A01" onclick="clearOutput()" class="btn btn-outline-danger btn-sm mb-2 tooltip2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                </svg><span class="tooltiptext" id="myTooltip022">Clear Text</span></span>

                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <script>
        function copyFromSource() {
            var copyText = document.getElementById(['<%=valuetxt.ClientID %>']);
            copyText.select();
            copyText.setSelectionRange(0, 99999)
            document.execCommand("copy");
            var tooltip = document.getElementById("myTooltip3");
            tooltip.innerHTML = "Copied ";
        }


        //====================================================================
        function outFuncSource() {
            var tooltip = document.getElementById("myTooltip3");
            tooltip.innerHTML = "Copy to clipboard";
        }

        function clearSource() {
            document.getElementById(['<%=valuetxt.ClientID %>']).value = '';
        }
        function clearOutput() {
            document.getElementById(['<%=valuetxt.ClientID %>']).value = '';
        }




        function dictEnglish() {
            if (window.hasOwnProperty('webkitSpeechRecognition')) {
                var recognition = new webkitSpeechRecognition();
                recognition.continuous = false;
                recognition.interimResults = false;
                recognition.lang = "en-US";
                recognition.start();
                recognition.onresult = function (e) {
                    document.getElementById(['<%=valuetxt.ClientID %>']).value += e.results[0][0].transcript;
                    recognition.stop();
                };
                recognition.onerror = function (e) {
                    recognition.stop();
                }
            }
        }
    </script>
</asp:Content>
