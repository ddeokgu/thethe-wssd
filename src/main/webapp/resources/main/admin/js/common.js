
$(document).ready(function() {
    //초기설정
    minHeight();
    menuSize();
     transInput();
    $('.input_trans').change(function() {
         transInput();
    })
    //다른곳 클릭시 창닫기
    $(document).click(function (e){
        if($('.user').has(e.target).length === 0){

             $('.user_info').removeClass('view');

        }
        if($('.action').has(e.target).length === 0){

             $('.action_info').removeClass('view');

        }
        if($('.srch').has(e.target).length === 0){

            $('.srch').removeClass('view');

        }
        if($('.srch_filter').has(e.target).length === 0){

            $('.srch_filter button').removeClass('view');

        }
        if($('.seat_list li').has(e.target).length === 0){

            $('.seat_list a').removeClass('view');

        }

    });




   //사용자정보보기
     $('.user>a').click(function() {
        if($(this).next('.user_info').hasClass('view')) {
            $(this).next('.user_info').removeClass('view');
        }else {
            $(this).next('.user_info').addClass('view');
        }
    })
    //리스트 설정
    $('.action>button').click(function() {
            $('.action .action_info').removeClass('view');
            if($(this).next('.action_info').hasClass('view')) {
                $(this).next('.action_info').removeClass('view');
            }else {
                $(this).next('.action_info').addClass('view');
            }
        })
    //검색 박스보기
    $('.srch>a').click(function() {
            $(this).parent('.srch').addClass('view');
             $('.form_inner input[type="search"]').focus();
     })

     //메뉴 드랍다운
     $('.arrow>a').click(function() {
        if($(this).parent('li').hasClass('view')) {
            $(this).parent('li').removeClass('view');
        }else {
            $(this).parent('li').addClass('view');
        }

     })
     //전체메뉴 축소 확대
     $('.hd_menu button').click(function() {
        if($('.wrap').hasClass('simple')) {
            $('.wrap').removeClass('simple');
            if($('.nav_menu li.arrow a').hasClass('active')) {
                $('.nav_menu li a.active').parent('li').addClass('view');
            }
        }else {
             $('.wrap').addClass('simple');
             $('.nav_menu li').removeClass('view');
        }

     })
     $('.menu_depth_list a.view').click(function() {
        if($(this).parent('li').hasClass('view')) {
            $(this).parent('li').removeClass('view');
        }else {
             $(this).parent('li').addClass('view');
        }
        return false
     })
     //모바일 메뉴 온/오프
     $('.m_menu a,.m_bg,.m_close').click(function() {
        if($('.wrap').hasClass('m_view')) {
            $('.wrap').removeClass('m_view');
        }else {
             $('.wrap').addClass('m_view');
        }
     })
     //검색필터 온/오프
     $('.srch_filter button').click(function() {
           if($(this).hasClass('view')) {
               $(this).removeClass('view');
           }else {
                $(this).addClass('view');
           }
     })
     //모바일 리스트 더보기
     $('.m_show a.more').click(function() {
         if($(this).hasClass('view')) {
             $(this).removeClass('view');
             $(this).parents('tr').next('.tr_m_detail').removeClass('view');
         }else {
              $(this).addClass('view');
              $(this).parents('tr').next('.tr_m_detail').addClass('view');
         }
      });
     //로딩시 데이터피커실행
     datepickerSetting('add');

})
$(window).resize(function() {
    minHeight();
    menuSize();
})
//체크시 input
function transInput() {
    if($('input').hasClass('input_trans')) {

        if($('.input_trans').is(":checked") == true){
           $('.hide_input').addClass('view');
           $('.hide_input input').removeAttr('readonly');
        }else {
            $('.hide_input').removeClass('view')
           $('.hide_input input').attr('readonly','readonly')
        }
    }
}
//daterpicker
function datepickerSetting(set) {
  let setting = set
  if($('input').hasClass('picker_form')) {
    $('input[id^="datepicker"]').each(function() {
        $(this).datepicker({
             closeText: "닫기",
              prevText: "이전달",
              nextText: "다음달",
              currentText: "오늘",
              monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                "7월", "8월", "9월", "10월", "11월", "12월"
              ],
              monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                "7월", "8월", "9월", "10월", "11월", "12월"
              ],
              dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
              dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
              dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
              weekHeader: "주",
              dateFormat: 'yy-mm-dd',
              firstDay: 0,
              isRTL: false,
              showMonthAfterYear: true,
              yearSuffix: "년",
              showOn: 'both',
              buttonImage: '/resources/main/admin/img/icon/calender_img.svg',
              buttonText: "달력"
        });
        if (setting == "add") {

            if($(this).attr('id') == 'datepicker_go2') {
                $(this).datepicker("setDate", "+29D");
            }else if ($(this).attr('id') == 'datepicker_exam1' || $(this).attr('id') == 'datepicker_exam2') {

            }else {
                $(this).datepicker("setDate", "today");
            }
        }

    })
  }
}
function minHeight() {

    //박스 최소높이 설정
    var winH = $(window).innerHeight();
    $('.wrap').css('min-height',winH);
    $('.area,#nav').css('height',winH);
}
function menuSize() {
    //리사이즈시 leftmenu 변화
    var winW = $(window).innerWidth();
    if(winW < 1401 && winW > 1024) {
      $('.wrap').addClass('simple');
      $('.nav_menu li').removeClass('view');
    }else if (winW < 1025) {
        $('.wrap').removeClass('simple');
         if($('.nav_menu li.arrow a').hasClass('active')) {
            $('.nav_menu li a.active').parent('li').addClass('view');
        }
    }else {
        $('.wrap').removeClass('simple');
         if($('.nav_menu li.arrow a').hasClass('active')) {
            $('.nav_menu li a.active').parent('li').addClass('view');
        }
    }

}



 //좌석상태
function seat_set(el) {
   var _this = $(el);
   var positionL = _this.parent('li').position().left;
   var positionT = _this.parent('li').position().top;
   var wrapH = $('.seat_list').innerHeight();
   var boxW = _this.parents('ul').innerWidth()-200;
   var boxH = _this.parents('.seat_scroll').innerHeight()-50;

   if(_this.hasClass('view')) {
       _this.removeClass('view');
   }else {
        $('.seat_list a').removeClass('view')
       _this.addClass('view');
         if(boxW < positionL) {
             _this.removeClass('left');
            _this.addClass('right');
         }else {
            _this.removeClass('right');
            _this.addClass('left');
         }
         if(wrapH > 300) {
             if(boxH < positionT) {
                  _this.removeClass('top');
                 _this.addClass('bottom');
              }else {
                 _this.removeClass('bottom');
                 _this.addClass('top');
              }
          }
   }


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

//// 날짜 일수 계산 함수
function dateDiff(_date1, _date2) {
    let diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
    let diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);

    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());

    let diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));

    return diff;
}

///// 100,000 천단위 콤마
function AddComma(num)
{
    let regexp = /\B(?=(\d{3})+(?!\d))/g;
    return num.toString().replace(regexp, ',');
}
