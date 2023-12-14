<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="aside" id="mypage_lnb">
    <h2 class="title">MY녹즙</h2>
    <ul class="lnb-style">
        <li class="indepth">
            <a>매일배송 음용내역</a>
            <ul class="sub-navigation">
                <li><a href="/mypage/order/daily?drinkingType=Y">음용내역</a></li>
                <li><a href="/mypage/drink/bill">영수증조회</a></li>
            </ul>
        </li>
        <li>
            <a href="/mypage/order/box">택배배송 주문내역</a>
        </li>
        <li>
            <a href="/mypage/benefit/taste">시음선물내역</a>
        </li>
        <li>
            <a href="/mypage/benefit/coupon">쿠폰</a>
        </li>
        <li class="indepth">
            <a>활동정보</a>
            <ul class="sub-navigation">
                <li><a href="/mypage/product/list">찜한상품</a></li>
                <li><a href="/mypage/inquiry/list">1:1 문의</a></li>
                <li><a href="/mypage/action/review">리뷰</a></li>
            </ul>
        </li>
        <li class="indepth">
            <a>개인정보</a>
            <ul class="sub-navigation">
                <li><a href="/mypage/personal/address">주소록</a></li>
                <li><a href="/mypage/personal/info">개인정보 변경</a></li>
                <li><a href="/mypage/drink/paymethod">결제수단 관리</a></li>
                <li><a href="/mypage/personal/refund">환불계좌 관리</a></li>
            </ul>
        </li>
    </ul>
</div>


<script>

$(document).on("click", "#mypage_lnb .indepth>a", function (e) {
    var parent = $(this).parents("li");  
    if (parent.hasClass("active")) {
      parent.removeClass("active");
    } else {
      parent.addClass("active");
    }
    e.preventDefault();
    return false;
  });
  $(document).ready(function () {
    var item = undefined;
    $("#mypage_lnb .sub-navigation a").each(function (ix, elem) {
      var el = $(elem);
      if (location.pathname.startsWith(el.attr("href")) && !item) {
        item = el;
      }
    })
    if (!item) {
      $("#mypage_lnb .lnb-style>li>a").each(function (ix, elem) {
        var el = $(elem);
        if (el.attr("href") && location.pathname.startsWith(el.attr("href")) && !item) {
          item = el;
        }
      })
    }
    if (item) {
      item.parents("li").addClass("active");
      item.parents(".indepth").addClass("active");
    }
  })


</script>