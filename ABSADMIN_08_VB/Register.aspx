<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="ABSADMIN_08_VB.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABS ADMIN ::Registration</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/StyleSheet1.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="Content/StyleAdmin.css" />
    <script src="Scripts/jquery-1.11.0.js" type="text/javascript"></script>
    <script src="Scripts/JavaScript1.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row profile">
                <div id="profilePane" class="col-md-3" style="height: 300px !important;">
                    <div class="profile-sidebar">
                        <!-- SIDEBAR USERPIC -->
                        <div class="profile-userpic">
                            <img src="imgs/User-icon.png" class="img-responsive img-circle" alt="" />
                        </div>
                        <!-- END SIDEBAR USERPIC -->
                        <!-- SIDEBAR USER TITLE -->
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name">
                                NEW USER
                            </div>
                            <div class="profile-usertitle-job">
                                ABS
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                       <%-- <div class="profile-userbuttons form-group-sm">
                            <button id="hidePaneBtn" class="btn btn-info input-sm  pull-right">
                                <i class="glyphicon glyphicon-align-justify"></i>
                            </button>
                            <br />
                        </div>--%>
                        <!-- END SIDEBAR BUTTONS -->
                        <!-- SIDEBAR MENU -->
                       <%-- <div class="profile-usermenu">
                            <ul class="nav">
                                <li class="active">
                                    <a href="dashboard.aspx">
                                        <i class="glyphicon glyphicon-home"></i>
                                        Dashboard </a>
                                </li>
                                <li>
                                    <a href="AD_SEC_USER_DETAIL.aspx">
                                        <i class="glyphicon glyphicon-user"></i>
                                        View Profile  </a>
                                </li>
                                <li>
                                    <a href="SignOut.aspx" target="_self">
                                        <i class="glyphicon glyphicon-ok"></i>
                                        Sign Out </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-flag"></i>
                                        Help </a>
                                </li>
                            </ul>
                        </div>--%>
                        <!-- END MENU -->
                    </div>
                </div>
                <div id="contentPane" class="col-md-9">
                    <div class="profile-content">
                        <h1 style="font-weight: bold; font-family: Century Gothic;">ABS - ADMIN
                        </h1>
                        <table class="table input-sm">
                            <tr>
                                <td class="auto-style1">
                                    <span id="procurePage" class="control-label" style="font-weight: bold; font-family: Century Gothic; font-size: 20pt;">New User</span>
                                </td>
                                <td></td>
                                <td>
                                    <a href="Default.aspx" class="btn btn-info input-sm pull-right"><i class="glyphicon glyphicon-lock"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div>
                                        <h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">Register
                                        </h3>
                                        <table align="center" border="0" class="tbl_main">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <table border="0" class="tbl_butt">
                                                        <tr>
                                                            <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:Button ID="cmdNew" CssClass="cmd_butt" Text="New Data" runat="server" />
                                                                &nbsp;
                                                                <asp:Button ID="cmdSave" CssClass="cmd_butt" Text="Save Data" runat="server" Visible="false" />
                                                                <asp:Button ID="cmdSaveN" CssClass="cmd_butt" Text="Save Data" runat="server" OnClientClick="JavaSave_Rtn()" />
                                                               <%-- &nbsp;</input>&nbsp;--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblMessage" Text="Status:" ForeColor="Red" runat="server"></asp:Label></td>
                                            </tr>

                                            <tr>
                                                <td valign="top">
                                                    <table align="left" width="100%">
                                                        <tr>
                                                            <td align="left" colspan="2" valign="top" class="tbl_caption">User Setup
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td colspan="2">
                                                                <hr />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblCustID" runat="server" Enabled="false" Text="Record ID:"></asp:Label>
                                                            </td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtUserID" runat="server" Enabled="false" EnableViewState="true" MaxLength="3" Width="100px"></asp:TextBox>
                                                                <asp:Label ID="lblRecNo" runat="server" Enabled="false" Text="Rec. No:"></asp:Label>
                                                                <asp:TextBox ID="txtRecNo" runat="server" Enabled="false" MaxLength="18"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblFullName" runat="server" Text="FullName:"></asp:Label>
                                                                &nbsp;</td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtName" runat="server" EnableViewState="true" MaxLength="49" Width="450px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblShortName" runat="server" Text="Short Name :"></asp:Label>
                                                                &nbsp;</td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtShortName" runat="server" EnableViewState="true" MaxLength="10" Width="100px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr id="type1" style="display: none;">
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblGroup" runat="server" Text="Group:"></asp:Label>
                                                                &nbsp;</td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtGroup" runat="server" Enabled="false" EnableViewState="true" MaxLength="3" Width="100px"></asp:TextBox>
                                                                <asp:DropDownList ID="cboGroup" runat="server" AutoPostBack="True" Visible="true" Width="200px">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr id="TransClassRow" style="display: none;">
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblRole" runat="server" Text="Role:"></asp:Label>
                                                                &nbsp;</td>
                                                            <td valign="top">
                                                                <asp:DropDownList ID="cboRole" runat="server" Visible="true" Width="200px">
                                                                </asp:DropDownList>
                                                                &nbsp;&nbsp;</td>
                                                        </tr>

                                                        <tr id="BranchRow">
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblBraNum" Text="Branch:" runat="server"></asp:Label>&nbsp;</td>
                                                            <td valign="top">&nbsp;<asp:TextBox ID="txtBranch" runat="server" EnableViewState="true" MaxLength="39" Width="400px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblCustPhone01" runat="server" Text="GSM/Mobile No:"></asp:Label>
                                                                &nbsp;</td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtCustPhone01" runat="server" EnableViewState="true" MaxLength="11" Width="200px"></asp:TextBox>
                                                                &nbsp;&nbsp;<asp:Label ID="lblCustPhone02" runat="server" Text="Land Line No:"></asp:Label>
                                                                <asp:TextBox ID="txtCustPhone02" runat="server" EnableViewState="true" MaxLength="11" Width="200px"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblCustEmail01" runat="server" Text="Email Address - 1:"></asp:Label>
                                                            </td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtCustEmail01" runat="server" EnableViewState="true" MaxLength="49" Width="450px"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblCustEmail02" runat="server" Text="Email Address - 2:"></asp:Label>
                                                            </td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtCustEmail02" runat="server" EnableViewState="true" MaxLength="49" Width="450px"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="left" valign="top" colspan="2" class="myMenu_Title">
                                                                <asp:Label ID="lblCustEmail5" runat="server" Text="Login Detail:" Font-Bold="False"></asp:Label>
                                                            </td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="right" valign="top" class="auto-style1">
                                                                <asp:Label ID="lblLoginName" runat="server" Text="Login Email"></asp:Label>
                                                            </td>
                                                            <td valign="top" class="auto-style1">
                                                                <asp:TextBox ID="txtLoginName" runat="server" EnableViewState="true" Width="447px" type="Email"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                                                            </td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtPassword" runat="server" EnableViewState="true" MaxLength="11" TextMode="Password" Width="200px"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblConPassword" runat="server" Text="Confirm Password:"></asp:Label>
                                                            </td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtConPassword" runat="server" EnableViewState="true" MaxLength="11" TextMode="Password" Width="200px"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td colspan="2" valign="top">&nbsp;</td>
                                                        </tr>

                                                    </table>
                                                </td>
                                            </tr>

                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <footer>
            <div class="container">
                <hr />
                <span class="pull-left" style="color: white; font-family: 'Century gothic'; font-size: 10pt; color: #000000;">&copy;<%= Now.Year %> - Afrik Business Software
                </span>
                <span class="pull-right" style="color: white; font-family: 'Century gothic'; font-size: 10pt; color: #000000;">Custodian And Allied Insurance Plc.
                </span>
            </div>
        </footer>

    </form>

</body>
</html>
