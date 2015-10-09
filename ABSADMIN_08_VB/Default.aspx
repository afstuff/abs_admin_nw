<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="ABSADMIN_08_VB._Default" %>

<!DOCTYPE>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABS ADMIN ::Sign In</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/StyleSheet1.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/JavaScript1.js"></script>

    <script>
        //function to do on page load
        $(function () {

            //define the processing modal
            var pleaseWait = $('#pleaseWaitDialog');
            var showPleaseWait = function () {
                pleaseWait.modal('show');
            };
            var hidePleaseWait = function () {
                pleaseWait.modal('hide');
            };

            function onErrorLoadMotorTypes(response) {
                //debugger;
                //var errorText = response.responseText;
                var errorText = response.responseText;
                $("#returnMsg").html("<h4>Error!!!' + '\n\n' + 'Invalid user details!</h4>");

                //alert('Error!!!' + '\n\n' + 'Invalid user details!');
                hidePleaseWait();
            }

            function onFailure(response) {
                //debugger;
                $("#returnMsg").html("<h4>Failure!!!' + '<br/>' + 'Login failed, contact the admin!</h4>");
//                alert('Failure!!!' + '<br/>' + 'Login failed, contact the admin!');
                hidePleaseWait();
            }

            function retrieveUserRolenfoValues(admobjects) {
                var menuItem = new Object();
                //var subItem = [];
                //var menuItem0 = [];

                var menuPage = [];
                $.each(admobjects, function () {
                    var admobject = $(this);
                    menuPage.push({ menuPos: $(this).find("ADM_Menu_Position").text(), menuName: $(this).find("ADM_Menu_Name").text(), canAdd: $(this).find("ADM_Option_Add").text(), canEdit: $(this).find("ADM_Option_Edit").text(), canDelete: $(this).find("ADM_Option_Delete").text(), canPrint: $(this).find("ADM_Option_Print").text(), canVisible: $(this).find("ADM_Option_Visible").text() });
                });

                console.log(menuPage);

                // Encode the String
                var eString = JSON.stringify(menuPage);
                console.log(eString);
                sessionStorage.setItem("userInfo", eString);
                //move to next page
                window.location.href = "dashboard.aspx";

            }

            function onSuccessLoadUserRole(response) {
                //debugger;
                console.log(response.d);

                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var admobjects = xml.find("Table");
                retrieveUserRolenfoValues(admobjects);

            }

            function getUserRolesInfo(roleId) {
                console.log("getUserRolesInfo Clicked");
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/GetUserRolesInfo",
                    data: "{roleId : " + roleId + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: onSuccessLoadUserRole,
                    failure: onFailure,
                    error: onErrorLoadMotorTypes
                });
                // this avoids page refresh on button click
                return false;
            }

            function retrieveLoginValues(admobjects) {
                var menuItem = new Object();
                //var subItem = [];
                //var menuItem0 = [];

                var userPage = [];

                $.each(admobjects, function () {
                    var admobject = $(this);
                    var uRole = $(this).find("SEC_USER_ROLE").text();
                    if (uRole == "0") {
                        $("#returnMsg").html("<h4>User account has not been activated, contact admin for activation !</h4>");
                        //alert("User has not been activated, contact admin to activate account!");
                        return false;
                    }

                    userPage.push({ userRole: $(this).find("SEC_USER_ROLE").text(), userName: $(this).find("SEC_USER_NAME").text() });

                    console.log(userPage);

                    // Encode the String
                    var eString = JSON.stringify(userPage);
                    console.log(eString);
                    sessionStorage.setItem("userRole", "");
                    sessionStorage.setItem("userRole", eString);

                    //move to next page
                    //window.location.href = "dashboard.aspx";


                    getUserRolesInfo($(this).find("SEC_USER_ROLE").text());
                    //return false;
                });
            }

            function onSuccessLogin(response) {
                //debugger;
                console.log(response.d);

                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var admobjects = xml.find("Table");
                retrieveLoginValues(admobjects);

            }

            function doLogin(inputEmail, inputPassword) {
                console.log("doLogin Clicked");
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/DoLogin",
                    data: "{userName : '" + inputEmail + "', userPassword : '" + inputPassword + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: onSuccessLogin,
                    failure: onFailure,
                    error: onErrorLoadMotorTypes
                });
                // this avoids page refresh on button click
                return false;
            }


            $("#loginBtn").click(function (e) {
                e.preventDefault();

                var inputEmail = $("#inputEmail").val();
                var inputPassword = $("#inputPassword").val();
                //alert(inputEmail + " " + inputPassword);
                if ((inputEmail != null) || inputPassword != null) {
                    showPleaseWait();
                    doLogin(inputEmail, inputPassword);
                } else {
                    $("#returnMsg").html("<h4>Login fields cannot be empty!</h4>");

                    //alert("Login fields cannot be empty!");
                }

                //var pleaseWait = $('#pleaseWaitDialog');
                //hidePleaseWait = function () {
                //    pleaseWait.modal('hide');
                //};

            });

        })

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container" align="center" style="left: 20%!important; right: 20% !important; width: 60% !important; background-color: white !important;">
                <h1 style="font-weight: bold; font-family: century gothic;">ABS ADMIN
                </h1>
            </div>
            <div class="container" style="margin-top: 5px !important;">
                <div class="card card-container">
                    <img id="profile-img" class="profile-img-card" src="imgs/User-icon.png" />
                    <p id="profile-name" class="profile-name-card"></p>
                    <div class="form-signin">
                        <span id="reauth-email" class="reauth-email"></span>
                        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                        <div id="remember" class="checkbox">
                            <label>
                                <input type="checkbox" value="remember-me">
                                Remember me
                            </label>
                        </div>
                        <button id="loginBtn" class="btn btn-lg btn-info btn-block btn-signin">Sign in</button>
                    </div>
                    <!-- /form -->
                    <a href="forgotpassword.aspx" class="forgot-password pull-left">Forgot the password?</a>
                    <a href="Register.aspx" class="forgot-password pull-right">Register!</a>
                </div>
                <!-- /card-container -->
            </div>
            <!-- /container -->
        </div>

        <!-- Modal start -->
        <div class="modal fade" id="pleaseWaitDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <span style="font-family: 'century-gothic'; font-size: 20pt; font-weight: bold;">Processing login...</span>
                    </div>
                    <div class="modal-body">
                        <span id="returnMsg"></span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                <%--<span class="sr-only">40% Complete (success)</span>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal ends -->

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
