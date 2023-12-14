<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div class="wrapper">
	<main class="page">
		<div id="container-wrapper" class="container-wrapper">
			<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css">
			<link rel="stylesheet" href="/resources/assets/css/common_v1.css">
			<link rel="stylesheet" href="/resources/assets/css/plugin.override.css">
			<script type="text/javascript" src="/resources/assets/js/common.ui.js"></script>
			<script type="text/javascript" src="/resources/assets/js/message.js"></script>
			<script type="text/javascript" src="/resources/assets/js/front.ui.js"></script>
			<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->
			<script type="text/javascript">
    $().ready(function() {
        var type = "staff";
        if ( type == "staff" ) {
            tabOpen(1);

        }
        if (location.hash.startsWith("#tab=") && location.hash.substring(5) === "1") {
            tabOpen(1);

        }
     
        //창업FAQ
        if (localStorage.getItem('val') == 7) {
            $('.js-btab-cont-' + localStorage.getItem('val'))
                .siblings('.js-btab-cont').hide().end()
                .show();
            $(
                '.js-btab-link[data-idx='
                + localStorage.getItem('val') + ']')
                .parent().addClass('is-active').siblings()
                .removeClass('is-active');
            localStorage.removeItem('val');
        }
        //scrollEvent
        $(window).scroll(function() {
            if ($('.js-footer-fixed').length) {
                fixedBottom();
            }
        });

        //영상변경
        $('.video-list a').click(function() {
            $(this)
                .parents('.video-list')
                .siblings('.video-wrap')
                .find('.video')
                .html(
                    "<iframe width='100%' height='100%' src='https://youtube.com/embed/"
                    + $(this).data("video")
                    + "?enablejsapi=1&version=3&playerapiid=ytplayer&ecver=2&vq=hd720&rel=0' allow='autoplay; encrypted-media' allowfullscreen></iframe>")
        });

        // 휴대폰번호,투자금 숫자만 입력
        $(document).on('keyup', '#phone,#invest', function() {
            $(this).val($(this).val().replace(/[^0-9]/g, ''));
        });

        $(document).on('keyup', '#phoneOneFranchaise,#investOneFranchaise', function() {
            $(this).val($(this).val().replace(/[^0-9]/g, ''));
        });

        // 내용 글자수 체크
        $('#contents').keyup(function(e) {
            var max = $(this).attr('maxlength');
            var txtLen = $(this).val().length;
            var txtCnt = $(this).closest("div").find('.num-countt > span');
            txtCnt.text(txtLen);
            if (txtLen > max) {
                txtCnt.text(max);
            }
        });
        // 내용 글자수 체크
        $('#contentsOneFranchaise').keyup(function(e) {
            var max = $(this).attr('maxlength');
            var txtLen = $(this).val().length;
            var txtCnt = $(this).closest("div").find(
                '.num-countt > span');
            txtCnt.text(txtLen);
            if (txtLen > max) {
                txtCnt.text(max);
            }
        });
        // 광역시에 따른 시/도/군
        $("#sido").change(function() {
            var sido = $(this).val();
            if (sido == "세종특별자치시") {
                $("#sigugun").html("");
                $("#sigugun").append("<option value=''></option>");
                $("#sigugun").val("1").prop("selected", true);
                return;
            }
            if (sido != "" && sido != "세종특별자치시") {
                get({
                    url : '/info/sigugun/' + sido + '',
                    param : {}
                }, function(response) {
                    $("#sigugun").html("");
                    $.each(response.RESULT_MSG, function(index, item) {
                        $("#sigugun").append(
                            "<option value='"+ item.gugun +"'>"
                            + item.gugun
                            + "</option>");
                    });
                });
                hideError("hopeLocalError");
            }
        });
        // 광역시에 따른 시/도/군
        $("#sidoOneFranchaise").change(function() {
            var sido = $(this).val();
            if (sido == "세종특별자치시") {
                $("#sigugunOneFranchaise").html("");
                $("#sigugunOneFranchaise").append("<option value=''></option>");
                $("#sigugunOneFranchaise").val("1").prop("selected", true);
                return;
            }
            if (sido != "" && sido != "세종특별자치시") {
                get({
                    url : '/info/sigugun/' + sido + '',
                    param : {}
                }, function(response) {
                    $("#sigugunOneFranchaise").html("");
                    $.each(response.RESULT_MSG, function(index, item) {
                        $("#sigugunOneFranchaise").append(
                            "<option value='"+ item.gugun +"'>"
                            + item.gugun
                            + "</option>");
                    });
                });
                hideError("hopeLocalErrorOneFranchaise");
            }
        });

        $("#name,#phone,#invest").blur(function() {
            $(this).keyup();
        });

        $("#userNameOneFranchaise,#phoneOneFranchaise,#investOneFranchaise").blur(function() {
            $(this).keyup();
        });

        $("#name,#phone,#invest").blur(function() {
            $(this).keyup();
        });
        $("#userNameOneFranchaise,#phoneOneFranchaise,#investOneFranchaise").blur(function() {
            $(this).keyup();
        });

        $("#name").keyup(function(e) {
            var name = $(this).val();

            if (name == "") {
                showError("nameError", message.customer.name);
            } else {
                hideError("nameError");
            }
        });
        $("#userNameOneFranchaise").keyup(function(e) {
            var name = $(this).val();

            if (name == "") {
                showError("nameErrorOneFranchaise", message.customer.name);
            } else {
                hideError("nameErrorOneFranchaise");
            }
        });

        $("#phone").keyup(function(e) {
            var phone = $(this).val();

            if (phone == "") {
                showError("phoneError", message.customer.phone.format);
            } else {
                hideError("phoneError");
            }
        });
        $("#phoneOneFranchaise").keyup(function(e) {
            var phone = $(this).val();

            if (phone == "") {
                showError("phoneErrorOneFranchaise", message.customer.phone.format);
            } else {
                hideError("phoneErrorOneFranchaise");
            }
        });
        $("#invest").keyup(function(e) {
            var invest = $(this).val();

            if (invest == "") {
                showError("investError", "투자금을 입력해주세요.");
            } else {
                hideError("investError");
            }
        });
        $("#investOneFranchaise").keyup(function(e) {
            var invest = $(this).val();

            if (invest == "") {
                showError("investErrorOneFranchaise", "투자금을 입력해주세요.");
            } else {
                hideError("investErrorOneFranchaise");
            }
        });

        // 이메일 체크
        $("#email, #emailHost").keyup(function(e) {

            var email = $("#email").val();
            var emailHost = $("#emailHost").val() || $("#emailHostList").val();

            var fullEmail = email + "@" + emailHost;

            if ( email == "" ) {
                showError("emailError", message.member.regist.email.empty);
            }
            else if ( emailHost == "" ) {
                showError("emailError", message.member.regist.email.empty);
            }
            else if ( !message.member.regist.email.isFormat(fullEmail) ) {
                showError("emailError", message.member.regist.email.format);
            }
            hideError("emailError");
            $("#emailFull").val(fullEmail);
            //showSuccess("emailError", message.member.regist.email.ok);

        });
        $("#email, #emailHost").blur(function() {
            $(this).keyup();
        });

        $("#emailHostList").change(function() {
            $("#emailHost").val("");
            if ( $(this).val() == "1" ) {
                $("#emailHost").prop("disabled", false);
            }
            else if ( $(this).val() == "" ) {
                $("#emailHost").prop("disabled", true);
            }
            else {
                $("#emailHost").prop("disabled", false);
                $("#emailHost").prop("readonly", false);
                $("#emailHost").val($(this).val());
            }

            $("#email").keyup();
        });

        $("#emailHostList").change();
        $("#email").keyup();

        // 가맹점 이메일 체크
        $("#emailOneFranchaise, #emailHostOneFranchaise").keyup(function(e) {

            var email = $("#emailOneFranchaise").val();
            var emailHost = $("#emailHostOneFranchaise").val() || $("#emailHostListOneFranchaise").val();

            var fullEmail = email + "@" + emailHost;

            if ( email == "" ) {
                showError("emailErrorOneFranchaise", message.member.regist.email.empty);
            }
            else if ( emailHost == "" ) {
                showError("emailErrorOneFranchaise", message.member.regist.email.empty);
            }
            else if ( !message.member.regist.email.isFormat(fullEmail) ) {
                showError("emailErrorOneFranchaise", message.member.regist.email.format);
            }
            hideError("emailErrorOneFranchaise");
            $("#emailFullOneFranchaise").val(fullEmail);
            //showSuccess("emailError", message.member.regist.email.ok);

        });
        $("#emailOneFranchaise, #emailHostOneFranchaise").blur(function() {
            $(this).keyup();
        });

        $("#emailHostListOneFranchaise").change(function() {
            $("#emailHostOneFranchaise").val("");
            if ( $(this).val() == "1" ) {
                $("#emailHostOneFranchaise").prop("disabled", false);
            }
            else if ( $(this).val() == "" ) {
                $("#emailHostOneFranchaise").prop("disabled", true);
            }
            else {
                $("#emailHostOneFranchaise").prop("disabled", false);
                $("#emailHostOneFranchaise").prop("readonly", false);
                $("#emailHostOneFranchaise").val($(this).val());
            }

            $("#emailOneFranchaise").keyup();
        });

        $("#emailHostListOneFranchaise").change();
        $("#emailOneFranchaise").keyup();

        // 모닝스템 이메일 체크
        $("#emailMorning, #emailHostMorning").keyup(function(e) {

            var email = $("#emailMorning").val();
            var emailHost = $("#emailHostMorning").val() || $("#emailHostListMorning").val();

            var fullEmail = email + "@" + emailHost;

            if ( email == "" ) {
                showError("emailErrorMorning", message.member.regist.email.empty);
            }
            else if ( emailHost == "" ) {
                showError("emailErrorMorning", message.member.regist.email.empty);
            }
            else if ( !message.member.regist.email.isFormat(fullEmail) ) {
                showError("emailErrorMorning", message.member.regist.email.format);
            }
            hideError("emailErrorMorning");
            $("#emailFullMorning").val(fullEmail);
            //showSuccess("emailError", message.member.regist.email.ok);

        });
        $("#emailMorning, #emailHostMorning").blur(function() {
            $(this).keyup();
        });

        $("#emailHostListMorning").change(function() {
            $("#emailHostMorning").val("");
            if ( $(this).val() == "1" ) {
                $("#emailHostMorning").prop("disabled", false);
            }
            else if ( $(this).val() == "" ) {
                $("#emailHostMorning").prop("disabled", true);
            }
            else {
                $("#emailHostMorning").prop("disabled", false);
                $("#emailHostMorning").prop("readonly", false);
                $("#emailHostMorning").val($(this).val());
            }

            $("#emailMorning").keyup();
        });

        $("#emailHostListMorning").change();
        $("#emailMorning").keyup();

        // 주소
        $("#detailAddress").keyup(function (e) {
            //var detailAddress = $(this).val();
            if ($("#zipcode").val() == "" || $("#roadAddress").val() == "") {
                $("#zipcode").closest("div").addClass("error-wrap");
                showError("adressError", "주소를 입력해주세요.");
            } else if ($("#detailAddress").val() == "") {
                $("#zipcode").closest("div").addClass("error-wrap");
                showError("adressError", "상세주소를 입력해주세요.");
            } else {
                $("#zipcode").closest("div")
                    .removeClass("error-wrap");
                hideError("adressError");
            }
        });

        $("#detailAddressOneFranchaise").keyup(function(e) {
            //var detailAddress = $(this).val();

            if ($("#zipcodeOneFranchaise").val() == "" || $("#roadAddressOneFranchaise").val() == "") {
                $("#zipcodeOneFranchaise").closest("div").addClass("error-wrap");
                showError("adressErrorOneFranchaise", "주소를 입력해주세요.");
            } else {
                $("#zipcodeOneFranchaise").closest("div").removeClass("error-wrap");
                hideError("adressErrorOneFranchaise");
            }
        });

        // 등록
        $("#fdSaveBtn").click(function() {
            if(!$("#name").val()){
                alert("이름을 입력해주세요.")
                return;
            }
            if(!$("#phone").val()){
                alert("휴대폰번호를 입력해주세요.")
                return;
            }
            var phoneCheck =$("#phone").val();
            var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            if (!regPhone.test(phoneCheck)=== true) {
                alert("입력된 값은 휴대전화번호 유형이 아닙니다.");
                return;
            }
            var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            if(!reg_email.test($("#emailFull").val())) {
                alert("이메일 유형이 잘못되었습니다.");
                return false;
            }
            if(!$("#invest").val()){
                alert("투자금을 입력해주세요.")
                return;
            }

            $("#email").keyup();
            $("#name").val($.trim($("#name").val()));
            $("#detailAddress").val($.trim($("#detailAddress").val()));
            $("#name").keyup();
            $("#phone").keyup();
            $("#invest").keyup();
            $("#detailAddress").keyup();

            if ($("#sido").val() === "" || $("#sigugun").val()==="") {
                alert( "개설 희망지역을 선택해주세요.");
                return;
            } else {
                var hopeLocal = $("#sido").val() + " "
                    + $("#sigugun").val();
                $("#hopeLocal").val(hopeLocal);
            }

            if(!$("#zipcode").val()){
                alert("주소를 입력해주세요.");
                return;
            }

            if(!$("#detailAddress").val()){
                alert("상세주소를 입력해 주세요");
                return;
            }
            if(!$("#contents").val()){
                alert("내용을 입력해주세요.")
                return;
            }

            if (hasError()) {
                return false;
            }

            if (!$("#agree-22").is(':checked')) {
                alert( "개인정보 수집 및 이용에 동의해주세요.");
                return;
            }
            $('#confirmModal .confirm').unbind('click');
            confirmDesign('', '입력하신 핸드폰, 메일 주소가 정상적으로 입력되었는지 확인 부탁드립니다', function () {
				$('.confirm').prop('disabled',true);
                post({
                    url : '/info/business/foundation/write',
                    param : $("#listForm").serialize()
                }, function(response) {
                    window.open("/info/googleChkPop", "popup_window", 'scrollbars=no,toolbar=no,status=no,width=1, height=1,resizable=yes,menubar=no,left=-110,top=-110,resizble=no');
                    alert("가맹점 개설문의가 등록되었습니다.<br>빠른 시일내에 답변 드리겠습니다.",()=>location.href='/');
                });
            });

            // $('.pop-customer-alert-03').dialog('open');
        });

        // 1인 독립형 사업가 상담접수하기 등록
        $("#fdSaveOneFranchaiseBtn").click(function() {
            var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            if(!reg_email.test($("#emailFullOneFranchaise").val())) {
                alert("이메일 유형이 잘못되었습니다.");
                return false;
            }
            var phoneCheck =$("#phoneOneFranchaise").val();
            var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            if (!regPhone.test(phoneCheck)=== true) {
                alert("입력된 값은 휴대전화번호 유형이 아닙니다.");
                return;
            }
            $("#emailOneFranchaise").keyup();
            $("#nameOneFranchaise").val($.trim($("#nameOneFranchaise").val()));
            $("#detailAddressOneFranchaise").val(
                $.trim($("#detailAddressOneFranchaise").val()));
            $("#nameOneFranchaise").keyup();
            $("#phoneOneFranchaise").keyup();
            $("#investOneFranchaise").keyup();
            $("#detailAddressOneFranchaise").keyup();

            if ($("#sidoOneFranchaise").val() == "") {
                showAlert("", "개설 희망지역을 선택해주세요.");
            } else {
                var hopeLocal = $("#sidoOneFranchaise").val() + " "
                    + $("#sigugunOneFranchaise").val();
                $("#hopeLocalOneFranchaise").val(hopeLocal);
            }
            if (hasError()) {
                return false;
            }

            if (!$("#agree-24").is(':checked')) {
                alert( "개인정보 수집 및 이용에 동의해주세요.");
                return;
            }


            $('.pop-customer-alert-10').dialog('open');
        });



        // 등록 확인
        $("#foundationApply").click(function() {

            post({
                url : '/info/business/foundation/write',
                param : $("#listForm").serialize()
            }, function(response) {
                $('.pop-customer-alert-03').dialog('close');
                $('.pop-customer-alert-04').dialog('open');

                window.open("/info/googleChkPop", "popup_window", 'scrollbars=no,toolbar=no,status=no,width=1, height=1,resizable=yes,menubar=no,left=-110,top=-110,resizble=no');
            });
        });

        // 등록 확인
        $("#foundationApplyOneFranchaise").click(function() {

            post({
                url : '/info/business/foundation/writeOneFranchaise',
                param : $("#listForm3").serialize()
            }, function(response) {
                $('.pop-customer-alert-10').dialog('close');
                $('.pop-customer-alert-11').dialog('open');
            });
        });


        $("#fdconfirmBtn").click(function() {
            location.href = "/info/foundation";
        });

        $("#fdconfirmBtnOneFranchaise").click(function() {
            location.href = "/info/foundation";
        });

        //////////////////// 모닝스탭 ////////////////////
        // 년도설정
        setDateBox();

        // 휴대폰번호 숫자만 입력
        $(document).on('keyup', '#phoneMorning', function() {
            $(this).val($(this).val().replace(/[^0-9]/g, ''));
        });

        // 내용 글자수 체크
        $('#memo').keyup(function(e) {
            var max = $(this).attr('maxlength');
            var txtLen = $(this).val().length;
            var txtCnt = $(this).closest("div").find(
                '.num-count > span');
            txtCnt.text(txtLen);
            if (txtLen > max) {
                txtCnt.text(max);
            }
        });

        $("#nameMorning").keyup(function(e) {
            var name = $(this).val();

            if (name == "") {
                showError("nameMorningError",
                    message.customer.name);
            } else {
                hideError("nameMorningError");
            }
        });

        $("#phoneMorning").keyup(function(e) {
            var phone = $(this).val();

            if (phone == "") {
                showError("phoneMorningError", message.customer.phone.format);
            } else {
                hideError("phoneMorningError");
            }
        });

        $("#birthday").change(function(e) {
            var birthday = $(this).val();

            if (birthday == "") {
                showError("birthdayError", "출생년도를 선택해주세요.");
            } else {
                hideError("birthdayError");
            }
        });

        $("#detailAddressMorning").keyup(function(e) {
            //var detailAddress = $(this).val();

            if ($("#zipcodeMorning").val() == "" || $("#roadAddressMorning").val() == "") {
                $("#zipcodeMorning").closest("div").addClass("error-wrap");
                showError("adressErrorMorning", "주소를 입력해주세요.");
            }else if ($("#detailAddressMorning").val() == "") {
                $("#zipcodeMorning").closest("div").addClass("error-wrap");
                showError("adressErrorMorning", "상세주소를 입력해주세요.");
            } else {
                $("#zipcodeMorning").closest("div").removeClass("error-wrap");
                hideError("adressErrorMorning");
            }
        });

        // 모닝스탭 등록
        $("#staffApplyBtn").click(function() {
            $("#nameMorning").val($.trim($("#nameMorning").val()));
            $("#detailAddressMorning").val($.trim($("#detailAddressMorning").val()));

            $("#nameMorning").keyup();
            if(!$("#nameMorning").val()){
                alert("이름을 입력해주세요.")
                return;
            }

            $("#phoneMorning").keyup();
            if(!$("#phoneMorning").val()){
                alert("휴대폰번호를 입력해주세요.")
                return;
            }
            var phoneCheck =$("#phoneMorning").val();
            var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            if (!regPhone.test(phoneCheck)=== true) {
                alert("입력된 값은 휴대전화번호 유형이 아닙니다.");
                return;
            }
            var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            if(!reg_email.test($("#emailFullMorning").val())) {
                alert("이메일 유형이 잘못되었습니다.");
                return false;
            }

            $("#birthday").change();
            if(!$('#birthday').val()){
                alert("출생년도를 입력해주세요.")
                return;
            }

            $("#detailAddressMorning").keyup();
            if(!$("#zipcodeMorning").val()){
                alert("주소를 입력해 주세요");
                return;
            }

            if(!$("#detailAddressMorning").val()){
                alert("상세주소를 입력해 주세요");
                return;
            }
            if(!$("#memo").val()){
                alert("내용을 입력해주세요.")
                return;
            }


            if (hasError()) {
                return false;
            }

            if (!$("#agree-2202").is(':checked')) {
                alert( "개인정보 수집 및 이용에 동의해주세요.");
                return;
            }

          $('#confirmModal .confirm').unbind('click');
            confirmDesign(
                "모닝스탭 등록 안내",
                "입력하신 핸드폰, 메일 주소가 정상적으로 입력되었는지 확인 부탁드립니다",
                function () {
                  $('.confirm').prop('disabled',true);
                    post({
                        url : '/info/business/staff/write',
                        param : $("#listForm2").serialize()
                    }, function(response) {
                        alert("모닝스텝 지원서가 등록되었습니다.<br>빠른 시일내에 답변 드리겠습니다.",()=>location.href='/');
                    });
                }
            );
        });

        // 모닝스탭 등록 등록 확인
        $("#staffApply").click(function() {

        });
        $("#stconfirmBtn").click(function() {
            location.href = "/info/staff";
        });

    });

    // 주소찾기
    function searchPostcode() {
        new daum.Postcode({
            oncomplete : function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다. (구 우편번호 data.postcode)
                $("#zipcode").val(data.zonecode);
                $("#roadAddress").val(data.roadAddress);

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /*
				if(data.roadAddress !== ''){
					$("#detailAddress").val(extraRoadAddr);
				} else {
					$("#detailAddress").val('');
				}
				 */
                $("#detailAddress").keyup();
            }
        }).open();
    }

    // 주소찾기
    function searchPostcode2() {
        new daum.Postcode({
            oncomplete : function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다. (구 우편번호 data.postcode)
                $("#zipcodeMorning").val(data.zonecode);
                $("#roadAddressMorning").val(data.roadAddress);

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /*
				if(data.roadAddress !== ''){
					$("#detailAddress").val(extraRoadAddr);
				} else {
					$("#detailAddress").val('');
				}
				 */
                $("#detailAddressMorning").keyup();
            }
        }).open();
    }

    // 주소찾기
    function searchPostcode3() {
        new daum.Postcode({
            oncomplete : function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다. (구 우편번호 data.postcode)
                $("#zipcodeOneFranchaise").val(data.zonecode);
                $("#roadAddressOneFranchaise").val(data.roadAddress);

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /*
				if(data.roadAddress !== ''){
					$("#detailAddress").val(extraRoadAddr);
				} else {
					$("#detailAddress").val('');
				}
				 */
                $("#detailAddressOneFranchaise").keyup();
            }
        }).open();
    }

    //출생년도 범위 생성
    function setDateBox() {
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        $("#birthday").append("<option value='' hidden>년도</option>");
        for (var y = (com_year - 59); y <= (com_year - 20); y++) {
            $("#birthday").append(
                "<option value='"+ y +"'>" + y + " 년" + "</option>");
        }
    }
    // moveToChain
    function moveToChain() {
        tabOpen(0);
        businessTabOpen(7);
    }

    function moveToStaff(){
        tabOpen(1);
        businessTabOpen(10);
    }

    function moveToStaffMovie(){
        tabOpen(1);
        businessTabOpen(8);
    }
</script>
			<div class="v1_content_body" style="padding-bottom: 120px">
				<div class="breadcrumb-style">
					<div class="container">
						<ul>
							<li><a>홈</a></li>
							<li><a class="active">창업안내</a></li>
						</ul>
					</div>
				</div>
				<div id="container-wrapper" class="container-wrapper">
					<!--S:cheader-->
					<div class="cheader">
						<!--S:cheader-->
						<div class="cheader">
							<div class="section">
								<div class="ctitle-wrap">
									<h2 class="ctitle">창업안내</h2>
								</div>
							</div>
						</div>
					</div>
					<!--E:cheader-->
					<!--S:cbody-->
					<div class="cbody-wrap">
						<div class="section">
							<div class="cbody-cont">
								<div class="tab-wrap inquiry-wrap">
									<!--S:201200110 탭 순서 변경 -->
									<ul class="tab-type02">
										<li class="item"><button onclick="javascript:tabOpen(0);" type="button" data-href="js-tab-cont" data-idx="0" class="tab-link js-tab-link">가맹점 개설 안내</button></li>
										<li class="item is-active"><button onclick="javascript:tabOpen(1);" type="button" data-href="js-tab-cont" data-idx="1" class="tab-link js-tab-link">모닝스텝 안내</button></li>
									</ul>
									<!--S:가맹점개설 안내  >-->
									<div class="tab-cont js-tab-cont js-tab-cont-0" style="display: none;">
										<h3 class="offscreen">가맹점 개설안내</h3>
										<!--S:2depth tab-->
										<div class="tab-sublist">
											<ul class="tab-type04">
												<li class="item tab-item is-active"><button type="button" data-idx="3" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(3);">사업소개</button></li>
												<li class="item tab-item"><button type="button" data-idx="4" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(4);">성공스토리</button></li>
												<li class="item tab-item"><button type="button" data-idx="5" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(5);">개설프로세스</button></li>
												<li class="item tab-item"><button type="button" data-idx="6" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(6);">개설조건</button></li>
												<li class="item tab-item"><button type="button" data-idx="7" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(7);">개설문의</button></li>
												<li class="item tab-item"><button type="button" data-idx="8" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(8);">창업FAQ</button></li>
											</ul>
										</div>
										<!--E:2depth tab-->
										<div class="tab-cont js-btab-cont js-btab-cont-3">
											<h3 class="stitle">사업소개</h3>
											<!--s:영상목록-->
											<div class="business-video">
												<div class="video-wrap">
													<div class="video">
														<iframe width="100%" height="100%" src="https://www.youtube.com/embed/FnO1-uRkMqw?enablejsapi=1&amp;version=3&amp;playerapiid=ytplayer&amp;ecver=2&amp;vq=hd720&amp;rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
													</div>
												</div>
												<ul class="video-list">
													<!--data-video에 유튜브 고유 id를 넣어주세요-->
													<li><a data-video="FnO1-uRkMqw"><img src="/resources/assets/images/contents/img_business_video_thumb01.jpg" alt="통영가맹점"><i class="play-ico"></i></a></li>
													<li><a data-video="sIzul-We7rQ"><img src="/resources/assets/images/contents/img_business_video_thumb02.jpg" alt="동판교오피스"><i class="play-ico"></i></a></li>
													<li><a data-video="hg6swO1dm9g"><img src="/resources/assets/images/contents/img_business_video_thumb03.jpg" alt="왕의녹즙"><i class="play-ico"></i></a></li>
													<li><a data-video="6kr3N5t3w-4"><img src="/resources/assets/images/contents/img_business_video_thumb04.jpg" alt="풀무원녹즙 홍보영상"><i class="play-ico"></i></a></li>
												</ul>
											</div>
											<!--e:영상목록-->
											<h3 class="stitle">
												풀무원녹즙 <em>가맹사업의 특별함</em>
											</h3>
											<ul class="business-special">
												<li><i class="ico ico-business-special01"></i>
													<p class="title">신뢰할 수 있는 풀무원 브랜드</p>
													<p class="desc">풀무원녹즙은 건강을 생각하는 고객들에게 많은 사랑을 받고 있는 NO.1 녹즙 브랜드입니다.</p></li>
												<li><i class="ico ico-business-special02"></i>
													<p class="title">손쉬운 창업</p>
													<p class="desc">
														최소한의 비용으로 창업가능!!<br>인수권리금(규모에 따라 차이) 점포임차금 외 가맹비 550만원, 시설비용 300만원 수준으로 창업이 가능하며, 점포(사업장)의 위치도 이면도로에 있어도 가능하기 때문에 초기 투자비가 낮습니다. 인수권리금은 회원수에 따라 차이가 있으며, 풀무원녹즙 전산시스템에 등록된 기준으로 투명하게 정산이 되며, 인수 이후 회원의 증가 시 영업권의 가치를 높일 수 있습니다.
													</p></li>
												<li><i class="ico ico-business-special04"></i>
													<p class="title">믿을 수 있는 제품</p>
													<p class="desc">전국 산지 농가와 유기농업의 장인과 계약 재배를 통해 유기농 원료를 확보하고 있으며, 풀무원기술연구원에서 한 달에 한 번 유기농산물과 토양을 검사, 분석, 관리하여 안전한 원료만을 사용합니다. 풀무원녹즙은 세계 최대 생즙공장을 보유하고 있으며, 친환경 생산시설에서 주문된 양만큼만 수확해 세척, 착즙, 살균, 혼합, 충진, 검사, 배송을 준비하고 하루 29만개, 연간 1억개의 녹즙 생산이 가능합니다.</p></li>
												<li><i class="ico ico-business-special05"></i>
													<p class="title">가맹본부 주도의 광고ㆍ홍보 집행</p>
													<p class="desc">풀무원녹즙에서는 가맹점 사업자의 부담 없이 가맹본부 주도로 광고ㆍ홍보를 실시하고 있습니다.</p></li>
											</ul>

											<h3 class="stitle">
												사업<em>현황</em>
											</h3>
											<ul class="business-state">
												<li><i class="ico ico-business-state01"></i>
													<p class="desc">풀무원녹즙은 1995년 바른먹거리 풀무원의 건강신선음료 사업으로 시작하여 매일 아침 신선한 채소와 과일의 영양을 그대로 고객에게 전하고 있습니다.</p></li>
												<li><i class="ico ico-business-state02"></i>
													<p class="desc">전국 약 400여개 가맹점(오피스 가맹점 250여개, 홈 가맹점 150여개)을 통해 음용을 원하는 고객에게 매일 아침 신선하게 제품을 배송하고 있습니다.</p></li>
												<li><i class="ico ico-business-state03"></i>
													<p class="desc">각 가맹점에서는 신선 배송을 위해 배송스텝을 모집하여 운영하고 있으며, 오피스(사무실)는 모닝스텝이, 홈(가정)은 홈스텝이라고 부르며 전국 1,500여명의 배송스텝들이 고객들의 배송을 책임지고 있습니다.</p></li>
											</ul>

											<h3 class="stitle">
												사업<em>형태</em>
											</h3>
											<div class="business-form">
												<table class="tbl-col">
													<caption></caption>
													<colgroup>
														<col width="25%">
														<col width="">
														<col width="">
														<col width="">
														<col width="">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">구분</th>
															<th scope="col">배송구분</th>
															<th scope="col">스텝구분</th>
															<th scope="col">배송시간</th>
															<th scope="col">가맹점 수</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row" class="title">오피스 가맹점(Office Delivery)</th>
															<td>오피스 배송</td>
															<td>모닝스텝</td>
															<td>오전 배송 7시 ~ 1시(월~금)</td>
															<td>약 200여개</td>
														</tr>
														<tr>
															<th scope="row" class="title">홈 가맹점(Home Delivery)</th>
															<td>가정 배송</td>
															<td>홈스텝</td>
															<td>새벽 배송 2시 ~ 7시(월~금)</td>
															<td>약 150여개</td>
														</tr>
														<tr>
															<th scope="row" class="title">병행가맹점</th>
															<td>오피스&amp;가정 배송</td>
															<td>모닝스텝&amp;홈스텝</td>
															<td>새벽&amp;오전 병행(월~금)</td>
															<td>약 50여개</td>
														</tr>
													</tbody>
												</table>
											</div>

										</div>
										<div class="tab-cont js-btab-cont js-btab-cont-4" style="display: none;">
											<h3 class="stitle">성공스토리</h3>
											<!--s:영상목록-->
											<div class="business-video">
												<div class="video-wrap">
													<div class="video">
														<iframe width="100%" height="100%" src="https://www.youtube.com/embed/FnO1-uRkMqw?enablejsapi=1&amp;version=3&amp;playerapiid=ytplayer&amp;ecver=2&amp;vq=hd720&amp;rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
													</div>
												</div>
												<ul class="video-list">
													<!--data-video에 유튜브 고유 id를 넣어주세요-->
													<li><a data-video="FnO1-uRkMqw"><img src="/resources/assets/images/contents/img_business_video_thumb01.jpg" alt="통영가맹점"><i class="play-ico"></i></a></li>
													<li><a data-video="sIzul-We7rQ"><img src="/resources/assets/images/contents/img_business_video_thumb02.jpg" alt="동판교오피스"><i class="play-ico"></i></a></li>
													<li><a data-video="hg6swO1dm9g"><img src="/resources/assets/images/contents/img_business_video_thumb03.jpg" alt="왕의녹즙"><i class="play-ico"></i></a></li>
													<li><a data-video="6kr3N5t3w-4"><img src="/resources/assets/images/contents/img_business_video_thumb04.jpg" alt="풀무원녹즙 홍보영상"><i class="play-ico"></i></a></li>
												</ul>
											</div>
											<!--e:영상목록-->
											<h3 class="stitle">
												풀무원녹즙 가맹점 <em>해외연수 및 세미나</em>
											</h3>
											<div class="step-photo-wrap story-photo-wrap">
												<ul class="photo-list">
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_story_photo01.jpg" alt="성공스토리">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_story_photo02.jpg" alt="성공스토리">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_story_photo03.jpg" alt="성공스토리">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_story_photo04.jpg" alt="성공스토리">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_story_photo05.jpg" alt="성공스토리">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_story_photo06.jpg" alt="성공스토리">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_story_photo07.jpg" alt="성공스토리">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_story_photo08.jpg" alt="성공스토리">
														</div>
													</li>
												</ul>
											</div>
										</div>
										<div class="tab-cont js-btab-cont js-btab-cont-5" style="display: none;">
											<h3 class="stitle">
												개설 <em>프로세스</em>
											</h3>
											<p class="stitle-desc">※ 가맹점 개설확정(선정위원회 심의) 통보 후 20일 내 계약 체결이 되며 가맹점주 필수 교육 이수 후 사업을 시작할 수 있습니다.</p>
											<!-- s: 개설프로세스 -->
											<div class="stp-process-wrap">
												<ul>
													<li><span class="stp-process-step-wrap"><i class="ico ico-stp-process01"></i></span> <em class="step">STEP 01</em>
														<p class="title">개설문의</p>
														<p>홈페이지 상담신청</p></li>
													<li><span class="stp-process-step-wrap"><i class="ico ico-stp-process02"></i></span> <em class="step">STEP 02</em>
														<p class="title">사업신청서 접수</p>
														<p>
															개설 상담 후<br>사업신청서 &amp; 자기소개서 접수
														</p></li>
													<li><span class="stp-process-step-wrap"><i class="ico ico-stp-process03"></i></span> <em class="step">STEP 03</em>
														<p class="title">사업후보자 검증심사</p>
														<p>가맹점 선정위원회 심사</p></li>
													<li><span class="stp-process-step-wrap"><i class="ico ico-stp-process04"></i></span> <em class="step">STEP 04</em>
														<p class="title">개설확정 통보</p>
														<p>정보공개서 외 법적 문서 발송</p></li>
												</ul>
												<ul>
													<li><span class="stp-process-step-wrap"><i class="ico ico-stp-process05"></i></span> <em class="step">STEP 05</em>
														<p class="title">
															사무실확정 및<br>임대차 계약
														</p></li>
													<li><span class="stp-process-step-wrap"><i class="ico ico-stp-process06"></i></span> <em class="step">STEP 06</em>
														<p class="title">사업서류 구비</p></li>
													<li><span class="stp-process-step-wrap"><i class="ico ico-stp-process07"></i></span> <em class="step">STEP 07</em>
														<p class="title">가맹점주 필수 교육 이수</p>
														<p>
															개설 전 본사 정규과정<br>- 온라인(e러닝)<br>- 오프라인(집합)
														</p></li>
													<li><span class="stp-process-step-wrap"><i class="ico ico-stp-process08"></i></span> <em class="step">STEP 08</em>
														<p class="title">계약 체결</p>
														<p>
															전자 계약 체결<br>정보공개서 수신 후 16일 이내<br>가맹비 납입(계약 후 2일 이내)
														</p></li>
												</ul>
											</div>
											<!-- e: 개설프로세스 -->

											<h3 class="stitle">
												개설<em>비용</em>
											</h3>
											<p class="stitle-desc">
												※ 가맹점 개설은 기존 영업권을 인수하는 형태로 진행이 되며 최소한의 비용으로 개설을 하실 수 있도록 지원하여 드립니다.<br>가맹점 규모, 영업지역, 고객수에 따라 소요 비용에 차이가 있을 수 있습니다.(임대보증금은 포함되어 있지 않습니다.)
											</p>
											<!-- s: 개설비용 -->
											<div class="stp-cost">
												<table class="tbl-col">
													<caption></caption>
													<colgroup>
														<col style="width: 25%">
														<col style="width: 25%">
														<col style="width: 50%">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">구분</th>
															<th scope="col">금액</th>
															<th scope="col">비고</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>가맹비</td>
															<td>550만원</td>
															<td>VAT 포함</td>
														</tr>
														<tr>
															<td>창업교육비</td>
															<td>없음</td>
															<td>가맹점장, 배송스텝 교육 무상지원</td>
														</tr>
														<tr>
															<td>영업권리금</td>
															<td>최소 2000만원 ~ 1억원</td>
															<td>규모, 영업지역, 회원수에 따라 상이함</td>
														</tr>
														<tr>
															<td>간판/썬팅</td>
															<td>100만원</td>
															<td>1층 15평 규모의 전면썬팅 &amp; 간판 1개 기준</td>
														</tr>
														<tr>
															<td>비품 및 인테리어</td>
															<td>최소 100 ~ 300만원</td>
															<td>냉장/냉동 설비, 오피스 용품, 사무 전산기기</td>
														</tr>
													</tbody>
													<tfoot>
														<tr class="total">
															<th scope="row" style="text-align: center">합계</th>
															<td>최소 2750만원 ~ 1억 9.5만원</td>
															<td></td>
														</tr>
													</tfoot>
												</table>
											</div>
											<!-- e: 개설비용 -->
										</div>
										<div class="tab-cont js-btab-cont js-btab-cont-6" style="display: none;">
											<div class="qualification-title-wrap">
												<div class="qualification-title">
													<h3 class="stitle">
														<em>개설 가능</em> 지역
													</h3>
													<p class="stitle-desc">개설을 희망하는 지역 및 문의사항은 상담 시 상세히 안내해 드립니다.</p>
												</div>
												<button type="button" class="btn-mid green" onclick="javascript:$('.pop-qualification-area').dialog('open');">개설 가능 지역 보기</button>
											</div>

											<h3 class="stitle mg">
												자격 및 <em>혜택</em>
											</h3>
											<ul class="qualification-info">
												<li><i class="ico ico-qualification-info01"></i>
													<p class="title">
														<em>01</em> 부부가 함께 하면 좋은 사업입니다!
													</p>
													<p class="desc">부부가 함께 사업을 운영할 경우!! 더욱 큰 매력이 있는 사업입니다.</p></li>
												<li><i class="ico ico-qualification-info02"></i>
													<p class="title">
														<em>02</em> 기본적인 컴퓨터 활용!
													</p>
													<p class="desc">
														풀무원녹즙 전산시스템을 무료로 제공하여 고객 주문 · 배송 · 결제 · 정산 등을 편리하게 할 수 있도록 도와드립니다.<br>배송 직원들에게는 모바일 고객관리 시스템을 제공하여 간편하게 고객 관리를 하실 수 있습니다.<br>철저한 상권 분석으로 성공적인 사업을 지원합니다.<br>※전산기기는 별도 구비 필요
													</p></li>
												<li><i class="ico ico-qualification-info03"></i>
													<p class="title">
														<em>03</em> 홍보활동 가능하신 분 우대!
													</p>
													<p class="desc">가맹본부에서는 다양한 프로모션을 통해 가맹점의 판매활동을 지원하고 있으며, 가맹점은 영업지역 내 홍보 활동을 통해 매출을 더욱 올릴 수 있습니다.</p></li>
												<li><i class="ico ico-qualification-info04"></i>
													<p class="title">
														<em>04</em> 온·오프라인 판촉지원
													</p>
													<p class="desc">포털 검색을 통한 온라인 판촉 및 풀무원 전용몰 입점으로 고객 판촉을 지원합니다. 오프라인 전문판촉 인력을 통한 지원도 하고 있습니다.</p></li>
												<li><i class="ico ico-qualification-info05"></i>
													<p class="title">
														<em>05</em> 채용사이트 무료 지원!
													</p>
													<p class="desc">배송 스텝 구인이 가능하도록 브랜드 채용 사이트를 무료로 이용할 수 있게 지원드립니다.</p></li>
												<li><i class="ico ico-qualification-info06"></i>
													<p class="title">
														<em>06</em> 사업장 임대차 조건
													</p>
													<p class="desc">- 물류수급의 편의성(2.5t 차량 진입로 확보)</p>
													<p class="desc">- 근린생활시설로 우유류 판매업 및 건강기능식품 판매 허가가 가능한 곳</p>
													<p class="desc">- 최초 실평수 기준 13평 내외</p></li>
											</ul>
										</div>
										<div class="tab-cont js-btab-cont js-btab-cont-7" style="display: none;">
											<form id="listForm">
												<input type="hidden" id="hopeLocal" name="hopeLocal">
												<h3 class="stitle mg">가맹점 개설 문의</h3>
												<div class="list-head">
													<p class="list-desc">풀무원녹즙 가맹점 개설을 위해 궁금하신 사항을 고객상담원이 1:1서비스로 답변드립니다.</p>
												</div>
												<table class="tbl-row">
													<caption></caption>
													<colgroup>
														<col style="width: 205px">
														<col>
													</colgroup>
													<tbody>
														<tr>
															<th scope="row"><label for="ip-name1">이름</label></th>
															<td class="input">
																<div class="ip-wrap">
																	<input title="이름 입력" id="name" name="userName" type="text" placeholder="이름을 입력해주세요." maxlength="10"> <span class="message" id="nameError"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="ip-mobile1">휴대폰번호</label></th>
															<td class="input">
																<div class="ip-wrap">
																	<input title="입력" id="phone" data-call-text="" name="phone" type="hidden" placeholder="‘-’없이 숫자만 입력해주세요" maxlength="13"> <span class="message" id="phoneError"></span> <input title="입력" name="_x_phone" type="text" placeholder="‘-’없이 숫자만 입력해주세요" maxlength="13">
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row">이메일</th>
															<td class="input">
																<div class="ip-wrap">
																	<div class="ip-email-wrap">
																		<input type="text" title="이메일 아이디 입력" id="email" name="email" placeholder="이메일" value=""> <input type="hidden" title="이메일 아이디 입력" id="emailFull" name="emailFull" placeholder="이메일" value="@naver.com"> <span class="gap">@</span> <input type="text" title="이메일 도메인 직접입력" id="emailHost" name="emailHost" value=""> <select title="이메일 도메인 선택" id="emailHostList" name="emailHostList">
																			<option value="">선택</option>
																			<option value="naver.com" selected="selected">naver.com</option>
																			<option value="daum.net">daum.net</option>
																			<option value="hanmail.net">hanmail.net</option>
																			<option value="gmail.com">gmail.com</option>
																			<option value="nate.com">nate.com</option>
																			<option value="1">직접 입력</option>
																		</select>
																	</div>
																	<span id="emailError" class="message"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="ip-money1">투자금</label></th>
															<td class="input">
																<div class="ip-txt-wrap">
																	<input title="입력" id="invest" name="invest" type="text" placeholder="숫자만 입력해주세요" maxlength="20"> <span class="lb">만원</span> <span class="message" id="investError"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="sel-city1-1">개설희망지역</label></th>
															<td class="input">
																<div class="multi-sel-wrap">
																	<select title="개설희망지역 광역시/도 선택" id="sido">
																		<option value="" hidden="">광역시/도</option>

																		<option value="강원도">강원도</option>

																		<option value="경기도">경기도</option>

																		<option value="경상남도">경상남도</option>

																		<option value="경상북도">경상북도</option>

																		<option value="광주광역시">광주광역시</option>

																		<option value="대구광역시">대구광역시</option>

																		<option value="대전광역시">대전광역시</option>

																		<option value="부산광역시">부산광역시</option>

																		<option value="서울특별시">서울특별시</option>

																		<option value="세종특별자치시">세종특별자치시</option>

																		<option value="울산광역시">울산광역시</option>

																		<option value="인천광역시">인천광역시</option>

																		<option value="전라남도">전라남도</option>

																		<option value="전라북도">전라북도</option>

																		<option value="제주특별자치도">제주특별자치도</option>

																		<option value="충청남도">충청남도</option>

																		<option value="충청북도">충청북도</option>

																	</select> <select title="개설희망지역 시/군/구 선택" id="sigugun">
																		<option value="" hidden="">시/군/구</option>
																	</select> <span class="message" id="hopeLocalError"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="ip-zipcode-1">거주지 주소</label></th>
															<td class="input">
																<div class="ip-btn-wrap">
																	<input type="text" id="zipcode" name="zipcode" readonly="">
																	<button title="새창으로 이동합니다" class="btn-pos" type="button" onclick="searchPostcode();">우편번호 찾기</button>
																</div>
																<div class="ip-addr-wrap">
																	<input title="주소 입력" type="text" id="roadAddress" name="addr1" readonly=""> <input title="상세 주소 입력" type="text" id="detailAddress" name="addr2" placeholder="상세주소를 입력해주세요." maxlength="80"> <span class="message" id="adressError"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="">일일배달 사업 경험</label></th>
															<td class="input">
																<ul class="rc-list">
																	<li>
																		<div class="rc-item">
																			<input id="ip-rdo1-1" type="radio" checked="" name="businessYn" value="Y"> <label for="ip-rdo1-1">있습니다</label>
																		</div>
																	</li>
																	<li>
																		<div class="rc-item">
																			<input id="ip-rdo1-2" type="radio" name="businessYn" value="N"> <label for="ip-rdo1-2">없습니다</label>
																		</div>
																	</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="txt-1">내용</label></th>
															<td class="input">
																<div class="textarea-byte-check">
																	<textarea id="contents" name="contents" placeholder="상담하실 내용을 입력해주세요. 고객님의 개인정보 등은 표기하지 말아주세요" maxlength="500"></textarea>
																	<p class="ar num-countt">
																		<span>0</span> / 500
																	</p>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
												<div class="agree-wrap">
													<div class="agree-container">
														<div class="agree-item js-fold-wrap">
															<div class="agree-header">
																<span class="rc-item no-bg"> <input type="checkbox" id="agree-22" name="order-agree"> <label for="agree-22">개인정보 수집 및 이용 동의 (필수)</label> <!-- 20200309 텍스트 수정 -->
																</span>
																<button type="button" class="btn-more-view" onclick="javascript:foldCont($(this));">
																	<span class="lb">내용보기</span> <i class="ico ico-arr-down-xs"></i>
																</button>
															</div>
															<div class="agree-container js-fold-container" style="display: none;">
																<div class="agree-cont">
																	<!-- s: 20200313 약관 내용 수정 -->
																	<!-- s: 20200310 약관 내용 수정 -->
																	<!-- s: 20200309 약관 내용 수정 -->
																	<ol>
																		<li>1) 수집 및 이용목적 : 가맹점 개설 문의에 대한 회신</li>
																		<li>2) 수집항목 : 이름, 휴대폰번호, 투자금, 개설희망지역, 일일배달 사업 경험 여부</li>
																		<li>3) 이용기간 : 원칙적으로 수집 및 이용목적이 달성된 후에 해당 정보를 지체없이 파기합니다.</li>
																		<li>4) 동의거부 권리 등 : 고객은 개인정보의 제공을 거부할 권리가 있습니다. 다만, 개인정보 수집 및 이용동의에 동의하지 않거나 수집항목을 기재하지 않으시면 문의 접수 및 회신이 되지 않습니다.</li>
																	</ol>

																	<p>(주)풀무원녹즙은 개인정보보호 관련 법률 및 각종 기준을 준수하고 있으며, 기타 자세한 사항은 홈페이지에 공개한 "개인정보처리방침"을 참조하시기 바랍니다. 개인정보 수집 및 이용동의 안내 내용을 충분히 이해하시고 이에 동의하여 주시기 바랍니다.</p>
																	<!-- e: 20200309 약관 내용 수정 -->
																	<!-- e: 20200310 약관 내용 수정 -->
																	<!-- e: 20200313 약관 내용 수정 -->
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="btn-wrap">
													<button class="btn-lg green" type="button" id="fdSaveBtn">등록</button>
												</div>
											</form>
										</div>


										<div tabindex="-1" class="ui-widget ui-widget-content ui-front ui-resizable ui-dialog" role="dialog" aria-describedby="ui-id-5" aria-labelledby="ui-id-6" style="left: 298.5px; top: 406.5px; width: 320px; height: auto; display: none; position: absolute;">

											<div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div>
										</div>

										<div tabindex="-1" class="ui-widget ui-widget-content ui-front ui-resizable ui-dialog" role="dialog" aria-describedby="ui-id-7" aria-labelledby="ui-id-8" style="left: 298.5px; top: 394px; width: 320px; height: auto; display: none; position: absolute;">

											<div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div>
										</div>

										<div class="tab-cont js-btab-cont js-btab-cont-8" style="display: none;">
											<h3 class="stitle">FAQ</h3>
											<!--S:FAQ list-->
											<ul class="business-faq-list" style="margin-top: 0px">
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">가맹점을 창업하고 싶은데 어떻게 해야 하나요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">희망지역과 희망 사업(오피스, 홈) 여부를 작성하시어 상담 신청을 해주시면 담당 부서에서 창업 가능 여부를 상담해 드립니다. 희망지역에 창업이 어려운 경우 영업관리자가 거주지 중심으로 지역을 추천해드립니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">타인에게 사업 양도와 인수가 가능한가요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">사업 양도는 가맹본부와 사전 협의 하에 가능합니다. 사업후보자를 직접 모집하거나 가맹본부에서 모집을 지원하고 있으며, 양수도 거래는 가맹점사업자(가맹희망자)님들 간의 거래로 이루어집니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">희망 지역에 창업할 수 있나요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">풀무원녹즙은 기존 운영지역의 배송 고객을 양도받아 사업을 시작하는 경우가 대부분입니다. 가맹희망자가 희망하는 지역을 최우선으로 안내해드립니다. 신규 배송 희망 지역은 영업 관리자가 사업성을 검토하여 상담해 드립니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">권리금은 따로 없나요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">기존 음용 고객에 대한 영업권리금은 있으며, 별도 보증금은 없습니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">동일 상권에서도 추가 개설이 가능한가요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">풀무원녹즙은 가맹점간의 과열 경쟁을 지양하며 상생 협력을 도모하고자 가맹사업법에 따른 영업지역을 설정하여 운영합니다. 가맹본부는 정당한 사유 없이 가맹계약기간 중 가맹점사업자의 영업지역 안에 가맹점사업자와 동일한 업종의 직영점이나 가맹점을 설치하는 행위를 하지 않습니다.(계열회사 포함) 다만, 설정된 영업지역 외는 추가 개설이 가능하며, 법령에 정한 사유에 해당하는 경우 가맹점사업자와의 합의에 따라 추가 개설이 가능합니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">사무실은 본사에서 지정해주나요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">사무실 위치 선정 및 임대는 전적으로 가맹사업자가 직접 진행합니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">최초 가맹금은 얼마인가요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">최초 가맹금는 550만원(VAT포함)입니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">최초 가맹금은 사업 종료 시 돌려받을 수 있나요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">최초 가맹금은 가맹점사업자가 가맹본부로부터 가맹본부의 영업표지 사용과 경영 및 영업활동 등에 대한 지원, 교육 등을 제공 받는 대가로, 모든 프랜차이즈 사업체에서 계약 종료 시 반환되지 않는 소멸성 경비로 지정하고 있습니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">최초가맹금은 어떻게 납부하는 건가요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">가맹점사업자는 가맹계약 체결 후 D+2일 내 최초 가맹금을 당사의 계좌(국민은행)로 입금해야 합니다. 가맹점사업자의 영업개시 또는 가맹계약 체결일부터 2개월이 지난 예치가맹금은 가맹본부에 지급됩니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">사무실 운영 비품은 어떤 게 필요한가요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">자율적으로 판단하여 가맹점 운영에 무리가 없도록 구입하여 비치해주시는 것을 원칙으로 하되, 관련한 제 비용은 가맹점사업자가 부담합니다. 컴퓨터, 책상, 의자, 보드판, 수납장, 캐비닛, 제품보관매대, 탕비실 제반, 문구류 등 가맹점 규모, 구좌, 인원 수에 따라 여건에 맞게 구매하시면 됩니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">가전장비도 필요한가요? </a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">교육을 함께 시청할 수 있는 모니터(TV, 빔 프로젝터), 냉장고, 냉동고, 에어컨 등이 필요하며 장비의 수량은 가맹점 규모, 구좌, 인원수 등 제반 여건 고려 후 구매하시면 됩니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">영업시간은 어떻게 되나요? </a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">영업시간은 평일 주 5일로 배송시간 외 고객관리, 스텝 관리 시간이 소요됩니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">주요 고객층은 누구인가요? </a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">주요 고객층은 30~50대로 배송처는 관공서, 학교, 금융권(은행, 증권사), 재래시장, 상가, 가정집 등으로 다양합니다. 일평균 약 20만명이 풀무원녹즙을 음용하고 있습니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">배송스텝은 가맹본부에서 모집해주나요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">운영직원과 배송스텝은 가맹점사업자가 직접 모집 하셔야 하며, 가맹본부는 채용사이트를 통해 가맹점 사업자가 원만히 배송스텝을 모집할 수 있도록 온라인 홍보, 취업설명회 등을 진행하여 지원하고 있습니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">배송스텝은 본사 특별 혜택이 있나요? </a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">
															1. 월간 일정금액을 쌓아 목돈을 마련할 수 있는 적립금 제도를 운영하고 있습니다.<br> 2. 상호부조와 혜택 향상을 도모하는 상조회 제도를 가맹점사업자들 간 운영하고 있습니다.<br> 3. 자녀입학축하금, 국내외 연수, 로하스아카데미(연수원) 체험이 가능합니다. <br> 4. 배송스텝이 정착할 수 있도록 정규과정 교육 프로그램이 무료 과정으로 상시 진행되고 있으며, 모닝스텝 전용 학습 플랫폼을 제공합니다.
														</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">배송스텝도 창업을 시작할 수 있나요? </a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">배송스텝(모닝스텝 or 홈스텝)으로 활동 하시다가 사업에 자신감이 생겨 실제 가맹점사업자로 전환하는 경우가 많습니다. 자세한 사항은 상담을 통해 안내 받을 수 있습니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">가정주부도 할 수 있나요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">일반적인 프랜차이즈 사업에 비해 난이도가 낮고 가맹점사업자 개인의 운영보다 배송스텝(모닝스텝, 홈스텝)을 모집하여 함께 운영하는 사업으로 여성 또는 가정주부도 충분히 도전하실 수 있습니다. 현재, 전국 400여개 가맹점에서 약 230여개 가맹점(약 58%)은 여성 사장님이 운영하고 계십니다.</div>
													</div>
												</li>
												<li class="faq-item js-fold-wrap">
													<div class="js-fold-header">
														<a href="javascript:;" class="faq-link" onclick="javascript:foldCont($(this));">가맹 계약 후 개설까지는 기간이 얼마나 걸리나요?</a>
														<button type="button" class="btn-more-view">
															<i class="ico ico-fold-arrow"></i> <span class="offscreen">내용펼치기</span>
														</button>
													</div>
													<div class="faq-body js-fold-container">
														<div class="faq-cont">사업 후보자 검증 단계 이후 예비 가맹점사업자로 확정이 되면 사업 개설시까지 약 20여 일이 소요됩니다.</div>
													</div>
												</li>
											</ul>
											<!--E:FAQ list-->
										</div>

										<!--S: inquiry button-->
										<div class="footer-btn-wrap js-footer-fixed is-fixed">
											<div class="section">
												<p class="title">더 궁금하신 사항은 전화상담을 통해 확인하세요.</p>
												<!-- <button type="button" data-idx="7" data-href="js-btab-cont" class="btn-pos js-btab-link" onclick="javascript:businessTabOpen(7);"> 바로가기</button> -->
												<button type="button" data-idx="7" data-href="js-btab-cont" class="btn-pos js-btab-link" onclick="javascript:businessTabOpen(7);">상담 접수하기</button>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn-pos" onclick="javascript:$('.pop-qualification-area').dialog('open');">개설가능 지역보기</button>
											</div>
										</div>
										<!--E: inquiry button-->
									</div>
									<!-- e:가맹점개설 안내 -->



									<!--s:모닝스텝안내 -->
									<div class="tab-cont js-tab-cont js-tab-cont-1">
										<h3 class="offscreen">모닝스텝안내</h3>
										<!--S:2depth tab-->
										<div class="tab-sublist">
											<ul class="tab-type04">
												<li class="item tab-item is-active"><button type="button" data-idx="8" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(8);">모닝스텝 소개</button></li>
												<li class="item tab-item"><button type="button" data-idx="9" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(9);">지원 및 혜택</button></li>
												<li class="item tab-item"><button type="button" data-idx="10" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(10);">모닝스텝 지원</button></li>
											</ul>
										</div>
										<!--E:2depth tab-->
										<div class="tab-cont js-btab-cont js-btab-cont-8">
											<h3 class="stitle">모닝스텝 안내</h3>
											<div class="video-wrap">
												<div class="video">
													<iframe width="100%" height="100%" src="https://www.youtube.com/embed/bkfstdS9DNg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>

												</div>
											</div>


											<div class="morning-staff-bn">
												<p class="offscreen">건강한 아침을 책임지는 모닝스텝</p>
											</div>

											<h3 class="stitle">
												<em>모닝스텝</em>이란?
											</h3>
											<p class="stitle-desc">고객들에게 매일 아침 신선한 채소와 과일의 영양을 자연 그대로 담은 풀무원녹즙 제품을 전달하여 건강을 관리하는 ‘건강지킴이’입니다.</p>
											<!-- 20200224 폰트 블랙컬러 삭제 -->

											<h3 class="stitle">
												누구나 바로, <em>지원하세요!</em>
											</h3>
											<div class="morning-staff-info">
												<ol class="morning-staff-list">
													<li><i class="ico ico-morning-staff-info03"></i>
														<p class="title">
															<em>01</em> 자유로운 시간 활용 가능!
														</p>
														<p class="desc">탄력적 시간 운영 가능! 전국 모닝스텝은 주5일 하루 5시간(배송업무 4시간+기타업무 1시간) 전후 오전에 활동하고 선택적으로 추가적인 활동을 통해 소득을 올리고 있습니다. 가사와 자녀 돌봄을 병행할 수 있어 시간적 제약이 크지 않고, 학력이나 나이제한은 없습니다.</p></li>
													<li><i class="ico ico-morning-staff-info02"></i>
														<p class="title">
															<em>02</em> 안정적 소득!
														</p>
														<p class="desc">모닝스텝은 녹즙 가맹점에 소속되어 지역과 고정 고객을 배정받아 활동하게 됩니다. 활동초기 비용은 없으며,&nbsp;약&nbsp;5시간 활동으로 안정적인 수입을 올릴 수 있습니다.</p></li>
													<li><i class="ico ico-morning-staff-info01"></i>
														<p class="title">
															<em>03</em> 로하스 실천의 건강한 삶
														</p>
														<p class="desc">주말,&nbsp;공휴일을 제외하고 매일 아침 규칙적인 활동을 통해 다양한 고객을 만나며 몸과 마음의 건강을 챙길 수 있습니다.</p></li>
												</ol>
											</div>

											<h3 class="stitle">
												모닝스텝 <em>교육 및 국내·외 연수</em>
											</h3>
											<div class="step-photo-wrap">
												<ul class="photo-list">
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_business_photo05.jpg" alt="우수가맹점 한마음연수 및 스텝 교육">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_business_photo06.jpg" alt="우수가맹점 한마음연수 및 스텝 교육">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_business_photo07.jpg" alt="우수가맹점 한마음연수 및 스텝 교육">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_business_photo08.jpg" alt="우수가맹점 한마음연수 및 스텝 교육">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_business_photo09.jpg" alt="우수가맹점 한마음연수 및 스텝 교육">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_business_photo10.jpg" alt="우수가맹점 한마음연수 및 스텝 교육">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_business_photo11.jpg" alt="우수가맹점 한마음연수 및 스텝 교육">
														</div>
													</li>
													<li>
														<div class="thumb-box">
															<img src="/resources/assets/images/contents/img_business_photo12.jpg" alt="우수가맹점 한마음연수 및 스텝 교육">
														</div>
													</li>
												</ul>
											</div>
										</div>

										<div class="tab-cont js-btab-cont js-btab-cont-9" style="display: none;">
											<h3 class="stitle">
												풀무원녹즙만의 <em>복지와 혜택!</em>
											</h3>
											<ul class="morning-staff-benefit">
												<li><i class="ico ico-staff-benefit01"></i>
													<p class="title">지원과 복지혜택</p>
													<p class="desc">
														월간 일정금액이 쌓이는 적립금 제도를 운영하고 있어요! 상호부조와 혜택 향상을 도모하는 상조회 제도가 있습니다.<br>상호부조와 혜택 향상을 도모하는 상조회 제도를 가맹사업자들 간 운영하고 있습니다.자녀 입학 축하금,&nbsp;국내외 연수,&nbsp;로하스아카데미 체험도 가능합니다!<br>(※&nbsp;가맹점별 운영기준이 상이할 수 있습니다.)
													</p></li>
												<li><i class="ico ico-staff-benefit02"></i>
													<p class="title">체계적 교육 제공!</p>
													<p class="desc">
														입문 교육&nbsp;&amp;&nbsp;정기 교육 프로그램을 진행합니다.<br>자세한 제품별 화법집과 리플렛을 드립니다.<br>모닝스텝 전용 어플리케이션을 제공합니다.
													</p></li>
												<li><i class="ico ico-staff-benefit03"></i>
													<p class="title">누가 일하고 있을까?</p>
													<div class="who-list">
														<dl>
															<i class="ico ico-wholist"></i>
															<dt>"아침 운동하는 상쾌한 기분으로 활동하고 있어요"</dt>
															<dd>20대 김O희 모닝스텝(동판교가맹점)</dd>
														</dl>
														<dl>
															<i class="ico ico-wholist"></i>
															<dt>"건강한 아르바이트로 시작했다가, 이제는 사업가(가맹점운영)을 꿈꾸고 있어요"</dt>
															<dd>30대 이O영 모닝스텝(테헤란가맹점)</dd>
														</dl>
														<dl>
															<i class="ico ico-wholist"></i>
															<dt>"생활비와 아이들 교육비, 늘어가는 가계 부담에 다시 한번 팔을 걷어붙였죠"</dt>
															<dd>40대 전O현 모닝스텝(동두천가맹점)</dd>
														</dl>
														<dl>
															<i class="ico ico-wholist"></i>
															<dt>
																"경력단절 10년만에 다시 당당하게 사회활동 하고 있어요. 고객님께 건강을 전하고,<br>제 건강도 챙기고 일한만큼 수익까지! 앞으로 10년,20년 쭈욱 활동할 겁니다."
															</dt>
															<dd>50대 박O미 모닝스텝(송파가맹점)</dd>
														</dl>
													</div></li>
												<li><i class="ico ico-staff-benefit04"></i>
													<p class="title">모닝스텝 이런게 궁금해요</p>
													<div class="qna-list">
														<dl>
															<dt>
																<i class="ico ico-qna-q"></i>나이가 걱정되세요?
															</dt>
															<dd>
																<i class="ico ico-qna-a"></i><em>19세 이상 누구나</em> 가능합니다!
															</dd>
															<!-- 20200224 폰트 블랙컬러 삭제 -->
														</dl>
														<dl>
															<dt>
																<i class="ico ico-qna-q"></i>처음이라 걱정되세요?
															</dt>
															<dd>
																<i class="ico ico-qna-a"></i><em>지역과 기존 고객을 배정받고</em> 시작하게 됩니다!
															</dd>
															<!-- 20200224 폰트 블랙컬러 삭제 -->
														</dl>
														<dl>
															<dt>
																<i class="ico ico-qna-q"></i>오후 근무가 어려워요.
															</dt>
															<dd>
																<i class="ico ico-qna-a"></i>탄력적인 근무시간으로 <em>일과 가정의 병행</em>이 가능합니다!
															</dd>
															<!-- 20200224 폰트 블랙컬러 삭제 -->
														</dl>
														<dl>
															<dt>
																<i class="ico ico-qna-q"></i>앞으로의 비전이 있을까요?
															</dt>
															<dd>
																<i class="ico ico-qna-a"></i><em>모닝스텝부터 성장하여 사장님까지</em> 가능합니다!
															</dd>
															<!-- 20200224 폰트 블랙컬러 삭제 -->
														</dl>
													</div></li>
											</ul>
											<div class="morning-staff-app">
												<div class="app-l">
													<dl>
														<dt>활동 시간 대비 고소득</dt>
														<dd>오전 5시간 활동 → 안정적 소득</dd>
													</dl>
													<dl>
														<dt>적립금 · 상조회 지원</dt>
														<dd>
															활동 기간 동안 적립금 지원 (3년 만기)<br>상조회 가입 지원
														</dd>
													</dl>
													<dl>
														<dt>판매 비품 무상 지급</dt>
														<dd>
															보냉백 · 보냉가방 · 전단 등<br>판매에 필요한 비품 무상 지원
														</dd>
													</dl>
												</div>
												<div class="app">
													<img src="/resources/assets/images/contents/img_benefit_appr.png" alt="모닝스텝">
													<button type="button" data-idx="10" data-href="js-btab-link" class="btn-lg green js-btab-link" onclick="javascript:businessTabOpen(10);">모닝스텝 지원 바로가기</button>
												</div>
												<div class="app-r">
													<dl>
														<dt>가맹 사업 오픈시 지원 혜택</dt>
														<dd>
															모닝스텝이 가맹 사업을 창업할 경우<br>지원 혜택 부여
														</dd>
													</dl>
													<dl>
														<dt>우수 모닝스텝 한마음 연수</dt>
														<dd>
															연간 판매 우수 모닝스텝 선발<br>해외 연수 지원
														</dd>
													</dl>
													<dl>
														<dt>고객 관리용 모바일 시스템 지원</dt>
														<dd>
															고객의 음용 정보 및 수금 관리<br>[ 개인 모바일 기기 활용 ]
														</dd>
													</dl>
												</div>
											</div>
										</div>

										<div class="tab-cont js-btab-cont js-btab-cont-10" style="display: none;">
											<form id="listForm2">
												<h3 class="stitle mg">모닝스텝 지원</h3>
												<div class="list-head">
													<p class="list-desc">매일아침 건강과 행복을 전하는 모닝스텝에 지원하세요!</p>
												</div>
												<table class="tbl-row">
													<caption></caption>
													<colgroup>
														<col style="width: 205px">
														<col>
													</colgroup>
													<tbody>
														<tr>
															<th scope="row"><label for="ip-name1">이름</label></th>
															<td class="input">
																<div class="ip-wrap">
																	<input title="이름 입력" id="nameMorning" name="userName" type="text" placeholder="이름을 입력해주세요." maxlength="10"> <span class="message" id="nameMorningError"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="ip-mobile1">휴대폰번호</label></th>
															<td class="input">
																<div class="ip-wrap">
																	<input title="입력" id="phoneMorning" name="cellPhone" data-call-text="" type="hidden" placeholder="‘-’없이 숫자만 입력해주세요" maxlength="13"> <span class="message" id="phoneMorningError"></span> <input title="입력" name="_x_cellPhone" type="text" placeholder="‘-’없이 숫자만 입력해주세요" maxlength="13">
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row">이메일</th>
															<td class="input">
																<div class="ip-wrap">
																	<div class="ip-email-wrap">
																		<input type="text" title="이메일 아이디 입력" id="emailMorning" name="emailMorning" placeholder="이메일" value=""> <input type="hidden" title="이메일 아이디 입력" id="emailFullMorning" name="emailFullMorning" placeholder="이메일" value="@naver.com"> <span class="gap">@</span> <input type="text" title="이메일 도메인 직접입력" id="emailHostMorning" name="emailHostMorning" value=""> <select title="이메일 도메인 선택" id="emailHostListMorning" name="emailHostListMorning">
																			<option value="">선택</option>
																			<option value="naver.com" selected="selected">naver.com</option>
																			<option value="daum.net">daum.net</option>
																			<option value="hanmail.net">hanmail.net</option>
																			<option value="gmail.com">gmail.com</option>
																			<option value="nate.com">nate.com</option>
																			<option value="1">직접 입력</option>
																		</select>
																	</div>
																	<span id="emailErrorMorning" class="message"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row">희망 배달업무 시간</th>
															<td class="input">
																<ul class="rc-list">
																	<li>
																		<div class="rc-item">
																			<input name="hopeTime" id="ip-rdo2-1" type="radio" checked="" value="A"> <label for="ip-rdo2-1">오전 배달</label>
																		</div>
																	</li>
																	<li>
																		<div class="rc-item">
																			<input name="hopeTime" id="ip-rdo2-2" type="radio" value="P"> <label for="ip-rdo2-2">새벽 배달</label>
																		</div>
																	</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="sel-year">출생년도</label></th>
															<td class="input">
																<div class="ip-wrap">
																	<select title="출생년도 선택" id="birthday" name="birthday">
																		<option value="" hidden="">년도</option>
																		<option value="1964">1964 년</option>
																		<option value="1965">1965 년</option>
																		<option value="1966">1966 년</option>
																		<option value="1967">1967 년</option>
																		<option value="1968">1968 년</option>
																		<option value="1969">1969 년</option>
																		<option value="1970">1970 년</option>
																		<option value="1971">1971 년</option>
																		<option value="1972">1972 년</option>
																		<option value="1973">1973 년</option>
																		<option value="1974">1974 년</option>
																		<option value="1975">1975 년</option>
																		<option value="1976">1976 년</option>
																		<option value="1977">1977 년</option>
																		<option value="1978">1978 년</option>
																		<option value="1979">1979 년</option>
																		<option value="1980">1980 년</option>
																		<option value="1981">1981 년</option>
																		<option value="1982">1982 년</option>
																		<option value="1983">1983 년</option>
																		<option value="1984">1984 년</option>
																		<option value="1985">1985 년</option>
																		<option value="1986">1986 년</option>
																		<option value="1987">1987 년</option>
																		<option value="1988">1988 년</option>
																		<option value="1989">1989 년</option>
																		<option value="1990">1990 년</option>
																		<option value="1991">1991 년</option>
																		<option value="1992">1992 년</option>
																		<option value="1993">1993 년</option>
																		<option value="1994">1994 년</option>
																		<option value="1995">1995 년</option>
																		<option value="1996">1996 년</option>
																		<option value="1997">1997 년</option>
																		<option value="1998">1998 년</option>
																		<option value="1999">1999 년</option>
																		<option value="2000">2000 년</option>
																		<option value="2001">2001 년</option>
																		<option value="2002">2002 년</option>
																		<option value="2003">2003 년</option>
																	</select> <span class="message" id="birthdayError"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="ip-zipcode-1">주소</label></th>
															<td class="input">
																<div class="ip-btn-wrap">
																	<input type="text" id="zipcodeMorning" name="zipCode" readonly="">
																	<button title="새창으로 이동합니다" class="btn-pos" type="button" onclick="searchPostcode2();">우편번호 찾기</button>
																</div>
																<div class="ip-addr-wrap">
																	<input title="주소 입력" type="text" id="roadAddressMorning" name="addr1" readonly=""> <input title="상세 주소 입력" id="detailAddressMorning" name="addr2" type="text" placeholder="상세주소를 입력해주세요." maxlength="80"> <span class="message" id="adressErrorMorning"></span>
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row"><label for="txt-1">내용</label></th>
															<td class="input">
																<div class="textarea-byte-check">
																	<textarea id="memo" name="memo" placeholder="상담하실 내용을 입력해주세요. 고객님의 개인정보 등은 표기하지 말아주세요" maxlength="500"></textarea>
																	<p class="ar num-count">
																		<span>0</span> / 500
																	</p>
																</div>
															</td>
														</tr>
													</tbody>
												</table>

												<div class="agree-wrap">
													<div class="agree-container">
														<div class="agree-item js-fold-wrap">
															<div class="agree-header">
																<span class="rc-item no-bg"> <input type="checkbox" id="agree-2202" name="order-agree"> <label for="agree-2202">개인정보 수집 및 이용 동의 (필수)</label> <!-- 20200309 텍스트 수정 -->
																</span>
																<button type="button" class="btn-more-view" onclick="javascript:foldCont($(this));">
																	<span class="lb">내용보기</span> <i class="ico ico-arr-down-xs"></i>
																</button>
															</div>
															<div class="agree-container js-fold-container" style="display: none;">
																<div class="agree-cont">
																	<!-- s: 20200313 약관 내용 수정 -->
																	<!-- s: 20200310 약관 내용 수정 -->
																	<!-- s: 20200309 약관 내용 수정 -->
																	<ol>
																		<li>1) 수집 및 이용목적 : 모닝스텝 지원에 대한 회신</li>
																		<li>2) 수집항목 : 이름, 휴대폰번호, 희망 배달 업무 시간, 출생년도, 주소</li>
																		<li>3) 이용기간 : 원칙적으로 수집 및 이용목적이 달성된 후에 해당 정보를 지체없이 파기합니다.</li>
																		<li>4) 동의거부 권리 등 : 고객은 개인정보의 제공을 거부할 권리가 있습니다. 다만, 개인정보 수집 및 이용동의에 동의하지 않거나 수집항목을 기재하지 않으시면 문의 접수 및 회신이 되지 않습니다.</li>
																	</ol>

																	<p>(주)풀무원녹즙은 개인정보보호 관련 법률 및 각종 기준을 준수하고 있으며, 기타 자세한 사항은 홈페이지에 공개한 "개인정보처리방침"을 참조하시기 바랍니다. 개인정보 수집 및 이용동의 안내 내용을 충분히 이해하시고 이에 동의하여 주시기 바랍니다.</p>
																	<!-- e: 20200309 약관 내용 수정 -->
																	<!-- e: 20200310 약관 내용 수정 -->
																	<!-- e: 20200313 약관 내용 수정 -->
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="btn-wrap">
													<button class="btn-lg green" type="button" id="staffApplyBtn">등록</button>
												</div>
											</form>
										</div>


										<div tabindex="-1" class="ui-widget ui-widget-content ui-front ui-resizable ui-dialog" role="dialog" aria-describedby="ui-id-5" aria-labelledby="ui-id-6" style="left: 298.5px; top: 406.5px; width: 320px; bottom: 400px; height: auto; display: none;">

											<div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div>
										</div>

										<div tabindex="-1" class="ui-widget ui-widget-content ui-front ui-resizable ui-dialog" role="dialog" aria-describedby="ui-id-7" aria-labelledby="ui-id-8" style="left: 298.5px; top: 394px; width: 320px; height: auto; display: none; position: absolute;">

											<div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div>
											<div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div>
										</div>

										<!--S: morning-step-btn -->
										<div class="footer-btn-wrap js-footer-fixed is-fixed">
											<div class="section">
												<p class="title">풀무원녹즙 모닝스텝 지원하기</p>
												<button type="button" data-idx="10" data-href="js-btab-link" class="btn-pos js-btab-link" onclick="javascript:businessTabOpen(10);">풀무원녹즙 모닝스텝 지원 바로가기</button>
											</div>
										</div>
										<!--E: morning-step-btn -->

										<!--S: inquiry button-->
										<div class="footer-btn-wrap js-footer-fixed is-fixed">
											<div class="section">
												<p class="title">더 궁금하신 사항은 전화상담을 통해 확인하세요.</p>

												<!-- <button type="button" data-idx="7" data-href="js-btab-cont" class="tab-link js-btab-link" onclick="javascript:businessTabOpen(7);"/>-->
												<button type="button" class="btn-pos js-btab-link" onclick="javascript:moveToStaff();">상담 접수하기</button>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn-pos" onclick="javascript:moveToStaffMovie();">모닝스텝 소개 영상</button>
											</div>
										</div>
										<!--E: inquiry button-->
									</div>
									<!--e: 모닝스텝안내-->
								</div>
								<!--e: tab-wrap inquiry-wrap -->
							</div>
							<!--e: cbody-cont -->
						</div>
						<!--e: section -->
					</div>
					<!--E:cbody-->
				</div>
			</div>
		</div>
	</main>
</div>
</html>