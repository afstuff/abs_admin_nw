<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="forgotpassword.aspx.vb" Inherits="ABSADMIN_08_VB.forgotpassword" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>ABS ADMIN ::Registration</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/StyleSheet1.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="Content/StyleAdmin.css" />
    <script src="Scripts/jquery-1.11.0.js" type="text/javascript"></script>
    <script src="Scripts/JavaScript1.js"></script>
    
</head>
<body onload="FirstMsg">
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
                    </div>
                </div>
                <div id="contentPane" class="col-md-9">
                    <div class="profile-content">
                        <h1 style="font-weight: bold; font-family: Century Gothic;">ABS - ADMIN
                        </h1>
                        <table class="table input-sm">
                            <tr>
                                <td class="auto-style1">
                                    <span id="procurePage" class="control-label" style="font-weight: bold; font-family: Century Gothic; font-size: 20pt;">User Password</span>
                                </td>
                                <td></td>
                                <td>
                                    <a href="Default.aspx" class="btn btn-info input-sm pull-right"><i class="glyphicon glyphicon-lock"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div>
                                        <h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">Recovery
                                        </h3>
                                        <table align="center" border="0" class="tbl_main">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <table border="0" class="tbl_butt">
                                                        <tr>
                                                            <td valign="top">                                                                <%-- &nbsp;</input>&nbsp;--%>
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
                                                            <td align="left" colspan="2" valign="top" class="tbl_caption">Password Recorvery Details</td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="right" valign="top" class="auto-style1">
                                                                &nbsp;</td>
                                                            <td valign="top" class="auto-style1">
                                                                &nbsp;</td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="right" valign="top" class="auto-style1">
                                                                <asp:Label ID="lblLoginName" runat="server" Text="Login Email"></asp:Label>
                                                            </td>
                                                            <td valign="top" class="auto-style1">
                                                                <asp:TextBox ID="txtLoginName" runat="server" EnableViewState="true" Width="447px" type="email"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="right" valign="top">
                                                                <asp:Label ID="lblPassword" runat="server" Text="Enter Secret Phrase/Word:"></asp:Label>
                                                            </td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtSecretPhrase" runat="server" EnableViewState="true" MaxLength="11" TextMode="Password" Width="310px"></asp:TextBox>
                                                                <asp:Label ID="lblPassword0" runat="server" Text="(6 min character)"></asp:Label>
                                                            </td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="right" valign="top">
                                                            </td>
                                                            <td valign="top">
                                                                <asp:Button ID="verifyBtn" CssClass="cmd_butt" Text="Verify Entry" runat="server" Visible="True" />
                                                            </td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="center" valign="top" colspan="2">
                                                                <asp:Panel ID="Panel1" runat="server" Width="70%" Visible="False">
                                                                    <table style="width: 100%;">
                                                                        <tr>
                                                                            <td>
                                                                                Enter New Password:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox ID="txtPwd1" runat="server" TextMode="Password" Width="275px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Confirm New Password:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox ID="txtPwd2" runat="server" TextMode="Password" Width="275px"></asp:TextBox>
                                                                                <asp:CompareValidator ID="comparePwd" runat="server" ControlToCompare="txtPwd1" ControlToValidate="txtPwd2" ErrorMessage="Password does not match!"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td align="left">
                                                                                <asp:Button ID="changePwdBtn" runat="server" Text="Change Password" />    
                                                                            </td>
                                                                        </tr>
                                                                    </table>     
                                                                </asp:Panel>   
                                                            </td>
                                                        </tr>

                                                        <tr id="DeptRow">
                                                            <td align="right" valign="top">
                                                                &nbsp;</td>
                                                            <td valign="top">
                                                                &nbsp;</td>
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
