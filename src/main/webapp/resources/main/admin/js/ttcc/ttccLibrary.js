/** 문자열 함수 시작 *****************************************************************************/
String.prototype.s2_trim = function () {
    var str = this.replace(/(\s+$)/g, "");
    return str.replace(/(^\s*)/g, "");
}
/** 문자열 함수 종료 *****************************************************************************/


$(document).ready(function(){
    $(document).on("keydown","#form-search input[name=searchText]", function(e){
        if(e.keyCode === 13){
            e.preventDefault();
            goSearch();
        }
    })
    $(document).on("change","#form-search .go-search", function(e){
        goSearch(true);
    })
    $(document).on("click","#form-search .button-search", function(e){
        goSearch();
    })
})


let goSearch = function(noCheckFlag){
    let $searchForm = $("#form-search")
    let $searchTextInput = $searchForm.find("input[name=searchText]");
    $searchTextInput.val($searchTextInput.val().trim());
    let searchText = $searchForm.find("input[name=searchText]").val();
    $searchForm.find("input[name=currentPage]").val(1);
    goView($searchForm.attr("action"));
}

function filterSet() {
    if ($('.srch_filter button').hasClass('view')) {
        $('.srch_filter button').removeClass('view');
    }
}

function checkNum(e) {
    let keyVal = event.keyCode;
    if((((keyVal >= 48) && (keyVal <= 57)) || (keyVal == 8) || ((keyVal >= 96) && (keyVal <= 105)))){
        return true;
    }
    else{
        alert("숫자만 입력가능합니다");
        return false;
    }
}

let goView = function(url, queryString){

    location.href = "?" +  $("#form-search").serialize() + (queryString?("&"+queryString):"");
}

let Alert ={
    ok : function(msg){alert(msg?msg:"정상 처리되었습니다.");},
    err : function(msg){alert(msg?msg:"처리 중 오류가 발생하였습니다.");},
    reg : function(msg){return confirm(msg?msg:"정보를 저장하시겠습니까?");},
    del : function(msg){return confirm(msg?msg:"정보를 삭제하시겠습니까?\n삭제된 정보는 복구되지 않습니다.");}
}

/** 폼 검증 함수 시작 ****************************************************************************/

function s2_search_form_check() {
    form = document.formSearch;

    if (!s2_radio_is_checked(true, form.search_target)) {
        alert("검색방법을 설정해주십시오.");
        return false;
    }
    if (s2_txt_is_empty(true, form.search_string)) {
        alert("검색어를 입력하십시오.");
        return false;
    }

    form.submit();
}

function s2_is_mb_rrn(s2_focus, s2_element1, s2_element2)   //주민등록번호 체크
{
    var rrn1 = s2_element1.value.s2_trim();
    var rrn2 = s2_element2.value.s2_trim();

    if ((rrn1.length != 6) || (rrn2.length != 7)) {
        if (s2_focus)
            s2_element1.focus();

        return false;
    }

    var temp_num = new Array(13);
    var last_num, i, j;

    for (i = 0; i <= 5; i++)
        temp_num[i] = rrn1.charAt(i);

    for (j = 0; j <= 7; j++) {
        var n = j + 6;
        temp_num[n] = rrn2.charAt(j);
    }

    last_num = 11 - ((temp_num[0] * 2 +
        temp_num[1] * 3 +
        temp_num[2] * 4 +
        temp_num[3] * 5 +
        temp_num[4] * 6 +
        temp_num[5] * 7 +
        temp_num[6] * 8 +
        temp_num[7] * 9 +
        temp_num[8] * 2 +
        temp_num[9] * 3 +
        temp_num[10] * 4 +
        temp_num[11] * 5) % 11);

    if (last_num > 9)
        last_num = last_num % 10;

    if (last_num != temp_num[12]) {
        if (s2_focus)
            s2_element1.focus();

        return false;
    } else
        return true;
}

function s2_is_bsn(s2_focus, s2_element1, s2_element2, s2_element3) {
    var tax_no1 = s2_element1.value.s2_trim();
    var tax_no2 = s2_element2.value.s2_trim();
    var tax_no3 = s2_element3.value.s2_trim();

    var tax_no = tax_no1 + "" + tax_no2 + "" + tax_no3;

    var step1, step2, step3, step4, step5, step6, step7;
    var chkRule = "137137135";

    if ((tax_no1.length != 3) || (tax_no2.length != 2) || (tax_no3.length != 5)) {
        if (s2_focus)
            s2_element1.focus();

        return false;
    }

    step1 = 0;

    for (i = 0; i < 7; i++)
        step1 = step1 + (tax_no.substring(i, i + 1) * chkRule.substring(i, i + 1));

    step2 = step1 % 10;
    step3 = (tax_no.substring(7, 8) * chkRule.substring(7, 8)) % 10;
    step4 = tax_no.substring(8, 9) * chkRule.substring(8, 9);
    step5 = Math.round(step4 / 10 - 0.5);
    step6 = step4 - (step5 * 10);
    step7 = (10 - ((step2 + step3 + step5 + step6) % 10)) % 10;

    if (tax_no.substring(9, 10) != step7) {
        if (s2_focus)
            s2_element1.focus();

        return false;
    } else
        return true;
}

function s2_txt_is_domain(s2_focus, s2_element) {
    if (s2_element.value.s2_trim().search(/(\S+)\.(\S+)/) == -1) {
        if (s2_focus && !s2_element.readOnly && !s2_element.disabled)
            s2_element.focus();
        return false;
    } else
        return true;
}

function s2_max_length_mobile(s2_element) {
    if (s2_element.value.length > s2_element.maxLength) {
        s2_element.value = s2_element.value.slice(0, s2_element.maxLength);
    }
}

function s2_txt_is_email(s2_focus, s2_element) {
    if (s2_element.value.s2_trim().search(/(\S+)@(\S+)\.(\S+)/) == -1) {
        if (s2_focus && !s2_element.readOnly && !s2_element.disabled)
            s2_element.focus();
        return false;
    } else
        return true;
}

function s2_txt_is_equal(s2_remove, s2_element1, s2_element2) {
    if (s2_element1.value.s2_trim() != s2_element2.value.s2_trim()) {
        if (s2_remove) {
            s2_element1.value = "";
            s2_element2.value = "";

            if (!s2_element1.readOnly && !s2_element1.disabled)
                s2_element1.focus();
        }

        return false;
    } else
        return true;
}

/** 폼 검증 함수 종료 ****************************************************************************/

/** input type=text 관련 스크립트 시작 ***********************************************************/
function s2_txt_is_empty(s2_focus, s2_element) {
    if ((s2_element.value.s2_trim() == "") || (s2_element.value.s2_trim().length <= 0)) {
        s2_element.value = "";

        if (s2_focus && !s2_element.readOnly && !s2_element.disabled) {
            s2_element.focus();
        }

        return true;
    } else {
        return false;
    }
}

function s2_txt_is_length(s2_focus, s2_condition, s2_element) {
    if (eval("s2_element.value.s2_trim().length " + s2_condition)) {
        if (s2_focus && !s2_element.readOnly && !s2_element.disabled)
            s2_element.focus();

        return true;
    } else
        return false;
}

function s2_txt_is_char_length(s2_element, s2_char) {
    var char_cnt = 0;
    if ((s2_element.value.s2_trim() == "") || (s2_element.value.s2_trim().length <= 0)) {
        char_cnt = 0;
    } else {
        char_length = s2_element.value.s2_trim().length;
        for (i = 0; i < char_length; i++) {
            if (s2_element.value.s2_trim().charAt(i) == s2_char) {
                char_cnt = char_cnt + 1;
            }
        }
    }
    return char_cnt;
}

function s2_txt_last_char_check(s2_element, s2_char) {
    if ((s2_element.value.s2_trim() == "") || (s2_element.value.s2_trim().length <= 0)) {
        return false;
    } else {
        if (s2_element.value.substr(s2_element.value.length - 1, 1) == s2_char) {
            return true;
        } else {
            return false;
        }
    }
}

/** input type=text 관련 스크립트 시작 ***********************************************************/

/** input type=radio, checkbox 관련 스크립트 시작 ************************************************/

function s2_radio_is_checked(s2_focus, s2_element) {
    var is_checked = false;

    if (typeof (s2_element.length) == "undefined")  // 같은 이름의 Radio, Checkbox 가 1개일 경우
    {
        if (s2_element.checked)
            is_checked = true;

        if (s2_focus && !is_checked && !s2_element.readOnly && !s2_element.disabled)
            s2_element.focus();
    } else                                            // 같은 이름의 Radio, Checkbox 가 2개 이상일 경우
    {
        for (i = 0; i < s2_element.length; i++) {
            if (s2_element[i].checked)
                is_checked = true;
        }

        if (s2_focus && !is_checked && !s2_element[0].readOnly && !s2_element.disabled)
            s2_element[0].focus();
    }

    return is_checked;
}

function s2_radio_checked_value(s2_element) {
    var checked_value = "";

    if (typeof (s2_element.length) == "undefined")  // 같은 이름의 Radio 가 1개일 경우
    {
        if (s2_element.checked)
            checked_value = s2_element.value;
    } else                                        // 같은 이름의 Radio 가 2개 이상일 경우
    {
        for (i = 0; i < s2_element.length; i++) {
            if (s2_element[i].checked)
                checked_value = s2_element[i].value;
        }
    }

    return checked_value;
}

function s2_checkbox_checked_cnt(s2_element) {
    var checkedNum = 0;

    if (typeof (s2_element.length) == "undefined")  // 같은 이름의 Checkbox 가 1개일 경우
    {
        if (s2_element.checked)
            checkedNum = checkedNum + 1;
    } else                                        // 같은 이름의 Checkbox 가 2개 이상일 경우
    {
        for (i = 0; i < s2_element.length; i++) {
            if (s2_element[i].checked)
                checkedNum = checkedNum + 1;
        }
    }

    return checkedNum;
}

function s2_checkbox_count(s2_element, s2_condition) {
    /********************************************
     * s2_element   : 같은 name 을 사용하는 체크박스
     * s2_condition : 조건
     - all       : 전체 갯수
     - checked   : 선택한 체크박스 갯수
     - unchecked : 선택하지 않은 체크박스 갯수
     ********************************************/

    if (s2_condition != "all" && s2_condition != "checked" && s2_condition != "unchecked") {
        alert("잘못된 접근입니다.")
        return false;
    }

    var countAll = 0;
    var countChecked = 0;
    var countUnChecked = 0;

    if (typeof (s2_element.length) == "undefined")   // 같은 이름의 Checkbox 가 1개일 경우
    {
        countAll = 1;

        if (s2_element.checked)
            countChecked = 1;
    } else                                            // 같은 이름의 Checkbox 가 2개 이상일 경우
    {
        countAll = s2_element.length;

        for (i = 0; i < s2_element.length; i++) {
            if (s2_element[i].checked)
                countChecked = countChecked + 1;
        }
    }

    countUnChecked = countAll - countChecked;

    switch (s2_condition) {
        case "all"       :
            return countAll;
            break;
        case "checked"   :
            return countChecked;
            break;
        case "unchecked" :
            return countUnChecked;
            break;
    }
}

function s2_checkbox_check(s2_target, s2_checked) {
    var s2_status;

    if (s2_checked == "auto") {
        if (s2_checkbox_count(s2_target, "unchecked") > 0)
            s2_status = true;     //선택되지 않은게 1개라도 있을 경우 전부 선택
        else
            s2_status = false;    // 모두 선택되었을 경우 전부 해제
    } else if (s2_checked === true || s2_checked === false)    // true나 false 일 경우 모두 선택 또는 해제
        s2_status = s2_checked;

    for (i = 0; i < s2_target.length; i++)
        s2_target[i].checked = s2_status;

    return s2_status;
}


/** input type=radio, checkbox 관련 스크립트 종료 ************************************************/

/** select 관련 스크립트 시작 ********************************************************************/

function s2_select_is_empty(s2_focus, s2_element) {
    if ((s2_element.options[s2_element.selectedIndex].value.s2_trim() == "") || (s2_element.options[s2_element.selectedIndex].value.s2_trim().length <= 0)) {
        if (s2_focus && !s2_element.disabled)
            s2_element.focus();

        return true;
    } else
        return false;
}

function s2_select_selected_value(s2_element) {
    return s2_element.options[s2_element.selectedIndex].value.s2_trim();
}

function s2_select_selected_text(s2_element) {
    return s2_element.options[s2_element.selectedIndex].text.s2_trim();
}

function s2_select_option_remove(s2_element) {
    var len = s2_element.options.length - 1;

    for (i = len; i >= 1; i--)      // Option를 뒤에서 부터 삭제한다. 앞에서 부터 삭제하면 index값 조정이 힘들다.
        s2_element.options.remove(i);

    s2_element.selectedIndex = 0;
}

function s2_select_option_insert(s2_element, s2_code, s2_text) {
    var oOption;

    oOption = document.createElement("OPTION");
    oOption.value = s2_code;
    oOption.text = s2_text;

    s2_element.add(oOption);
}

/** select 관련 스크립트 시작 ********************************************************************/

/** 입력중인 값 관련함수 시작 ************************************************************************/

function s2_input_only_number()              // 오직 숫자만 입력
{
    if ((event.keyCode < 48) || (event.keyCode > 57))  // 숫자(48-57)만 허용
    {
        event.returnValue = false;
        if (event.preventDefault) {
            event.preventDefault();
        }
    } else {
        event.returnValue = true;
    }
}

function s2_input_only_number_check(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) {
        return;
    } else {
        return false;
    }
}

function s2_input_only_remove_char(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) {
        return;
    } else {
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
    }
}

function s2_input_only_bank_number(s2_element)      // 은행계좌번호 형식 입력 (ex '111-22-33333')
{
    if (((event.keyCode < 48) || (event.keyCode > 57)) && (event.keyCode != 45))						// 숫자(48-57)와 - (45) 만 입력 허용
    {
        event.returnValue = false;
        if (event.preventDefault) {
            event.preventDefault();
        }
    } else {
        if ((s2_element.value.length == 0) && (event.keyCode == 45))                                 // 처음입력시 - (45) 문자 차단
        {
            event.returnValue = false;
            if (event.preventDefault) {
                event.preventDefault();
            }
        } else if ((s2_element.value.substr(s2_element.value.length - 1, 1) == "-") && (event.keyCode == 45))		// - (45) 문자 2번 반복 차단
        {
            event.returnValue = false;
            if (event.preventDefault) {
                event.preventDefault();
            }
        } else {
            event.returnValue = true;
        }
    }
}


function s2_input_only_percent(s2_element)      // 퍼센트 형식 입력 (ex '11.25')
{
    if (((event.keyCode < 48) || (event.keyCode > 57)) && (event.keyCode != 46))						// 숫자(48-57)와 . (46) 만 입력 허용
    {
        event.returnValue = false;
        if (event.preventDefault) {
            event.preventDefault();
        }
    } else {
        if ((s2_element.value.length == 0) && (event.keyCode == 46)) // 처음입력시 . (46) 문자 차단
        {
            event.returnValue = false;
            if (event.preventDefault) {
                event.preventDefault();
            }
        } else if ((s2_element.value.substr(s2_element.value.length - 1, 1) == ".") && (event.keyCode == 46))		// . (46) 문자 2번 반복 차단
        {
            event.returnValue = false;
            if (event.preventDefault) {
                event.preventDefault();
            }
        } else if ((s2_element.value.indexOf(".") > -1) && (event.keyCode == 46))		// . (46) 문자 2번 입력 차단
        {
            event.returnValue = false;
            if (event.preventDefault) {
                event.preventDefault();
            }
        } else {
            event.returnValue = true;
        }
    }
}

function s2_input_only_bank_number_check(s2_element)  //은행계좌번호가 '-'로 끝날 경우 제거 (ex '123-45-678-' => '123-45-678')
{
    if (s2_element.value.s2_trim().substr(s2_element.value.s2_trim().length - 1, 1) == "-") {
        s2_element.value = s2_element.value.s2_trim().substr(0, s2_element.value.s2_trim().length - 1);
    }
}

function s2_move_focus(s2_length, s2_element1, s2_element2)   // Focus 이동
{
    var len = s2_element1.value.s2_trim().length;

    if (s2_length == len)
        s2_element2.focus();
}

function s2_input_number_format_on(s2_element) {
    var num = s2_element.value;

    num = new String(num);
    num = num.replace(/,/gi, "");

    var sign = "";
    if (isNaN(num)) {
        alert("숫자만 입력할 수 있습니다.");
        return 0;
    }

    if (num == 0) {
        return num;
    }

    if (num < 0) {
        num = num * (-1);
        sign = "-";
    } else {
        num = num * 1;
    }
    num = new String(num)
    var temp = "";
    var pos = 3;
    num_len = num.length;
    while (num_len > 0) {
        num_len = num_len - pos;
        if (num_len < 0) {
            pos = num_len + pos;
            num_len = 0;
        }
        temp = "," + num.substr(num_len, pos) + temp;
    }

    s2_element.value = sign + temp.substr(1);
}

function s2_input_number_comma(s2_element) {
    var num = s2_element;
    num = new String(num)
    var temp = "";
    var pos = 3;
    num_len = num.length;

    while (num_len > 0) {
        num_len = num_len - pos;
        if (num_len < 0) {
            pos = num_len + pos;
            num_len = 0;
        }
        temp = "," + num.substr(num_len, pos) + temp;
    }

    temp = temp.substr(1);

    return temp;

}

function s2_file_img_check(s2_element) {
    var file_name = s2_element1.value.s2_trim();
    var file_parts = file_name.split('.');
    var file_ext = file_parts[file_parts.length - 1];
    switch (file_ext.toLowerCase()) {
        case 'jpg' :
            return true;
            break;
        case 'gif' :
            return true;
            break;
        case 'png' :
            return true;
            break;
        case 'jpeg' :
            return true;
            break;
        default :
            return false;
    }
}

function onlyDecimal(element, event) {
    event = event || window.event;
    var code = (event.which) ? event.which : event.keyCode; // Firefox는 event.which 사용
    if ((code >= 48 && code <= 57) || (code >= 96 && code <= 105) || code == 8 || code == 9 || code == 46 || code == 37 || code == 39 || code == 110 || code == 116 || code == 190) {
        if ((element.value.length == 0) && (code == 110 || code == 190)) { // 처음입력시 . (190) 문자 차단
            event.returnValue = false;
            if (event.preventDefault) {
                event.preventDefault();
            }
        } else if ((element.value.substr(element.value.length - 1, 1) == ".") && (code == 110 || code == 190)) { // . (190) 문자 2번 반복 차단
            event.returnValue = false;
            if (event.preventDefault) {
                event.preventDefault();
            }
        } else if ((element.value.indexOf(".") > -1) && (code == 110 || code == 190)) { // . (190) 문자 2번 입력 차단
            event.returnValue = false;
            if (event.preventDefault) {
                event.preventDefault();
            }
        } else {
            event.returnValue = true;
        }
    } else {
        event.returnValue = false;
    }
}

function removeChar(event) {
    event = event || window.event;

    var code = (event.which) ? event.which : event.keyCode;
    if (code == 8 || code == 46 || code == 37 || code == 39) {
        return;
    } else {
        event.target.value = event.target.value.replace(/[^\.0-9]/g, "");
    }
}

/** 입력중인 값 관련함수 종료 ************************************************************************/

/** blink 관련함수 ************************************************************************/

/**━━ Blink 관련함수 시작 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**/

function s2_blink() {
    setInterval("s2_blink_sub()", 500); //속도
}

function s2_blink_sub() {
    var blinkArr = document.getElementsByTagName("BLINK");
    var blinkCnt = blinkArr.length;
    for (var i = 0; i < blinkCnt; i++) {
        blinkArr[i].style.visibility = (blinkArr[i].style.visibility == "hidden") ? "" : "hidden";
    }
}

/**━━ Blink 관련함수 종료 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**/

/**━━ Cookie 관련함수 시작 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**/

function s2_cookie_set_expire_date(year, day, hour, minute, second) {
    var today = new Date();
    var exprs = new Date();
    exprs.setTime(today.getTime()
        + 1000 * 60 * 60 * 24 * 365 * year
        + 1000 * 60 * 60 * 24 * day
        + 1000 * 60 * 60 * hour
        + 1000 * 60 * minute
        + 1000 * second);
    return exprs;
}

function s2_cookie_set(name, value, expires, path, domain, secure) {
    document.cookie = name + '=' + escape(value) + ';' +
        ((expires) ? ' expires=' + expires.toGMTString() + ';' : '') +
        ((path) ? ' path=' + path + ';' : '') +
        ((domain) ? ' domain=' + domain + ';' : '') +
        ((secure) ? ' secure' + ';' : '');
}

// Returns a string or false
function s2_cookie_get(name) {
    var srch = name + '=';
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(srch);
        if (offset != -1) {
            offset += srch.length;
            end = document.cookie.indexOf(';', offset);
            if (end == -1)
                end = document.cookie.length;

            return unescape(document.cookie.substring(offset, end));
        } else
            return '';
    } else
        return '';
}

// Optional: path,domain
function s2_cookie_delete(name, path, domain) {
    if (s2_cookie_get(name)) {
        document.cookie = name + '=;' +
            ' expires=Thu, 01-Jan-70 00:00:01 GMT;' +
            ((path) ? ' path=' + path + ';' : '') +
            ((domain) ? ' domain=' + domain + ';' : '');
    }
}

/**━━ Cookie 관련함수 종료 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**/


/** 날짜관련 함수 : 시작 ***************************************************************************************************/

function s2_date_text2time(timeString)          //Time 스트링을 자바스크립트 Date 객체로 변환
{                                               //Parameter time: Time 형식의 String (고정폭 년월일시분초)
    var chkPattern = /-/g;                      //ex) 2005-01-02 또는 20050102 : '-' 사용은 편한대로
    var chkString = timeString.replace(chkPattern, "")

    var chkYear = chkString.substr(0, 4);
    var chkMonth = chkString.substr(4, 2) - 1;   // 1월=0,12월=11
    var chkDay = chkString.substr(6, 2);

    return new Date(chkYear, chkMonth, chkDay);
}

function s2_date_time2text(chkDate)             //Date 객체를 TimeString(ex 2005-01-02)로 변경
{
    var chkYear = chkDate.getFullYear();
    var chkMonth = chkDate.getMonth() + 1;      //1월=0,12월=11이므로 1 더함
    var chkDay = chkDate.getDate();

    if (("" + chkMonth).length == 1) {
        chkMonth = "0" + chkMonth;
    }
    if (("" + chkDay).length == 1) {
        chkDay = "0" + chkDay;
    }

    return (chkYear + "-" + chkMonth + "-" + chkDay)
}

function s2_date_time3text(chkDate)             //Date 객체를 TimeString(ex 20050102)로 변경
{
    var chkYear = chkDate.getFullYear();
    var chkMonth = chkDate.getMonth() + 1;      //1월=0,12월=11이므로 1 더함
    var chkDay = chkDate.getDate();

    if (("" + chkMonth).length == 1) {
        chkMonth = "0" + chkMonth;
    }
    if (("" + chkDay).length == 1) {
        chkDay = "0" + chkDay;
    }

    return (chkYear + "" + chkMonth + "" + chkDay)
}

function s2_date_add(chkString, yy, mo, dd)     //문자열 받아서 문자열로 반환
{                                               //ex) 2007-01-01 + 2개월 => 2007-03-01
    if (typeof (yy) == "undefined") yy = 0;
    if (typeof (mo) == "undefined") mo = 0;
    if (typeof (dd) == "undefined") dd = 0;

    var date = s2_date_text2time(chkString);

    date.setFullYear(date.getFullYear() + yy);  //yy년을 더함
    date.setMonth(date.getMonth() + mo);  //mo월을 더함
    date.setDate(date.getDate() + dd);  //dd일을 더함

    return s2_date_time2text(date);
}

function s2_date_term_month(time1, time2)       //measureMonthInterval(time1,time2)
{                                               //두 Time이 몇 개월 차이나는지 구함
    var date1 = s2_date_text2time(time1);
    var date2 = s2_date_text2time(time2);

    var years = date2.getFullYear() - date1.getFullYear();
    var months = date2.getMonth() - date1.getMonth();
    var days = date2.getDate() - date1.getDate();

    return (years * 12 + months + (days >= 0 ? 0 : -1));
}

/** 생년월일 유효성 체크 */
function s2_isValidDate_birth(iDate) {
    if (iDate.length != 8) {
        return false;
    }

    oDate = new Date();

    if (parseInt(s2_date_time3text(oDate)) < parseInt(iDate)) {	/*현재 년도와 비교 */
        return false;
    }

    if (!s2_isValidDate(iDate)) {	/* 날짜 형식 유효성 */
        return false;
    }

    return true;
}

/**yyyymmdd 형식의 날짜값을 입력받아서 유효한 날짜인지 체크한다. ex) isValidDate("20070415"); */
function s2_isValidDate(iDate) {
    if (iDate.length != 8) {
        return false;
    }

    month_int = parseInt(iDate.substring(4, 6), 10);
    month_value = month_int - 1;
    oDate = new Date();
    oDate.setFullYear(iDate.substring(0, 4));
    oDate.setMonth(month_value);
    oDate.setDate(parseInt(iDate.substring(6), 10));
    oDate_getYear = oDate.getFullYear();
    oDate_getDate = oDate.getDate();
    if (oDate.getMonth() == 2 || oDate.getMonth() == 4 || oDate.getMonth() == 6 || oDate.getMonth() == 9 || oDate.getMonth() == 11) {
        if (month_value == 2 || month_value == 4 || month_value == 6 || month_value == 9 || month_value == 11) {
            oDate_getMonth = oDate.getMonth() + 1;
        } else {
            oDate_getMonth = oDate.getMonth();
        }
    } else {
        oDate_getMonth = oDate.getMonth() + 1;
    }

    if (oDate_getYear != iDate.substring(0, 4)
        || oDate_getMonth != parseInt(iDate.substring(4, 6), 10)
        || oDate_getDate != parseInt(iDate.substring(6), 10)) {


        return false;
    }

    return true;
}


/** 날짜관련 함수 : 종료 ***************************************************************************************************/

function s2_window_open_center(popUrl, popName, popWidth, popHeight, popAddFeatures) {
    var popTop = (screen.availHeight - popHeight) / 2;
    var popLeft = (screen.availWidth - popWidth) / 2;

    if (popAddFeatures)
        var popFeatures = "top=" + popTop + ", left=" + popLeft + ", width=" + popWidth + ", height=" + popHeight + ", " + popAddFeatures;
    else
        var popFeatures = "top=" + popTop + ", left=" + popLeft + ", width=" + popWidth + ", height=" + popHeight;

    window.open(popUrl, popName, popFeatures);
}

function s2_movie_play(chkUrl, chkWidth, chkHeight) {
    var s2_element_width = (chkWidth ? chkWidth : 320);
    var s2_element_height = (chkHeight ? chkHeight : 240) + 67; // 플레이어 버튼영역

    str = "<object id=\"MovePlay\" width=" + s2_element_width + " height=" + s2_element_height + " viewastext style=\"z-index:1\" classid=\"CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95\" codebase=\"http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701\" standby=\"Loading Microsoft Windows Media Player components...\" type=\"application/x-oleobject\">"
        + "  <param name=\"FileName\"           value=\"" + chkUrl + "\">"
        + "  <param name=\"ANIMATIONATSTART\"   value=\"1\">"
        + "  <param name=\"AUTOSTART\"          value=\"1\">"
        + "  <param name=\"BALANCE\"            value=\"0\">"
        + "  <param name=\"CURRENTMARKER\"      value=\"0\">"
        + "  <param name=\"CURRENTPOSITION\"    value=\"0\">"
        + "  <param name=\"DISPLAYMODE\"        value=\"4\">"
        + "  <param name=\"ENABLECONTEXTMENU\"  value=\"0\">"
        + "  <param name=\"ENABLED\"            value=\"1\">"
        + "  <param name=\"FULLSCREEN\"         value=\"0\">"
        + "  <param name=\"INVOKEURLS\"         value=\"1\">"
        + "  <param name=\"PLAYCOUNT\"          value=\"1\">"
        + "  <param name=\"RATE\"               value=\"1\">"
        + "  <param name=\"SHOWCONTROLS\"       value=\"1\">"
        + "  <param name=\"SHOWSTATUSBAR\"      value=\"-1\">"
        + "  <param name=\"STRETCHTOFIT\"       value=\"0\">"
        + "  <param name=\"TRANSPARENTATSTART\" value=\"1\">"
        + "  <param name=\"UIMODE\"             value=\"FULL\">"
        + "  <param name=\"displaybackcolor\"   value=\"0\">"
        + "</object>"

    document.write(str);
}


function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function getCookie(name) {
    var nameOfCookie = name + "=";
    var x = 0;
    while (x <= document.cookie.length) {
        var y = (x + nameOfCookie.length);
        if (document.cookie.substring(x, y) == nameOfCookie) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
        }
        x = document.cookie.indexOf(" ", x) + 1;
        if (x == 0)
            break;
    }
    return "";
}

function bookmarksite(title, url) {
    // Internet Explorer

    if (document.all) {
        window.external.AddFavorite(url, title);
    }
    // Google Chrome
    else if (window.chrome) {
        alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
    }
    // Firefox
    else if (window.sidebar) // firefox
    {
        window.sidebar.addPanel(title, url, "");
    }
    // Opera
    else if (window.opera && window.print) { // opera
        var elem = document.createElement('a');
        elem.setAttribute('href', url);
        elem.setAttribute('title', title);
        elem.setAttribute('rel', 'sidebar');
        elem.click();
    }
}

//넘어온 도 명에 따라 구군 체크박스 생성
function searchGu2(cityName, targetId) {
    divArea = document.getElementById(targetId);
    var tag = "";
    divArea.innerHTML = '';

    if (cityName == "강원") {
        tag += '<div class="chk_box"><label for="chk_gu1"><input type="checkbox" name="buy_style_C2_2" id="chk_gu1" value="강릉시"><span>강릉시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu2"><input type="checkbox" name="buy_style_C2_2" id="chk_gu2" value="고성군"><span>고성군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu3"><input type="checkbox" name="buy_style_C2_2" id="chk_gu3" value="동해시"><span>동해시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu4"><input type="checkbox" name="buy_style_C2_2" id="chk_gu4" value="삼척시"><span>삼척시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu5"><input type="checkbox" name="buy_style_C2_2" id="chk_gu5" value="속초시"><span>속초시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu6"><input type="checkbox" name="buy_style_C2_2" id="chk_gu6" value="양구군"><span>양구군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu7"><input type="checkbox" name="buy_style_C2_2" id="chk_gu7" value="양양군"><span>양양군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu8"><input type="checkbox" name="buy_style_C2_2" id="chk_gu8" value="원주시"><span>원주시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu9"><input type="checkbox" name="buy_style_C2_2" id="chk_gu9" value="인제군"><span>인제군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu10"><input type="checkbox" name="buy_style_C2_2" id="chk_gu10" value="정선군"><span>정선군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu11"><input type="checkbox" name="buy_style_C2_2" id="chk_gu11" value="철원군"><span>철원군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu12"><input type="checkbox" name="buy_style_C2_2" id="chk_gu12" value="춘천시"><span>춘천시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu13"><input type="checkbox" name="buy_style_C2_2" id="chk_gu13" value="태백시"><span>태백시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu14"><input type="checkbox" name="buy_style_C2_2" id="chk_gu14" value="평창군"><span>평창군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu15"><input type="checkbox" name="buy_style_C2_2" id="chk_gu15" value="홍천군"><span>홍천군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu16"><input type="checkbox" name="buy_style_C2_2" id="chk_gu16" value="화천군"><span>화천군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu17"><input type="checkbox" name="buy_style_C2_2" id="chk_gu17" value="횡성군"><span>횡성군</span></label></div> ';
    } else if (cityName == "경기") {
        tag += '<div class="chk_box"><label for="chk_gu18"><input type="checkbox" name="buy_style_C2_2" id="chk_gu18" value="가평군"><span>가평군</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu19"><input type="checkbox" name="buy_style_C2_2" id="chk_gu19" value="고양시 덕양구"><span>고양시 덕양구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu20"><input type="checkbox" name="buy_style_C2_2" id="chk_gu20" value="고양시 일산동구"><span>고양시 일산동구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu21"><input type="checkbox" name="buy_style_C2_2" id="chk_gu21" value="고양시 일산서구"><span>고양시 일산서구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu22"><input type="checkbox" name="buy_style_C2_2" id="chk_gu22" value="과천시"><span>과천시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu23"><input type="checkbox" name="buy_style_C2_2" id="chk_gu23" value="광명시"><span>광명시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu24"><input type="checkbox" name="buy_style_C2_2" id="chk_gu24" value="광주시"><span>광주시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu25"><input type="checkbox" name="buy_style_C2_2" id="chk_gu25" value="구리시"><span>구리시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu26"><input type="checkbox" name="buy_style_C2_2" id="chk_gu26" value="군포시"><span>군포시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu27"><input type="checkbox" name="buy_style_C2_2" id="chk_gu27" value="김포시"><span>김포시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu28"><input type="checkbox" name="buy_style_C2_2" id="chk_gu28" value="남양주시"><span>남양주시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu29"><input type="checkbox" name="buy_style_C2_2" id="chk_gu29" value="동두천시"><span>동두천시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu30"><input type="checkbox" name="buy_style_C2_2" id="chk_gu30" value="부천시 소사구"><span>부천시 소사구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu31"><input type="checkbox" name="buy_style_C2_2" id="chk_gu31" value="부천시 오정구"><span>부천시 오정구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu32"><input type="checkbox" name="buy_style_C2_2" id="chk_gu32" value="부천시 원미구"><span>부천시 원미구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu33"><input type="checkbox" name="buy_style_C2_2" id="chk_gu33" value="성남시 분당구"><span>성남시 분당구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu34"><input type="checkbox" name="buy_style_C2_2" id="chk_gu34" value="성남시 수정구"><span>성남시 수정구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu35"><input type="checkbox" name="buy_style_C2_2" id="chk_gu35" value="성남시 중원구"><span>성남시 중원구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu36"><input type="checkbox" name="buy_style_C2_2" id="chk_gu36" value="수원시 권선구"><span>수원시 권선구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu37"><input type="checkbox" name="buy_style_C2_2" id="chk_gu37" value="수원시 영통구"><span>수원시 영통구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu38"><input type="checkbox" name="buy_style_C2_2" id="chk_gu38" value="수원시 장안구"><span>수원시 장안구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu39"><input type="checkbox" name="buy_style_C2_2" id="chk_gu39" value="수원시 팔달구"><span>수원시 팔달구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu40"><input type="checkbox" name="buy_style_C2_2" id="chk_gu40" value="안산시 단원구"><span>안산시 단원구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu41"><input type="checkbox" name="buy_style_C2_2" id="chk_gu41" value="안산시 상록구"><span>안산시 상록구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu42"><input type="checkbox" name="buy_style_C2_2" id="chk_gu42" value="안양시 동안구"><span>안양시 동안구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu43"><input type="checkbox" name="buy_style_C2_2" id="chk_gu43" value="안양시 만안구"><span>안양시 만안구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu44"><input type="checkbox" name="buy_style_C2_2" id="chk_gu44" value="용인시 기흥구"><span>용인시 기흥구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu45"><input type="checkbox" name="buy_style_C2_2" id="chk_gu45" value="용인시 수지구"><span>용인시 수지구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu46"><input type="checkbox" name="buy_style_C2_2" id="chk_gu46" value="용인시 처인구"><span>용인시 처인구</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu47"><input type="checkbox" name="buy_style_C2_2" id="chk_gu47" value="의왕시"><span>의왕시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu48"><input type="checkbox" name="buy_style_C2_2" id="chk_gu48" value="의정부시"><span>의정부시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu49"><input type="checkbox" name="buy_style_C2_2" id="chk_gu49" value="이천시"><span>이천시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu50"><input type="checkbox" name="buy_style_C2_2" id="chk_gu50" value="파주시"><span>파주시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu51"><input type="checkbox" name="buy_style_C2_2" id="chk_gu51" value="평택시"><span>평택시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu52"><input type="checkbox" name="buy_style_C2_2" id="chk_gu52" value="포천시"><span>포천시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu53"><input type="checkbox" name="buy_style_C2_2" id="chk_gu53" value="하남시"><span>하남시</span></label></div> ';
        tag += '<div class="chk_box"><label for="chk_gu54"><input type="checkbox" name="buy_style_C2_2" id="chk_gu54" value="화성시"><span>화성시</span></label></div>';
    } else if (cityName == "경남") {
        tag += '<div class="chk_box"><label for="chk_gu55"><input type="checkbox" name="buy_style_C2_2" id="chk_gu55" value="거제시"><span>거제시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu56"><input type="checkbox" name="buy_style_C2_2" id="chk_gu56" value="거창군"><span>거창군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu57"><input type="checkbox" name="buy_style_C2_2" id="chk_gu57" value="고성군"><span>고성군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu58"><input type="checkbox" name="buy_style_C2_2" id="chk_gu58" value="김해시"><span>김해시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu59"><input type="checkbox" name="buy_style_C2_2" id="chk_gu59" value="남해군"><span>남해군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu60"><input type="checkbox" name="buy_style_C2_2" id="chk_gu60" value="밀양시"><span>밀양시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu61"><input type="checkbox" name="buy_style_C2_2" id="chk_gu61" value="사천시"><span>사천시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu62"><input type="checkbox" name="buy_style_C2_2" id="chk_gu62" value="산청군"><span>산청군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu63"><input type="checkbox" name="buy_style_C2_2" id="chk_gu63" value="양산시"><span>양산시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu64"><input type="checkbox" name="buy_style_C2_2" id="chk_gu64" value="의령군"><span>의령군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu65"><input type="checkbox" name="buy_style_C2_2" id="chk_gu65" value="진주시"><span>진주시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu66"><input type="checkbox" name="buy_style_C2_2" id="chk_gu66" value="창녕군"><span>창녕군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu67"><input type="checkbox" name="buy_style_C2_2" id="chk_gu67" value="창원시 마산합포구"><span>창원시 마산합포구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu68"><input type="checkbox" name="buy_style_C2_2" id="chk_gu68" value="창원시 마산회원구"><span>창원시 마산회원구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu69"><input type="checkbox" name="buy_style_C2_2" id="chk_gu69" value="창원시 성산구"><span>창원시 성산구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu70"><input type="checkbox" name="buy_style_C2_2" id="chk_gu70" value="창원시 의창구"><span>창원시 의창구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu71"><input type="checkbox" name="buy_style_C2_2" id="chk_gu71" value="창원시 진해구"><span>창원시 진해구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu72"><input type="checkbox" name="buy_style_C2_2" id="chk_gu72" value="통영시"><span>통영시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu73"><input type="checkbox" name="buy_style_C2_2" id="chk_gu73" value="하동군"><span>하동군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu74"><input type="checkbox" name="buy_style_C2_2" id="chk_gu74" value="함안군"><span>함안군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu75"><input type="checkbox" name="buy_style_C2_2" id="chk_gu75" value="함양군"><span>함양군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu76"><input type="checkbox" name="buy_style_C2_2" id="chk_gu76" value="합천군"><span>합천군</span></label></div>';
    } else if (cityName == "경북") {
        tag += '<div class="chk_box"><label for="chk_gu77"><input type="checkbox" name="buy_style_C2_2" id="chk_gu77" value="경산시"><span>경산시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu78"><input type="checkbox" name="buy_style_C2_2" id="chk_gu78" value="경주시"><span>경주시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu79"><input type="checkbox" name="buy_style_C2_2" id="chk_gu79" value="고령군"><span>고령군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu80"><input type="checkbox" name="buy_style_C2_2" id="chk_gu80" value="구미시"><span>구미시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu81"><input type="checkbox" name="buy_style_C2_2" id="chk_gu81" value="군위군"><span>군위군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu82"><input type="checkbox" name="buy_style_C2_2" id="chk_gu82" value="김천시"><span>김천시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu83"><input type="checkbox" name="buy_style_C2_2" id="chk_gu83" value="문경시"><span>문경시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu84"><input type="checkbox" name="buy_style_C2_2" id="chk_gu84" value="봉화군"><span>봉화군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu85"><input type="checkbox" name="buy_style_C2_2" id="chk_gu85" value="상주시"><span>상주시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu86"><input type="checkbox" name="buy_style_C2_2" id="chk_gu86" value="성주군"><span>성주군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu87"><input type="checkbox" name="buy_style_C2_2" id="chk_gu87" value="안동시"><span>안동시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu88"><input type="checkbox" name="buy_style_C2_2" id="chk_gu88" value="영덕군"><span>영덕군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu89"><input type="checkbox" name="buy_style_C2_2" id="chk_gu89" value="영양군"><span>영양군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu90"><input type="checkbox" name="buy_style_C2_2" id="chk_gu90" value="영주시"><span>영주시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu91"><input type="checkbox" name="buy_style_C2_2" id="chk_gu91" value="영천시"><span>영천시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu92"><input type="checkbox" name="buy_style_C2_2" id="chk_gu92" value="예천군"><span>예천군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu93"><input type="checkbox" name="buy_style_C2_2" id="chk_gu93" value="울릉군"><span>울릉군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu94"><input type="checkbox" name="buy_style_C2_2" id="chk_gu94" value="울진군"><span>울진군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu95"><input type="checkbox" name="buy_style_C2_2" id="chk_gu95" value="의성군"><span>의성군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu96"><input type="checkbox" name="buy_style_C2_2" id="chk_gu96" value="청도군"><span>청도군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu97"><input type="checkbox" name="buy_style_C2_2" id="chk_gu97" value="청송군"><span>청송군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu98"><input type="checkbox" name="buy_style_C2_2" id="chk_gu98" value="칠곡군"><span>칠곡군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu99"><input type="checkbox" name="buy_style_C2_2" id="chk_gu99" value="포항시 남구"><span>포항시 남구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu100"><input type="checkbox" name="buy_style_C2_2" id="chk_gu100" value="포항시 북구"><span>포항시 북구</span></label></div>';
    } else if (cityName == "광주") {
        tag += '<div class="chk_box"><label for="chk_gu101"><input type="checkbox" name="buy_style_C2_2" id="chk_gu101" value="광산구"><span>광산구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu102"><input type="checkbox" name="buy_style_C2_2" id="chk_gu102" value="남구"><span>남구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu103"><input type="checkbox" name="buy_style_C2_2" id="chk_gu103" value="동구"><span>동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu104"><input type="checkbox" name="buy_style_C2_2" id="chk_gu104" value="북구"><span>북구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu105"><input type="checkbox" name="buy_style_C2_2" id="chk_gu105" value="서구"><span>서구</span></label></div>';
    } else if (cityName == "대구") {
        tag += '<div class="chk_box"><label for="chk_gu106"><input type="checkbox" name="buy_style_C2_2" id="chk_gu106" value="남구"><span>남구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu107"><input type="checkbox" name="buy_style_C2_2" id="chk_gu107" value="달서구"><span>달서구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu108"><input type="checkbox" name="buy_style_C2_2" id="chk_gu108" value="달성군"><span>달성군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu109"><input type="checkbox" name="buy_style_C2_2" id="chk_gu109" value="동구"><span>동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu110"><input type="checkbox" name="buy_style_C2_2" id="chk_gu110" value="북구"><span>북구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu111"><input type="checkbox" name="buy_style_C2_2" id="chk_gu111" value="서구"><span>서구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu112"><input type="checkbox" name="buy_style_C2_2" id="chk_gu112" value="수성구"><span>수성구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu113"><input type="checkbox" name="buy_style_C2_2" id="chk_gu113" value="중구"><span>중구</span></label></div>';
    } else if (cityName == "대전") {
        tag += '<div class="chk_box"><label for="chk_gu114"><input type="checkbox" name="buy_style_C2_2" id="chk_gu114" value="대덕구"><span>대덕구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu115"><input type="checkbox" name="buy_style_C2_2" id="chk_gu115" value="동구"><span>동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu116"><input type="checkbox" name="buy_style_C2_2" id="chk_gu116" value="서구"><span>서구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu117"><input type="checkbox" name="buy_style_C2_2" id="chk_gu117" value="유성구"><span>유성구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu118"><input type="checkbox" name="buy_style_C2_2" id="chk_gu118" value="중구"><span>중구</span></label></div>';
    } else if (cityName == "부산") {
        tag += '<div class="chk_box"><label for="chk_gu119"><input type="checkbox" name="buy_style_C2_2" id="chk_gu119" value="강서구"><span>강서구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu120"><input type="checkbox" name="buy_style_C2_2" id="chk_gu120" value="금정구"><span>금정구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu121"><input type="checkbox" name="buy_style_C2_2" id="chk_gu121" value="기장군"><span>기장군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu122"><input type="checkbox" name="buy_style_C2_2" id="chk_gu122" value="남구"><span>남구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu123"><input type="checkbox" name="buy_style_C2_2" id="chk_gu123" value="동구"><span>동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu124"><input type="checkbox" name="buy_style_C2_2" id="chk_gu124" value="동래구"><span>동래구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu125"><input type="checkbox" name="buy_style_C2_2" id="chk_gu125" value="부산진구"><span>부산진구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu126"><input type="checkbox" name="buy_style_C2_2" id="chk_gu126" value="북구"><span>북구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu127"><input type="checkbox" name="buy_style_C2_2" id="chk_gu127" value="사상구"><span>사상구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu128"><input type="checkbox" name="buy_style_C2_2" id="chk_gu128" value="사하구"><span>사하구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu129"><input type="checkbox" name="buy_style_C2_2" id="chk_gu129" value="서구"><span>서구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu130"><input type="checkbox" name="buy_style_C2_2" id="chk_gu130" value="수영구"><span>수영구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu131"><input type="checkbox" name="buy_style_C2_2" id="chk_gu131" value="연제구"><span>연제구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu132"><input type="checkbox" name="buy_style_C2_2" id="chk_gu132" value="영도구"><span>영도구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu133"><input type="checkbox" name="buy_style_C2_2" id="chk_gu133" value="중구"><span>중구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu134"><input type="checkbox" name="buy_style_C2_2" id="chk_gu134" value="해운대구"><span>해운대구</span></label></div>';
    } else if (cityName == "서울") {
        tag += '<div class="chk_box"><label for="chk_gu135"><input type="checkbox" name="buy_style_C2_2" id="chk_gu135" value="강남구"><span>강남구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu136"><input type="checkbox" name="buy_style_C2_2" id="chk_gu136" value="강동구"><span>강동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu137"><input type="checkbox" name="buy_style_C2_2" id="chk_gu137" value="강북구"><span>강북구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu138"><input type="checkbox" name="buy_style_C2_2" id="chk_gu138" value="강서구"><span>강서구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu139"><input type="checkbox" name="buy_style_C2_2" id="chk_gu139" value="관악구"><span>관악구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu140"><input type="checkbox" name="buy_style_C2_2" id="chk_gu140" value="광진구"><span>광진구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu141"><input type="checkbox" name="buy_style_C2_2" id="chk_gu141" value="구로구"><span>구로구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu142"><input type="checkbox" name="buy_style_C2_2" id="chk_gu142" value="금천구"><span>금천구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu143"><input type="checkbox" name="buy_style_C2_2" id="chk_gu143" value="노원구"><span>노원구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu144"><input type="checkbox" name="buy_style_C2_2" id="chk_gu144" value="도봉구"><span>도봉구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu145"><input type="checkbox" name="buy_style_C2_2" id="chk_gu145" value="동대문구"><span>동대문구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu146"><input type="checkbox" name="buy_style_C2_2" id="chk_gu146" value="동작구"><span>동작구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu147"><input type="checkbox" name="buy_style_C2_2" id="chk_gu147" value="마포구"><span>마포구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu148"><input type="checkbox" name="buy_style_C2_2" id="chk_gu148" value="서대문구"><span>서대문구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu149"><input type="checkbox" name="buy_style_C2_2" id="chk_gu149" value="서초구"><span>서초구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu150"><input type="checkbox" name="buy_style_C2_2" id="chk_gu150" value="성동구"><span>성동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu151"><input type="checkbox" name="buy_style_C2_2" id="chk_gu151" value="성북구"><span>성북구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu152"><input type="checkbox" name="buy_style_C2_2" id="chk_gu152" value="송파구"><span>송파구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu153"><input type="checkbox" name="buy_style_C2_2" id="chk_gu153" value="양천구"><span>양천구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu154"><input type="checkbox" name="buy_style_C2_2" id="chk_gu154" value="영등포구"><span>영등포구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu155"><input type="checkbox" name="buy_style_C2_2" id="chk_gu155" value="용산구"><span>용산구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu156"><input type="checkbox" name="buy_style_C2_2" id="chk_gu156" value="은평구"><span>은평구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu157"><input type="checkbox" name="buy_style_C2_2" id="chk_gu157" value="종로구"><span>종로구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu158"><input type="checkbox" name="buy_style_C2_2" id="chk_gu158" value="중구"><span>중구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu159"><input type="checkbox" name="buy_style_C2_2" id="chk_gu159" value="중랑구"><span>중랑구</span></label></div>';
    } else if (cityName == "울산") {
        tag += '<div class="chk_box"><label for="chk_gu160"><input type="checkbox" name="buy_style_C2_2" id="chk_gu160" value="남구"><span>남구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu161"><input type="checkbox" name="buy_style_C2_2" id="chk_gu161" value="동구"><span>동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu162"><input type="checkbox" name="buy_style_C2_2" id="chk_gu162" value="북구"><span>북구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu163"><input type="checkbox" name="buy_style_C2_2" id="chk_gu163" value="울주군"><span>울주군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu164"><input type="checkbox" name="buy_style_C2_2" id="chk_gu164" value="중구"><span>중구</span></label></div>';
    } else if (cityName == "인천") {
        tag += '<div class="chk_box"><label for="chk_gu165"><input type="checkbox" name="buy_style_C2_2" id="chk_gu165" value="강화군"><span>강화군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu166"><input type="checkbox" name="buy_style_C2_2" id="chk_gu166" value="계양구"><span>계양구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu167"><input type="checkbox" name="buy_style_C2_2" id="chk_gu167" value="남구"><span>남구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu168"><input type="checkbox" name="buy_style_C2_2" id="chk_gu168" value="남동구"><span>남동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu169"><input type="checkbox" name="buy_style_C2_2" id="chk_gu169" value="동구"><span>동구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu170"><input type="checkbox" name="buy_style_C2_2" id="chk_gu170" value="부평구"><span>부평구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu171"><input type="checkbox" name="buy_style_C2_2" id="chk_gu171" value="서구"><span>서구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu172"><input type="checkbox" name="buy_style_C2_2" id="chk_gu172" value="연수구"><span>연수구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu173"><input type="checkbox" name="buy_style_C2_2" id="chk_gu173" value="옹진군"><span>옹진군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu174"><input type="checkbox" name="buy_style_C2_2" id="chk_gu174" value="중구"><span>중구</span></label></div>';
    } else if (cityName == "전남") {
        tag += '<div class="chk_box"><label for="chk_gu175"><input type="checkbox" name="buy_style_C2_2" id="chk_gu175" value="강진군"><span>강진군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu176"><input type="checkbox" name="buy_style_C2_2" id="chk_gu176" value="고흥군"><span>고흥군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu177"><input type="checkbox" name="buy_style_C2_2" id="chk_gu177" value="곡성군"><span>곡성군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu178"><input type="checkbox" name="buy_style_C2_2" id="chk_gu178" value="광양시"><span>광양시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu179"><input type="checkbox" name="buy_style_C2_2" id="chk_gu179" value="구례군"><span>구례군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu180"><input type="checkbox" name="buy_style_C2_2" id="chk_gu180" value="나주시"><span>나주시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu181"><input type="checkbox" name="buy_style_C2_2" id="chk_gu181" value="담양군"><span>담양군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu182"><input type="checkbox" name="buy_style_C2_2" id="chk_gu182" value="목포시"><span>목포시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu183"><input type="checkbox" name="buy_style_C2_2" id="chk_gu183" value="무안군"><span>무안군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu184"><input type="checkbox" name="buy_style_C2_2" id="chk_gu184" value="보성군"><span>보성군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu185"><input type="checkbox" name="buy_style_C2_2" id="chk_gu185" value="순천시"><span>순천시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu186"><input type="checkbox" name="buy_style_C2_2" id="chk_gu186" value="신안군"><span>신안군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu187"><input type="checkbox" name="buy_style_C2_2" id="chk_gu187" value="여수시"><span>여수시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu188"><input type="checkbox" name="buy_style_C2_2" id="chk_gu188" value="영광군"><span>영광군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu189"><input type="checkbox" name="buy_style_C2_2" id="chk_gu189" value="영암군"><span>영암군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu190"><input type="checkbox" name="buy_style_C2_2" id="chk_gu190" value="완도군"><span>완도군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu191"><input type="checkbox" name="buy_style_C2_2" id="chk_gu191" value="장성군"><span>장성군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu192"><input type="checkbox" name="buy_style_C2_2" id="chk_gu192" value="장흥군"><span>장흥군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu193"><input type="checkbox" name="buy_style_C2_2" id="chk_gu193" value="진도군"><span>진도군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu194"><input type="checkbox" name="buy_style_C2_2" id="chk_gu194" value="함평군"><span>함평군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu195"><input type="checkbox" name="buy_style_C2_2" id="chk_gu195" value="해남군"><span>해남군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu196"><input type="checkbox" name="buy_style_C2_2" id="chk_gu196" value="화순군"><span>화순군</span></label></div>';
    } else if (cityName == "전북") {
        tag += '<div class="chk_box"><label for="chk_gu197"><input type="checkbox" name="buy_style_C2_2" id="chk_gu197" value="고창군"><span>고창군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu198"><input type="checkbox" name="buy_style_C2_2" id="chk_gu198" value="군산시"><span>군산시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu199"><input type="checkbox" name="buy_style_C2_2" id="chk_gu199" value="김제시"><span>김제시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu200"><input type="checkbox" name="buy_style_C2_2" id="chk_gu200" value="남원시"><span>남원시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu201"><input type="checkbox" name="buy_style_C2_2" id="chk_gu201" value="무주군"><span>무주군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu202"><input type="checkbox" name="buy_style_C2_2" id="chk_gu202" value="부안군"><span>부안군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu203"><input type="checkbox" name="buy_style_C2_2" id="chk_gu203" value="순창군"><span>순창군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu204"><input type="checkbox" name="buy_style_C2_2" id="chk_gu204" value="완주군"><span>완주군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu205"><input type="checkbox" name="buy_style_C2_2" id="chk_gu205" value="익산시"><span>익산시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu206"><input type="checkbox" name="buy_style_C2_2" id="chk_gu206" value="임실군"><span>임실군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu207"><input type="checkbox" name="buy_style_C2_2" id="chk_gu207" value="장수군"><span>장수군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu208"><input type="checkbox" name="buy_style_C2_2" id="chk_gu208" value="전주시 덕진구"><span>전주시 덕진구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu209"><input type="checkbox" name="buy_style_C2_2" id="chk_gu209" value="전주시 완산구"><span>전주시 완산구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu210"><input type="checkbox" name="buy_style_C2_2" id="chk_gu210" value="정읍시"><span>정읍시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu211"><input type="checkbox" name="buy_style_C2_2" id="chk_gu211" value="진안군"><span>진안군</span></label></div>';
    } else if (cityName == "제주") {
        tag += '<div class="chk_box"><label for="chk_gu212"><input type="checkbox" name="buy_style_C2_2" id="chk_gu212" value="서귀포시"><span>서귀포시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu213"><input type="checkbox" name="buy_style_C2_2" id="chk_gu213" value="제주시"><span>제주시</span></label></div>';
    } else if (cityName == "충남") {
        tag += '<div class="chk_box"><label for="chk_gu214"><input type="checkbox" name="buy_style_C2_2" id="chk_gu214" value="계룡시"><span>계룡시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu215"><input type="checkbox" name="buy_style_C2_2" id="chk_gu215" value="공주시"><span>공주시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu216"><input type="checkbox" name="buy_style_C2_2" id="chk_gu216" value="금산군"><span>금산군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu217"><input type="checkbox" name="buy_style_C2_2" id="chk_gu217" value="논산시"><span>논산시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu218"><input type="checkbox" name="buy_style_C2_2" id="chk_gu218" value="당진시"><span>당진시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu219"><input type="checkbox" name="buy_style_C2_2" id="chk_gu219" value="보령시"><span>보령시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu220"><input type="checkbox" name="buy_style_C2_2" id="chk_gu220" value="부여군"><span>부여군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu221"><input type="checkbox" name="buy_style_C2_2" id="chk_gu221" value="서산시"><span>서산시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu222"><input type="checkbox" name="buy_style_C2_2" id="chk_gu222" value="서천군"><span>서천군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu223"><input type="checkbox" name="buy_style_C2_2" id="chk_gu223" value="아산시"><span>아산시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu224"><input type="checkbox" name="buy_style_C2_2" id="chk_gu224" value="예산군"><span>예산군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu225"><input type="checkbox" name="buy_style_C2_2" id="chk_gu225" value="천안시 동남구"><span>천안시 동남구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu226"><input type="checkbox" name="buy_style_C2_2" id="chk_gu226" value="천안시 서북구"><span>천안시 서북구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu227"><input type="checkbox" name="buy_style_C2_2" id="chk_gu227" value="청양군"><span>청양군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu228"><input type="checkbox" name="buy_style_C2_2" id="chk_gu228" value="태안군"><span>태안군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu229"><input type="checkbox" name="buy_style_C2_2" id="chk_gu229" value="홍성군"><span>홍성군</span></label></div>';
    } else if (cityName == "충북") {
        tag += '<div class="chk_box"><label for="chk_gu230"><input type="checkbox" name="buy_style_C2_2" id="chk_gu230" value="괴산군"><span>괴산군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu231"><input type="checkbox" name="buy_style_C2_2" id="chk_gu231" value="단양군"><span>단양군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu232"><input type="checkbox" name="buy_style_C2_2" id="chk_gu232" value="보은군"><span>보은군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu233"><input type="checkbox" name="buy_style_C2_2" id="chk_gu233" value="영동군"><span>영동군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu234"><input type="checkbox" name="buy_style_C2_2" id="chk_gu234" value="옥천군"><span>옥천군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu235"><input type="checkbox" name="buy_style_C2_2" id="chk_gu235" value="음성군"><span>음성군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu236"><input type="checkbox" name="buy_style_C2_2" id="chk_gu236" value="제천시"><span>제천시</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu237"><input type="checkbox" name="buy_style_C2_2" id="chk_gu237" value="증평군"><span>증평군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu238"><input type="checkbox" name="buy_style_C2_2" id="chk_gu238" value="진천군"><span>진천군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu239"><input type="checkbox" name="buy_style_C2_2" id="chk_gu239" value="청원군"><span>청원군</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu240"><input type="checkbox" name="buy_style_C2_2" id="chk_gu240" value="청주시 상당구"><span>청주시 상당구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu241"><input type="checkbox" name="buy_style_C2_2" id="chk_gu241" value="청주시 흥덕구"><span>청주시 흥덕구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu242"><input type="checkbox" name="buy_style_C2_2" id="chk_gu242" value="청주시 서원구"><span>청주시 서원구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu243"><input type="checkbox" name="buy_style_C2_2" id="chk_gu243" value="청주시 청원구"><span>청주시 청원구</span></label></div>';
        tag += '<div class="chk_box"><label for="chk_gu244"><input type="checkbox" name="buy_style_C2_2" id="chk_gu244" value="충주시"><span>충주시 ';
    } else if (cityName == "세종") {
        tag += '<div class="chk_box"><label for="chk_gu245"><input type="checkbox" name="buy_style_C2_2" id="chk_gu245" value="세종시"><span>세종시</span></label></div>';
    }
    divArea.innerHTML = tag;
}

function isEmpty(value) {
    if (value.length == 0 || value == null) {
        return true;
    } else {
        return false;
    }
}

function isNumeric(value) {
    var regExp = /^[0-9]+$/g;
    return regExp.test(value);
}

function currencyFormatter(amount) {
    return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

function numberBlur(el) {
    var val = $(el).val();
    if (!isEmpty(val) && isNumeric(val)) {
        val = currencyFormatter(val);
        $(el).val(val);
    }
}

function inputNumberAutoComma(obj) {

    // 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
    var deleteComma = obj.value.replace(/\,/g, "");

    // 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
    if (isFinite(deleteComma) == false) {
        alert("문자는 입력하실 수 없습니다.");
        obj.value = "";
        return false;
    }

    // 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
    obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
}

function inputNumberAutoComma2(str) {

    str = String(str);
    // 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
    var deleteComma = str.replace(/\,/g, "");

    // 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
    if (isFinite(deleteComma) == false) {
        alert("문자는 입력하실 수 없습니다.");
        return false;
    }
    // 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
    return inputNumberWithComma(inputNumberRemoveComma(str));
}

// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function inputNumberWithComma(str) {

    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
}

// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
function inputNumberRemoveComma(str) {

    str = String(str);
    return str.replace(/[^\d]+/g, "");
}

function hangul() { //한글 입력(onkeyPress)
    if ((event.keyCode < 12592) || (event.keyCode > 12687)) {
        event.returnValue = false;
    }
}

function evalGetIdSetVal(headStr, tailStr, val) {
    return (new Function(document.getElementById(headStr + tailStr).value = val));
}

function evalGetIdGetVal(headStr, tailStr) {
    var id = headStr + tailStr
    return $("#"+id).val();
}

function evalGetIdGetObject(headStr, tailStr) {
    var id = headStr + tailStr
    return $("#"+id);
}

function popCheck() {
    var win = window.open('', 'win', 'width=1, height=1, scrollbars=yes, resizable=yes');
    if (win == null || typeof (win) == "undefined" || (win == null && win.outerWidth == 0) || (win != null && win.outerHeight == 0) || win.test == "undefined") {
        alert("팝업 차단 기능이 설정되어있습니다.\n차단 기능을 해제(팝업허용) 한 후 다시 이용해 주십시오.");
        return;
    } else if (win) {
        if (win.innerWidth === 0) {
            alert("팝업 차단 기능이 설정되어있습니다.\n차단 기능을 해제(팝업허용) 한 후 다시 이용해 주십시오.");
        }
    } else {
        return;
    }

    if(win){
        win.close();
    }
}

var checkSum = function(jqElements){
    return jqElements.map(function () {
        return Math.pow(2, parseInt($(this).val()));
    }).get().reduce(function(sum, curVal){
        return sum + curVal;
    }, 0)
}

function getFileExtension(filePath){  // 파일의 확장자를 가져옮
    var lastIndex = -1;
    lastIndex  = filePath.lastIndexOf('.');
    var extension = "";

    if(lastIndex != -1){
        extension = filePath.substring( lastIndex+1, filePath.len);
    }else{
        extension = "";
    }
    return extension;
}

function checkImage(value){   // 파일 확장자 체크하기.
    var src = getFileExtension(value);
    if(!((src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg") || (src.toLowerCase() == "png"))){
        alert('gif, jpg, png 파일만 지원합니다.');
        return false;
    }
    return true;
}

function checkImageVideo(value){   // 파일 확장자 체크하기.
    var extImgArr = ["gif", "jpg", "jpeg", "png"];
    var extVidArr = ["mp4", "avi", "mpeg"];
    var src = getFileExtension(value).toLowerCase();
    for(i = 0; i < extImgArr.length; i++){
        if(extImgArr[i] === src){
            return 0;
        }
    }
    for(i = 0; i < extVidArr.length; i++){
        if(extVidArr[i] === src){
            return 1;
        }
    }
    alert("이미지 및 동영상 파일만 지원합니다.");
    return -1;
}

function fileCheck(file, sizeMb){
    var maxSize  = sizeMb * 1024 * 1024
    var fileSize = 0;
    var browser=navigator.appName;
    // 익스플로러일 경우
    if (browser=="Microsoft Internet Explorer"){
        var oas = new ActiveXObject("Scripting.FileSystemObject");
        fileSize = oas.getFile( file.value ).size;
    }else{
        fileSize = file.files[0].size;
    }

    if(fileSize > maxSize){
        alert("첨부파일 사이즈는 "+sizeMb+"MB 이내로 등록 가능합니다.");
        return false;
    }
    return true;
}

var addDatepicker = function (dom, format) {
    $(dom).find(".datepicker-add-need").each(function (idx, item) {
        $(item).datepicker({
            trigger: $(item).next(),
            format: format?format:"yyyy-mm-dd"
        });
        $(item).removeClass("datepicker-add-need");
        $(item).datepicker('setDate', $(item).val() == "" ? "today" : $(item).val());
    })
}



function numchk(obj){
    var num=obj.value;
    var val = num.replace(/,/gi,"");  // ,를 삭제하고 넘김
    var regExp=/[^0-9]/gi; //0~9를 제외한 모든문자
    if(regExp.test(val)){
        alert("숫자만 입력 가능합니다.");
        new_num=numchk1(val.replace(regExp,""));
        obj.value=new_num;
    }else{
        new_num= numchk1(val);
        obj.value=new_num;
    }
}
function numchk1(num){
    if(num==0) {
        return num;
    }else{                  //0으로 시작하는 숫자는 1을 곱해서 0을 없애줌
        num=num*1;
    }
    num = new String(num)
    var temp="";
    var pos=3;
    num_len=num.length;
    while (num_len>0){
        num_len=num_len-pos;
        if(num_len<0) {
            pos=num_len+pos;
            num_len=0;
        }
        temp=","+num.substr(num_len,pos)+temp;
    }
    return temp.substr(1);
}
//숫자를 제외하곤 ""처리
function SetNum(obj){
    var val=obj.value;
    var regExp=/[^0-9]/gi; //0~9를 제외한 모든문자
    if(regExp.test(obj.value)){
        alert("숫자만 입력 가능합니다.");
        obj.value=val.replace(regExp,"");
    }
}

//숫자와 - 를 제외하고 "" 처리
function SetNum2(obj){
    var val=obj.value;
    var regExp=/[^0-9-]/gi;
    if(regExp.test(obj.value)){
        alert("숫자와 -만  입력 가능합니다.");
        obj.value=val.replace(regExp,"");
    }
}

function updateLike(inDom){
    var dom = $(inDom)
    var target = dom.data("target");
    var targetId = dom.data("id");
    var like_status = dom.hasClass("fix")?'N':'Y';
    $.ajax({
        type: "put",
        url: "/common/like",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify({
            target : target,
            targetId : targetId,
            like_status : like_status
        })
    }).done(function (response) {
        if(response.success){
            if(response.storeData == "Y")
                dom.addClass("fix");
            else
                dom.removeClass("fix");
        }
    })
}


$.ajaxSetup({
    error: function(xhr, status, err) {
        let type = xhr.responseJSON.message;
        if (xhr.status == 401) {
            if(type == "master") {
                alert("세션이 종료되었습니다.\n재접속 하시기 바랍니다.");
                location.href = "/master/login.do";
            } else if(type == "user") {
                alert("세션이 종료되었습니다.\n재접속 하시기 바랍니다.");
                location.href = "/common/login.do";
            }

        }
    }
});

