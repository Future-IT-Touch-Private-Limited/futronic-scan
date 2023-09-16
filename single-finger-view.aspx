<%@ Page Title="Single Finger View" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="single-finger-view.aspx.cs" Inherits="one_finger_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <style>
        /* Apply custom styles to Select2 dropdown items */
        .select2-results__option {
            display: block !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-header-left">
                        <h3>Single Finger View</h3>
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
                        <li class="breadcrumb-item active">View Fingerprints</li>
                    </ol>
                    <!-- Breadcrumb end -->
                </div>
            </div>
        </div>
    </div>


    <div class="container-fluid mb-5 pb-5">
        <div class="row report-summary">
            <div class="col-xl-4 xl-4">
                <div class="text-center"><strong>Left</strong></div>
                <asp:Image ID="left_img" Style="border: 1px solid gray" runat="server" />
            </div>
            <div class="col-xl-4 xl-4">
                <div class="text-center"><strong>Center</strong></div>
                <asp:Image ID="center_img" Style="border: 1px solid gray" runat="server" />
            </div>
            <div class="col-xl-4 xl-4">
                <div class="text-center"><strong>Right</strong></div>
                <asp:Image ID="right_img" Style="border: 1px solid gray" runat="server" />
            </div>
        </div>

        <div class="row mt-5 report-summary">
            <div class="col-lg-8 offset-lg-2">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="pt-2 pb-2">
                                    <div><strong>Pattern:</strong></div>
                                    <asp:DropDownList ID="pattern" CssClass="form-control select2" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="pt-2 pb-2">
                                    <div><strong>Value:</strong></div>
                                    <asp:TextBox ID="value" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="pt-2 pb-2">
                                    <div><strong>Note:</strong></div>
                                    <asp:TextBox ID="note" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="pt-2 pb-2 text-center">
                                    <asp:Button ID="update_btn" CssClass="btn btn-md btn-primary" OnClick="update_btn_Click" runat="server" Text="Update" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <section>
        <asp:HiddenField ID="userid_plain_hf" runat="server" />
        <div class="row">

            <div class="col-xl-6">
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
            </div>

            <div class="col-xl-6">
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
    </section>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        jQuery(document).ready(function () {
            // Initialize Select2 on the DropDownList control
            jQuery(".select2").select2();
        });
    </script>

</asp:Content>
