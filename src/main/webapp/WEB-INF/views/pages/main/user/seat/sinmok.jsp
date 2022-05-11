<%--
  Created by IntelliJ IDEA.
  User: ttcc
  Date: 2022-03-10
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>

<%-- 신목점 --%>
<div id="sinmok" class="pop_bot pop_bot02 sinmok">
  <div class="seat_bg">
    <img src="/resources/main/user/img/icon/bg-arrow.png" alt="">
  </div>
  <div class="seat seatG">
    <span class="gb_tit">&lt;여학생&gt;</span>
    <div class="seatBox">
      <ul>
        <li id="32" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
            <%--<span class="name"></span>
            <span class="work"></span>--%>
          </a>
        </li>
        <li></li>
        <li id="31" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="30" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="29" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="28" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="27" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li></li>
        <li id="26" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="25" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="24" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="23" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="22" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="21" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="20" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="19" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="18" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="17" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="16" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="15" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="14" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="13" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="12" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="11" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="10" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li></li>
        <li></li>
        <li id="9" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="8" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="7" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="6" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="5" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="4" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="3" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="2" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="1" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
      </ul>
    </div>
  </div>
  <div class="seat seatB">
    <span class="gb_tit">&lt;남학생&gt;</span>
    <div class="seatBox">
      <ul>
        <li id="64" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="63" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li></li>
        <li id="62" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li></li>
        <li></li>
        <li id="61" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="60" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="59" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="58" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="57" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li>

        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="56" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="55" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="54" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="53" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="52" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="51" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="50" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="49" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="48" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="47" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="46" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="45" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="44" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="43" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="42" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="41" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="40" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="39" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="38" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="37" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="36" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="35" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="34" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="33" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>
