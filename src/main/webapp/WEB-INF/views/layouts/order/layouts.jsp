<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<tiles:insertAttribute name="head" />
<body>

<div class="wrapper">
	<!-- header -->
	<tiles:insertAttribute name="header" />
	
  	<!-- main -->
  	<main class="page order box">
		<div class="container">
	             
	        <div class="page-wrap">
				<!-- content -->
				<tiles:insertAttribute name="content" />
			</div>
			
		</div>
	</main>
  	<!-- footer -->
  	<tiles:insertAttribute name="footer" />
</div>

<tiles:insertAttribute name="modal" />

<script>
		$(function () {
			// 상품 추가하기 버튼
			$("#addProductBtn").on("click", function () {
				addProduct(null, 1);
			})
			
			$("#searchKeyword").on("keydown", function(event){
				let searchKeyword = $(this).val();
				if (event.keyCode == 13) {
					addProduct(searchKeyword, 1);
			    }
			})
			$("#productSearch").on("click", function(event){
				let searchKeyword = $("#searchKeyword").val();
				addProduct(searchKeyword, 1);
			})
			
			// 다음 주소 api
			searchPostcode();
			
			// 고객 정보와 동일 체크박스
			let name = $("#receiver").val();
			let tel = $("#tel").val();
			chkCheck(name, tel);
			
			// 주소록 가져오기
			let member_no = ${ member.member_no };
			$("#addressBtn").on("click", function(){
				showAddress(member_no, 1);
			})
			
			// 가맹점
			$(".radio-area").on("change", function(){
				// 위도, 경도값 가져오기
				let address = $("#addrRoad").val();
				if(address == "") return false;
				let addressInfo = getAddressInfo(address, kakaoREST);
				
				// 홈/오피스 체크값 가져오기
				let fc_type = $(this).find(":checked").val();
				
				// 가맹점 정보 가져오기
				getFranchise(addressInfo.x, addressInfo.y, fc_type);
			});
			
			// datepicker
			let today = new Date();
			let minDate = new Date();
			minDate.setDate(today.getDate()+2);
			let maxDate = new Date();
			maxDate.setDate(today.getDate()+30);
			$("#ip-datepicker-1").daterangepicker({
				singleDatePicker: true
				, minDate: minDate
				, maxDate: maxDate
				, regional: "ko"
				// 주말 선택 비활성화 옵션 - 안 먹음
				, beforeShowDay: function(date) {
					let day = date.getDay();
					return [(day != 0 && day != 6)];
				}
			});
			
			// 카드 인증
			$("#validCardBtn").on("click", function () {
				validCard();
			});
			
			$(".numberOnly").on("keyup", function() {
				$(this).val($(this).val().replace(/[^0-9]/g,""));
			});
			
			// 계좌 인증
			$("#callCms").on("click", function () {
				callCms($(this));
			});
			
			// 결제 방식
			$("#myTab-area li").on("click", function () {
				let index = $(this).index();
				$("#box_pay_method").val(index);
			});
		});
</script>
</body>
</html>