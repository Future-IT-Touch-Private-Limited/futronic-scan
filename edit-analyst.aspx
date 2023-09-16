<%@ Page Title="View/Edit Analyst Details" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="edit-analyst.aspx.cs" Inherits="edit_analyst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            <div class="form-group col-md-12 col-sm-12">
                                <label>Analyst Organisation <span class="font-danger">*</span></label>
                                <asp:TextBox ID="analyst_organisation" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label>Analyst ID <span class="font-danger">*</span></label>
                                <asp:TextBox ID="analyst_id" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label>Gender <span class="font-danger">*</span></label>
                                <asp:DropDownList ID="gender" class="form-control" runat="server">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label>Analyst Name <span class="font-danger">*</span></label>
                                <asp:TextBox ID="analyst_name" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label>Email ID <span class="font-danger">*</span></label>
                                <asp:TextBox ID="analyst_email_id" ReadOnly="true" TextMode="Email" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label>Analyst Contact No. <span class="font-danger">*</span></label>
                                <asp:TextBox ID="analyst_contact_no" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>State <span class="font-danger">*</span></label>
                                <asp:DropDownList ID="analyst_state" class="form-control" runat="server">
                                    <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Assam</asp:ListItem>
                                    <asp:ListItem>Bihar</asp:ListItem>
                                    <asp:ListItem Selected="True">Chandigarh</asp:ListItem>
                                    <asp:ListItem>Chhattisgarh</asp:ListItem>
                                    <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                    <asp:ListItem>Delhi</asp:ListItem>
                                    <asp:ListItem>Goa</asp:ListItem>
                                    <asp:ListItem>Gujarat</asp:ListItem>
                                    <asp:ListItem>Haryana</asp:ListItem>
                                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Jammu</asp:ListItem>
                                    <asp:ListItem>Jharkhand</asp:ListItem>
                                    <asp:ListItem>Karnataka</asp:ListItem>
                                    <asp:ListItem>Kerala</asp:ListItem>
                                    <asp:ListItem>Ladakh</asp:ListItem>
                                    <asp:ListItem>Lakshadweep</asp:ListItem>
                                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                    <asp:ListItem>Maharashtra</asp:ListItem>
                                    <asp:ListItem>Manipur</asp:ListItem>
                                    <asp:ListItem>Meghalaya</asp:ListItem>
                                    <asp:ListItem>Mizoram</asp:ListItem>
                                    <asp:ListItem>Nagaland</asp:ListItem>
                                    <asp:ListItem>Odisha</asp:ListItem>
                                    <asp:ListItem>Puducherry</asp:ListItem>
                                    <asp:ListItem>Punjab</asp:ListItem>
                                    <asp:ListItem>Rajasthan</asp:ListItem>
                                    <asp:ListItem>Sikkim</asp:ListItem>
                                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                                    <asp:ListItem>Telangana</asp:ListItem>
                                    <asp:ListItem>Uttarakhand</asp:ListItem>
                                    <asp:ListItem>West Bengal</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>City <span class="font-danger">*</span></label>
                                <asp:TextBox ID="analyst_city" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-12">
                                <label>Address <span class="font-danger">*</span></label>
                                <asp:TextBox ID="analyst_address" TextMode="MultiLine" Rows="3" class="form-control" runat="server"></asp:TextBox>
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
                            <asp:Button ID="updatebtn" OnClick="updatebtn_Click" runat="server" class="btn btn-pill btn-gradient color-4" Text="Update Analyst Details" />
                            <a href="all-analysts.aspx" class="btn btn-pill btn-dashed color-4">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header pb-0">
                        <h5>Analyst Logo</h5>
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
