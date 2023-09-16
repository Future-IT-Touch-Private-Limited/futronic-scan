<%@ Page Title="Add Analyst" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="add-analyst.aspx.cs" Inherits="add_agent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-header-left">
                        <h3>Add Analyst
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
                        <li class="breadcrumb-item active">New Analyst</li>
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
                        <h5>Analyst details</h5>
                    </div>
                    <div class="card-body admin-form">
                        <div class="row gx-3">
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
                                <asp:TextBox ID="analyst_email_id" TextMode="Email" class="form-control" runat="server"></asp:TextBox>
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
                            <div class="form-group col-sm-6">
                                <asp:HiddenField ID="password_hf" runat="server" />
                                <label>Password  <span class="font-danger">*</span></label>
                                <div class="input-group has-validation">
                                    <asp:TextBox ID="analyst_password" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                    <span class="input-group-text" id="showpassword" onclick="Toggle()"><i class="fa fa-eye"></i></span>
                                </div>
                                <%--<asp:TextBox ID="analyst_password" TextMode="Password" class="form-control" runat="server"></asp:TextBox>--%>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Confirm Password  <span class="font-danger">*</span></label>
                                <asp:TextBox ID="analyst_confirm_password" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
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
                            <asp:Button ID="addbtn" OnClick="addbtn_Click" runat="server" class="btn btn-pill btn-gradient color-4" Text="Add Analyst" />
                            <a href="dash.aspx" class="btn btn-pill btn-dashed color-4">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Change the type of input to password or text
        function Toggle() {
            var temp = document.getElementById('<%= analyst_password.ClientID %>');
            if (temp.type === "password") {
                temp.type = "text";
                document.getElementById("showpassword").style.background = "#fff";
                document.getElementById("showpassword").innerHTML = '<i class="fa fa-eye-slash"></i>';
            }
            else {
                temp.type = "password";
                document.getElementById("showpassword").style.background = "#F0F0F0";
                document.getElementById("showpassword").innerHTML = '<i class="fa fa-eye"></i>';
            }
        }
    </script>

</asp:Content>
