<%@ Page Title="View User Details" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="view-user.aspx.cs" Inherits="view_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .s_sze {
            font-size: 13px;
            font-weight: 500;
        }

        .round_cb {
            font-weight: bold;
            background: #d2d7f9;
            border-radius: 50%;
            padding: 5px 10px 5px 10px;
        }

        .stuff {
            padding-top: 60px;
        }

        /* basic css */
        input[type=checkbox] {
            display: none;
        }

        .__label,
        p {
            padding-left: 30px;
        }

        .check-box-div {
            position: relative;
            margin-bottom: 20px;
        }

        /* checkbox css */
        .__label {
            cursor: pointer;
        }

            .__label span {
                display: block;
                position: absolute;
                left: 0;
                -webkit-transition-duration: 0.3s;
                -moz-transition-duration: 0.3s;
                transition-duration: 0.3s;
            }

            .__label .__circle {
                background: #FFF;
                left: -30px;
                top: -30px;
                height: 80px;
                width: 80px;
                z-index: -1;
                border-radius: 50%;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
            }

            .__label .__box {
                border: 2px solid #000;
                height: 20px;
                width: 20px;
                z-index: 888;
                -webkit-transition-delay: 0.2s;
                -moz-transition-delay: 0.2s;
                transition-delay: 0.2s;
            }

            .__label .__check {
                top: -7px;
                left: 6px;
                width: 12px;
                height: 24px;
                border: 2px solid #0f9d58;
                border-top: none;
                border-left: none;
                opacity: 0;
                z-index: 888;
                -webkit-transform: rotate(180deg);
                -moz-transform: rotate(180deg);
                transform: rotate(180deg);
                -webkit-transition-delay: 0.3s;
                -moz-transition-delay: 0.3s;
                transition-delay: 0.3s;
            }

        /* handling click events */

        /* bubble animation */

        @-webkit-keyframes growCircle {

            0%, 100% {
                -webkit-transform: scale(0);
            }

            70% {
                background: #DDD;
                -webkit-transform: scale(1.25);
            }
        }

        @-moz-keyframes growCircle {

            0%, 100% {
                -moz-transform: scale(0);
            }

            70% {
                background: #DDD;
                -moz-transform: scale(1.25);
            }
        }

        @keyframes growCircle {

            0%, 100% {
                transform: scale(0);
            }

            70% {
                background: #DDD;
                transform: scale(1.25);
            }
        }

        /* when checkbox is checked */
        .__label .__circle {
            animation: growCircle 0.3s ease;
            animation-duration: 0.3s;
            animation-timing-function: ease;
            animation-delay: 0s;
            animation-iteration-count: 1;
            animation-direction: normal;
            animation-fill-mode: none;
            animation-play-state: running;
            animation-name: growCircle;
        }

        input[type=checkbox]:checked ~ .__label .__box {
            opacity: 0;
            -webkit-transform: scale(0) rotate(-180deg);
            -moz-transform: scale(0) rotate(-180deg);
            transform: scale(0) rotate(-180deg);
        }

        input[type=checkbox]:checked ~ .__label .__check {
            opacity: 1;
            -webkit-transform: scale(1) rotate(45deg);
            -moz-transform: scale(1) rotate(45deg);
            transform: scale(1) rotate(45deg);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="scrollPosition" runat="server" />
            <div class="container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="page-header-left">
                                <h3>View User Details</h3>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <!-- Breadcrumb start -->
                            <ol class="breadcrumb pull-right">
                                <li class="breadcrumb-item">
                                    <a href="index.html">
                                        <i class="fa fa-home"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">View Users</li>
                            </ol>
                            <!-- Breadcrumb end -->
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row report-summary">

                    <div class="col-xl-4 xl-4">
                        <asp:Panel runat="server" ID="data_pnl" Height="500" Style="overflow-y: scroll; overflow-x: hidden" class="card g-0">
                            <div class="card-body g-0 management-table">
                                <div class="table-responsive">
                                    <table class="table table-bordernone">
                                        <tbody>
                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important; border-top: 2px solid #1507be70 !important">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_t_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Thumb - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_t_1_btn" OnClientClick="storeScrollPosition();" OnClick="rh_t_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-primary text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_t_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Thumb - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_t_2_btn" OnClientClick="storeScrollPosition();" OnClick="rh_t_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-primary text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_t_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Thumb - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_t_3_btn" OnClientClick="storeScrollPosition();" OnClick="rh_t_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-primary text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_if_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Index Finger - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_if_1_btn" OnClientClick="storeScrollPosition();" OnClick="rh_if_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-success text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_if_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Index Finger - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_if_2_btn" OnClientClick="storeScrollPosition();" OnClick="rh_if_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-success text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_if_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Index Finger - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_if_3_btn" OnClientClick="storeScrollPosition();" OnClick="rh_if_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-success text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_mf_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Middle Finger - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_mf_1_btn" OnClientClick="storeScrollPosition();" OnClick="rh_mf_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-warning text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_mf_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Middle Finger - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_mf_2_btn" OnClientClick="storeScrollPosition();" OnClick="rh_mf_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-warning text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_mf_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Middle Finger - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_mf_3_btn" OnClientClick="storeScrollPosition();" OnClick="rh_mf_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-warning text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_rf_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Ring Finger - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_rf_1_btn" OnClientClick="storeScrollPosition();" OnClick="rh_rf_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-info text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_rf_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Ring Finger - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_rf_2_btn" OnClientClick="storeScrollPosition();" OnClick="rh_rf_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-info text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_rf_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Ring Finger - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_rf_3_btn" OnClientClick="storeScrollPosition();" OnClick="rh_rf_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-info text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_lf_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Little Finger - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_lf_1_btn" OnClientClick="storeScrollPosition();" OnClick="rh_lf_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-dark text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_lf_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Little Finger - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_lf_2_btn" OnClientClick="storeScrollPosition();" OnClick="rh_lf_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-dark text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #1507be70 !important; border-right: 4px solid #1507be70 !important; border-bottom: 2px solid #1507be70 !important">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="rh_lf_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Right Hand</h6>
                                                            <span>Little Finger - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="rh_lf_3_btn" OnClientClick="storeScrollPosition();" OnClick="rh_lf_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-dark text-white border-0" Text="View" />
                                                </td>
                                            </tr>




                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important; border-top: 2px solid #12be078c !important">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_t_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Thumb - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_t_1_btn" OnClientClick="storeScrollPosition();" OnClick="lh_t_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-primary text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_t_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Thumb - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_t_3_btn" OnClientClick="storeScrollPosition();" OnClick="lh_t_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-primary text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_t_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Thumb - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_t_2_btn" OnClientClick="storeScrollPosition();" OnClick="lh_t_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-primary text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_if_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Index Finger - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_if_1_btn" OnClientClick="storeScrollPosition();" OnClick="lh_if_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-success text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_if_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Index Finger - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_if_3_btn" OnClientClick="storeScrollPosition();" OnClick="lh_if_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-success text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_if_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Index Finger - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_if_2_btn" OnClientClick="storeScrollPosition();" OnClick="lh_if_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-success text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_mf_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Middle Finger - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_mf_1_btn" OnClientClick="storeScrollPosition();" OnClick="lh_mf_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-warning text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_mf_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Middle Finger - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_mf_3_btn" OnClientClick="storeScrollPosition();" OnClick="lh_mf_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-warning text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_mf_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Middle Finger - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_mf_2_btn" OnClientClick="storeScrollPosition();" OnClick="lh_mf_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-warning text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_rf_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Ring Finger - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_rf_1_btn" OnClientClick="storeScrollPosition();" OnClick="lh_rf_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-info text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_rf_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Ring Finger - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_rf_3_btn" OnClientClick="storeScrollPosition();" OnClick="lh_rf_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-info text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1 bg-light" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_rf_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Ring Finger - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_rf_2_btn" OnClientClick="storeScrollPosition();" OnClick="lh_rf_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-info text-dark border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_lf_1_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Little Finger - Center</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_lf_1_btn" OnClientClick="storeScrollPosition();" OnClick="lh_lf_1_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-dark text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important;">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_lf_3_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Little Finger - Right</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_lf_3_btn" OnClientClick="storeScrollPosition();" OnClick="lh_lf_3_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-dark text-white border-0" Text="View" />
                                                </td>
                                            </tr>

                                            <tr class="border-1" style="border-left: 4px solid #12be078c !important; border-right: 4px solid #12be078c !important; border-bottom: 2px solid #12be078c !important">
                                                <td>
                                                    <div class="media">
                                                        <asp:Image ID="lh_lf_2_img" ImageUrl="~/icons/loading.png" runat="server" class="img-fluid" />
                                                        <div class="media-body">
                                                            <h6>Left Hand</h6>
                                                            <span>Little Finger - Left</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Button ID="lh_lf_2_btn" OnClientClick="storeScrollPosition();" OnClick="lh_lf_2_btn_Click" runat="server" CssClass="label label-shadow ms-1 bg-dark text-white border-0" Text="View" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>


                    <div class="col-xl-4 xl-4">
                        <div class="card">
                            <div class="card-header p-2">

                                <h6 class="text-center">
                                    <asp:HiddenField ID="finger_hf" runat="server" />
                                    <asp:HiddenField ID="customer_id_hf" runat="server" />
                                    <asp:Label ID="finger_lbl" runat="server" Text="Click view to show data"></asp:Label>
                                </h6>
                            </div>
                            <div class="card-body p-2 ps-3 management-table text-center">
                                <asp:Image ID="img_preview" CssClass="img-fluid" runat="server" />
                                <asp:Panel ID="buttons_div" Visible="false" runat="server">
                                    <div class="text-center">
                                        Mark status as
                                    </div>
                                    <div>
                                        <asp:Label ID="column_name_lbl" Visible="false" runat="server" Text=""></asp:Label>
                                    </div>
                                    <asp:Button ID="pending_btn" OnClick="pending_btn_Click" CssClass="btn btn-light btn-md" runat="server" Text="Pending" />
                                    <asp:Button ID="submit_btn" OnClick="submit_btn_Click" CssClass="btn btn-light btn-md" runat="server" Text="Submit" />
                                    <asp:Button ID="retake_btn" OnClick="retake_btn_Click" CssClass="btn btn-light btn-md" runat="server" Text="Retake" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-4 xl-4">
                        <div class="card g-0">
                            <div class="card-header p-2">
                                <h6 class="text-center">User Details</h6>
                            </div>
                            <div class="card-body p-2 ps-3 management-table">
                                <div class="pb-3">
                                    Full Name:
                            <asp:Label Font-Bold="true" ID="full_name" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="pb-3">
                                    Father/Husband Name:
                            <asp:Label Font-Bold="true" ID="father_husband_name" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="pb-3">
                                    Mother Name:
                            <asp:Label Font-Bold="true" ID="mother_name" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="pb-3">
                                    Address:
                            <asp:Label Font-Bold="true" ID="address" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="pb-3">
                                    Mobile:
                            <asp:Label Font-Bold="true" ID="contact_no" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="pb-3">
                                    Email Id:
                            <asp:Label Font-Bold="true" ID="email_id" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="card g-0">
                            <div class="card-header p-2">
                                <h6 class="text-center">Analyst Details</h6>
                                <asp:HiddenField ID="analyst_id" runat="server" />
                            </div>
                            <div class="card-body p-2 ps-3 management-table">
                                <div class="pb-3">
                                    Analyst Name:
                            <asp:Label Font-Bold="true" ID="analyst_name" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="pb-3">
                                    Analyst Email Id:
                            <asp:Label Font-Bold="true" ID="analyst_email_id" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="pb-3">
                                    Analyst Contact No:
                            <asp:Label Font-Bold="true" ID="analyst_contact_no" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="pb-3">
                                    Address: 
                                    <asp:Label Font-Bold="true" ID="analyst_address" runat="server" Text=""></asp:Label>
                                    <asp:Label Font-Bold="true" ID="analyst_city" runat="server" Text=""></asp:Label>
                                    <asp:Label Font-Bold="true" ID="analyst_state" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="row">
                    <div class="col-lg-8 mb-2">
                        <div class="container text-center">
                            <asp:HyperLink ID="r1_hl" runat="server" Target="_blank" CssClass="btn btn-outline-primary btn-lg mb-2">R-1</asp:HyperLink>
                            <asp:HyperLink ID="r2_hl" runat="server" Target="_blank" CssClass="btn btn-outline-primary btn-lg mb-2">R-2</asp:HyperLink>
                            <asp:HyperLink ID="r3_hl" runat="server" Target="_blank" CssClass="btn btn-outline-primary btn-lg mb-2">R-3</asp:HyperLink>
                            <asp:HyperLink ID="r4_hl" runat="server" Target="_blank" CssClass="btn btn-outline-primary btn-lg mb-2">R-4</asp:HyperLink>
                            <asp:HyperLink ID="r5_hl" runat="server" Target="_blank" CssClass="btn btn-outline-primary btn-lg mb-2">R-5</asp:HyperLink>
                        </div>
                        <div class="container text-center mb-5 pb-5">
                            <asp:HyperLink ID="l1_hl" runat="server" Target="_blank" CssClass="btn btn-outline-danger btn-lg mb-2">L-1</asp:HyperLink>
                            <asp:HyperLink ID="l2_hl" runat="server" Target="_blank" CssClass="btn btn-outline-danger btn-lg mb-2">L-2</asp:HyperLink>
                            <asp:HyperLink ID="l3_hl" runat="server" Target="_blank" CssClass="btn btn-outline-danger btn-lg mb-2">L-3</asp:HyperLink>
                            <asp:HyperLink ID="l4_hl" runat="server" Target="_blank" CssClass="btn btn-outline-danger btn-lg mb-2">L-4</asp:HyperLink>
                            <asp:HyperLink ID="l5_hl" runat="server" Target="_blank" CssClass="btn btn-outline-danger btn-lg mb-2">L-5</asp:HyperLink>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group check-box-div"> 
                            <asp:CheckBox ID="report_by_admin_cb" AutoPostBack="true" OnCheckedChanged="report_by_admin_cb_CheckedChanged" runat="server" />
                            <label for="<%=report_by_admin_cb.ClientID %>" class="__label">
                                <span></span>
                                <span class="__check"></span>
                                <span class="__box"></span>
                                Report by Admin
                            </label>
                        </div>
                        <div class="form-group check-box-div">
                            <asp:CheckBox ID="report_by_analyst_cb" AutoPostBack="true" OnCheckedChanged="report_by_analyst_cb_CheckedChanged" runat="server" />
                            <label for="<%=report_by_analyst_cb.ClientID %>" class="__label">
                                <span></span>
                                <span class="__check"></span>
                                <span class="__box"></span>
                                Report by Analyst
                            </label>
                        </div>
                    </div>
                </div>

            </div>

            <script type="text/javascript">
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                    setTimeout(function () {
                        var scrollPosition = parseInt(document.getElementById('<%= scrollPosition.ClientID %>').value);
                        document.getElementById('<%= data_pnl.ClientID %>').scrollTop = scrollPosition;
                    }, 0);
                });

                storeScrollPosition();

                function storeScrollPosition() {
                    document.getElementById('<%= scrollPosition.ClientID %>').value = document.getElementById('<%= data_pnl.ClientID %>').scrollTop;
                }
            </script>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
