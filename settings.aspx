<%@ Page Title="" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-header-left">
                        <h3>View/Edit Analyst Details
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
                        <li class="breadcrumb-item active">View/Edit Analyst Details</li>
                    </ol>
                    <!-- Breadcrumb end -->

                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header pb-0">
                        <h5>View/Edit Analyst Details</h5>
                    </div>
                    <div class="card-body admin-form">
                        <div class="row">
                            <div class="form-group col-md-6 col-sm-6">
                                <label>Admin Organisation <span class="font-danger">*</span></label>
                                <asp:TextBox ID="admin_organisation" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6 col-sm-6">
                                <label>Admin Organisation's Tag Line <span class="font-danger">*</span></label>
                                <asp:TextBox ID="admin_organisation_tag_line" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Admin Name <span class="font-danger">*</span></label>
                                <asp:TextBox ID="admin_name" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Admin Email <span class="font-danger">*</span></label>
                                <asp:TextBox ID="admin_email" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Admin Contact No. <span class="font-danger">*</span></label>
                                <asp:TextBox ID="admin_contact" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-12">
                                <label>Admin Address <span class="font-danger">*</span></label>
                                <asp:TextBox ID="admin_address" TextMode="MultiLine" Rows="3" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-12">
                                <label>Report's Footer Text <span class="font-danger">*</span></label>
                                <asp:TextBox ID="report_footer" TextMode="MultiLine" Rows="3" class="form-control" runat="server"></asp:TextBox>
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
                            <asp:Button ID="updatebtn" OnClick="updatebtn_Click" runat="server" class="btn btn-pill btn-gradient color-4" Text="Update Admin Details" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header pb-0">
                        <h5>Admin Logo</h5>
                    </div>
                    <div class="card-body admin-form">
                        <asp:HiddenField ID="current_logo_hf" runat="server" />
                        <asp:Image ID="Image1" runat="server" CssClass="img-fluid" />
                        <div class="text-center pt-3">
                            <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Panel runat="server" Visible="false" ID="errordiv_upload" class="alert alert-danger alert-dismissible fade show" Style="background: #b41414" role="alert">
                                    <strong>
                                        <asp:Label ID="errorlbl_upload_lbl" ForeColor="White" runat="server" Text="errsdf sdf"></asp:Label></strong>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </asp:Panel>
                                <asp:Panel runat="server" Visible="false" ID="successdiv_upload" class="alert alert-success alert-dismissible fade show" Style="background: #0a9112" role="alert">
                                    <strong>
                                        <asp:Label ID="successlbl_upload_lbl" ForeColor="White" runat="server" Text=""></asp:Label></strong>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="form-btn">
                            <asp:Button ID="upload_logo_btn" OnClick="upload_logo_btn_Click" runat="server" class="btn btn-pill btn-gradient color-4" Text="Upload Logo" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>