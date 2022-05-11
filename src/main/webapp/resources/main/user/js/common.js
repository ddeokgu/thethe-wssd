

$(document).ready(function (){
    joinTab01();
    joinTab02();
    joinTab03();
    joinTab04();
    dateN();
    action();
    othTabMenu();
    clockTab();
    clockTab02();

    /* left-menu two_list */
    $(".two_nav >a").click(function(){
        if($(this).hasClass('view')) {
            $(this).removeClass('view');
        }else {
            $(this).addClass('view');
        }

    });


    $('.cont_input input').focus(function() {
        $(this).parents('.cont_input').addClass('focus');
        $(this).addClass('focus');
    })
    $('.cont_input input').on('input',function() {
        if ($(this).val() == "") {
            $(this).removeClass('focus');
            $('.cont_btn a').removeClass('active');
        }else {
            $(this).parents('.cont_input').addClass('focus');
            $('.cont_btn a').addClass('active');

        }
    });

    /* 등록 table_list 모바일 view*/
    $('.m_show a.more').click(function() {
        if ($(this).hasClass('view')) {
            $(this).parents('tr').next('.tr_re').removeClass('view');
        }else {
            $(this).removeClass('view');
            $(this).parents('tr').next('.tr_re').addClass('view');
        }
    });


    /* 타학원 table_list 모바일 view*/
    $('.m_show a.more').click(function() {
        if ($(this).hasClass('view')) {
            $(this).removeClass('view');
            $(this).parents('tr').next('.tr_01').removeClass('view');
        }else {
            $(this).addClass('view');
            $(this).parents('tr').next('.tr_01').addClass('view');
        }

    });

    /* 예외일정 view */
    $('.delete .btn_type01').click(function() {
        if($(this).hasClass('view')) {
            $(this).removeClass('view');
            $(this).parents('tr').next('.tr_01').next('.other_list').next('.tr_02').removeClass("view");
        }else {
            $(this).addClass('view');
            $(this).parents('tr').next('.tr_01').next('.other_list').next('.tr_02').addClass("view");
        }
    });


    /* 등록신청서-구분 select */
    $('#select_regist_exam').change(function() {
        var state = $('#select_regist_exam option:selected').val();
        if ( state == 'TE0' ) {
            $('.on_none').show();
        } else {
            $('.on_none').hide();
        }
    });

    //다른곳 클릭시 창닫기
    $(document).click(function (e){
        if($('.action').has(e.target).length === 0){

            $('.action_info').removeClass('view');

        }

    });


});


/*function seat(el, SEAT_SEQ) {
    var _this = $(el);
    $('.seatBox>li').removeClass("active");
    _this.parent('li').addClass("active");

    if(el != null) {
        document.querySelector("#selected_seat").value =SEAT_SEQ;
    }

}*/

function agreeView(el) {
    var _this = $(el)
    if( _this.parents('.all').next('.cont').hasClass('view')) {

        _this.parents('.all').next('.cont').removeClass('view');
    }else {
        _this.parents('.all').next('.cont').addClass('view');

    }

}


function joinTab01(){
    var chkTab01 = $('.chktab01');
    var chkTabUl = chkTab01.children('ul');
    var chkTabLi = chkTabUl.children('li');

    var chkTabCon01 = $('.chktabCon01');
    var chkTabConUl = chkTabCon01.children('ul');
    var chkTabConLi = chkTabConUl.children('li');

    chkTabLi.on('click', function () {
        var thisI = $(this).index();
        chkTabLi.addClass("active");
        chkTabLi.eq(thisI).siblings().removeClass("active");
        chkTabConLi.eq(thisI).show();
        chkTabConLi.eq(thisI).siblings().hide();
    });
    chkTabConLi.on('click', function () {
        var thisI = $(this).index();
    });
};

function joinTab02(){
    $(".chktab02 ul li").click(function(){
        $(".chktab02 ul li").removeClass('on');
        $(".chktabCon02 .conBox").removeClass('on');
        $(this).addClass('on');
        $("#"+$(this).data('id')).addClass('on');
    });
};

function joinTab03(){
    var chkTab03 = $('.chktab03');
    var chkTabUl = chkTab03.children('ul');
    var chkTabLi = chkTabUl.children('li');

    var chkTabCon03 = $('.chktabCon03');
    var chkTabConUl = chkTabCon03.children('ul');
    var chkTabConLi = chkTabConUl.children('li');

    chkTabLi.on('click', function () {
        var thisI = $(this).index();
        chkTabLi.addClass("active");
        chkTabLi.eq(thisI).siblings().removeClass("active");
        chkTabConLi.eq(thisI).show();
    });
    chkTabConLi.on('click', function () {
        var thisI = $(this).index();
    });
}

function joinTab04(el){
    $(".chktab04 ul li").click(function (){
        var _this = $(el);
        $(".chktab04 ul li").removeClass("on");
        $(".chktabCon").removeClass('on');
        $(".chktabCon04 .conBox").removeClass('on');
        $(this).addClass('on');
        $("#"+$(this).data('id')).addClass('on');
        $("#school_list option:eq(0)").prop('selected', true);
        $("#regist_grade option:eq(0)").prop('selected', true);
        $("#select_regist_exam option:eq(0)").prop('selected', true);
        $("#regist_seat_front").val("");
        $("#div_pay").empty();
    });
}

/* left-menu */
function naView(num) {
    var number = num;
    if (number == 1) {
        $('.left_menu, .nav_contents').addClass('view');
        $('html,body').css('overflow', 'auto');
    }
}

function agreeClose() {
    $('.left_menu, .nav_contents').removeClass('view');
    $('html,body').css('overflow','');
}
function navClose() {
    parent.agreeClose();
}

/* 좌석팝업 */
function popView(num) {
    var number = num;
    if (number == 1) {
        $('.pop_cont01').addClass('view');
        $('html,body').css('overflow', 'auto');
    }
}

function popBoxClose() {
    $('.pop_cont01').removeClass('view');
    $('html,body').css('overflow','');
}
function popClose() {
    parent.popBoxClose();
}

/* 등록신청서팝업 */
function popView02(num) {
    var number = num;
    if (number == 1) {
        $('.pop_cont02').addClass('view');
        $('html,body').css('overflow', 'auto');
    }
}

function popBoxClose02() {
    $('.pop_cont02').removeClass('view');
    $('html,body').css('overflow','');
}
function popClose02() {
    parent.popBoxClose02();
}

function checkPassword(passwordStr) {
    var regexPattern = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
    return (new RegExp(regexPattern)).test(passwordStr);
}

function checkEmail(emailStr) {
    var regexPattern =  /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i;
    return (new RegExp(regexPattern)).test(emailStr);
}


function AddComma(num)
{
    let regexp = /\B(?=(\d{3})+(?!\d))/g;
    return num.toString().replace(regexp, ',');
}

function changeSchool() {
    $("#regist_seat_front").val("");
    $("#div_pay").empty();
}

///// 숫자만 입력 가능 기능
function onlyNumber(event) {
    let regexp = /[^0-9]/gi;
    let v = $(this).val();
    if (regexp.test(v)) {
        alert("숫자만 입력가능 합니다.");
        $(this).val(v.replace(regexp, ''));
    }
}


/* 프로필-비밀번호 팝업 */
function pwView(num) {
    var number = num;
    if (number == 1) {
        $('.register_pop').addClass('view');
        $('html,body').css('overflow', 'auto');
    }
}

function pwBoxClose() {
    $('.register_pop').removeClass('view');
    $('html,body').css('overflow','');
}
function pwConClose() {
    parent.pwBoxClose();
}

/* 타학원시간표 영구추가 날짜 */
function dateN() {
    var chkTab05 = $('.chktab06');
    var chkTabUl = chkTab05.children('ul');
    var chkTabLi = chkTabUl.children('li.dateN');

    var dateNon = $('.date_on');

    chkTabLi.on('click', function () {
        dateNon.addClass("on");
    });


    $(".chktab06 ul li").click(function(){
        $(".chktab06 ul li").removeClass('on');
        $(".date_on").removeClass('on');
        $(this).addClass('on');
        $("#"+$(this).data('id')).addClass('on');
    });
}

/* 타학원시간표 관리 버튼 */
function action() {
    $('.action>button').click(function() {
        $('.action_info').removeClass('view');
        if( $(this).next('.action_info').hasClass('view')) {
            $(this).next('.action_info').removeClass('view');
        }else {
            $(this).next('.action_info').addClass('view');

        }
    });
}

/* 타학원시간표 tab */
function othTabMenu() {
    var tt = $('.table_tab');
    var tabUl = tt.children('ul');
    var tabLi = tabUl.children('li');

    var tabCont = $('.otherSch_form');

    tabLi.on('click', function () {
        var thisI = $(this).index();
        tabLi.addClass("active");
        tabLi.eq(thisI).siblings().removeClass("active");
        tabCont.eq(thisI).addClass('view');
        tabCont.eq(thisI).siblings().removeClass('view');
    });
    tabCont.on('click', function () {
        var thisI = $(this).index();
    });
}

/* 타학원시간표 시간tab */
function clockTab() {
    $('.clockTab ul li').click(function (){
        $(".clockCon").removeClass('on');
        $(this).addClass('on');
        $("#"+$(this).data('id')).addClass('on');
    });
}
function clockTab02() {
    $('.clockTab02 ul li').click(function (){
        $(".clockCon02").removeClass('on');
        $(this).addClass('on');
        $("#"+$(this).data('id')).addClass('on');
    });
}


