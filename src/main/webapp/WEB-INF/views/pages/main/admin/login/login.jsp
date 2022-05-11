<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-17
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script> 
<script>

$(document).ready(function() {
	var mstSaveId = getCookie("mstSaveId");
	$("input[name='memberId']").val(mstSaveId);
	
	if($("input[name='memberId']").val() != ""){
		  $("#id_save").attr("checked", true);
		}
	
	
	$("#id_save").change(function(){
		  if($("#id_save").is(":checked")){
		    var mstSaveId = $("input[name='memberId']").val();
		      setCookie("mstSaveId", mstSaveId, 7);
		  }else{
		      deleteCookie("mstSaveId");
		  }
		});
	
	
    $(document).keydown(function(key) {
        if (key.keyCode == 13) {
            login();
        }
    });
});

function login(){
	var frm = document.frmL;
	if (s2_txt_is_empty(true, frm.mb_id)) { alert("아이디를 입력해 주십시오."); frm.mb_id.focus(); return false; }
	if (s2_txt_is_empty(true, frm.mb_pw)) { alert("비밀번호를 입력해 주십시오."); frm.mb_pw.focus(); return false; }
	
	frm.action = "/common/member/loginProc.do";
	frm.submit();
}

function setCookie(cookieName, value, exdays){
	var exdate = new Date();	
	exdate.setDate(exdate.getDate() + exdays);
	
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
  }
  
function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
  }
	 

function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
	  start += cookieName.length;
	  var end = cookieData.indexOf(';', start);
  	  if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
  }

	$(window).load(function() {    
			$('#loading').hide();  
	});

</script>
<c:if test="${logSession_M eq null }">
<div class="login_wrap typeScroll">
    <div class="login_form">
        <div class="login_login">
            <span>
                <img src="/resources/main/admin/img/common/master_login.png" alt="와신상담 마스터">
            </span>
        </div>
        <div class="login_cont">
            <div class="login_header">
                <span class="top">Welcome Back</span>
                <span class="bottom">계속하려면 로그인을 하세요.</span>
            </div>
            <div class="login_body">
                <form id="frmL" method="post" name="frmL" action="#">
                    <input type="hidden" name="ltype" value="B">
                    <div class="login_get">
                        <div class="dan">
                            <label for="mb_id">아이디</label>
                            <input  type="text" size="20" id="mb_id" name="memberId" placeholder="아이디를 입력해 주세요." tabindex="1">
                        </div>
                        <div class="dan">
                            <label for="mb_pw">비밀번호</label>
                            <input type="password" size="20" id="mb_pw" name="memberPass" placeholder="비밀번호를 입력해 주세요." autocomplete="off">
                        </div>
                    </div>
                    <div class="login_save">
                        <label for="id_save" class="check_label">
                            <input type="checkbox" name="mstSaveId" id="id_save" value="Y">
                            <span>ID저장</span>
                        </label>
                    </div>
                    <div style="text-align:center;margin-top:10px;color:red;">${log}</div>
                    <div class="login_btn">
                        <button type="button" onclick="login();" class="btn btn_all btn_01"><span>로그인</span></button>
                    </div>
                </form>
            </div>
        </div>
        <div class="login_copy">
            <span>Copyright © 와신상담 All Rights Reserved</span>
        </div>
    </div>
</div>
</c:if>
<c:if test="${logSession_M ne null }">
	<jsp:forward page="/master/index.do"/>
</c:if>
<div id="loading"><img id="loading-image" src="/resources/main/admin/img/common/loading.svg" alt="Loading..." /></div>