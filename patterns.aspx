<%@ Page Title="" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="patterns.aspx.cs" Inherits="patterns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-header-left">
                        <h3>Patterns</h3>
                    </div>
                </div>
                <div class="col-sm-6">
                    <!-- Breadcrumb start -->
                    <ol class="breadcrumb pull-right">
                        <li class="breadcrumb-item">
                            <a href="#">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item active">Patterns</li>
                    </ol>
                    <!-- Breadcrumb end -->
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-4">

                <div class="card">
                    <div class="card-body">
                        <div class="pt-2 pb-2">
                            <div><strong>Pattern Short Name:</strong></div>
                            <asp:TextBox ID="pattern_short_name" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="pt-2 pb-2">
                            <div><strong>Pattern Full Name:</strong></div>
                            <asp:TextBox ID="pattern_full_form" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
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
                        <div class="pt-2 pb-2">
                            <asp:Button ID="add_btn" OnClick="add_btn_Click" CssClass="btn btn-md btn-primary" runat="server" Text="Add" />
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-8">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th>Sr.</th>
                            <th>Short</th>
                            <th>Full</th>
                            <th>Action</th>
                        </tr>

                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td></td>
                                    <td><%# Eval("pattern_short_name") %></td>
                                    <td><%# Eval("pattern_full_form") %></td>
                                    <td><a href='edit-pattern.aspx?sr=<%# Eval("sr") %>'>Edit</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
