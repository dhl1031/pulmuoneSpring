<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 		<div class="breadcrumb-style"> -->
<!-- 			<div class="container"> -->
<!-- 				<ul> -->
<!-- 					<li><a href="/">홈</a></li> -->
<!-- 					<li><a class="active">MY녹즙</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->


<div class="container">
	<h2 class="container-title light">
		<b><sec:authentication property="principal.member.name"/></b>님 안녕하세요
	</h2>
	
	<ul class="stat-wrapper">
		<li>
			<a href="/mypage/order/daily.do?drinkingType=Y" class="item">
				<label>매일배송</label>
				<span>1</span>
			</a>
		</li>
		<li class="dim">
			<a href="/mypage/order/box.do" class="item">
				<label>택배배송</label>
				<span style="color: #333;border-bottom: 1px solid #7acc12">${ boxOrderCnt }</span>
			</a>
		</li>
		<li>
			<a href="/taste/taste.do" class="item">
				<label>시음선물</label>
				<span class="blank_copy">선물해보세요</span>
			</a>
		</li>
		<li>
			<a href="/event/event/view.do?event_no=2" class="item">
				<label>쿠폰</label>
				<span class="blank_copy">친구초대하고 쿠폰받으세요</span>
			</a>
		</li>
		<li>
			<a href="/mypage/action/review.do" class="item">
				<label>리뷰</label>
				<span>${fn:length(reviewlist) }</span>
			</a>
		</li>
		<li>
			<a href="/mypage/inquiry/list.do" class="item">
				<label>1:1 문의</label>
				<span style="border-bottom: none;color: #999">${ totalCount }</span>
			</a>
		</li>
	</ul>

	<div class="box-partition">
		<div class="part">
			<div class="part-head" style="margin-bottom:17px;">
				<a href="/mypage/order/daily.do?drinkingType=Y">매일배송 음용정보</a>
			</div>
			
			<div class="box-layout" style="margin-bottom:6px;">
				<div>
					<div class="half-area nickname-format">
							<label>기본</label>
						<h5>음용1</h5>
						<span>1</span>
					</div>
					<a href="/mypage/order/dailyView.do?orderNo=1" class="rounded-button">상세보기</a>
				</div>
				<div style="padding:20px 25px 20px 0;">
					<div class="half-area">
						<ul class="document-style">
							<li>
								<label style="font-weight:500">담당 가맹점</label>
								<p>서초홈가맹점</p>
							</li>
						</ul>
					</div>
					<div class="half-area end">
						<ul class="addiction-info">
							<li class="tel">
								<label></label>
								<p data-call-text="">02-547-0519</p>
							</li>
							<li style="margin-left:30px;" class="phone">
								<label></label>
								<p data-call-text="">010-3899-4569</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="part" style="border-bottom: none;padding-bottom: 35px">
			<div class="part-head" style="margin-bottom: 16px;">
				<a href="/mypage/order/box.do">택배배송 주문내역</a>
			</div>
				<ul class="delivery-process">
					<li class="">
						<div class="item">
							<div class="thumb">
								<img src="/resources/assets/images/common/ico_delivery_process_img01.png">
							</div>
							<p>
								<c:out value="${ boxOrderStatus[0] }"></c:out>
							</p>
							<span>결제완료</span>
						</div>
					</li>
					<li class="">
						<div class="item">
							<div class="thumb">
								<img src="/resources/assets/images/common/ico_delivery_process_img02.png">
							</div>
							<p>
								<c:out value="${ boxOrderStatus[1] }"></c:out>
							</p>
							<span>배송준비중</span>
						</div>
					</li>
					<li class="">
						<div class="item">
							<div class="thumb">
								<img src="/resources/assets/images/common/ico_delivery_process_img03.png">
							</div>
							<p>
								<c:out value="${ boxOrderStatus[2] }"></c:out>
							</p>
							<span>배송중</span>
						</div>
					</li>
					<li class="">
						<div class="item">
							<div class="thumb">
								<img src="/resources/assets/images/common/ico_delivery_process_img04.png">
							</div>
							<p>
								<c:out value="${ boxOrderStatus[3] }"></c:out>
							</p>
							<span>배송완료</span>
						</div>
					</li>
				</ul>
		</div>
		
		<table class="basic-table-style cell-narrow" style="margin-top:8px;">
			<thead></thead>
			<colgroup>
				<col width="147">
				<col width="*">
				<col width="127">
				<col width="63">
				<col width="130">
				<col width="120">
			</colgroup>
			<tbody>
				<tr>
					<th class="t-left">주문번호</th>
					<th class="t-left">상품명</th>
					<th>결제금액</th>
					<th>주문일자</th>
					<th>주문상태</th>
					<th>상세보기</th>
				</tr>
				<c:forEach items="${ boxOrderSimpleInfolist }" var="bosiList">
					<tr style="border-radius: 10px; font-size: 13px;">
						<td class="t-left">${ bosiList.orderNo }</td>
						<td class="t-left">${ bosiList.productsName }</td>
						<td><fmt:formatNumber value="${ bosiList.finalPrice }" type="number"></fmt:formatNumber> 원</td>
						<td>
							<fmt:parseDate value="${ bosiList.boxOrderDate }" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
							<fmt:formatDate value="${ parsedDate }" pattern="yyyy-MM-dd" />
						</td>
						<td>
							<b>
								<c:choose>
									<c:when test="${ bosiList.boxOrderStatus eq -1 }">주문취소</c:when>
									<c:when test="${ bosiList.boxOrderStatus eq 0 }">결제대기-(가상계좌)</c:when>
									<c:when test="${ bosiList.boxOrderStatus eq 1 }">결제완료</c:when>
									<c:when test="${ bosiList.boxOrderStatus eq 2 }">배송준비중</c:when>
									<c:when test="${ bosiList.boxOrderStatus eq 3 }">배송중</c:when>
									<c:when test="${ bosiList.boxOrderStatus eq 4 }">배송완료</c:when>
								</c:choose>
							</b>
						</td>
						<td>
							<a href="/mypage/order/box.do?boxOrderNo=${ bosiList.orderNo }" class="rounded-button sm">상세보기</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>
					
					
<script>
	$(function () {
	    $("div.item p").each(function(index) {
	        if ($(this).text() != 0) {
	            $("div.item:eq(" + index + ")").parent("li").addClass("active");
	        } // if
	    });
	})
</script>
