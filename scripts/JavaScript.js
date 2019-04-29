
/// Language Change ///
var lang;

$(document).ready(function () {
    //בדיקה מהי השפה כרגע ולהציג את קישור החלפת השפה המתאים
   // alert("check");
    //לחיצה על כפתור אנגלית
    $("#SwitchLangToEn").click(function () {
        $("body").removeClass("rtl");
        $("body").addClass("ltr");
        $("#pageTitle").addClass("pageTitileEnglish");
        $("#thirdTnay").addClass("conditionsEnglish");
        $("#cretateGameBtn").addClass("saveGameEnglish");
        $("#pageTitle").addClass("myGamesTitleEnglish");
        $("#categoryLabel").addClass("categoryLabelEng");
        $("#gameNameCategorySaveBtn").addClass("gameNameCategorySaveBtnEng");
        $("#categoryCounterLabel").addClass("categoryCounterLabelEng");

        ChangeLangLink();
        sessionStorage.setItem("lang", "ltr");
        //location.reload(true);
    })

    //לחיצה על כפתור עברית
    $("#SwitchLangToHe").click(function () {
        $("body").removeClass("ltr");
        $("body").addClass("rtl");
        $("#pageTitle").removeClass("pageTitileEnglish");
        $("#thirdTnay").removeClass("conditionsEnglish");
        $("#cretateGameBtn").removeClass("saveGameEnglish");
        $("#pageTitle").removeClass("myGamesTitleEnglish");
        $("#categoryLabel").removeClass("categoryLabelEng");
        $("#gameNameCategorySaveBtn").removeClass("gameNameCategorySaveBtnEng");
        $("#categoryCounterLabel").removeClass("categoryCounterLabelEng");

        ChangeLangLink();
        sessionStorage.setItem("lang", "rtl");

        //location.reload(true);
    })

    if (sessionStorage.lang == "ltr") {

        $("body").removeClass("rtl");
        $("body").addClass("ltr");
        $("#pageTitle").addClass("pageTitileEnglish");
        $("#thirdTnay").addClass("conditionsEnglish");
        $("#cretateGameBtn").addClass("saveGameEnglish");
        $("#pageTitle").addClass("myGamesTitleEnglish");
        $("#categoryLabel").addClass("categoryLabelEng");
        $("#gameNameCategorySaveBtn").addClass("gameNameCategorySaveBtnEng");
        $("#categoryCounterLabel").addClass("categoryCounterLabelEng");

        ChangeLangLink();

    }
    else {
        $("body").removeClass("ltr");
        $("body").addClass("rtl");
        $("#pageTitle").removeClass("pageTitileEnglish");
        $("#thirdTnay").removeClass("conditionsEnglish");
        $("#cretateGameBtn").removeClass("saveGameEnglish");
        $("#pageTitle").removeClass("myGamesTitleEnglish");
        $("#categoryLabel").removeClass("categoryLabelEng");
        $("#gameNameCategorySaveBtn").removeClass("gameNameCategorySaveBtnEng");
        $("#categoryCounterLabel").removeClass("categoryCounterLabelEng");

        ChangeLangLink();

    }
});

//שינוי שפה
function ChangeLangLink() {

    //הצגת כפתור השפה הנכון
    if ($("body").hasClass("rtl")) {
        lang = "he-il";
        $("#SwitchLangToEn").show();
        $("#SwitchLangToHe").hide();
        $("body").removeClass("ltr");
        $("body").addClass("rtl");

        sessionStorage.setItem("lang", "rtl");
    }
    else {
        lang = "en-us";
        $("#SwitchLangToEn").hide();
        $("#SwitchLangToHe").show();
        sessionStorage.setItem("lang", "ltr");
        $("body").removeClass("rtl");
        $("body").addClass("ltr");
    }
    langFunc();
    //שינוי הטקסטים מהמילון
    ShowFromDictionary();
}

function ShowFromDictionary() {

    //קריאה לXML
    $.ajax({
        type: "GET",
        url: "trees/lang.xml",
        dataType: "xml",
        success: function (xml) {
            $(".DictionaryText").each(function () {
                var ThisElement = $(this);
                $(xml).find('text[value="' + $(this).attr('dictionaryvalue') + '"]').find(lang).each(function () {

                    if ($(ThisElement).is("input[type=text]")) {

                        $(ThisElement).attr('placeholder', $(this).text());
                    }
                    if ($(ThisElement).is("input[type=button]")) {

                        $(ThisElement).attr('Text', $(this).text());
                    }
                    else {
                        if ($(ThisElement).is("input")) {
                            $(ThisElement).val($(this).text());
                        }
                        else {
                            $(ThisElement).html($(this).text());
                        }
                    }


                    //if (ThisElement.is("input")) {
                    //    $(ThisElement).val($(this).text());

                    //}
                    //else {
                    //    //$(ThisElement).html($(this).text() + "<br />");
                    //    $(ThisElement).html($(this).text());
                    //}
                });
            })

        }
    });
}


////הקריאה לפונקציה מתרחשת באנימייט ומחזיקה את השם המתאימה
function langFunc() {
    if (sessionStorage.lang == "rtl")
        return 1;
    return 0;

}

/// End of Language Change ///

function uploadPicture() {
    $("#paritText").hide();
    $("#paritTextCounterLabel").hide();
    $('#imageUpload').click();
    var picType = "p";
    document.getElementById("picTypeHidden").value = picType;
}
$(document).ready(function () {
    $("#imageUpload").change(function () {
        readURL(this);
    });

    function readURL(input) {
        var file = input.files[0];
        var fileType = file["type"];
        var ValidImageTypes = ["image/gif", "image/jpeg", "image/png"];
        if ($.inArray(fileType, ValidImageTypes) < 0) {
            $("#picUploadPop").removeClass("visibileFalse");
            $("#picUploadPop").addClass("visibleTrue");
            $("#picUploadPop").addClass("PopUpPanel");

            $("#blackBackground").removeClass("visibileFalse");
            $("#blackBackground").addClass("visibleTrue");
            $("#blackBackground").addClass("PopupBackground");


            $("#uploadedImage").removeClass("visibleUploadedImage");
            $("#uploadedImage").addClass("hiddenUploadedImage");
        }

        else if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#uploadedImage').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
            document.getElementById("addParitBtn").disabled = false;
            //מחק את מחלקת כפתור  דיסאייבל
            $("#addParitBtn").removeClass("disableBtn");
            //הוסף את מחלקת כפתור  רגיל
            $("#addParitBtn").addClass("buttons blueButtons");
            $("#addParitBtn").removeClass("hiddenUploadedImage");
            $("#uploadedImage").addClass("visibleUploadedImage");
        }
    }
});

// פונקציה שקוראת כמה תווים נכתבו בטקסט בוקס
function textCounterFunc(field, cnt, maxlimit) {
    // שומר את הנתיב של הלייבל אליה נפלוט את התווים שנכתבו
    var cntfield = document.getElementById(cnt);
    if (field.value.length > maxlimit) {
        field.value = field.value.substring(0, maxlimit);
        cntfield.style.color = "red";
    }
    // otherwise, update 'characters left' counter
    else {
        cntfield.style.color = "darkgray";
        cntfield.value = (field.value.length + "/" + maxlimit).toString();
    }
}
// ספירת תווים מסך עריכת משחק
function TextCountEditGame() {
    if (document.getElementById("addGameTextBox").value.length < 2 || document.getElementById("addCategoryTextBox").value.length < 2) {
        if (document.getElementById("addGameTextBox").value.trim != "" && (document.getElementById("addCategoryTextBox")).value.trim() != "")

            //הכפתור שמור  יהיה לא פעיל
            document.getElementById("gameNameCategorySaveBtn").disabled = true;
        //מחק את מחלקת כפתור רגיל  דיסאייבל
        $("#gameNameCategorySaveBtn").removeClass("buttons blueButtons");
        //הוסף את מחלקת כפתור  דיסאייבל
        $("#gameNameCategorySaveBtn").addClass(" disableBtn");

    }

    else if (document.getElementById("addGameTextBox").value.length > 1 && document.getElementById("addCategoryTextBox").value.length > 1) {

        // כפתור שמור יהיה פעיל
        document.getElementById("gameNameCategorySaveBtn").disabled = false;
        //מחק את מחלקת כפתור  דיסאייבל
        $("#gameNameCategorySaveBtn").removeClass("disableBtn");
        //הוסף את מחלקת כפתור  רגיל
        $("#gameNameCategorySaveBtn").addClass("buttons blueButtons");
    }
}

// ספירת תווים מסך המשחקים שלי
function TextCount(x) {
    if (document.getElementById("addNewGame").value.length > 1) {
        if ((document.getElementById("addNewGame").value).trim() != "") {
            // הכפתור יהיה פעיל
            document.getElementById("cretateGameBtn").disabled = false;
            //מחק את מחלקת כפתור  דיסאייבל
            $("#cretateGameBtn").removeClass("disableBtn");
            //הוסף את מחלקת כפתור  רגיל
            $("#cretateGameBtn").addClass("buttons blueButtons");
            // tool tip
            // אם הכפתור  פעיל
            // תוריד את הקלאס של טולטיפ
            document.getElementById("gameNameDiv").removeAttribute("class");
            //   $("#cretateGameBtn").css({ bottom: '74%' });
            //  $("#cretateGameBtn").css({ "margin-right": '207px' });
            // תוריד את הקלאס השני של טולטיפ ותעשה אותו מוסתר
            document.getElementById("gameNameSpan").removeAttribute("class");
            document.getElementById("gameNameSpan").setAttribute("class", "hiddenClass");
        }
    }
    else if (document.getElementById("addNewGame").value.length < 2) {

        //הכפתור יהיה לא פעיל
        document.getElementById("cretateGameBtn").disabled = true;
        //מחק את מחלקת כפתור רגיל  דיסאייבל
        $("#cretateGameBtn").removeClass("buttons blueButtons");
        //הוסף את מחלקת כפתור  דיסאייבל
        $("#cretateGameBtn").addClass(" disableBtn");
        //    $("#cretateGameBtn").css({ bottom: '0' });
        //    $("#cretateGameBtn").css({ "margin-right": '175px' });
        document.getElementById("gameNameDiv").setAttribute("class", "myTooltip");
        document.getElementById("gameNameSpan").setAttribute("class", "tooltiptext");
    }
}

// בדיקה שנכתב משהו בשם משתמש והסיסמה
function userNameTextCount() {
    if (document.getElementById("UserTxt").value.length != 0 && document.getElementById("UserPassword").value.length != 0) {
        if ((document.getElementById("UserTxt").value).trim() != "" && (document.getElementById("UserPassword").value).trim() != "") {
            // הכפתור יהיה פעיל
            document.getElementById("LoginButton").disabled = false;
            //מחק את מחלקת כפתור  דיסאייבל
            $("#LoginButton").removeClass("disableBtn");
            //הוסף את מחלקת כפתור  רגיל
            $("#LoginButton").addClass("buttons blueButtons");
        }
    }
    else if (document.getElementById("UserTxt").value.length == 0 || document.getElementById("UserPassword").value.length == 0) {

        //הכפתור יהיה לא פעיל
        document.getElementById("LoginButton").disabled = true;
        //מחק את מחלקת כפתור רגיל  דיסאייבל
        $("#LoginButton").removeClass("buttons blueButtons");
        //הוסף את מחלקת כפתור  דיסאייבל
        $("#LoginButton").addClass(" disableBtn");
    }
}
// לחיצה על אודות
function OdotFunc() {
    $("#odotPanel").css({ visibility: 'visible' })
}

// לחיצה על איקס במסך אודות וחזרה למסך משחק
function exitOdotGame() {
    $("#odotPanel").css({ visibility: 'hidden' })
    $("#slide-item-1").prop("checked", true); // מחזיר את הסמן למקום

}
// לחיצה על איקס במסך אודות וחזרה למסך עורך
function exitOdotEdit() {
    $("#odotPanel").css({ visibility: 'hidden' })
    $("#slide-item-2").prop("checked", true); // מחזיר את הסמן למקום
}
// לחיצה על איקס במסך אודות וחזרה למסך איך משחקים
function exitOdotHow() {
    $("#odotPanel").css({ visibility: 'hidden' })
    $("#slide-item-3").prop("checked", true); // מחזיר את הסמן למקום
}
// מונה לכמה תווים הוכנסו בתיבת טקסט פריט
function itemTextCount() {
        if (document.getElementById("paritText").value.length > 1) {
            if ((document.getElementById("paritText").value).trim() != "") {
                // הכפתור יהיה פעיל
                document.getElementById("addParitBtn").disabled = false;
                //מחק את מחלקת כפתור  דיסאייבל
                $("#addParitBtn").removeClass("disableBtn");
                //הוסף את מחלקת כפתור  רגיל
                $("#addParitBtn").addClass("buttons blueButtons");
            }
        }
        else if (document.getElementById("paritText").value.length < 2) {
            if ((document.getElementById("paritText").value).trim() != "") {
                //הכפתור יהיה לא פעיל
                document.getElementById("addParitBtn").disabled = true;
                //מחק את מחלקת כפתור רגיל  דיסאייבל
                $("#addParitBtn").removeClass("buttons blueButtons");
                //הוסף את מחלקת כפתור  דיסאייבל
                $("#addParitBtn").addClass(" disableBtn");
            }
    }

        if (document.getElementById("paritText").value.length > 1) {
            if ((document.getElementById("paritText").value).trim() != "") {
                // הכפתור יהיה פעיל
                document.getElementById("saveParitBtn").disabled = false;
                //מחק את מחלקת כפתור  דיסאייבל
                $("#saveParitBtn").removeClass("disableBtn");
                //הוסף את מחלקת כפתור  רגיל
                $("#saveParitBtn").addClass("buttons blueButtons");
            }
        }
        else if (document.getElementById("paritText").value.length < 2) {
            if ((document.getElementById("paritText").value).trim() != "") {
                //הכפתור יהיה לא פעיל
                document.getElementById("saveParitBtn").disabled = true;
                //מחק את מחלקת כפתור רגיל  דיסאייבל
                $("#saveParitBtn").removeClass("buttons blueButtons");
                //הוסף את מחלקת כפתור  דיסאייבל
                $("#saveParitBtn").addClass(" disableBtn");
            }
    }
 
}

//how to play
function HowtoPlay() {
    $("#HowToWindow").css({ visibility: 'visible' });
    $("#backgroundP").css({ visibility: 'visible' });
    $("#Iframediv").css({ visibility: 'visible' })
}
//function closeHowToPlay() {
//    $("#HowToWindow").css({ visibility: 'hidden' });
//    $("#backgroundP").css({ visibility: 'hidden' });
//    $("#Iframediv").css({ visibility: 'hidden' });
//    $('iframe').attr('src', $('iframe').attr('src'));
//}
// לחיצה על איקס במסך איך משחקים וחזרה למסך משחק
function exitHowToGame() {
    $("#HowToWindow").css({ visibility: 'hidden' });
    $("#backgroundP").css({ visibility: 'hidden' });
    $("#Iframediv").css({ visibility: 'hidden' });
    $('iframe').attr('src', $('iframe').attr('src'));
    $("#slide-item-1").prop("checked", true); // מחזיר את הסמן למקום

}
// לחיצה על איקס במסך איך משחקים  וחזרה למסך עורך
function exitHowToEdit() {
    $("#HowToWindow").css({ visibility: 'hidden' });
    $("#backgroundP").css({ visibility: 'hidden' });
    $("#Iframediv").css({ visibility: 'hidden' });
    $('iframe').attr('src', $('iframe').attr('src'));
    $("#slide-item-2").prop("checked", true); // מחזיר את הסמן למקום
}

//  sending an email
function mailto () {
    window.open('mailto:noy2432@gmail.com', '_blank', "toolbar=no,scrollbars=yes,resizable=yes,width=800px, height=550px'");

    //    window.open('mailto:' + users.Table[0].email, '_blank', "toolbar=no,scrollbars=yes,resizable=yes,width=800px, height=550px'");

    //});



};