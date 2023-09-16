<%@ Page Title="Completed Fingerprints of Users" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="completed-fingerprints.aspx.cs" Inherits="completed_fingerprints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-header-left">
                        <h3>All Users  
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
                        <li class="breadcrumb-item active">All Users</li>
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
                        <h5>Total:
                            <asp:Label ID="total_analysts_lbl" Font-Bold="true" runat="server" Text="0"></asp:Label></h5>
                    </div>
                    <div class="card-body payment-table">
                        <div id="batchDelete" class="transactions jsgrid" style="position: relative; height: auto; width: 100%;">
                            <div class="jsgrid-grid-header jsgrid-header-scrollbar">
                                <table class="jsgrid-table table table-hover table-bordered">
                                    <tr class="jsgrid-header-row">
                                        <th>User ID</th>
                                        <th>User Name</th>
                                        <th>Analyst</th>
                                        <th>Email ID</th>
                                        <th>Contact No.</th>
                                        <th>Account Date</th>
                                        <th>Status</th>
                                        <th>View</th>
                                    </tr>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                        <ItemTemplate>
                                            <tr class="jsgrid-row">
                                                <td>
                                                    <asp:Label ID="userid_plain" runat="server" Text='<%# Eval("userid_plain") %>'></asp:Label></td>
                                                <td><%# Eval("full_name") %></td>
                                                <td><%# Eval("analyst_id") %></td>
                                                <td><%# Eval("email_id") %></td>
                                                <td><%# Eval("contact_no") %></td>
                                                <td><%# Eval("short_date") %></td>
                                                <td><span><%# Eval("account_status") %></span></td>
                                                <td><a href='view-user.aspx?sr=<%# Eval("sr") %>'>View/Edit</a></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </table>
                            </div>

                            <div class="jsgrid-pager-container" style="display: none;">
                                <div class="jsgrid-pager">Pages: <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a href="javascript:void(0);">First</a></span> <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a href="javascript:void(0);">Prev</a></span> <span class="jsgrid-pager-page jsgrid-pager-current-page">1</span> <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a href="javascript:void(0);">Next</a></span> <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a href="javascript:void(0);">Last</a></span> &nbsp;&nbsp; 1 of 1 </div>
                            </div>
                            <div class="jsgrid-load-shader" style="display: none; position: absolute; inset: 0px; z-index: 1000;"></div>
                            <div class="jsgrid-load-panel" style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">Please, wait...</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row pt-4">
            <div class="col-lg-6 offset-lg-3 pb-3">
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click">First</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkPrevious" runat="server" OnClick="lnkPrevious_Click">Previous</asp:LinkButton>
                            </td>
                            <td>
                                <asp:DataList ID="RepeaterPaging" runat="server"
                                    OnItemCommand="RepeaterPaging_ItemCommand"
                                    OnItemDataBound="RepeaterPaging_ItemDataBound" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Pagingbtn" runat="server"
                                            CommandArgument='<%# Eval("PageIndex") %>' CommandName="newpage"
                                            Text='<%# Eval("PageText") %>' Width="20px"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">Next</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkLast" runat="server" OnClick="lnkLast_Click">Last</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-center">
                                <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
