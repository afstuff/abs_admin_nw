<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="dashboard.aspx.vb" Inherits="ABSADMIN_08_VB.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABS ADMIN ::Dashboard</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/StyleSheet1.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/JavaScript1.js"></script>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <div class="row profile">
                <div id="profilePane" class="col-md-3">
                    <div class="profile-sidebar">
                        <!-- SIDEBAR USERPIC -->
                        <div class="profile-userpic">
                            <img src="imgs/User-icon.png" class="img-responsive img-circle" alt="" />
                        </div>
                        <!-- END SIDEBAR USERPIC -->
                        <!-- SIDEBAR USER TITLE -->
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name">
                                ABS USER
                            </div>
                            <div class="profile-usertitle-job">
                                ABS
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                        <div class="profile-userbuttons form-group-sm">
                            <button id="hidePaneBtn" class="btn btn-info input-sm pull-right">
                                <i class="glyphicon glyphicon-align-justify"></i>
                            </button>
                            <br />
                        </div>
                        <!-- END SIDEBAR BUTTONS -->
                        <!-- SIDEBAR MENU -->
                        <div class="profile-usermenu">
                            <ul class="nav">
                                <li class="active">
                                    <a href="#">
                                        <i class="glyphicon glyphicon-home"></i>
                                        Overview </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-user"></i>
                                        View Profile  </a>
                                </li>
                                <li>
                                    <a href="#" target="_blank">
                                        <i class="glyphicon glyphicon-ok"></i>
                                        Tasks </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="glyphicon glyphicon-flag"></i>
                                        Help </a>
                                </li>
                            </ul>
                        </div>
                        <!-- END MENU -->
                    </div>
                </div>
                <div id="contentPane" class="col-md-9">
                    <div class="profile-content">
                        <span style="font-weight: bold; font-family: Century Gothic; font-size: xx-large;">ABS - ADMIN
                        </span>
                        <button id="showPaneBtn" class="btn btn-info input-sm pull-right"><i class="glyphicon glyphicon-align-justify"></i></button>
                        <hr />
                        
                        <h3 style="font-weight: bold; font-family: Century Gothic;">Dashboard
                        </h3>
                        <p>
                            &nbsp;
                        </p>
                        <div class="menuItemDiv" align="center" id="tell">
                            <a href="TelephoneBill.aspx">
                                <img src="imgs/telephone_blue.png" />
                                <br />
                                Telephone Bill
                            </a>
                        </div>

                        <div class="menuItemDiv" align="center" id="ser">
                            <a href="ServicesBill.aspx">
                                <img src="imgs/service.png" />
                                <br />
                                Services Bill
                            </a>
                        </div>

                        <div class="menuItemDiv" align="center" id="mot">
                            <a href="MotorVehicle.aspx">
                                <img src="imgs/moto.png" />
                                <br />
                                Motor Vehicle(R&amp;M)
                            </a>
                        </div>
                        <div class="menuItemDiv" align="center" id="pro">
                            <a href="Procurement.aspx">
                                <img src="imgs/procurement.png" />
                                <br />
                                Procurement
                            </a>
                        </div>

                        <div class="clearfix" style="margin-bottom: 80px!important;"></div>

                        <div class="menuItemDiv" align="center" id="bra">
                            <a href="BranchExpenses.aspx">
                                <img src="imgs/expenses.png" />
                                <br />
                                Branch Expenses
                            </a>
                        </div>
                        <div class="menuItemDiv" align="center" id="pre">
                            <a href="PremiumPaid.aspx">
                                <img src="imgs/premRec.png" />
                                <br />
                                Insurance Prem. Rec.
                            </a>
                        </div>
                        <div class="menuItemDiv" align="center" id="clm">
                            <a href="ClaimReceived.aspx">
                                <img src="imgs/claimRec.png" />
                                <br />
                                Insurance Claim Rec.
                            </a>
                        </div>
                        <div class="clearfix" style="margin-bottom: 80px!important;"></div>


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
        </div>
    </form>
</body>
</html>

