<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<form id="joinForm" action="/member/regist/step4" method="post" >
	<div class="container relative">
		
		<div class="account-wrapper" style="padding-bottom:80px;">
			<ul class="account-process" style="margin-top: 59px">
				<li>
					<h2 class="title" style="height: 76px">
						<b style="margin-right: 3px">01.</b>
						본인인증
					</h2>
					<input type="hidden" name="name" value="${ name }">
					<input type="hidden" name="tel" value="${ tel }">
					<input type="hidden" name="rrnBirthDate" value="${ rrnBirthDate }">
					<input type="hidden" name="rrnGenderCode" value="${ rrnGenderCode }">
				</li>
				<li class="joinform">
					<h2 class="title">
						<b style="margin-right: 3px">02.</b>
						약관동의 / 회원정보 입력
					</h2>
					<input type="hidden" name="memberId" value="${ memberId }">
					<input type="hidden" name="pwd" value="${ pwd }">
					<input type="hidden" name="email" value="${ email }">
					<input type="hidden" name="adApproval" value="${ adApproval }">
					<input type="hidden" name="marketingApproval" value="${ marketingApproval }">
				</li>
				<li class="active">
					<h2 class="title">
						<b>03.</b>
						추천정보
					</h2>
					<div class="form-input">
						<dl>
							<dt>
								<label for="friendId">초대회원코드</label>
							</dt>
							<dd>
								<input type="hidden" id="friendId" name="friendId" value="" />
								<input type="text" id="friendCode" name="friendCode" value="" placeholder="초대코드가 있으신 경우 입력하세요" style="padding-left: 44px">
								<button type="button" id="friendButton" class="btn-square btn-black">확인</button>
							</dd>
						</dl>
						<p id="friendIdError"></p>
					</div>
					<div style='color: red; text-align: center'>초대코드가 없으신 경우 입력하지 않으셔도 됩니다.</div>
					<div class="button-set" style="margin-top: 39px">
						<button id="sendBtn" class="button-basic primary" style="height: 69px; width: 460px">다음으로</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
</form>

<script type="text/javascript">
	$(document).ready(function () {
		var friendCodeCheck = false;

		$("#friendCode").keydown(function (e) {
			$("#friendId").val("");
			if (e.keyCode == 13) {
				$("#friendButton").click();
			}
		});
		var  a = false;
		$(document).on("submit", "#joinForm", function (e) {
			e.preventDefault()
			const form = $(this).get(0)
			if(!$("#friendCode").val() || !friendCodeCheck){
            if(!a){
				confirmDesign('',"추천코드는 회원가입 시에만 입력 가능합니다.<br>추천코드 없이 '확인'을 선택하시면 <br>회원 가입이 진행됩니다.",function (){
                    $('#loading').modal('show')
					form.submit();
				})
                a=true;
				return;
			}
            }
            $('#loading').modal('show')
			form.submit();
		});

		$("#friendButton").click(function() {
			$("#friendCode").val( $.trim( $("#friendCode").val() ) );

			// 기존 회원 확인
		    var invCode = $("#friendCode").val();
			$.ajax({
				url:"/ajax/member/regist/invCodeCheck" , 
				data: { invCode : invCode },
				dataType:"json",
				type:"GET",
				cache:false ,
				success: function ( data,  textStatus, jqXHR ){
					console.log(data);
					if( data.memberNo == "0" ) {
						showErrorForm("friendIdError", "올바른 추천코드가 아닙니다.");

					} else {  
	 					showSuccessForm("friendIdError", data.name + "님이 초대하였습니다.");
// 	 					$("#friendId").val(response.RESULT_MSG.recommenderCode+","+response.RESULT_MSG.recommenderId);
	 					$("#friendId").val($("#friendCode").val()+","+data.memberId);
	 					friendCodeCheck = true;
					}
				 
				},
				error:function (){
				 	alert("에러~~~ ");
				}
			 
			});

		});

		
		
		if (sessionStorage.getItem("JOIN_KEY")) {
			$("#friendCode").val(sessionStorage.getItem("JOIN_KEY"));
			$("#friendCode").val( $.trim( $("#friendCode").val() ) );
			$("#friendButton").click();
		}
	});
</script>


<div class="modal" id="loading" tabindex="-1" aria-labelledby="loading" aria-hidden="true" data-keyboard="false"
     data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		</div>
	</div>
</div>

<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
			<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
		</div>
	</div>
</div>


<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="cancel" data-dismiss="modal">취소</button>
				<button type="button" class="confirm">확인</button>
			</div>
		</div>
	</div>
</div>


<div class="modal" id="shareModal" tabindex="-1" aria-labelledby="shareModal" aria-hidden="true">
	<input type="text" style="opacity: 0" id="share_url_input" value="https://greenjuice.pulmuone.com/member/regist/step3"/>
	<div class="modal-dialog modal-dialog-centered" style="width:430px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="shareModalLabel">공유하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body select-wrapper" style="padding:0 30px 30px;">
				<a class="button-basic prefix kakao" style="width:100%;"
				   onclick="shareToKakao('', '')">
					<i class="ico"></i>
					카카오톡으로 공유
				</a>
				<a class="button-basic prefix link" style="width:100%; margin-top:14px;"
				   data-clipboard-target="#share_url_input">
					<i class="ico"></i>
					URL 복사하기
				</a>
			</div>
		</div>
	</div>
</div>