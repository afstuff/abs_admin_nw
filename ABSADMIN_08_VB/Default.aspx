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
            function onErrorLoadMotorTypes(response) {
                //debugger;
                var errorText = response.responseText;
                alert('Error!!!' + '\n\n' + errorText);
            }

            function onFailure(response) {
                //debugger;
                alert('Failure!!!' + '<br/>' + response.reponseText);
            }

            function retrieveUserRolenfoValues(admobjects) {
                var menuItem = new Object();
                //var subItem = [];
                //var menuItem0 = [];

                var menuPage = [];
                $.each(admobjects, function () {
                    var admobject = $(this);
                    menuPage.push({ menuPos: $(this).find("ADM_Menu_Position").text(), menuName: $(this).find("ADM_Menu_Name").text(), canAdd: $(this).find("ADM_Option_Add").text(), canEdit: $(this).find("ADM_Option_Edit").text(), canDelete: $(this).find("ADM_Option_Delete").text(), canPrint: $(this).find("ADM_Option_Print").text() });
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

            function getUserRolesInfo() {
                console.log("Clicked");
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/GetUserRolesInfo",
                    data: "{roleId : '1'}", 
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: onSuccessLoadUserRole,
                    failure: onFailure,
                    error: onErrorLoadMotorTypes
                });
                // this avoids page refresh on button click
                return false;
            }


            $("#loginBtn").click(function (e) {
                e.preventDefault();
                getUserRolesInfo();
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
                        <Button id="loginBtn" Class="btn btn-lg btn-info btn-block btn-signin">Sign in</Button>
                    </div>
                    <!-- /form -->
                    <a href="#" class="forgot-password">Forgot the password?
                    </a>
                </div>
                <!-- /card-container -->
            </div>
            <!-- /container -->
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
