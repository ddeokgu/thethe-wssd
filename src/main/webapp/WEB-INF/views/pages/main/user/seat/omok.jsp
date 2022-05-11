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

<%-- 오목점 --%>
<div id="omok" class="pop_bot pop_bot02 omok">
  <div class="seat_bg">
    <img src="/resources/main/user/img/icon/bg-arrow.png" alt="">
  </div>
  <div class="seat seatG">
    <span class="gb_tit">&lt;여학생&gt;</span>
    <div class="seatBox">
      <ul>
        <li id="96" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="95" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="94" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="93" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="92" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="91" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="90" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="89" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="88" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="87" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="86" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="85" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="84" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="83" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="82" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="81" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="80" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="79" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="78" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="77" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="76" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="75" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="74" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="73" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="72" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="71" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="70" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="69" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="68" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="67" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="66" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numG"></span>
          </a>
        </li>
        <li id="65" onclick ="seatSelect(this); return false;">
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
        <li id="97" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="98" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="99" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="100" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="101" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="102" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li></li>
        <li></li>
        <li id="103" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="104" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="105" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="106" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="107" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="108" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="109" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="110" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="111" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="112" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="113" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="114" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="115" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="116" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="117" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="118" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li></li>
        <li></li>
        <li id="119" onclick ="seatSelect(this); return false;">
        <a href="#">
          <span class="num numB"></span>
        </a>
        </li>
        <li id="120" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="121" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="122" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li></li>
        <li></li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="123" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="124" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="125" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="126" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="127" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="128" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="129" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="130" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="131" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="132" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="133" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="134" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="135" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="136" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="137" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="138" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="139" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="140" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="141" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="142" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="143" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="144" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="145" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="146" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="147" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="148" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="149" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="150" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="151" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="152" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="153" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="154" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="seatBox">
      <ul>
        <li id="155" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="156" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="157" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="158" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="159" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="160" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="161" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="162" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li></li>
        <li></li>
        <li></li>
        <li id="163" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="164" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="165" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="166" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
        <li id="167" onclick ="seatSelect(this); return false;">
          <a href="#">
            <span class="num numB"></span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>