//function to hide and show pane
$(function () {
    $("#showPaneBtn").hide();

    if (window.sessionStorage.length > 0) {
        var isPaneOpen = window.sessionStorage.getItem("paneBtn");
        //if (isPaneOpen === "show") {
        //    $("#contentPane").toggleClass("col-md-12 col-md-9");
        //    $("#profilePane").show();
        //}
        if (isPaneOpen === "hide") {
            $("#profilePane").hide();
            $("#contentPane").toggleClass("col-md-9 col-md-12");
            $("#showPaneBtn").show();
        }
    }


    $("#hidePaneBtn").click(function (e) {
        e.preventDefault();
        window.sessionStorage.setItem("paneBtn", "hide");
        $("#showPaneBtn").show();
        //$("#hidePaneBtn").show();

        $("#profilePane").hide();
        $("#contentPane").toggleClass("col-md-9 col-md-12");

    });

    $("#showPaneBtn").click(function (e) {
        e.preventDefault();
        window.sessionStorage.setItem("paneBtn", "show");
        //$("#hidePaneBtn").hide();
        $("#showPaneBtn").hide();

        $("#contentPane").toggleClass("col-md-12 col-md-9");
        $("#profilePane").show();
    });

});

//Menu Constructors
$(function () {
    if (window.sessionStorage.length > 0) {
        //console.log("working!");

        //get menu from session
        var dString = JSON.parse(sessionStorage.getItem("userInfo"));
        // Decode the String
        var mn = dString;
        //console.log(dString);
        //console.log(mn);

        //loop tru
        $.each(mn, function (m) {
            //console.log(m);
            //console.log(mn[m]);
            //console.log(mn[m].menuName);

            if ((mn[m].menuPos == "1") && (mn[m].canVisible) == "0") {
                $("#tell").addClass("hidden");
            }

            if ((mn[m].menuPos == "2") && (mn[m].canVisible) == "0") {
                $("#ser").addClass("hidden");
            }
            if ((mn[m].menuPos == "3") && (mn[m].canVisible) == "0") {
                $("#mot").addClass("hidden");
            }
            if ((mn[m].menuPos == "4 ") && (mn[m].canVisible) == "0") {
                $("#pro").addClass("hidden");
            }
            if ((mn[m].menuPos == "5") && (mn[m].canVisible) == "0") {
                $("#bra").addClass("hidden");
            }
            if ((mn[m].menuPos == "6") && (mn[m].canVisible) == "0") {
                $("#pre").addClass("hidden");
            }
            if ((mn[m].menuPos == "7") && (mn[m].canVisible) == "0") {
                $("#clm").addClass("hidden");
            }
            if ((mn[m].menuPos == "8") && (mn[m].canVisible) == "0") {
                $("#set").addClass("hidden");
            }

        });


    }
});



$(document).ready(function () {
    // DOM ready

    // Test data
    /*
     * To test the script you should discomment the function
     * testLocalStorageData and refresh the page. The function
     * will load some test data and the loadProfile
     * will do the changes in the UI
     */
    // testLocalStorageData();
    // Load profile if it exits
    loadProfile();
});

/**
 * Function that gets the data of the profile in case
 * thar it has already saved in localstorage. Only the
 * UI will be update in case that all data is available
 *
 * A not existing key in localstorage return null
 *
 */
function getLocalProfile(callback) {
    var profileImgSrc = localStorage.getItem("PROFILE_IMG_SRC");
    var profileName = localStorage.getItem("PROFILE_NAME");
    var profileReAuthEmail = localStorage.getItem("PROFILE_REAUTH_EMAIL");

    if (profileName !== null
            && profileReAuthEmail !== null
            && profileImgSrc !== null) {
        callback(profileImgSrc, profileName, profileReAuthEmail);
    }
}

/**
 * Main function that load the profile if exists
 * in localstorage
 */
function loadProfile() {
    if (!supportsHTML5Storage()) { return false; }
    // we have to provide to the callback the basic
    // information to set the profile
    getLocalProfile(function (profileImgSrc, profileName, profileReAuthEmail) {
        //changes in the UI
        $("#profile-img").attr("src", profileImgSrc);
        $("#profile-name").html(profileName);
        $("#reauth-email").html(profileReAuthEmail);
        $("#inputEmail").hide();
        $("#remember").hide();
    });
}

/**
 * function that checks if the browser supports HTML5
 * local storage
 *
 * @returns {boolean}
 */
function supportsHTML5Storage() {
    try {
        return 'localStorage' in window && window['localStorage'] !== null;
    } catch (e) {
        return false;
    }
}

/**
 * Test data. This data will be safe by the web app
 * in the first successful login of a auth user.
 * To Test the scripts, delete the localstorage data
 * and comment this call.
 *
 * @returns {boolean}
 */
function testLocalStorageData() {
    if (!supportsHTML5Storage()) { return false; }
    localStorage.setItem("PROFILE_IMG_SRC", "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120");
    localStorage.setItem("PROFILE_NAME", "César Izquierdo Tello");
    localStorage.setItem("PROFILE_REAUTH_EMAIL", "oneaccount@gmail.com");
}

