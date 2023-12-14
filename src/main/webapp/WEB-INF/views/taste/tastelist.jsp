<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script>
    $(function () {
		let searchMonth = '';
		if (searchMonth != "" && searchMonth != undefined) {
			$("#searchMonth").val(searchMonth);
			let target = "." + searchMonth;
			$('.dropdown-toggle').data('value', searchMonth)
			$('.dropdown-toggle').text($(target).text())
		}
		var formatter = new Intl.NumberFormat();
		$('.dropdown-item').click(function () {
			const value = $(this).data('value');
			const text = $(this).text();
			$('.dropdown-toggle').data('value', value)
			$('.dropdown-toggle').text(text)

			if (value === '3m') {
				$("#searchMonth").val("3m");
				console.log($("#searchMonth").val());
				var startDate = new Date();
				var endDate = new Date();
				startDate.setMonth(startDate.getMonth() - 3);
			} else if (value === '6m') {
				$("#searchMonth").val("6m");
				console.log($("#searchMonth").val());
				var startDate = new Date();
				var endDate = new Date();
				startDate.setMonth(startDate.getMonth() - 6);
			} else {
				$("#searchMonth").val("1y");
				console.log($("#searchMonth").val());
				var startDate = new Date();
				var endDate = new Date();
				startDate.setMonth(startDate.getMonth() - 12);
			}
			$('input[name="daterange"]').daterangepicker({startDate, endDate});

			$("#searchBtn").click();
		})
	    $('#resendSms').click(function (){
				const orderNum = $(this).data('ordernum')
		        newPost({url:'/taste/taste/resend?orderNum='+orderNum},function (r){
                    if(r.RESULT_MSG){
                        alert('SMS 재발송 요청되었습니다.',function (){
                            location.reload();
                        })
                    }
		        })
	    })
		$(document).on("click", ".applyBtn", function () {
			$("#searchBtn").click();
		});
		var startDate = new Date();
		var endDate = new Date();
		startDate.setMonth(startDate.getMonth() - 3);
		startDate = new Date("2023-08-21")
		endDate = new Date("2023-11-21")
		$('input[name="daterange"]').daterangepicker({
			opens: 'left',
			startDate,
			endDate
		}, function (start, end, label) {
			console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to '
					+ end.format('YYYY-MM-DD'));
		});
		$('#searchBtn').click(function () {
			const selectedRange = $('input[name=daterange]').val()
			console.log(selectedRange)
			$('input[name=startSearchDate]').val(
					selectedRange.split('~')[0].trim().replaceAll(' ', ''))
			$('input[name=endSearchDate]').val(
					selectedRange.split('~')[1].trim().replaceAll(' ', ''))

			$('#searchForm').submit();
		})
		$(document).on('click', '.cancelOrder', function () {
			// const orderNum = $(this).closest('li').prop('data').orderNum
			const orderNum =  $(this).data('ordernum');
			confirmDesign("", "시음선물을 취소하시겠습니까?", function () {
				post({
					url: `/order/taste/cancel/${orderNum}`
				}, function (response) {
					alert("취소되었습니다.", function () {
						location.reload();
					})
				})
			})
		})

	});
</script>
<div class="wrapper">
	<main class="page forum">
		<div class="breadcrumb-style">
			<div class="container">
				<ul>
					<li><a href="/">홈</a></li>
					<li><a href="/mypage">MY녹즙</a></li>
					<li><a class="active" href="">시음선물내역</a></li>
				</ul>
			</div>
		</div>
		<div class="container aside-layout" style="padding-bottom: 120px;">

			<div class="container">
				<div class="border-wrapper">
					<h2 class="container-title">시음선물내역</h2>
				</div>
				<div class="page-addiction-wrapper" style="align-items: center; margin-bottom: 20px;">
					<div class="info-copy description" style="padding-left: 3px; padding-top: 2px;">
						<p>
							총 <b>0</b>건
						</p>
					</div>
					<div class="form-input select none-dt" style="width: 228px;">
						<dl>
							<dt>문의유형</dt>
							<dd>
								<div class="dropdown">
									<a class="btn dropdown-toggle" href="javascript:void(0);" role="button" data-value="3m" data-toggle="dropdown" aria-expanded="false" style="height: 60px; padding-left: 19px; padding-top: 2px;"> 최근 3개월 </a>
									<div class="dropdown-menu">
										<a class="dropdown-item 3m" data-value="3m" href="javascript:void(0);">최근 3개월</a> <a class="dropdown-item 6m" data-value="6m" href="javascript:void(0);">최근 6개월</a> <a class="dropdown-item 1y" data-value="1y" href="javascript:void(0);">최근 1년</a>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<div class="form-input period sm none-dt" style="margin-left: 10px;">
						<dl class="date" style="height: 60px">
							<dt>기간 설정</dt>
							<dd style="width: 308px;">
								<input type="text" name="daterange" placeholder="기간을 선택하세요">
							</dd>
						</dl>
					</div>
					<div class="btn-wrap">
						<button style="margin-left: 5px; height: 60px; display: none" id="searchBtn" class="btn-square btn-black" type="button">조회</button>
					</div>
				</div>
				<div class="delivery-order-list gift">
					<div class="caution-unit page">
						<span class="mark"></span>
						<p>나의 시음선물 내역이 없습니다.</p>
					</div>
					<ul data-list-object="append" id="product-items">
					</ul>
				</div>
			</div>
		</div>

	</main>
</div>
</html>
