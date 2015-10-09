﻿//function to hide and show pane
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
    //alert("my fun");
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
                console.log(mn[m].menuPos);
                $("#set").addClass("hidden");
            }

        });


    }
});




