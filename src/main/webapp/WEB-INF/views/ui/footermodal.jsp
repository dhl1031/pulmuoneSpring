<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(function(){
		$('#myModal').on('shown.bs.modal', function () {
			$('#myInput').trigger('focus')
		});
	});
</script>
<!-- Modal -->
<div class="modal fade" id="emailPolicy" tabindex="-1" aria-labelledby="emailPolicy" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="emailPolicyLabel">이메일 무단수집 거부</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body" style="padding: 40px">
				<div class="p-cont">
					<p>풀무원녹즙 홈페이지 회원들에게 무차별적으로 보내지는 타사의 메일을 차단하기 위해, 본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며 이를 위반시 <span class="fc-orange">정보통신망법에 의해 형사 처벌</span> 됨을 유념하시기 바랍니다.</p>
					<br>
					<p>게시일 : 2008년 2월 20일</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="descModal" tabindex="-1" aria-labelledby="descModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="descModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body" style="padding: 30px">
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$().ready(function() {
		$("body").on("click", ".ui-dialog-titlebar-close, .ui-icon-closethick", function() {
			$(this).closest(".dialogContent").html("");
		});
	});
</script>
<form action="https://info.sweettracker.co.kr/tracking/5" target="_blank" style="display: none" id="sweet" method="post">
	<div class="form-group">
		<label for="t_key">API key</label>
		<input type="text" class="form-control" id="t_key" name="t_key" value="eq04nwS5eQul42h6BZig3Q" placeholder="제공받은 APIKEY">
	</div>
	<div class="form-group">
		<label for="t_code">택배사 코드</label>
		<input type="text" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드">
	</div>
	<div class="form-group">
		<label for="t_invoice">운송장 번호</label>
		<input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
	</div>
	<button type="submit" class="btn btn-default">조회하기</button>
</form>

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
	<input type="text" style="opacity: 0" id="share_url_input" value="https://greenjuice.pulmuone.com/info/foundation">
	<div class="modal-dialog modal-dialog-centered" style="width:430px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="shareModalLabel">공유하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body select-wrapper" style="padding:0 30px 30px;">
				<a class="button-basic prefix kakao" style="width:100%;" onclick="shareToKakao('', '')">
					<i class="ico"></i>
					카카오톡으로 공유
				</a>
				<a class="button-basic prefix link" style="width:100%; margin-top:14px;" data-clipboard-target="#share_url_input">
					<i class="ico"></i>
					URL 복사하기
				</a>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="productPreviewModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered" style="width:430px;">
		<div class="modal-content modal-product"></div>
	</div>
</div>

<button id="top_move_pointer" class="top-nav">
	<img src="/resources/assets/images/ui/left_short_arrow.png">
	<p>TOP</p>
</button>

<script>
  $(window).scroll(function() {
    if ($(window).scrollTop() > 0) {
      if (!$("#top_move_pointer").hasClass("st")) {
        $("#top_move_pointer").addClass("st");
      }
    } else {
      if ($("#top_move_pointer").hasClass("st")) {
        $("#top_move_pointer").removeClass("st");
      }
    }
  })


  $(document).on("click", "#top_move_pointer", function() {
    $(document).scrollTop(0);
  });

</script>

<div class="modal fade" id="privacyPolicy" tabindex="-1" aria-labelledby="privacyPolicy" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="privacyPolicyLabel">개인정보 처리방침</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body" style="border-bottom:6px #fafafa solid;">
				<div class="privacyPolicy" data-idx="1">
					

<style>
    .agree-inner+.agree-inner { margin-top:10px; }
    .agree-wrap .agree-cont ul { padding:5px 0; }
    .agree-wrap .agree-cont ul li { position: relative; padding-left:20px; }
    .agree-wrap .agree-cont ul li:before { content:none; }
    .agree-inner li+li { margin-top:5px; }
    .agree-inner ol li { padding-left:14px; }
    .agree-inner .num { position: absolute; font-size:11px; left:0; top:0px; }
    .agree-cont .agree-inner .agree-title { font-size:18px; padding-bottom:10px; border-bottom:1px #e5e5e5 solid; margin-bottom:10px; }

    .agree-wrap th,td { word-break: break-all; width:auto; color:#333; }
    .agree-wrap table { width:100%; margin-top:10px; border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
    .agree-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
    .agree-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }

</style>
<script>
    $(function () {
            $('.pop-content').click(function (e) {
                e.preventDefault()
                if ($(this).hasClass('prtn')) {
                    $('#alertModal2').find('.modal-body').html(prtn)
                } else {
                    $('#alertModal2').find('.modal-body').html(consumerCorp)
                }
                $('#alertModal2').modal('show');
            })
            $('#alertModalClose').click(function () {

                $('#alertModal2').modal('hide');
            })
        }
    )
</script>
<div class="" style="padding: 0 30px 30px">
    <div class="agree-wrap">
        <div class="agree-cont">
            <div class="agree-inner">
                <h4 class="agree-title">제 1 조 총칙</h4>
                <p>㈜풀무원녹즙은(이하 “회사”라 함) 이용자의 소중한 개인정보 보호를 위하여 관련 법령을 준수하며 개인정보처리방침을 통하여 이용자의 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 이용자의 개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 2 조 개인정보의 수집 항목 및 이용 목적</h4>
                <ul>
                    <li><span class="num">①</span> 서비스 이용 시 수집하는 정보
                        <table>
                            <tbody><tr>
                                <th colspan="2">구분</th>
                                <th>처리하는 항목</th>
                                <th>처리목적</th>
                                <th>보유기간</th>
                            </tr>
                            <tr>
                                <td rowspan="2">회원가입</td>
                                <td rowspan="4">필수</td>
                                <td>아이디, 패스워드, 이메일</td>
                                <td>부정이용 및 비인가 사용방지</td>
                                <td rowspan="4">회원탈퇴 시 파기<br>(CI값은 무분별한 재가입 방지를 위해 30일간 보관 후 파기)</td>
                            </tr>
                            <tr>
                                <td>이름, 휴대전화번호, 생년월일, 성별, CI(연계정보), DI(중복확인정보)</td>
                                <td>서비스 이용에 따른 본인식별 및 연령확인</td>
                            </tr>
                            <tr>
                                <td rowspan="2">SNS 간편로그인</td>
                                <td>이름, 이메일 주소, 성별, 생일</td>
                                <td>네이버 간편 로그인</td>
                            </tr>
                            <tr>
                                <td>닉네임, 프로필사진</td>
                                <td>카카오톡 간편 로그인</td>
                            </tr>
                            <tr>
                                <td rowspan="4">주문/결제/배송</td>
                                <td rowspan="2">필수</td>
                                <td>이름, 휴대전화번호, 배송지주소, 출입정보</td>
                                <td>상품배송, 정기배송</td>
                                <td rowspan="4">회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관</td>
                            </tr>
                            <tr>
                                <td>은행계좌번호, 신용카드번호</td>
                                <td>상품 결제</td>
                            </tr>
                            <tr>
                                <td rowspan="2">선택</td>
                                <td>예금주, 은행/카드사명, 생년월일, 계좌/카드번호</td>
                                <td>안심 자동이체 신청</td>
                            </tr>
                            <tr>
                                <td>휴대전화번호, 현금영수증카드번호</td>
                                <td>현금영수증 발급</td>
                            </tr>
                            <tr>
                                <td>마케팅 활용</td>
                                <td>선택</td>
                                <td>성명, 생년월일, 성별, 휴대전화번호 이메일, 주소</td>
                                <td>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리</td>
                                <td>회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관</td>
                            </tr>
                            <tr>
                                <td>이벤트/프로모션</td>
                                <td>필수</td>
                                <td>아이디, 이름, 휴대전화번호, 배송지주소</td>
                                <td>이벤트 경품지급 및 CS 처리</td>
                                <td>경품 지급 완료 후 1개월 보관 후 파기 <br>(경품 발송 후, CS처리를 위한 보유기간)</td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 서비스 이용 과정에서 생성되거나 자동으로 수집하는 정보
                        <table>
                            <tbody><tr>
                                <th>수집 목적</th>
                                <th>수집하는 항목</th>
                                <th>보유기간</th>
                            </tr>
                            <tr>
                                <td>IP주소, 서비스 이용기록, 접속 로그, 쿠키,
                                    접속기기 정보, 결제기록, 네트워크 연결정보
                                </td>
                                <td>
                                    - 서비스 이용 기록 통계분석<br>
                                    - 앱 실행 시 오류 확인<br>
                                    - 사용성 개선
                                </td>
                                <td>
                                    회원탈퇴 시 또는 법정 의무 보관기간
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 3 조 개인정보 수집 방법</h4>
                <ul>
                    <li><span class="num">①</span> 온라인(홈페이지) 이용 회원가입</li>
                    <li><span class="num">②</span> 오프라인(모닝스탭) 음용신청서 작성</li>
                    <li><span class="num">③</span> 제휴사로부터 제공받아 수집</li>
                    <li><span class="num">④</span> 쿠키(cookie)에 의한 정보 수집</li>
                    <li><span class="num">⑤</span> Application 통한 정보 수집</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 4 조 개인정보의 처리 위탁</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
                        <table>
                            <tbody><tr>
                                <th>수탁 받는 자</th>
                                <th>위탁 업무 내용</th>
                            </tr>
                            <tr>
                                <td><a class="pop-content prtn" href="#">[풀무원녹즙 가맹점]</a></td>
                                <td>
                                    오프라인 음용회원 모집, 판매 및 요금 결제,
                                    상품 배송, 청구서 발송, 고객 불만처리, 고지사항 전달,
                                    이벤트 및 광고성 정보 제공 및 참여기회 제공
                                </td>
                            </tr>
                            <tr>
                                <td>아이엔</td>
                                <td>오프라인 음용회원 모집 </td>
                            </tr>
                            <tr>
                                <td>유림기획</td>
                                <td rowspan="3">오픈마켓 위탁판매 운영</td>
                            </tr>
                            <tr>
                                <td>PL2K</td>
                            </tr>
                            <tr>
                                <td>쿨앤쿨</td>
                            </tr>
                            <tr>
                                <td>㈜풀무원식품</td>
                                <td>고객상담 및 CS처리</td>
                            </tr>
                            <tr>
                                <td>㈜풀무원</td>
                                <td rowspan="2">정보시스템 유지보수 및 운영</td>
                            </tr>
                            <tr>
                                <td>메타넷</td>
                            </tr>
                            <tr>
                                <td>CJ대한통운</td>
                                <td>주문 상품 배송</td>
                            </tr>
                            <tr>
                                <td><a class="pop-content consumerCorp">[소비자 조사 업체]</a></td>
                                <td>소비자 조사 및 실사</td>
                            </tr>
                            <tr>
                                <td>엠포플러스</td>
                                <td>
                                    카카오 알림톡 및 톡기반서비스, 문자발송(SMS/LMS/MMS)
                                </td>
                            </tr>
                            <tr>
                                <td>(주)NICE신용평가정보</td>
                                <td>
                                    CI/DI 및 휴대폰번호 실명인증
                                </td>
                            </tr>
                            <tr>
                                <td>효성 FMS</td>
                                <td>
                                    CMS, 카드자동결제 관리
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 회사는 위탁 계약 체결 시 관련 법령에 따라 ‘목적 외 개인정보 처리금지’, ‘기술적ㆍ관리적 보호조치’, ‘재-위탁 제한’ 등 수탁자에 대한 관리ㆍ감독에 관한 사항을 계약서 문서에 명시하여 수탁자가 개인정보를 안전하게 처리하는지 감독하고 있습니다.
                    </li>
                    <li><span class="num">③</span> 회사는 위탁업무의 내용이나 수탁자가 변경될 경우 지체없이 본 개인정보처리방침을 통하여 공개합니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 5 조 개인정보의 제3자 제공</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 이용자의 개인정보를 제2조(개인정보의 수집 항목 및 이용 목적)에서 고지한 범위내에서 사용하며, 동 범위를 초과하여 이용하거나 타인을 포함한 제3자에게 임의 제공하지 않습니다. 다만, 아래의 경우에는 예외로 제공할 수 있습니다.
                        <ol>
                            <li><span class="num">1.</span> 정보주체의 제3자 제공에 대하여 동의한 경우 </li>
                            <li><span class="num">2.</span> 다른 법률에 특별한 규정이 있는 경우</li>
                            <li><span class="num">3</span> 수사기관의 요구가 있는 경우로서 법령상 제출근거가 존재하는 경우</li>
                        </ol>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 6 조 개인정보의 보유 및 이용기간</h4>
                <p>회사는 수집된 개인정보는 서비스 미 이용 시 5년간 보관 후 지체없이 파기합니다. 다만, 『전자상거래 등에서의 소비자 보호에 관한 법률』 등과 관련 법령에 따라 보존할 필요가 있는 경우 아래와 같이 보유합니다.</p>
                <table>
                    <tbody><tr>
                        <th>보존근거</th>
                        <th>목적</th>
                        <th>보유기간</th>
                    </tr>
                    <tr>
                        <td rowspan="4">전자상거래 소비자 보호에 관한 법률</td>
                        <td>계약 또는 청약 철회</td>
                        <td>5년</td>
                    </tr>
                    <tr>
                        <td>대금결제 및 재화 등의 공급에 관한 기록</td>
                        <td>5년</td>
                    </tr>
                    <tr>
                        <td>소비자 불만 또는 분쟁처리에 관한 기록</td>
                        <td>3년</td>
                    </tr>
                    <tr>
                        <td>표시ㆍ광고에 관한 기록</td>
                        <td>6개월</td>
                    </tr>
                    <tr>
                        <td>통신비밀보호법</td>
                        <td>통신사실 확인자료에 관한 기록</td>
                        <td>3개월</td>
                    </tr>
                </tbody></table>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 7 조 개인정보 파기절차 및 방법</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</li>
                    <li><span class="num">②</span> 정보주체로부터 동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 보존하여야 하는 경우에는 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</li>
                    <li><span class="num">③</span> 개인정보 파기의 절차 및 방법은 다음과 같습니다.
                        <ol>
                            <li><span class="num">1.</span> 파기절차 : 회사는 파기 사유가 발생한 개인정보를 선정하고, 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</li>
                            <li><span class="num">2.</span> 파기방법 : 전자적 파일 형태로 기록ㆍ저장 된 개인정보는 재생할 수 없도록 파기하며, 종이 문서에 기록ㆍ저장 된 개인정보는 분쇄하거나 소각하여 파기합니다.</li>
                        </ol>
                    </li>
                    <li><span class="num">④</span> 회사는 개인정보보호법 제39조의6에 의거 1년간 이용 내역이 없는 이용자의 개인정보를 파기합니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 8 조 이용자 및 법정대리인의 권리ㆍ의무 및 그 행사방법</h4>
                <ul>
                    <li><span class="num">①</span> 이용자 및 법정대리인은 언제든지 개인정보 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 등의 권리를 행사할 수 있습니다. 다만, 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 시 열람 등을 요구한 한자가 이용자 본인이거나 정당한 대리인인지를 확인합니다.</li>
                    <li><span class="num">②</span> 이용자 및 법정대리인은 인터넷, 전화, 서면 등을 통하여 하실 수 있습니다.</li>
                    <li><span class="num">③</span> 개인정보의 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.</li>
                    <li><span class="num">④</span> 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</li>
                    <li><span class="num">⑤</span> 회사는 원칙적으로 만 14세 미만 아동의 개인정보를 수집하지 않습니다. 다만, 법정대리인의 동의를 받은 경우에 한하여 처리할 수 있습니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 9 조 개인정보의 안정성 확보조치</h4>
                <p>회사는 이용자의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조, 훼손 등이 되지 아니하도록 안전성을 확보하기 위하여 다음과 같이 기술적·관리적 보호대책을 강구하고 있습니다.</p>
                <ul>
                    <li><span class="num">①</span> 관리적 조치 : 내부관리계획 수립 시행, 정기적 직원 교육 등</li>
                    <li><span class="num">②</span> 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 등</li>
                    <li><span class="num">③</span> 물리적 조치 : 전산실, 자료보관실 등의 접근통제 등</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 10 조 개인정보 자동 수집 장치의 설치ㆍ운영 및 거부에 관한 사항</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 개인화되고 맞춤화 된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.</li>
                    <li><span class="num">②</span> 회사는 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심 분야를 파악하여 이용자의 관심분야에 따라 차별화된 정보를 제공하기 위하여 쿠키를 사용합니다.</li>
                    <li><span class="num">③</span> 쿠키 설치 허용 여부를 지정하는 방법은 다음과 같습니다.
                        <ol>
                            <li><span class="num">1.</span> Edge : 설정 메뉴 &gt; 설정 &gt; 개인정보, 검색 및 서비스 &gt; 추적방지 여부 수준 설정</li>
                            <li><span class="num">2.</span> Chrome : 설정 메뉴 &gt; 고급 설정 표시 &gt; 개인정보 &gt; 쿠키 수준 설정</li>
                        </ol>
                    </li>
                    <li><span class="num">④</span> 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 11 조 개인정보 보호책임자 및 열람청구 담당부서</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 이용자의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위하여 아래와 같이 개인정보 보호책임자 및 관련 부서를 지정하고 있습니다.
                        <table>
                            <tbody><tr>
                                <td>개인정보보호책임자</td>
                                <td>개인정보보호 담당부서</td>
                            </tr>
                            <tr>
                                <td>
                                    성명: 최미현<br>
                                    소속부서: 풀무원녹즙 사업혁신담당<br>
                                    이메일: pmocs_05@pulmuone.com
                                </td>
                                <td>
                                    부서명: 디지털커뮤니케이션팀<br>
                                    연락처: 02-800-0393<br>
                                    이메일: pmocs_05@pulmuone.com
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 이용자는 개인정보 침해에 대한 신고나 상담이 필요하신 경우 아래 기관에 문의하시기 바랍니다.
                        <ol>
                            <li><span class="num">1. </span> 개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)</li>
                            <li><span class="num">2. </span> 대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)</li>
                            <li><span class="num">3. </span> 경찰청 사이버안전국 (police.go.kr / 국번없이 182)</li>
                            <li><span class="num">4. </span> 개인정보 분쟁조정위원회 (kopico.go.kr / 1833-6972)</li>
                        </ol>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 12 조 고지의 의무</h4>
                <p>개인정보처리방침은 법령ㆍ정책 및 회사 내부 운영방침 또는 보안기술의 변경에 따라 내용이 수정될 수 있으며, 이때 변경되는 개인정보처리방침을 지체없이 공지합니다. 이 정책은 공지한 날로부터 시행됩니다.</p>
            </div>
            <div class="agree-inner">
                <p>시행일자 : 2023년 9월 21일</p>
            </div>
        </div>
    </div>
</div>

<style>
    a.pop-content {
        color: #7acc12;
        text-decoration: underline;
        font-weight: bold;
        cursor: pointer;
    }

    a.pop-content.hover {
        color: #7acc12;
        text-decoration: underline;
    }

    .agree-wrap td {
        vertical-align: middle;
    }
</style>


<div class="modal fade show" id="alertModal2" style="z-index: 1051" tabindex="-1" aria-labelledby="alertModalLabel" aria-modal="true" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="alertModalLabel"></h5>
                <button type="button" class="close" id="alertModalClose" aria-label="Close">
                </button>
            </div>
            <div class="modal-body" style="font-size: 13px;padding: 20px;    color: #333;">

            </div>
            
        </div>
    </div>
</div>





				</div>
				<div class="privacyPolicy" data-idx="2" style="display: none">
					

<style>
    .agree-inner+.agree-inner { margin-top:10px; }
    .agree-wrap .agree-cont ul { padding:5px 0; }
    .agree-wrap .agree-cont ul li { position: relative; padding-left:20px; }
    .agree-wrap .agree-cont ul li:before { content:none; }
    .agree-inner li+li { margin-top:5px; }
    .agree-inner ol li { padding-left:14px; }
    .agree-inner .num { position: absolute; font-size:11px; left:0; top:0px; }
    .agree-cont .agree-inner .agree-title { font-size:18px; padding-bottom:10px; border-bottom:1px #e5e5e5 solid; margin-bottom:10px; }

    .agree-wrap th,td { word-break: break-all; width:auto; color:#333; }
    .agree-wrap table { width:100%; margin-top:10px; border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
    .agree-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
    .agree-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }

</style>
<script>
    $(function () {
            $('.pop-content').click(function (e) {
                e.preventDefault()
                if ($(this).hasClass('prtn')) {
                    $('#alertModal2').find('.modal-body').html(prtn)
                } else {
                    $('#alertModal2').find('.modal-body').html(consumerCorp)
                }
                $('#alertModal2').modal('show');
            })
            $('#alertModalClose').click(function () {

                $('#alertModal2').modal('hide');
            })
        }
    )
</script>

<div class="" style="padding: 0 30px 30px">
    <div class="agree-wrap">
        <div class="agree-cont">
            <div class="agree-inner">
                <h4 class="agree-title">제 1 조 총칙</h4>
                <p>㈜풀무원녹즙은(이하 “회사”라 함) 이용자의 소중한 개인정보 보호를 위하여 관련 법령을 준수하며 개인정보처리방침을 통하여 이용자의 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 이용자의 개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 2 조 개인정보의 수집 항목 및 이용 목적</h4>
                <ul>
                    <li><span class="num">①</span> 서비스 이용 시 수집하는 정보
                        <table>
                            <tbody><tr>
                                <th colspan="2">구분</th>
                                <th>처리하는 항목</th>
                                <th>처리목적</th>
                                <th>보유기간</th>
                            </tr>
                            <tr>
                                <td rowspan="2">회원가입</td>
                                <td rowspan="4">필수</td>
                                <td>아이디, 패스워드, 이메일</td>
                                <td>부정이용 및 비인가 사용방지</td>
                                <td rowspan="4">회원탈퇴 시 파기<br>(CI값은 무분별한 재가입 방지를 위해 30일간 보관 후 파기)</td>
                            </tr>
                            <tr>
                                <td>이름, 휴대전화번호, 생년월일, 성별, CI(연계정보), DI(중복확인정보)</td>
                                <td>서비스 이용에 따른 본인식별 및 연령확인</td>
                            </tr>
                            <tr>
                                <td rowspan="2">SNS 간편로그인</td>
                                <td>이름, 이메일 주소, 성별, 생일</td>
                                <td>네이버 간편 로그인</td>
                            </tr>
                            <tr>
                                <td>닉네임, 프로필사진</td>
                                <td>카카오톡 간편 로그인</td>
                            </tr>
                            <tr>
                                <td rowspan="4">주문/결제/배송</td>
                                <td rowspan="2">필수</td>
                                <td>이름, 휴대전화번호, 배송지주소, 출입정보</td>
                                <td>상품배송, 정기배송</td>
                                <td rowspan="4">회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관</td>
                            </tr>
                            <tr>
                                <td>은행계좌번호, 신용카드번호</td>
                                <td>상품 결제</td>
                            </tr>
                            <tr>
                                <td rowspan="2">선택</td>
                                <td>예금주, 은행/카드사명, 생년월일, 계좌/카드번호</td>
                                <td>안심 자동이체 신청</td>
                            </tr>
                            <tr>
                                <td>휴대전화번호, 현금영수증카드번호</td>
                                <td>현금영수증 발급</td>
                            </tr>
                            <tr>
                                <td>마케팅 활용</td>
                                <td>선택</td>
                                <td>성명, 생년월일, 성별, 휴대전화번호 이메일, 주소</td>
                                <td>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리</td>
                                <td>회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관</td>
                            </tr>
                            <tr>
                                <td>이벤트/프로모션</td>
                                <td>필수</td>
                                <td>아이디, 이름, 휴대전화번호, 배송지주소</td>
                                <td>이벤트 경품지급 및 CS 처리</td>
                                <td>경품 지급 완료 후 1개월 보관 후 파기 <br>(경품 발송 후, CS처리를 위한 보유기간)</td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 서비스 이용 과정에서 생성되거나 자동으로 수집하는 정보
                        <table>
                            <tbody><tr>
                                <th>수집 목적</th>
                                <th>수집하는 항목</th>
                                <th>보유기간</th>
                            </tr>
                            <tr>
                                <td>IP주소, 서비스 이용기록, 접속 로그, 쿠키,
                                    접속기기 정보, 결제기록, 네트워크 연결정보
                                </td>
                                <td>
                                    - 서비스 이용 기록 통계분석<br>
                                    - 앱 실행 시 오류 확인<br>
                                    - 사용성 개선
                                </td>
                                <td>
                                    회원탈퇴 시 또는 법정 의무 보관기간
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 3 조 개인정보 수집 방법</h4>
                <ul>
                    <li><span class="num">①</span> 온라인(홈페이지) 이용 회원가입</li>
                    <li><span class="num">②</span> 오프라인(모닝스탭) 음용신청서 작성</li>
                    <li><span class="num">③</span> 제휴사로부터 제공받아 수집</li>
                    <li><span class="num">④</span> 쿠키(cookie)에 의한 정보 수집</li>
                    <li><span class="num">⑤</span> Application 통한 정보 수집</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 4 조 개인정보의 처리 위탁</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
                        <table>
                            <tbody><tr>
                                <th>수탁 받는 자</th>
                                <th>위탁 업무 내용</th>
                            </tr>
                            <tr>
                                <td><a class="pop-content prtn" href="#">[풀무원녹즙 가맹점]</a></td>
                                <td>
                                    오프라인 음용회원 모집, 판매 및 요금 결제,
                                    상품 배송, 청구서 발송, 고객 불만처리, 고지사항 전달,
                                    이벤트 및 광고성 정보 제공 및 참여기회 제공
                                </td>
                            </tr>
                            <tr>
                                <td>아이엔</td>
                                <td>오프라인 음용회원 모집 </td>
                            </tr>
                            <tr>
                                <td>유림기획</td>
                                <td rowspan="3">오픈마켓 위탁판매 운영</td>
                            </tr>
                            <tr>
                                <td>PL2K</td>
                            </tr>
                            <tr>
                                <td>쿨앤쿨</td>
                            </tr>
                            <tr>
                                <td>㈜풀무원식품</td>
                                <td>고객상담 및 CS처리</td>
                            </tr>
                            <tr>
                                <td>㈜풀무원</td>
                                <td rowspan="2">정보시스템 유지보수 및 운영</td>
                            </tr>
                            <tr>
                                <td>메타넷</td>
                            </tr>
                            <tr>
                                <td>CJ대한통운</td>
                                <td>주문 상품 배송</td>
                            </tr>
                            <tr>
                                <td><a class="pop-content consumerCorp">[소비자 조사 업체]</a></td>
                                <td>소비자 조사 및 실사</td>
                            </tr>
                            <tr>
                                <td>엠포플러스</td>
                                <td>
                                    카카오 알림톡 및 톡기반서비스, 문자발송(SMS/LMS/MMS)
                                </td>
                            </tr>
                            <tr>
                                <td>(주)NICE신용평가정보</td>
                                <td>
                                    CI/DI 및 휴대폰번호 실명인증
                                </td>
                            </tr>
                            <tr>
                                <td>효성 FMS</td>
                                <td>
                                    CMS, 카드자동결제 관리
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 회사는 위탁 계약 체결 시 관련 법령에 따라 ‘목적 외 개인정보 처리금지’, ‘기술적ㆍ관리적 보호조치’, ‘재-위탁 제한’ 등 수탁자에 대한 관리ㆍ감독에 관한 사항을 계약서 문서에 명시하여 수탁자가 개인정보를 안전하게 처리하는지 감독하고 있습니다.
                    </li>
                    <li><span class="num">③</span> 회사는 위탁업무의 내용이나 수탁자가 변경될 경우 지체없이 본 개인정보처리방침을 통하여 공개합니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 5 조 개인정보의 제3자 제공</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 이용자의 개인정보를 제2조(개인정보의 수집 항목 및 이용 목적)에서 고지한 범위내에서 사용하며, 동 범위를 초과하여 이용하거나 타인을 포함한 제3자에게 임의 제공하지 않습니다. 다만, 아래의 경우에는 예외로 제공할 수 있습니다.
                        <ol>
                            <li><span class="num">1.</span> 정보주체의 제3자 제공에 대하여 동의한 경우 </li>
                            <li><span class="num">2.</span> 다른 법률에 특별한 규정이 있는 경우</li>
                            <li><span class="num">3</span> 수사기관의 요구가 있는 경우로서 법령상 제출근거가 존재하는 경우</li>
                        </ol>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 6 조 개인정보의 보유 및 이용기간</h4>
                <p>회사는 수집된 개인정보는 수집 및 이용목적 또는 제공받은 목적이 달성된 경우 지체없이 파기합니다. 다만, 『전자상거래 등에서의 소비자 보호에 관한 법률』 등과 관련 법령에 따라 보존할 필요가 있는 경우 아래와 같이 보유합니다.</p>
                <table>
                    <tbody><tr>
                        <th>보존근거</th>
                        <th>목적</th>
                        <th>보유기간</th>
                    </tr>
                    <tr>
                        <td rowspan="4">전자상거래 소비자 보호에 관한 법률</td>
                        <td>계약 또는 청약 철회</td>
                        <td>5년</td>
                    </tr>
                    <tr>
                        <td>대금결제 및 재화 등의 공급에 관한 기록</td>
                        <td>5년</td>
                    </tr>
                    <tr>
                        <td>소비자 불만 또는 분쟁처리에 관한 기록</td>
                        <td>3년</td>
                    </tr>
                    <tr>
                        <td>표시ㆍ광고에 관한 기록</td>
                        <td>6개월</td>
                    </tr>
                    <tr>
                        <td>통신비밀보호법</td>
                        <td>통신사실 확인자료에 관한 기록</td>
                        <td>3개월</td>
                    </tr>
                </tbody></table>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 7 조 개인정보 파기절차 및 방법</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</li>
                    <li><span class="num">②</span> 정보주체로부터 동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 보존하여야 하는 경우에는 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</li>
                    <li><span class="num">③</span> 개인정보 파기의 절차 및 방법은 다음과 같습니다.
                        <ol>
                            <li><span class="num">1.</span> 파기절차 : 회사는 파기 사유가 발생한 개인정보를 선정하고, 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</li>
                            <li><span class="num">2.</span> 파기방법 : 전자적 파일 형태로 기록ㆍ저장 된 개인정보는 재생할 수 없도록 파기하며, 종이 문서에 기록ㆍ저장 된 개인정보는 분쇄하거나 소각하여 파기합니다.</li>
                        </ol>
                    </li>
                    <li><span class="num">④</span> 회사는 개인정보보호법 제39조의6에 의거 1년간 이용 내역이 없는 이용자의 개인정보를 파기합니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 8 조 이용자 및 법정대리인의 권리ㆍ의무 및 그 행사방법</h4>
                <ul>
                    <li><span class="num">①</span> 이용자 및 법정대리인은 언제든지 개인정보 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 등의 권리를 행사할 수 있습니다. 다만, 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 시 열람 등을 요구한 한자가 이용자 본인이거나 정당한 대리인인지를 확인합니다.</li>
                    <li><span class="num">②</span> 이용자 및 법정대리인은 인터넷, 전화, 서면 등을 통하여 하실 수 있습니다.</li>
                    <li><span class="num">③</span> 개인정보의 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.</li>
                    <li><span class="num">④</span> 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</li>
                    <li><span class="num">⑤</span> 회사는 원칙적으로 만 14세 미만 아동의 개인정보를 수집하지 않습니다. 다만, 법정대리인의 동의를 받은 경우에 한하여 처리할 수 있습니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 9 조 개인정보의 안정성 확보조치</h4>
                <p>회사는 이용자의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조, 훼손 등이 되지 아니하도록 안전성을 확보하기 위하여 다음과 같이 기술적·관리적 보호대책을 강구하고 있습니다.</p>
                <ul>
                    <li><span class="num">①</span> 관리적 조치 : 내부관리계획 수립 시행, 정기적 직원 교육 등</li>
                    <li><span class="num">②</span> 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 등</li>
                    <li><span class="num">③</span> 물리적 조치 : 전산실, 자료보관실 등의 접근통제 등</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 10 조 개인정보 자동 수집 장치의 설치ㆍ운영 및 거부에 관한 사항</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 개인화되고 맞춤화 된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.</li>
                    <li><span class="num">②</span> 회사는 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심 분야를 파악하여 이용자의 관심분야에 따라 차별화된 정보를 제공하기 위하여 쿠키를 사용합니다.</li>
                    <li><span class="num">③</span> 쿠키 설치 허용 여부를 지정하는 방법은 다음과 같습니다.
                        <ol>
                            <li><span class="num">1.</span> Edge : 설정 메뉴 &gt; 설정 &gt; 개인정보, 검색 및 서비스 &gt; 추적방지 여부 수준 설정</li>
                            <li><span class="num">2.</span> Chrome : 설정 메뉴 &gt; 고급 설정 표시 &gt; 개인정보 &gt; 쿠키 수준 설정</li>
                        </ol>
                    </li>
                    <li><span class="num">④</span> 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 11 조 개인정보 보호책임자 및 열람청구 담당부서</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 이용자의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위하여 아래와 같이 개인정보 보호책임자 및 관련 부서를 지정하고 있습니다.
                        <table>
                            <tbody><tr>
                                <td>개인정보보호책임자</td>
                                <td>개인정보보호 담당부서</td>
                            </tr>
                            <tr>
                                <td>
                                    성명: 최미현<br>
                                    소속부서: 풀무원녹즙 사업혁신담당<br>
                                    이메일: pmocs_05@pulmuone.com
                                </td>
                                <td>
                                    부서명: 디지털커뮤니케이션팀<br>
                                    연락처: 02-800-0393<br>
                                    이메일: pmocs_05@pulmuone.com
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 이용자는 개인정보 침해에 대한 신고나 상담이 필요하신 경우 아래 기관에 문의하시기 바랍니다.
                        <ol>
                            <li><span class="num">1. </span> 개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)</li>
                            <li><span class="num">2. </span> 대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)</li>
                            <li><span class="num">3. </span> 경찰청 사이버안전국 (police.go.kr / 국번없이 182)</li>
                            <li><span class="num">4. </span> 개인정보 분쟁조정위원회 (kopico.go.kr / 1833-6972)</li>
                        </ol>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 12 조 고지의 의무</h4>
                <p>개인정보처리방침은 법령ㆍ정책 및 회사 내부 운영방침 또는 보안기술의 변경에 따라 내용이 수정될 수 있으며, 이때 변경되는 개인정보처리방침을 지체없이 공지합니다. 이 정책은 공지한 날로부터 시행됩니다.</p>
            </div>
            <div class="agree-inner">
                <p>시행일자 : 2023년 8월 10일</p>
            </div>
        </div>
    </div>
</div>

<style>
    a.pop-content {
        color: #7acc12;
        text-decoration: underline;
        font-weight: bold;
        cursor: pointer;
    }

    a.pop-content.hover {
        color: #7acc12;
        text-decoration: underline;
    }

    .agree-wrap td {
        vertical-align: middle;
    }
</style>


<div class="modal fade show" id="alertModal2" style="z-index: 1051" tabindex="-1" aria-labelledby="alertModalLabel" aria-modal="true" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="alertModalLabel"></h5>
                <button type="button" class="close" id="alertModalClose" aria-label="Close">
                </button>
            </div>
            <div class="modal-body" style="font-size: 13px;padding: 20px;    color: #333;">

            </div>
            
        </div>
    </div>
</div>





				</div>
				<div class="privacyPolicy" data-idx="3" style="display: none">
					

<style>
    .agree-inner+.agree-inner { margin-top:10px; }
    .agree-wrap .agree-cont ul { padding:5px 0; }
    .agree-wrap .agree-cont ul li { position: relative; padding-left:20px; }
    .agree-wrap .agree-cont ul li:before { content:none; }
    .agree-inner li+li { margin-top:5px; }
    .agree-inner ol li { padding-left:14px; }
    .agree-inner .num { position: absolute; font-size:11px; left:0; top:0px; }
    .agree-cont .agree-inner .agree-title { font-size:18px; padding-bottom:10px; border-bottom:1px #e5e5e5 solid; margin-bottom:10px; }

    .agree-wrap th,td { word-break: break-all; width:auto; color:#333; }
    .agree-wrap table { width:100%; margin-top:10px; border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
    .agree-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
    .agree-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }

</style>


<div class="" style="padding: 0 30px 30px">
    <div class="agree-wrap">
        <div class="agree-cont">
            <div class="agree-inner">
                <h4 class="agree-title">제 1 조 총칙</h4>
                <p>㈜풀무원녹즙은(이하 “회사”라 함) 이용자의 소중한 개인정보 보호를 위하여 관련 법령을 준수하며 개인정보처리방침을 통하여 이용자의 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 이용자의 개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 2 조 개인정보의 수집 항목 및 이용 목적</h4>
                <ul>
                    <li><span class="num">①</span> 서비스 이용 시 수집하는 정보
                        <table>
                            <tbody><tr>
                                <th colspan="2">구분</th>
                                <th>처리하는 항목</th>
                                <th>처리목적</th>
                                <th>보유기간</th>
                            </tr>
                            <tr>
                                <td rowspan="2">회원가입</td>
                                <td rowspan="4">필수</td>
                                <td>아이디, 패스워드, 이메일</td>
                                <td>부정이용 및 비인가 사용방지</td>
                                <td rowspan="4">회원탈퇴 시 파기<br>(CI값은 무분별한 재가입 방지를 위해 30일간 보관 후 파기)</td>
                            </tr>
                            <tr>
                                <td>이름, 휴대전화번호, 생년월일, 성별, CI(연계정보), DI(중복확인정보)</td>
                                <td>서비스 이용에 따른 본인식별 및 연령확인</td>
                            </tr>
                            <tr>
                                <td rowspan="2">SNS 간편로그인</td>
                                <td>이름, 이메일 주소, 성별, 생일</td>
                                <td>네이버 간편 로그인</td>
                            </tr>
                            <tr>
                                <td>닉네임, 프로필사진</td>
                                <td>카카오톡 간편 로그인</td>
                            </tr>
                            <tr>
                                <td rowspan="4">주문/결제/배송</td>
                                <td rowspan="2">필수</td>
                                <td>이름, 휴대전화번호, 배송지주소, 출입정보</td>
                                <td>상품배송, 정기배송</td>
                                <td rowspan="4">회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관</td>
                            </tr>
                            <tr>
                                <td>은행계좌번호, 신용카드번호</td>
                                <td>상품 결제</td>
                            </tr>
                            <tr>
                                <td rowspan="2">선택</td>
                                <td>예금주, 은행/카드사명, 생년월일, 계좌/카드번호</td>
                                <td>안심 자동이체 신청</td>
                            </tr>
                            <tr>
                                <td>휴대전화번호, 현금영수증카드번호</td>
                                <td>현금영수증 발급</td>
                            </tr>
                            <tr>
                                <td>마케팅 활용</td>
                                <td>선택</td>
                                <td>성명, 생년월일, 성별, 휴대전화번호 이메일, 주소</td>
                                <td>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리</td>
                                <td>회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관</td>
                            </tr>
                            <tr>
                                <td>이벤트/프로모션</td>
                                <td>필수</td>
                                <td>아이디, 이름, 휴대전화번호, 배송지주소</td>
                                <td>이벤트 경품지급 및 CS 처리</td>
                                <td>경품 지급 완료 후 1개월 보관 후 파기 <br>(경품 발송 후, CS처리를 위한 보유기간)</td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 서비스 이용 과정에서 생성되거나 자동으로 수집하는 정보
                        <table>
                            <tbody><tr>
                                <th>수집 목적</th>
                                <th>수집하는 항목</th>
                                <th>보유기간</th>
                            </tr>
                            <tr>
                                <td>IP주소, 서비스 이용기록, 접속 로그, 쿠키,
                                    접속기기 정보, 결제기록, 네트워크 연결정보
                                </td>
                                <td>
                                    - 서비스 이용 기록 통계분석<br>
                                    - 앱 실행 시 오류 확인<br>
                                    - 사용성 개선
                                </td>
                                <td>
                                    회원탈퇴 시 또는 법정 의무 보관기간
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 3 조 개인정보 수집 방법</h4>
                <ul>
                    <li><span class="num">①</span> 온라인(홈페이지) 이용 회원가입</li>
                    <li><span class="num">②</span> 오프라인(모닝스탭) 음용신청서 작성</li>
                    <li><span class="num">③</span> 제휴사로부터 제공받아 수집</li>
                    <li><span class="num">④</span> 쿠키(cookie)에 의한 정보 수집</li>
                    <li><span class="num">⑤</span> Application 통한 정보 수집</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 4 조 개인정보의 처리 위탁</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
                        <table>
                            <tbody><tr>
                                <th>수탁 받는 자</th>
                                <th>위탁 업무 내용</th>
                            </tr>
                            <tr>
                                <td><a class="pop-content prtn" href="#">[풀무원녹즙 가맹점]</a></td>
                                <td>
                                    오프라인 음용회원 모집, 판매 및 요금 결제,
                                    상품 배송, 청구서 발송, 고객 불만처리, 고지사항 전달,
                                    이벤트 및 광고성 정보 제공 및 참여기회 제공
                                </td>
                            </tr>
                            <tr>
                                <td>유림기획</td>
                                <td rowspan="3">오픈마켓 위탁판매 운영</td>
                            </tr>
                            <tr>
                                <td>PL2K</td>
                            </tr>
                            <tr>
                                <td>쿨앤쿨</td>
                            </tr>
                            <tr>
                                <td>㈜풀무원식품</td>
                                <td>고객상담 및 CS처리</td>
                            </tr>
                            <tr>
                                <td>㈜풀무원</td>
                                <td rowspan="2">정보시스템 유지보수 및 운영</td>
                            </tr>
                            <tr>
                                <td>메타넷</td>
                            </tr>
                            <tr>
                                <td>CJ대한통운</td>
                                <td>주문 상품 배송</td>
                            </tr>
                            <tr>
                                <td><a class="pop-content consumerCorp">[소비자 조사 업체]</a></td>
                                <td>소비자 조사 및 실사</td>
                            </tr>
                            <tr>
                                <td>엠포플러스</td>
                                <td>
                                    카카오 알림톡 및 톡기반서비스, 문자발송(SMS/LMS/MMS)
                                </td>
                            </tr>
                            <tr>
                                <td>(주)NICE신용평가정보</td>
                                <td>
                                    CI/DI 및 휴대폰번호 실명인증
                                </td>
                            </tr>
                            <tr>
                                <td>효성 FMS</td>
                                <td>
                                    CMS, 카드자동결제 관리
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 회사는 위탁 계약 체결 시 관련 법령에 따라 ‘목적 외 개인정보 처리금지’, ‘기술적ㆍ관리적 보호조치’, ‘재-위탁 제한’ 등 수탁자에 대한 관리ㆍ감독에 관한 사항을 계약서 문서에 명시하여 수탁자가 개인정보를 안전하게 처리하는지 감독하고 있습니다.
                    </li>
                    <li><span class="num">③</span> 회사는 위탁업무의 내용이나 수탁자가 변경될 경우 지체없이 본 개인정보처리방침을 통하여 공개합니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 5 조 개인정보의 제3자 제공</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 이용자의 개인정보를 제2조(개인정보의 수집 항목 및 이용 목적)에서 고지한 범위내에서 사용하며, 동 범위를 초과하여 이용하거나 타인을 포함한 제3자에게 임의 제공하지 않습니다. 다만, 아래의 경우에는 예외로 제공할 수 있습니다.
                        <ol>
                            <li><span class="num">1.</span> 정보주체의 제3자 제공에 대하여 동의한 경우 </li>
                            <li><span class="num">2.</span> 다른 법률에 특별한 규정이 있는 경우</li>
                            <li><span class="num">3</span> 수사기관의 요구가 있는 경우로서 법령상 제출근거가 존재하는 경우</li>
                        </ol>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 6 조 개인정보의 보유 및 이용기간</h4>
                <p>회사는 수집된 개인정보는 수집 및 이용목적 또는 제공받은 목적이 달성된 경우 지체없이 파기합니다. 다만, 『전자상거래 등에서의 소비자 보호에 관한 법률』 등과 관련 법령에 따라 보존할 필요가 있는 경우 아래와 같이 보유합니다.</p>
                <table>
                    <tbody><tr>
                        <th>보존근거</th>
                        <th>목적</th>
                        <th>보유기간</th>
                    </tr>
                    <tr>
                        <td rowspan="4">전자상거래 소비자 보호에 관한 법률</td>
                        <td>계약 또는 청약 철회</td>
                        <td>5년</td>
                    </tr>
                    <tr>
                        <td>대금결제 및 재화 등의 공급에 관한 기록</td>
                        <td>5년</td>
                    </tr>
                    <tr>
                        <td>소비자 불만 또는 분쟁처리에 관한 기록</td>
                        <td>3년</td>
                    </tr>
                    <tr>
                        <td>표시ㆍ광고에 관한 기록</td>
                        <td>6개월</td>
                    </tr>
                    <tr>
                        <td>통신비밀보호법</td>
                        <td>통신사실 확인자료에 관한 기록</td>
                        <td>3개월</td>
                    </tr>
                </tbody></table>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 7 조 개인정보 파기절차 및 방법</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</li>
                    <li><span class="num">②</span> 정보주체로부터 동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 보존하여야 하는 경우에는 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</li>
                    <li><span class="num">③</span> 개인정보 파기의 절차 및 방법은 다음과 같습니다.
                        <ol>
                            <li><span class="num">1.</span> 파기절차 : 회사는 파기 사유가 발생한 개인정보를 선정하고, 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</li>
                            <li><span class="num">2.</span> 파기방법 : 전자적 파일 형태로 기록ㆍ저장 된 개인정보는 재생할 수 없도록 파기하며, 종이 문서에 기록ㆍ저장 된 개인정보는 분쇄하거나 소각하여 파기합니다.</li>
                        </ol>
                    </li>
                    <li><span class="num">④</span> 회사는 개인정보보호법 제39조의6에 의거 1년간 이용 내역이 없는 이용자의 개인정보를 파기합니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 8 조 이용자 및 법정대리인의 권리ㆍ의무 및 그 행사방법</h4>
                <ul>
                    <li><span class="num">①</span> 이용자 및 법정대리인은 언제든지 개인정보 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 등의 권리를 행사할 수 있습니다. 다만, 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 시 열람 등을 요구한 한자가 이용자 본인이거나 정당한 대리인인지를 확인합니다.</li>
                    <li><span class="num">②</span> 이용자 및 법정대리인은 인터넷, 전화, 서면 등을 통하여 하실 수 있습니다.</li>
                    <li><span class="num">③</span> 개인정보의 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.</li>
                    <li><span class="num">④</span> 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</li>
                    <li><span class="num">⑤</span> 회사는 원칙적으로 만 14세 미만 아동의 개인정보를 수집하지 않습니다. 다만, 법정대리인의 동의를 받은 경우에 한하여 처리할 수 있습니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 9 조 개인정보의 안정성 확보조치</h4>
                <p>회사는 이용자의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조, 훼손 등이 되지 아니하도록 안전성을 확보하기 위하여 다음과 같이 기술적·관리적 보호대책을 강구하고 있습니다.</p>
                <ul>
                    <li><span class="num">①</span> 관리적 조치 : 내부관리계획 수립 시행, 정기적 직원 교육 등</li>
                    <li><span class="num">②</span> 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 등</li>
                    <li><span class="num">③</span> 물리적 조치 : 전산실, 자료보관실 등의 접근통제 등</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 10 조 개인정보 자동 수집 장치의 설치ㆍ운영 및 거부에 관한 사항</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 개인화되고 맞춤화 된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.</li>
                    <li><span class="num">②</span> 회사는 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심 분야를 파악하여 이용자의 관심분야에 따라 차별화된 정보를 제공하기 위하여 쿠키를 사용합니다.</li>
                    <li><span class="num">③</span> 쿠키 설치 허용 여부를 지정하는 방법은 다음과 같습니다.
                        <ol>
                            <li><span class="num">1.</span> Edge : 설정 메뉴 &gt; 설정 &gt; 개인정보, 검색 및 서비스 &gt; 추적방지 여부 수준 설정</li>
                            <li><span class="num">2.</span> Chrome : 설정 메뉴 &gt; 고급 설정 표시 &gt; 개인정보 &gt; 쿠키 수준 설정</li>
                        </ol>
                    </li>
                    <li><span class="num">④</span> 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 11 조 개인정보 보호책임자 및 열람청구 담당부서</h4>
                <ul>
                    <li><span class="num">①</span> 회사는 이용자의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위하여 아래와 같이 개인정보 보호책임자 및 관련 부서를 지정하고 있습니다.
                        <table>
                            <tbody><tr>
                                <td>개인정보보호책임자</td>
                                <td>개인정보보호 담당부서</td>
                            </tr>
                            <tr>
                                <td>
                                    성명: 최미현<br>
                                    소속부서: 풀무원녹즙 사업혁신담당<br>
                                    이메일: pmocs_05@pulmuone.com
                                </td>
                                <td>
                                    부서명: 디지털커뮤니케이션팀<br>
                                    연락처: 02-800-0393<br>
                                    이메일: pmocs_05@pulmuone.com
                                </td>
                            </tr>
                        </tbody></table>
                    </li>
                    <li><span class="num">②</span> 이용자는 개인정보 침해에 대한 신고나 상담이 필요하신 경우 아래 기관에 문의하시기 바랍니다.
                        <ol>
                            <li><span class="num">1. </span> 개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)</li>
                            <li><span class="num">2. </span> 대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)</li>
                            <li><span class="num">3. </span> 경찰청 사이버안전국 (police.go.kr / 국번없이 182)</li>
                            <li><span class="num">4. </span> 개인정보 분쟁조정위원회 (kopico.go.kr / 1833-6972)</li>
                        </ol>
                    </li>
                </ul>
            </div>
            <div class="agree-inner">
                <h4 class="agree-title">제 12 조 고지의 의무</h4>
                <p>개인정보처리방침은 법령ㆍ정책 및 회사 내부 운영방침 또는 보안기술의 변경에 따라 내용이 수정될 수 있으며, 이때 변경되는 개인정보처리방침을 지체없이 공지합니다. 이 정책은 공지한 날로부터 시행됩니다.</p>
            </div>
            <div class="agree-inner">
                <p>공고일자 : 2023년 1월 11일</p>
                <p>시행일자 : 2023년 1월 25일</p>
            </div>
        </div>
    </div>
</div>

<style>
    a.pop-content {
        color: #7acc12;
        text-decoration: underline;
        font-weight: bold;
        cursor: pointer;
    }

    a.pop-content.hover {
        color: #7acc12;
        text-decoration: underline;
    }

    .agree-wrap td {
        vertical-align: middle;
    }
</style>


<div class="modal fade show" id="alertModal2" style="z-index: 1051" tabindex="-1" aria-labelledby="alertModalLabel" aria-modal="true" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="alertModalLabel"></h5>
                <button type="button" class="close" id="alertModalClose" aria-label="Close">
                </button>
            </div>
            <div class="modal-body" style="font-size: 13px;padding: 20px;    color: #333;">

            </div>
            
        </div>
    </div>
</div>





				</div>
				<div class="privacyPolicy" data-idx="4" style="display: none">
					

<style>
    .agree-inner+.agree-inner { margin-top:10px; }
    .agree-wrap .agree-cont ul { padding:5px 0; }
    .agree-wrap .agree-cont ul li { position: relative; padding-left:20px; }
    .agree-wrap .agree-cont ul li:before { content:none; }
    .agree-inner li+li { margin-top:5px; }
    .agree-inner ol li { padding-left:14px; }
    .agree-inner .num { position: absolute; font-size:11px; left:0; top:0px; }
    .agree-cont .agree-inner .agree-title { font-size:18px; padding-bottom:10px; border-bottom:1px #e5e5e5 solid; margin-bottom:10px; }

    .agree-wrap th,td { word-break: break-all; width:auto; color:#333; }
    .agree-wrap table { width:100%; margin-top:10px; border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
    .agree-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
    .agree-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }

</style>

<div class="" style="padding: 0 30px 30px">
    <div class="agree-wrap">
        <div class="cbody-cont">
            <div class="agree-wrap">
                <!-- s: 20200310 약관 수정 (최신 수급 컨텐츠로 수정 -->
                <!-- s: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
                <p>(주)풀무원녹즙은 (이하 ""회사""라 함) 회원님의 개인정보를 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 '정보통신망법'이라함) 등 관련법령(이하 '관련법령'이라 함)에 근거하여 수집 ㆍ 보유 및 처리되고 있습니다.</p>

                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">1. 수집하는 개인정보의 항목</h3>
                    <p>회사는 회원에게 다양한 서비스 제공 위해 다음과 같은 개인정보를 수집하고 있습니다. 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)와 주민등록번호는 수집하지 않습니다.</p>
                    <ol>
                        <li><span>①</span> 최초 회원 가입 시 고객님 식별 및 고지 전달, 불만처리나 서비스/이벤트 정보 안내 등 원활한 의사소통 경로 확보를 위해 다음과 같은 정보를 수집하여 이용합니다.
                            <ul>
                                <li>아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호, 이메일, CI(연계정보),DI(중복확인정보), 관심항목</li>
                                <li>휴대폰번호는 나이스평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다</li>
                            </ul>
                        </li>
                        <li><span>②</span> 재화 혹은 용역 주문에 따른 청구서, 상품 배송지의 확보를 위해 아래와 같은 정보를 수집하여 이용합니다.
                            <ul>
                                <li>배송정보 : 성명, 전화번호, 휴대폰번호, 배송지주소</li>
                                <li>결제정보 : 은행계좌정보, 신용카드정보, 휴대폰가입정보</li>
                                <li>현금영수증 발급정보 : 휴대폰번호, 신용카드번호, 현금영수증카드번호</li>
                            </ul>
                        </li>
                        <li><span>③</span> 이벤트, 프로모션, 마케팅에 참여를 원하시는 고객님의 경우 아래와 같은 정보를 수집하여 이용합니다. (선택)
                            <ul>
                                <li>마케팅 정보 수신 동의
                                    <p>* 경품 수령을 위해 제세공과금 처리가 필요한 경우, 소득세법에 따라 고객님의 주민등록번호, 계좌번호, 배송지주소 정보를 추가로 수집 및 이용 할 수 있습니다</p>
                                </li>
                            </ul>
                        </li>
                        <li><span>④</span> 서비스 이용 과정에서 아래와 같은 정보들이 간접적으로 수집될 수 있습니다.
                            <ul>
                                <li>네이버ID로그인시 네이버 이용자고유식별정보, 카카오ID로그인시 카카오 이용자고유식별정보</li>
                                <li>IP주소, 서비스 이용기록, 접속 로그, 쿠키, 접속기기 정보, 결제기록, 네트워크 연결정보등</li>
                            </ul>
                            <p>고객님께서 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않으며, 수집정보의 범위나 사용 목적, 용도가 변경될 시에는 반드시 고객님께 사전 동의를 구할 것 입니다.</p>
                        </li>
                    </ol>
                    <p>
                </p></div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">2. 개인정보 수집 및 이용목적</h3>
                    <ol>
                        <li><span>①</span> 회사는 개인정보를 다음 목적을 위해 합니다.
                            <ol>
                                <li><span>가.</span> 서비스 제공 계약의 성립 및 유지 종료를 위한 본인 식별, 가입의사 확인, 회원에 대한 고지사항전달, 고객정보분석 및 분석정보의 통계적 활용, 불량회원 부정이용방지 및 비인가 사용방지, 서비스 개발을 위한 연구/조사</li>
                                <li><span>나.</span> 불만처리 등 원활한 의사소통 경로의 확보</li>
                                <li><span>다.</span> 상품 및 서비스의 구매에 대한 결제와 공급 및 배송</li>
                            </ol>
                        </li>
                        <li><span>②</span> 수집한 개인정보는 상기의 목적 이외의 용도로는 사용되지 않으며 보다 나은 서비스 혜택 제공을 위해 다양한 방법(전화, SMS, 우편 등)을 통해 서비스 관련 정보를 회원에게 제공할 수 있습니다.<br>
                            단, 회원이 서비스 혜택 정보 제공을 원치 않는다는 의사를 명확히 밝히는 경우 정보제공을 하지 않으며 이 경우 회원에게 정보 미 제공으로 인한 불이익이 발생하더라도 회사가 책임지지 않습니다. 또한, 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.</li>
                        <li><span>③</span> 이용자는 회사가 회원의 개인정보를 수집할 때 이를 거부할 수 있습니다. 다만, 필수동의 관련 제공을 거부하는 경우에는 서비스 제공 불가 또는 제한의 불이익을 받을 수 있습니다.<br>
                            단, 회원이 서비스 혜택 정보 제공을 원치 않는다는 의사를 명확히 밝히는 경우 정보제공을 하지 않으며 이 경우 회원에게 정보 미 제공으로 인한 불이익이 발생하더라도 회사가 책임지지 않습니다. 또한, 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.</li>
                    </ol>
                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">3. 개인정보의 처리 위탁</h3>
                    <p>회사는 원활하고 향상된 서비스를 위하여 개인정보 처리를 타인에게 위탁할 수 있습니다.이 경우 회사는 사전에 다음 각 호의 사항 모두를 이용자에게 미리 알리고 동의를 받습니다. 그리고 회사는 위탁받은 업체가 정보통신망법에 따라 개인정보를 안전하게 처리하도록 필요한 사항을 규정하고 관리/감독을 하고 있습니다.</p>
                    <ul>
                        <li>메타넷: 정보전산 처리 및 유지관리</li>
                        <li>성화기업택배, 디엠라인, 비즈콘: 이벤트 진행등에 따른 물품배송</li>
                        <li>엠포플러스: 카카오 알림톡 및 톡기반 서비스</li>
                        <li>(주)Nice신용평가정보: CI/DI 및 휴대폰번호 실명인증</li>
                        <li>효성CMS: CSM, 카드자동결제 관리</li>
                        <li>풀무원녹즙 가맹점: 고객 음용제품 배송 및 서비스</li>
                        <li>엠포플러스: 문자발송(SMS/LMS)</li>
                        <li>벨류랩, 마크로일 엠브레인, 이사이트코리아, 아이앤아이마케팅, 와이즈 인사이트: 소비자조사</li>
                    </ul>
                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">4. 개인정보의 제 3자 제공</h3>
                    <p>회사는 이용자들의 개인정보를 「개인정보의 수집·이용」에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
                    <ol>
                        <li><span>가.</span> 이용자들이 사전에 공개 또는 제3자 제공에 동의한 경우</li>
                        <li><span>나.</span> 법령의 규정에 의거하거나, 수사, 조사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관 및 감독 당국의 요구가 있는 경우</li>
                        <li><span>다.</span> 요금 정산을 위하여 필요한 경우</li>
                        <li><span>라.</span> 통계작성, 학술연구,시장조사, 정보제공의 경우로서 특정 개인을 식별할 수 없는 형태로 제공되는 경우</li>
                    </ol>
                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">5. 개인정보 수집방법</h3>
                    <p>회사는 다음과 같은 방법으로 개인정보를 수집합니다.</p>
                    <ol>
                        <li><span>①</span> 홈페이지 이용</li>
                        <li><span>②</span> 제휴사로부터의 제공</li>
                        <li><span>③</span> 로그 분석 프로그램을 통한 생성정보 수집</li>
                        <li><span>④</span> '쿠키(cookie)'에 의한 정보 수집</li>
                        <li><span>⑤</span> Application을 통한 정보 수집</li>
                    </ol>
                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">6. 개인정보의 보유 , 이용기간 및 파기</h3>
                    <ol>
                        <li><span>1)</span> 풀무원녹즙은 고객님이 동의한 개인정보 수집목적 또는 제공받은 목적이 달성되거나, 풀무원녹즙 이용약관에 표명한 절차에 따라 탈퇴를 요청한 경우, 지체 없이 파기합니다. 단, 법에 의해 일정기간 보유하여야 할 필요가 있을 경우에는 해당 기간 동안 고객님의 개인정보를 보유합니다.
                            <ol>
                                <li><span>①</span> 계약 또는 청약철회 등에 관한 기록
                                    <ul>
                                        <li>보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
                                        <li>보존기간 : 5년</li>
                                    </ul>
                                </li>
                                <li><span>②</span> 대금결제 및 재화 등의 공급에 관한 기록
                                    <ul>
                                        <li>보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
                                        <li>보존기간 : 5년</li>
                                    </ul>
                                </li>
                                <li><span>③</span> 소비자의 불만 또는 분쟁처리에 관한 기록
                                    <ul>
                                        <li>보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
                                        <li>보존기간 : 3년</li>
                                    </ul>
                                </li>
                                <li><span>④</span> 접속에 관한 기록보존
                                    <ul>
                                        <li>보존근거 : 통신비밀보호법</li>
                                        <li>보존기간 : 3개월</li>
                                    </ul>
                                </li>
                                <li><span>⑤</span> 그 외
                                    <ul>
                                        <li>국세기본법 등에 따라 거래기록 등을 보관해야 하는 경우</li>
                                        <li>정보주체에게 별도 동의를 받은 경우</li>
                                    </ul>
                                </li>
                            </ol>
                        </li>
                        <li><span>2)</span> 개인정보의 파기 방법
                            <p>회사는 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다. 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제하며, 어떠한 용도로도 열람 또는 이용될 수 없도록 처리합니다. 단, 이때 기록을 재생할 수 없는 기술적 방법은 사회통념상 현재의 기술수준에서 적절한 비용이 소요되는 방법을 말합니다. 해당 개인정보의 처리가 제3자에게 위탁된 경우에는 수탁자가 더 이상 해당 개인정보를 처리하지 못하도록 합니다.</p>
                        </li>
                        <li><span>3)</span> 이용하지 아니하는 고객의 개인정보의 파기 등
                            <p>회사는 개인정보보호법 제39조의6 제1항 에 따라 12개월간 이용내역(로그인, 주문등)이 없는 고객님의 개인정보를 다른 고객님의 개인정보와 분리하여 별도로 저장 · 관리합니다.</p>
                            <p>개인정보 분리 예정의 고객님께 분리되기 1개월 전에 개인정보가 분리되어 저장 · 관리되는 사실과 기간 만료 일 및 해당 개인정보의 항목을 전자우편 · 서면 · 모사전송 · 전화 또는 이와 유사한 방법 중 어느 하나의 방법으로 고객님에게 알립니다.</p>
                        </li>
                    </ol>
                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">7. 이용자 및 법정대리인의 권리ㆍ의무 및 그 행사방법</h3>
                    <p>회사는 고객님의 개인정보를 보호하기 위해 노력하고 있습니다.</p>
                    <p>회사의 고의 또는 과실 등 귀책사유 없이 ID, 비밀번호 공유 등 고객님의 부주의로 인해 발생하는 문제에 대해서는 회사는 책임지지 않습니다. 타인의 개인정보를 도용하여 회원 가입 또는 구매가 확인되었을 경우, 이용계약이 일방적으로 해지되어 회원자격이 상실될 수 있습니다.</p>
                    <p>고객님의 ID 및 비밀번호는 원칙적으로 고객님만 사용하셔야 하며, 타인에게 이를 양도하거나 대여할 수 없습니다.  타인의 개인정보를 도용한 회원가입 또는 ID 도용으로 구매를 한 경우, 회원 자격 상실과 함께 관계법령에 의거하여 처벌될 수 있습니다.</p>
                    <p>고객님은 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 주의하셔야 합니다. 만약 이같은 책임을 다하지 못하고 타인의 정보 및 존엄성을 훼손할 시에는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률' , '개인정보보호법', '주민등록법' 등에 의해 처벌받을 수 있습니다.</p>
                    <p>이용자는 정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p>
                    <ol>
                        <li><span>①</span> 자신의 개인정보의 조회, 수정 및 가입해지의 요청</li>
                        <li><span>②</span> 개인정보의 오류에 대한 정정 및 삭제의 요청</li>
                        <li><span>③</span> 개인정보의 조회, 수정 및 해지, 삭제 등의 요청은 '고객정보변경' 및 '회원탈퇴' 등을 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정, 혹은 탈퇴가 가능합니다.</li>
                        <li><span>④</span> 이용자가 개인정보의 오류에 대한 정정 및 삭제를 요청한 경우에는 정정 및 삭제를 완료할 때까지 해당 개인정보를 이용 또는 제공하지 않습니다. 이 경우, 잘못된 개인정보를 이용 또는 제공한 경우 지체 없이 수정하겠습니다.</li>
                        <li><span>⑤</span> 회사는 이용자의 요청에 의해 해지 또는 삭제되는 개인정보는 개인정보의 파기절차 및 방법에 따라 처리합니다.</li>
                        <li><span>⑥</span> 개인정보의 열람, 정정, 삭제, 처리, 정지 요구가 다른 법령상의 의무를 준수하기 위하여 불가피한 경우, 다른 사람의 생명, 신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우, 개인정보를 처리하지 아니하면 정보주체와 약정한 서비스를 제공하지 못하는 등 계약이행이 곤란한 경우는 요구를 거절할 수 있습니다.</li>
                    </ol>
                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">8. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항</h3>
                    <p>회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.</p>
                    <ol>
                        <li><span>①</span> 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다.
                            <ol>
                                <li><span>가.</span> 쿠키의 사용 목적<br>
                                    회사는 이용자의 편의를 위하여 쿠키를 운영합니다. 회사가 쿠키를 통해 수집하는 정보는 회원 ID에 한하며, 그 외의 다른 정보는 수집하지 않습니다.</li>
                                <li><span>나.</span> 회사가 쿠키(cookie)를 통해 수집한 회원 ID는 다음의 목적을 위해 사용됩니다.
                                    <ol>
                                        <li><span>1)</span> 개인의 관심 분야에 따라 차별화된 정보를 제공</li>
                                        <li><span>2)</span> 회원과 비회원의 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 타겟(target) 마케팅에 활용</li>
                                        <li><span>3)</span> 쇼핑한 품목들에 대한 정보와 관심 있게 둘러본 품목들에 대한 자취를 추적하여 다음 번 쇼핑 때 개인 맞춤 서비스를 제공</li>
                                        <li><span>4)</span> 유료서비스 이용 시 이용기간 안내</li>
                                        <li><span>5)</span> 회원들의 습관을 분석하여 서비스 개편 등의 척도</li>
                                    </ol>
                                </li>
                            </ol>
                        </li>
                        <li><span>②</span> 쿠키의 설치/운영 및 거부
                            <ol>
                                <li><span>가.</span> 쿠이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 회사의 일부 서비스는 이용에 어려움이 있을 수 있습니다.</li>
                                <li><span>나.</span> 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)
                                    <ol>
                                        <li><span>1)</span> [도구] 메뉴에서 [인터넷 옵션]을 선택합니다.</li>
                                        <li><span>2)</span> [개인정보 탭]을 클릭합니다.</li>
                                        <li><span>3)</span> [개인정보처리 수준]을 설정하시면 됩니다.</li>
                                    </ol>
                                </li>
                            </ol>
                        </li>
                    </ol>
                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">9. 개인정보의 기술적/관리적 보호 대책</h3>
                    <p>회사는 「개인정보보호법」 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적, 관리적, 물리적 조치를 하고 있습니다.</p>
                    <ol>
                        <li><span>①</span> 개인정보 암호화 : 이용자의 개인정보는 비밀번호에 의해 보호되며, 중요한 데이터는 파일 및 전송 데이터를 암호화하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 통해 보호 하고 있습니다.</li>
                        <li><span>②</span> 해킹 등에 대비한 기술적 대책 : 회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다.
                            <ol>
                                <li><span>가.</span> 개인정보의 훼손에 대비해서 자료를 수시로 백업</li>
                                <li><span>나.</span> 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지</li>
                                <li><span>다.</span> 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제</li>
                                <li><span>라.</span> 물리적 무단 접근을 차단하기 위해 통제된 구역에 시스템 설치</li>
                                <li><span>마.</span> 기타 시스템적으로 보안성을 확보하기 위해 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.</li>
                            </ol>
                        </li>
                        <li><span>③</span> 개인정보처리시스템 접근 제한 : 회사는 개인정보를 처리할 수 있도록 체계적으로 구성한 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소 등에 관한 기준을 수립하고 비밀번호의 생성 방법, 변경 주기 등을 규정 운영하며 기타 개인정보에 대한 접근통제를 위해 필요한 조치를 다하고 있습니다.</li>
                        <li><span>④</span> 처리직원의 최소화 및 교육 :회사의 개인정보관련 처리 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 회사의 개인정보처리방침의 준수를 항상 강조하고 있습니다.</li>
                        <li><span>⑤</span> 개인정보보호전담기구의 운영 : 사내 개인정보보호전담기구 등을 통하여 회사의 개인정보처리방침의 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다.</li>
                    </ol>
                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">10. 개인정보보호 관리책임자</h3>
                    <p>회사는 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보보호 관리책임자를 지정하고 있습니다. (개인정보보호법 제31조 제1항에 따른 개인정보 보호책임자)</p>
                    <dl>
                        <!-- s: 20200310 개인정보관리책임자 정보 수정 -->
                        <dt>&lt;개인정보관리 책임자&gt;</dt>
                        <dd>성 명: 장종의</dd>
                        <dd>소속부서: FDD 영업본부장</dd>
                        <dd>전자우편: jejang@pulmuone.com</dd>
                        <dd>전화번호: 02-2186-8786</dd>
                        <dd>팩스번호: 02-582-4115</dd>
                        <!-- e: 20200310 개인정보관리책임자 정보 수정 -->
                    </dl>
                    <dl>
                        <dt>&lt;개인정보관리 부서&gt;</dt>
                        <dd>부서명: 디지털커뮤니케이션팀</dd>
                        <dd>담당자: 김수현</dd>
                        <dd>전자우편: shkimi@pulmuone.com</dd>
                        <dd>전화번호: 02-2186-8532</dd>
                        <dd>팩스번호: 02-582-4115</dd>
                    </dl>
                    <p>귀하께서는 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자에게 신고하실 수 있으며, 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br>
                        기타 개인정보 침해/피해와 관련한 상담이 필요한 경우에는 아래 기관으로 문의하시기 바랍니다.</p>
                    <ul>
                        <li>개인정보침해신고센터 (http://privacy.kisa.or.kr / 국번없이 118)</li>
                        <li>대검찰청 사이버수사과 (http://www.spo.go.kr / 국번없이 02-3480-3571)</li>
                        <li>경찰청 사이버안전국 (http://cyberbureau.police.go.kr / 국번없이 182)</li>
                        <li>개인정보 분쟁조정위원회 (http://kopico.go.kr / 02-2100-2499)</li>
                    </ul>

                </div>
                <!--e:repeat agree cont-->
                <!--s:repeat agree cont-->
                <div class="agree-cont">
                    <h3 class="agree-title">11. 고지의 의무</h3>
                    <p>이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 가능한 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
                    <dl>
                        <!-- s: 20200310 개인정보처리방침 버전번호,공고, 시행일자 변경 -->
                        <dt>개인정보처리방침 버전번호: 6.0</dt>
                        <dd>공고일자 : 2020년 3월 3일</dd>
                        <dd>시행일자 : 2020년 3월 10일</dd>
                        <!-- e: 20200310 개인정보처리방침 버전번호,공고, 시행일자 변경 -->
                    </dl>
                </div>
                <!--e:repeat agree cont-->
                <!-- e: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
                <!-- e: 20200310 약관 수정 (최신 수급 컨텐츠로 수정 -->

                <p>이전 버전 개인정보 처리방침은 공지사항에서 확인할 수 있습니다.</p><!-- 20200221 문구 추가 -->
            </div>

        </div>
    </div>
</div>

				</div>
				<div class="dropdown site-link" style="padding-block: 20px;
				    margin-top: 10px;
				    border-top: 1px solid #e5e5e5;
				    margin-inline: 10px;">
					<button class="btn dropdown-toggle" type="button" style="width: 230px" data-toggle="dropdown" aria-expanded="false">
						개인정보처리방침 변경이력
					</button>
					<div class="dropdown-menu" style="width: 230px">
						<a class="dropdown-item privacy" data-idx="1" href="javascript:void(0)">2023-09-21 시행</a>
						<a class="dropdown-item privacy" data-idx="2" href="javascript:void(0)">2023-08-10 시행</a>
						<a class="dropdown-item privacy" data-idx="3" href="javascript:void(0)">2023-01-25 시행</a>
						<a class="dropdown-item privacy" data-idx="4" href="javascript:void(0)">2020-03-10 시행</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
  $(function(){
    $('.dropdown-item').click(function(){
      const idx = $(this).data('idx')
      if($(this).hasClass('privacy')){

        $('.privacyPolicy').hide();
        $(`.privacyPolicy[data-idx=${idx}]`).show()
      }else {
        $('.terms').hide();
        $(`.terms[data-idx=${idx}]`).show()
      }
    })
  })
</script>

<div class="modal fade" id="personalInfo" tabindex="-1" aria-labelledby="personalInfo" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="personalInfoLabel">개인정보 수집 및 이용</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table>
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold" rowspan="3">회원가입, 부정이용 및 비인가 사용방지, 서비스 이용에 따른 본인식별 및 연령확인</td>
				<td>아이디, 패스워드, 이메일</td>
				<td style="font-weight: bold" rowspan="8">
					회원탈퇴 시 파기, CI값은 무분별한 재가입 방지를 위해 30일간 보관 후 파기<br>
					(단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관)
				</td>
			</tr>
			<tr>
				<td>이름, 휴대전화번호, 생년월일, 성별,</td>
			</tr>
			<tr>
				<td>
					CI(연계정보), DI(중복확인정보)
				</td>
			</tr>
			<tr>
				<td style="font-weight: bold" rowspan="2">SNS 간편로그인(네이버, 카카오톡)</td>
				<td>이름, 이메일 주소, 성별, 생일</td>
			</tr>
			<tr>
				<td>닉네임, 프로필사진</td>
			</tr>
			<tr>
				<td style="font-weight: bold" rowspan="3">주문/결제/배송</td>
				<td>이름, 휴대전화번호, 배송지주소</td>
			</tr>
			<tr>
				<td>출입정보</td>
			</tr>
			<tr>
				<td>은행계좌번호, 신용카드번호</td>
			</tr>
		</tbody></table>
		<p>※ 풀무원녹즙 회원가입을 위해 개인정보 수집 및 이용에 거부할 권리가 있으나, 동의를 거부 할 경우 풀무원녹즙 서비스 이용이 불가합니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="marketingPolicy" tabindex="-1" aria-labelledby="marketingPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="marketingPolicyLabel">마케팅 활용</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width: 100%">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">

					신상품 홍보 및 맞춤형 광고, 광고성 정보
					(메시지전송)
				</td>
				<td>성명, 휴대전화번호, 생년월일, 성별, 주소</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 마케팅 활용 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="adverPolicy" tabindex="-1" aria-labelledby="adverPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="adverPolicyLabel">광고성 정보 수신</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width:100%;">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">
					광고성 정보

					(메시지전송)
				</td>
				<td>휴대전화번호</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 광고성 정보 수신 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="tosPolicy" tabindex="-1" aria-labelledby="tosPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="tosPolicyLabel">이용약관</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body" style="border-bottom:6px #fafafa solid;">
				<div class="terms" data-idx="1">
					

<style>
	.agree-inner+.agree-inner { margin-top:10px; }
	.agree-wrap .agree-cont ul { padding:5px 0; }
	.agree-wrap .agree-cont ul li { position: relative; padding-left:20px; }
	.agree-wrap .agree-cont ul li:before { content:none; }
	.agree-inner li+li { margin-top:5px; }
	.agree-inner ol li { padding-left:14px; }
	.agree-inner .num { position: absolute; font-size:11px; left:0; top:0px; }
	.agree-wrap .agree-cont .agree-inner .agree-title { font-size:18px; padding-bottom:10px; border-bottom:1px #e5e5e5 solid; margin-bottom:10px; }
</style>
<div class="" style="padding: 0 30px 30px">
	<div class="agree-wrap">
		<!-- s: 20200310 약관 수정 -->
		<!-- s: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
		<!--s:repeat agree cont-->

		<!-- s: 20200310 약관 수정 -->
		<!-- s: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
		<!--s:repeat agree cont-->
		<div class="agree-cont">
			<div class="agree-inner">
				<h4 class="agree-title">제1조 목적</h4>
				<p>본 약관은 (주)풀무원 녹즙(이하 “회사”라 한다)이 운영하는 “풀무원녹즙 홈페이지”(greenjuice.pulmuone.com) (이하 “풀무원녹즙 홈페이지”라 한다.)이 제공하는 인터넷관련서비스(이하 “서비스”라 합니다.)를 이용함에 있어 “풀무원녹즙 홈페이지”와 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다. PC통신, 모바일, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제2조 용어의 정의</h4>
				<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”라 함은 “풀무원녹즙 홈페이지”가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.</li>
					<li><span class="num">②</span>  “이용자”라 함은 “풀무원녹즙 홈페이지”에 접속하여 “풀무원녹즙 홈페이지”가 제공하는 서비스를 받는 회원 및 비회원을 의미합니다. </li>
					<li><span class="num">③</span>  “회원”이라 함은 “풀무원녹즙 홈페이지”에 회원 가입을 한 자로서, 계속적으로 “풀무원녹즙 홈페이지”가 제공하는 서비스를 이용할 수 있는 자를 말합니다. </li>
					<li><span class="num">④</span>  “비회원”이라 함은 회원에 가입하지 않고 “풀무원녹즙 홈페이지”가 제공하는 서비스를 이용하는 자를 말합니다.</li>
					<li><span class="num">⑤</span>  “게시물”이라 함은 회원이 서비스를 이용함에 있어 서비스 상에 게시한 부호, 문자, 음성, 음향, 화상, 동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.</li>
					<li><span class="num">⑥</span>  “제휴 사이트”란 “풀무원녹즙 홈페이지”가 하이퍼링크 방식(하이퍼 링크의 대상에는 문자, 정지화상 및 동영상 등이 포함됨) 등으로 연결한 웹사이트 및 사이버 “몰(mall)”을 의미합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제3조 이용약관의 명시와 설명 및 개정</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, FAX, 전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리 책임자 등을 이용자가 쉽게 알 수 있도록 “풀무원녹즙 홈페이지”의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. </li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불 조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. </li>
					<li><span class="num">③</span> “풀무원녹즙 홈페이지”는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li>
					<li><span class="num">④</span> “풀무원녹즙 홈페이지”가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 “풀무원녹즙 홈페이지”의 공지사항에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 14일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “풀무원녹즙 홈페이지”는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</li>
					<li><span class="num">⑤</span> “회사”가 제4항에 따라 변경된 약관을 공지 또는 통지하면서 이용자에게 약관 변경 적용 일까지 거부의사를 표시하지 아니할 경우 약관 변경에 동의한 것으로 간주한다는 내용을 통지하였음에도 이용자가 명시적으로 약관 변경에 거부의사를 표시하지 아니하면, '회사'는 이용자가 변경 약관에 동의한 것으로 간주합니다.</li>
					<li><span class="num">⑥</span> 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제4조 서비스의 제공 및 변경</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 다음과 같은 업무를 수행합니다.
						<ol>
							<li><span class="num">1.</span> 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li>
							<li><span class="num">2.</span> 구매계약이 체결된 재화 또는 용역의 배송</li>
							<li><span class="num">3.</span> 기타 “풀무원녹즙 홈페이지”가 정하는 업무</li>
						</ol>
					</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
					<li><span class="num">③</span> “풀무원녹즙 홈페이지”가 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 회사와 미리 약정하여 지정한 연락처(전자우편주소 등 연락 가능한 수단을 포함)로 즉시 통지합니다.</li>
					<li><span class="num">④</span> 전항의 경우 “풀무원녹즙 홈페이지”는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “풀무원녹즙 홈페이지”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제5조 서비스의 중단</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
					</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “풀무원녹즙 홈페이지”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
					<li><span class="num">③</span> 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “풀무원녹즙 홈페이지”는 제8조에 정한 방법으로 이용자에게 통지하고 당초 “풀무원녹즙 홈페이지”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “풀무원녹즙 홈페이지”가 보상기준 등을 고지하지 아니한 경우에는 “풀무원녹즙 홈페이지”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제6조 회원가입</h4>
				<ul>
					<li><span class="num">①</span> 회원 가입은 개인의 경우 만 14세 이상이면 신청할 수 있으며, “제6조 ”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
					</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
						<ol>
							<li><span class="num">1.</span> 가입신청자가 회원 탈퇴 후 30일이 지나지 않은 경우</li>
							<li><span class="num">2.</span> 회원정보 내용이 기존 가입회원과 중복되거나 허위, 기재누락, 오기가 있는 경우</li>
							<li><span class="num">3.</span> 기타 회원으로 등록하는 것이 “풀무원녹즙 홈페이지”의 기술상 현저히 지장이 있다고 판단되는 경우</li>
						</ol>
					</li>
					<li><span class="num">③</span> 온라인 가입신청 양식에 기재되는 모든 회원의 정보는 실제 데이터인 것으로 간주합니다. 만일, 실명이나 실제 정보를 입력하지 않은 경우 회원은 법적인 보호를 받을 수 없으며, 서비스 이용에 제한을 받을 수 있습니다.</li>
					<li><span class="num">④</span> 회원 가입 계약의 성립 시기는 “풀무원녹즙 홈페이지”의 승낙이 회원에게 도달한 시점으로 합니다.</li>
					<li><span class="num">⑤</span> 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “풀무원녹즙 홈페이지”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다. 회원이 변경사항에 대한 통보나 수정을 하지 않음으로 인해 발생하는 재화나 용역의 피해에 대해서 “풀무원녹즙 홈페이지”는 책임을 지지 않습니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제7조 회원 탈퇴 및 자격 정지 등</h4>
				<ul>
					<li><span class="num">①</span> 회원은 “풀무원녹즙 홈페이지”에 언제든지 탈퇴를 요청할 수 있으며 “풀무원녹즙 홈페이지”는 즉시 회원탈퇴를 처리합니다. 단, 탈퇴 시 기존 아이디로는 재가입이 불가능 합니다.
					</li>
					<li><span class="num">②</span> 회원이 다음 각 호의 사유에 해당하는 경우, “풀무원녹즙 홈페이지”는 회원자격을 제한 및 정지시킬 수 있습니다.
						<ol>
							<li><span class="num">1.</span> 가입 신청 시에 허위 내용을 등록하거나 “풀무원녹즙 홈페이지”가 제공하는 각종 할인쿠폰, 이벤트 혜택 등으로 경제적 이익을 편법으로 수취하고자 회원가입시 타인 명의로 가입한 경우</li>
							<li><span class="num">2.</span> “풀무원녹즙 홈페이지”를 이용하여 구입한 재화 등의 대금, 기타 “풀무원녹즙 홈페이지” 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li>
							<li><span class="num">3.</span> 다른 사람의 “풀무원녹즙 홈페이지” 이용을 방해하거나 그 정보를 도용하는 등 서비스 운영에 지장을 주는 각종 행위를 하여 전자상거래 질서를 위협하거나 회사 및 타인의 신용·명예·권리를 훼손하는 행위</li>
							<li><span class="num">4.</span> “풀무원녹즙 홈페이지”를 이용하여 법령 또는 이 약관이 금지하거나 유해물 또는 유해사이트 게재 링크 등 공서양속에 반하는 행위를 하는 경우</li>
							<li><span class="num">5.</span> 범죄와 결부된다고 객관적으로 판단되는 행위를 하는 경우</li>
							<li><span class="num">6.</span> “풀무원녹즙 홈페이지”의 승인을 받지 않고 개인정보를 수집 또는 저장하는 행위를 하는 경우</li>
							<li><span class="num">7.</span> 개인이 재판매 등 영업 활동을 목적으로 서비스 혹은 재화를 구매하는 행위를 하는 경우</li>
							<li><span class="num">8.</span> 기타 관계법령에 위배되는 행위를 하는 경우</li>
						</ol>
					</li>
					<li><span class="num">③</span> “풀무원녹즙 홈페이지”가 회원 자격을 제한 · 정지 시킨 후, 회원에게 이를 통지하고 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다. 그러나 회원의 고의 또는 과실 등으로 통지가 불가능한 경우에는 그러하지 아니합니다.  </li>
					<li><span class="num">④</span> 전항의 통지를 받은 회원은 소명 후 회사의 승인을 얻어 제한 및 정지를 해제할 수 있으며, 원하는 경우 탈퇴를 요청할 수 있습니다. 소명이 없이 30일이 경과한 경우에는 회원자격 정지 상태가 유지됩니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제8조 회원에 대한 통지</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”가 회원과 비회원에 대한 통지를 하는 경우, 회원이 “풀무원녹즙 홈페이지”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
					</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 불특정다수 회원에 대한 통지의 경우 1주일이상 “풀무원녹즙 홈페이지” 게시판에 게시함으로써 개별통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제9조 구매신청 및 개인정보 제공 동의</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지” 이용자는 “풀무원녹즙 홈페이지”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “풀무원녹즙 홈페이지”는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
						<ol>
							<li><span class="num">1.</span> 재화 등의 검색 및 선택</li>
							<li><span class="num">2.</span> 받는 사람의 성명, 주소, 전화번호 등의 입력</li>
							<li><span class="num">3.</span> 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인</li>
							<li><span class="num">4.</span> 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)</li>
							<li><span class="num">5.</span> 재화등의 구매신청 및 이에 관한 확인 또는 “풀무원녹즙 홈페이지”의 확인에 대한 동의</li>
							<li><span class="num">6.</span> 결제방법의 선택</li>
						</ol>
					</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”가 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)</li>
					<li><span class="num">③</span> “풀무원녹즙 홈페이지”가 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 관련 개인정보보호법에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제10조 계약의 성립</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 또 “풀무원녹즙 홈페이지”는 미성년자와 계약을 체결하는 경우 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지합니다.
						<ol>
							<li><span class="num">1.</span> 신청 내용에 허위, 기재누락, 오기가 있거나 타인의 명의로 신청하는 경우</li>
							<li><span class="num">2.</span> 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
							<li><span class="num">3.</span> 기타 구매신청에 승낙하는 것이 “풀무원녹즙 홈페이지” 기술상 현저히 지장이 있다고 판단하는 경우</li>
						</ol>
					</li>
					<li><span class="num">②</span> 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
					<li><span class="num">③</span> “풀무원녹즙 홈페이지”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제11조 지급방법</h4>
				<p>“풀무원녹즙 홈페이지”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, “풀무원녹즙 홈페이지”는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.</p>
				<ol>
					<li><span class="num">1.</span> 폰뱅킹, 인터넷뱅킹, 메일뱅킹, 온라인 무통장 입금 등의 각종 계좌이체</li>
					<li><span class="num">2.</span> 선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
					<li><span class="num">3.</span> “풀무원녹즙 홈페이지”가 지급한 적립금 등 에 의한 결제</li>
					<li><span class="num">4.</span> 현장 현금 등에 의한 결제</li>
					<li><span class="num">5.</span> “회사”와 계약을 맺었거나 “풀무원녹즙 홈페이지”가 인정한 상품권에 의한 결제 </li>
					<li><span class="num">6.</span> 기타 전자적 지급 방법에 의한 대금 지급 등</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제12조 수신확인통지․구매신청 변경 및 취소</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</li>
					<li><span class="num">②</span> 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “풀무원녹즙 홈페이지”는 배송 준비 완료 전(“풀무원녹즙 홈페이지”가 배송업체에 수하물을 신탁하기 전 또는 입점판매자에게 발주하기 전)에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제13조 재화 등의 공급</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “풀무원녹즙 홈페이지”가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “풀무원녹즙 홈페이지”는 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “풀무원녹즙 홈페이지”가 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “풀무원녹즙 홈페이지”가 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제14조 환급</h4>
				<p>“풀무원녹즙 홈페이지”는 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제15조 청약철회 등</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”와 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.</li>
					<li><span class="num">②</span> 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환이 불가할 수 있습니다.
						<ol>
							<li><span class="num">1.</span> 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인 하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</li>
							<li><span class="num">2.</span> 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
							<li><span class="num">3.</span> 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우</li>
							<li><span class="num">4.</span> 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li>
							<li><span class="num">5.</span> 냉동·냉장·신선식품 등 반품 및 교환 과정에서 변질의 우려가 있거나, 주문제조 되는 식품으로 취소 마감 기한이 경과한 경우</li>
						</ol>
					</li>
					<li><span class="num">③</span> 제2항 제2호 내지 제5호의 경우에 “풀무원녹즙 홈페이지”가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.</li>
					<li><span class="num">④</span> 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
					</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제16조 청약철회 등의 효과</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 단, 신용카드 등의 결제의 경우 취소처리 완료 후 결제가 취소되며 “풀무원녹즙 홈페이지”가 이용자에게 재화등의 환급을 지연 한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제 수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
					</li>
					<li><span class="num">③</span> 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “풀무원녹즙 홈페이지”는 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시 · 광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “풀무원녹즙 홈페이지”가 부담합니다. </li>
					<li><span class="num">④</span> 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “풀무원녹즙 홈페이지”는 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</li>
					<li><span class="num">⑤</span> 물품의 판매 중단 등으로 재고가 없는 경우에는 교환이 불가능할 수 있으며, 이 경우에 이용자의 선택에 따라 반품, 동일이상 수준의 제품 교환, 재 입고 시 재 배송 진행 등으로 처리됩니다. </li>
					<li><span class="num">⑥</span> “풀무원녹즙 홈페이지”는 협의되지 않은 임의반품 또는 배송비 등 반품과 관련된 비용을 회원이 부담하여야 하는 경우에는 미지급시 환불이 지연될 수 있습니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제17조 개인정보보호</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 이용자의 개인정보 수집시 서비스 제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. </li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 회원 가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.</li>
					<li><span class="num">③</span> “풀무원녹즙 홈페이지”는 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. </li>
					<li><span class="num">④</span> “풀무원녹즙 홈페이지”는 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</li>
					<li><span class="num">⑤</span> “풀무원녹즙 홈페이지”는 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「개인정보보호법」이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</li>
					<li><span class="num">⑥</span> 이용자는 언제든지 “풀무원녹즙 홈페이지”가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “풀무원녹즙 홈페이지”는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “풀무원녹즙 홈페이지”는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</li>
					<li><span class="num">⑦</span> “풀무원녹즙 홈페이지”는 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</li>
					<li><span class="num">⑧</span> “풀무원녹즙 홈페이지” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.</li>
					<li><span class="num">⑨</span> “풀무원녹즙 홈페이지”는 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제18조 “풀무원녹즙 홈페이지”의 의무</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.</li>
					<li><span class="num">③</span> “풀무원녹즙 홈페이지”가 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</li>
					<li><span class="num">④</span> “풀무원녹즙 홈페이지”는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제19조 회원의 의무</h4>
				<ul>
					<li><span class="num">①</span> 회원은 자신에게 부여된 아이디와 비밀번호를 제3자에게 사용하게 하거나 도용 등 타인의 부정 사용이 발생하지 않도록 유의하여야 하며 “풀무원녹즙 홈페이지”의 고의·과실이 없는 한 회원의 아이디와 비밀번호에 관한 모든 관리 책임은 회원에게 있습니다.</li>
					<li><span class="num">②</span> 회원 자신의 아이디나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 “풀무원녹즙 홈페이지”에 신고하여야 하며 “풀무원녹즙 홈페이지”의 고의·과실이 없는 한, 신고를 하지 않아 발생하는 모든 결과에 대한 책임은 회원에게 있습니다. 이에 대하여 “풀무원녹즙 홈페이지”의 안내가 있을 때는 그에 따라야 합니다. </li>
					<li><span class="num">③</span> 회원은 “풀무원녹즙 홈페이지”의 사전승낙 없이는 서비스를 이용하여 영업활동을 할 수 없으며 그 영업활동 결과와 회원이 약관을 위반한 영업활동을 하여 발생한 결과에 대하여 “풀무원녹즙 홈페이지”는 책임지지 않습니다. 회원의 이와 같은 영업활동으로 “풀무원녹즙 홈페이지”가 손해를 입은 경우, 회원은“풀무원녹즙 홈페이지”에 대하여 손해배상책임을 부담합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제20조 이용자의 의무</h4>
				<p>이용자는 본 약관에서 규정하는 사항과 서비스 이용안내 또는 주의사항 등  “풀무원녹즙 홈페이지”가 적법한 절차와 내용으로 공지 혹은 통지하는 사항을 준수하여야 하며 기타  “풀무원녹즙 홈페이지”의 업무에 방해되는 다음 각 호의 행위를 하여서는 안됩니다. </p>
				<ol>
					<li><span class="num">1.</span> 신청 또는 변경시 허위 내용의 등록</li>
					<li><span class="num">2.</span> 타인의 정보 도용</li>
					<li><span class="num">3.</span> “풀무원녹즙 홈페이지”에 게시된 정보의 변경</li>
					<li><span class="num">4.</span> “풀무원녹즙 홈페이지”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
					<li><span class="num">5.</span> “풀무원녹즙 홈페이지” 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
					<li><span class="num">6.</span> “풀무원녹즙 홈페이지” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
					<li><span class="num">7.</span> 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제21조 저작권의 귀속 및 이용제한</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”가 작성한 저작물에 대한 저작권 기타 지적재산권은 “풀무원녹즙 홈페이지”에 귀속합니다. </li>
					<li><span class="num">②</span> 이용자는 “풀무원녹즙 홈페이지”를 이용함으로써 얻은 정보 중 “풀무원녹즙 홈페이지”에게 지적재산권이 귀속된 정보를 “풀무원녹즙 홈페이지”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</li>
					<li><span class="num">③</span> 서비스 내에 게재된 자료에 대한 권리와 책임은 게시자에게 있으며, “풀무원녹즙 홈페이지”는 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</li>
					<li><span class="num">④</span> “풀무원녹즙 홈페이지”는 회원이 게재하거나 등록하는 서비스 내의 자료(또는 내용물)이 다음 각 호의 1에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다.
						<ol>
							<li><span class="num">1.</span> 다른 회원 또는 제3자를 비방하거나 명예훼손의 여지가 있는 내용인 경우</li>
							<li><span class="num">2.</span> 공공질서 및 미풍양속에 위반되는 내용인 경우</li>
							<li><span class="num">3.</span> 범죄적 행위에 결부된다고 인정되는 내용일 경우</li>
							<li><span class="num">4.</span> “풀무원녹즙 홈페이지” 또는 제 3자의 저작권등 기타 권리를 침해하는 내용인 경우</li>
							<li><span class="num">5.</span> 유해물 게재 혹은 유해 사이트 링크 등을 하는 경우</li>
							<li><span class="num">6.</span> 기타 “풀무원녹즙 홈페이지”의 명예, 신용 등 이익을 침해할 우려가 상당한 경우</li>
							<li><span class="num">7.</span> 기타 관계법령에 위반된다고 판단되는 경우</li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제22조 광고 게재</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”는 서비스의 운용과 관련하여 서비스 화면, 이메일 등에 광고를 게재할 수 있습니다. 회원은 서비스 이용 시 노출되는 광고 게재에 대하여 동의하는 것으로 간주됩니다.</li>
					<li><span class="num">②</span> 서비스 상에 게재된 광고 내용이나 서비스를 통한 광고주의 판촉 활동에 대하여 회원은 본인의 책임과 판단으로 거래하여야 하며, 그 결과로서 발생하는 모든 손실 또는 손해에 대해 “풀무원녹즙 홈페이지”는 책임지지 않는 것을 원칙으로 합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제23조 분쟁 해결</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”와 회원은 서비스와 관련하여 분쟁이 발생한 경우에 이를 원만하게 해결하기 위해 필요한 모든 노력을 하여야 합니다.</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.</li>
					<li><span class="num">③</span> “풀무원녹즙 홈페이지”는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 즉시 통보해 드립니다.</li>
					<li><span class="num">④</span> “풀무원녹즙 홈페이지”와 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제24조 재판권 및 준거법</h4>
				<ul>
					<li><span class="num">①</span> “풀무원녹즙 홈페이지”와 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</li>
					<li><span class="num">②</span> “풀무원녹즙 홈페이지”와 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">부칙</h4>
				<p>본 약관은 2023년 01월 25일부터 시행합니다.</p>
			</div>
		</div>
		<!--e:repeat agree cont-->
	</div>
</div>

				</div>
				<div class="terms" data-idx="2" style="display: none">
					

<style>
    .agree-inner+.agree-inner { margin-top:10px; }
    .agree-wrap .agree-cont ul { padding:5px 0; }
    .agree-wrap .agree-cont ul li { position: relative; padding-left:20px; }
    .agree-wrap .agree-cont ul li:before { content:none; }
    .agree-inner li+li { margin-top:5px; }
    .agree-inner ol li { padding-left:14px; }
    .agree-inner .num { position: absolute; font-size:11px; left:0; top:0px; }
    .agree-wrap .agree-cont .agree-inner .agree-title { font-size:18px; padding-bottom:10px; border-bottom:1px #e5e5e5 solid; margin-bottom:10px; }
</style>
<div class="" style="padding: 0 30px 30px">
	<div class="agree-wrap">
		<!-- s: 20200310 약관 수정 -->
		<!-- s: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
		<!--s:repeat agree cont-->

		<!-- s: 20200310 약관 수정 -->
		<!-- s: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
		<!--s:repeat agree cont-->
		<div class="agree-cont">
			<h3 class="agree-title">제1장 총칙</h3>
			<div class="agree-inner">
				<h4 class="agree-title">제1조(목적)</h4>
				<p>이 약관은 풀무원녹즙 주식회사(이하 ‘회사’라 합니다)가 풀무원녹즙 홈페이지 국문본(이하 ‘풀무원녹즙 홈페이지’라 합니다) 및 이를 지원하기 위한 서버를 통하여 회원에게 제공하는 용역과 관련하여 회사와 회원과의 권리, 의무, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제2조(용어의 정의)</h4>
				<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
				<ul>
					<li>“서비스”란 구현되는 단말기와 무관하게 회사가 풀무원녹즙 홈페이지 및 이를 지원하기 위한 서버를 통하여 제공하는 용역을 말합니다.</li>
					<li>“풀무원녹즙 홈페이지”란 회사를 대표하는 홈페이지로서 회사의 관리하에 동일한 도메인네임 및 폴더구조(http://www.greejuice.pulmuone.com)를 사용하면서 체계적인 구조에 따라 조직되어 통일된 디자인 구성요소를 공유하는 웹페이지의 집합을 말합니다.</li>
					<li>“회원”이란 이 약관에 따라 이용계약이 체결되어 회사가 제공하는 서비스를 이용할 수 있는 고객을 말합니다.</li>
					<li>“법인회원”이란 법인인 회원을 말합니다.</li>
					<li>“개인회원”이란 자연인인 회원을 말합니다.</li>
					<li>“정회원”이란 법인회원과 본인인증을 한 개인회원을 말합니다.</li>
					<li>“아이디(ID)”란 회원의 식별과 서비스의 이용을 위하여 회사가 정한 정책에 따라 회원이 정하고 회사가 승인하는 숫자·부호 또는 문자의 조합을 말합니다.</li>
					<li>“비밀번호”란 부여 받은 아이디와 일치하는 회원임을 확인하기 위하여 회사가 정한 정책에 따라 회원 자신이 정한 숫자·부호 또는 문자의 조합을 말합니다.</li>
					<li>“회원 작성 자료”란 서비스를 통하여 회원이 작성한 자료로서 공개∙비공개 여부와 무관하게 풀무원녹즙 홈페이지 및 이를 지원하기 위한 서버에 등록된 자료 일체를 말합니다. 회원이 명시적으로 동의한 경우(스스로 본인의 개인정보가 기재된 자료를 공개적으로 게시하는 경우는 동의가 있는 것으로 간주합니다)를 제외하면, 회원 작성 자료의 범위에는 개인정보 보호법상 개인정보에 해당하는 자료를 포함하지 않습니다.</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제3조(약관의 적용범위)</h4>
				<p>이 약관은 서비스를 이용하는 모든 회원에게 적용됩니다. 비회원에게는 회사가 별도로 정한 정책이 적용됩니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제4조(약관의 개정)</h4>
				<ol>
					<li><span>①</span> 회사는 개정된 약관을 시행일 7일 전까지 시행일자, 개정내용, 개정사유 등을 명시하여 풀무원녹즙 홈페이지에 공지하는 방법으로 약관을 개정할 수 있습니다.</li>
					<li><span>②</span> 제1항에도 불구하고, 회원에게 불리한 약관 개정의 경우 회사는 시행일 14일 전까지 회원에게 전자적 전송매체를 이용하여 개별 통지하는 방법으로 약관을 개정할 수 있습니다. 다만, 연락처 미기재 등 부득이한 사유로 인하여 개별 통지가 어려운 회원에 한하여 회사는 개별 통지에 갈음하여 풀무원녹즙 홈페이지에 공지할 수 있습니다.</li>
					<li><span>③</span> 회원이 약관 개정에 부동의 하지 아니하고 시행일 이후에도 서비스를 이용한 경우, 회사는 회원이 약관 개정에 동의한 것으로 간주합니다. 회원이 약관 개정에 부동의 한 경우, 회사 또는 회원은 이용계약을 해지할 수 있습니다.</li>
					<li><span>④</span> 약관 개정을 위하여 공지 또는 통지하는 경우 회사는 제3항의 내용을 명확하게 따로 고지할 예정입니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제5조(약관 외 준칙)</h4>
				<ol>
					<li><span>①</span> 약관에 명시되지 않은 사항과 이 약관의 해석에 관하여는 관련 법령 또는 상관례에 따릅니다.</li>
					<li><span>②</span> 회원의 개인정보에 관한 사항은 개인정보 처리방침에서 별도로 정합니다.</li>
				</ol>
			</div>
		</div>
		<!--e:repeat agree cont-->
		<!--s:repeat agree cont-->
		<div class="agree-cont">
			<h3 class="agree-title">제2장 이용계약</h3>
			<div class="agree-inner">
				<h4 class="agree-title">제6조(이용계약의 성립)</h4>
				<ol>
					<li><span>①</span> 이용계약은 회원이 되고자 하는 자가 이 약관의 내용에 동의한 다음 회원가입 신청을 하고 회사가 위 신청에 대하여 승인함으로써 성립합니다..</li>
					<li><span>②</span> 회원은 이 약관에 대하여 전자적 방법으로 동의할 수 있습니다.</li>
					<li><span>③</span> 회사는 회원의 자격에 따라 서비스 제공 범위를 제한할 수 있습니다.</li>
					<li><span>④</span> 회사는 다음 각 호의 경우 회원가입 신청을 승인하지 않을 수 있습니다.
						<ul>
							<li>기술상 서비스 제공이 불가능한 경우</li>
							<li>회원정보를 누락하거나 사실과 다르게 기재한 경우</li>
							<li>개인정보 처리방침에 동의하지 아니한 경우</li>
							<li>정당한 접근권한 없이 또는 허용된 접근권한을 넘어 정보통신망에 침입하기 위한 시도가 확인된 경우</li>
							<li>회원의 의무위반으로 인하여 이용계약이 해지된 적이 있는 경우</li>
							<li>선량한 풍속 기타 사회 질서에 위반되는 경우</li>
							<li>기타 관련 법령 및 회사의 공개∙비공개된 정책 등에 부합하지 아니한 경우</li>
						</ul>
					</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제7조(이용계약의 내용)</h4>
				<ol>
					<li><span>①</span> 이용계약은 회사가 회원에게 서비스를 제공하는 것을 내용으로 합니다.</li>
					<li><span>②</span> 회사는 회원임을 확인하기 위하여 일정한 인증 절차를 요구할 수 있으며, 이러한 절차에 응하지 아니하는 경우 회사는 회원으로서의 서비스를 제공할 수 없습니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제8조(회원의 의무)</h4>
				<p>회원은 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다.</p>
				<ul>
					<li>회사 또는 제3자의 권리를 침해하거나 침해할 우려가 있는 행위(공연성 없는 모욕∙명예훼손, 업무방해미수, 회사 또는 제3자에 대한 무권대리 등을 포함합니다)</li>
					<li>회원정보를 사실과 다르게 기재하는 행위</li>
					<li>회사의 승인 없이 서비스를 통하여 얻은 정보를 영리목적으로 이용하는 행위</li>
					<li>회사의 승인 없이 서비스를 자신 또는 제3자를 위한 영리목적으로 이용하는 행위</li>
					<li>선량한 풍속 기타 사회 질서에 위반되는 행위</li>
					<li>기타 관련 법령 및 회사의 공개된 정책 등에 위반되는 행위</li>
				</ul>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제9조(아이디와 비밀번호 관리)</h4>
				<ol>
					<li><span>①</span> 아이디와 비밀번호에 관한 관리책임은 회원 본인에게 있습니다.</li>
					<li><span>②</span> 회원은 자신의 아이디 및 비밀번호를 제3자에게 제공, 공개하거나 제3자가 이용하도록 해서는 안 됩니다.</li>
					<li><span>③</span> 회원이 자신의 아이디 및 비밀번호의 유출 또는 제3자 사용에 대해 인지하고도 비밀번호를 변경하지 않은 경우 또는 이와 같은 사정을 회사에 통지 하지 않거나 회사의 조치에 응하지 않은 경우 등 회원이 본 조의 의무를 준수하지 않아 발생하는 모든 손실이나 손해 등 불이익에 대한 책임은 회원에게 있습니다.</li>
					<li><span>④</span> 회원의 비밀번호는 회사를 포함한 제3자로부터 복호화 되지 아니하도록 일방향 암호화하여 저장되므로, 아이디와 비밀번호의 관리의무는 회원 본인에게 있습니다.</li>
					<li><span>⑤</span> 회사는 회원의 개인정보를 보호하기 위하여 일정 주기로 비밀번호를 변경하도록 권고할 수 있습니다.</li>
					<li><span>⑥</span> 회사는 해당 아이디로 풀무원녹즙 서비스에 1년간 접속 기록이 없는 경우, 일정한 인증 절차를 수행한 후 서비스를 이용하도록 접속을 제한할 수 있습니다.</li>
					<li><span>⑦</span> 회사는 아이디와 비밀번호 관리에 관한 정책을 별도로 정할 수 있습니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제10조(회원정보의 수정)</h4>
				<ol>
					<li><span>①</span> 회원은 회원가입 신청 시 기재한 회원정보가 변경되었을 경우 회사가 정한 양식 및 방법에 의하여 회원정보를 수정하여야 합니다.</li>
					<li><span>②</span> 회사는 회원이 회원정보를 적시에 수정하지 않음으로 인하여 발생한 손해에 대해서는 책임을 지지 않습니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제11조(기존 회원의 전환)</h4>
				<ol>
					<li><span>①</span> 회사가 제공하는 기존 서비스의 운영이 종료되어 그 내용 중 일부 또는 전부를 본 서비스에서 제공하게 된 경우, 회사는 해당 서비스의 기존 회원을 이 약관의 적용을 받는 회원으로 전환하여 가입하도록 할 수 있습니다.</li>
					<li><span>②</span> 제1항의 경우 기존 서비스에서 정한 약관의 내용은 효력이 없습니다</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제12조(회원에 대한 통지)</h4>
				<ol>
					<li><span>①</span> 이 약관에서 별도로 정하지 아니하는 한, 회사는 회원이 등록한 회원정보를 바탕으로 전자적 전송매체를 이용하여 회원에 대하여 통지할 수 있습니다.</li>
					<li><span>②</span> 제1항에도 불구하고, 회사는 풀무원녹즙 홈페이지에 공지함으로써 불특정 다수 회원에 대한 통지에 갈음할 수 있습니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제13조(이용계약의 해지)</h4>
				<ol>
					<li><span>①</span> 회원은 이용계약을 해지하고자 할 경우 언제든지 서비스상에서 또는 회사가 정한 별도의 방법으로 회사에 회원탈퇴 신청을 하여야 합니다.</li>
					<li><span>②</span> 회사는 다음 각 호의 경우 통지 없이 이용계약을 해지할 수 있습니다.
						<ul>
							<li>회원이 제8조에서 정한 회원의 의무를 이행하지 않은 경우</li>
							<li>회원이 약관 개정에 부동의 한 경우</li>
						</ul>
					</li>
					<li><span>③</span> 회사는 다음 각 호의 경우 14일 이상의 상당한 기간을 정하여 회원에게 통지하고 그 기간 내에 회원이 회신하지 아니한 때에는 이용계약을 해지할 수 있습니다.
						<ul>
							<li>회회원이 일정 기간 동안 접속 기록이 없는 경우</li>
							<li>회원이 회원정보를 사실과 다르게 기재한 것으로 의심되는 경우</li>
						</ul>
					</li>
					<li><span>④</span> 이용계약 해지 시 회사는 관련 법령 등에 의하여 보존할 의무가 있는 정보를 제외한 나머지 정보를 즉시 삭제합니다.</li>
					<li><span>⑤</span> 회사는 본 조에서 정한 해지 사유가 발생한 경우 해지에 갈음하여 접속을 제한하는 등의 상당한 조치를 취할 수 있습니다.</li>
					<li><span>⑥</span> 회사는 개인정보보호 관련법률 및 관련기관의 규제나 지침에 따른 요청이 있는 경우 회원의 탈회처리 등의 조치를 취할 수 있습니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제14조(양도 금지)</h4>
				<p>회원은 회사의 승인 없이 이용계약상 지위 및 그로부터 발생하는 권리와 의무를 제3자에게 양도, 증여할 수 없습니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제 15조(14세 미만 아동의 가입제한)</h4>
				<p>법정대리인의 동의가 필요한 만 14세 미만 아동의 회원가입은 받고 있지 않습니다.</p>
			</div>
		</div>
		<!--e:repeat agree cont-->
		<!--s:repeat agree cont-->
		<div class="agree-cont">
			<h3 class="agree-title">제3장 서비스</h3>
			<div class="agree-inner">
				<h4 class="agree-title">제16조(서비스의 내용)</h4>
				<ol>
					<li><span>①</span> 서비스는 회사 및 회사가 제공하는 재화와 용역의 소개를 내용으로 합니다.</li>
					<li><span>②</span> 제1항에도 불구하고, 회사는 서비스에서 제공한 정보의 정확성에 대하여 보증하지 않습니다. 회원은 서비스에서 취득한 정보를 의사결정에 이용하기 전 해당 정보를 신뢰할 수 있는지 여부에 대하여 회사에 문의하여야 할 의무가 있으며, 회사는 회원이 이러한 의무를 해태하고 서비스상의 정보를 신뢰함으로써 발생한 손해에 대하여 책임을 지지 않습니다.</li>
					<li><span>③</span> 회사는 회원에게 특정한 내용의 서비스를 제공하여야 할 의무를 부담하지 않으며, 기존에 제공된 서비스의 내용은 회사가 미래에 제공할 서비스의 내용을 보장하지 않습니다.</li>
					<li><span>④</span> 풀무원녹즙 홈페이지에서 서비스 외의 외부 웹페이지로의 링크를 직접 제공하더라도, 회사는 외부 웹페이지와 무관하며 이에 대한 관리∙감독 의무를 부담하지 않습니다. 회사는 회원이 외부 웹페이지를 이용하면서 형성한 법률관계에 있어서 어떠한 책임도 부담하지 않습니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제17조(서비스의 개시)</h4>
				<p>다른 특별한 사정이 없는 한, 회사는 회원의 회원가입 신청을 승인한 때부터 서비스를 개시합니다. 단, 서비스 중 일부는 지정된 때부터 개시할 수 있습니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제18조(서비스의 이용시간)</h4>
				<p>서비스의 이용시간은 연중무휴 1일 24시간을 원칙으로 합니다.</p>
				<p>회사는 서비스를 일정범위로 분할하여 각 범위 별로 이용 가능한 시간을 별도로 정할 수 있습니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title"> 제19조(서비스의 중지 및 변경)</h4>
				<ol>
					<li><span>①</span> 회사는 업무상 필요한 경우 서비스의 전부 또는 일부를 일정 기간 동안 중지할 수 있습니다.</li>
					<li><span>②</span> 회사는 서비스를 중지할 경우 해당 내용을 사전 또는 사후에 풀무원녹즙 홈페이지에 공지하거나 회원에게 통지합니다.</li>
					<li><span>③</span> 회사는 서비스의 향상을 위하여 별도의 통지 없이 서비스의 전부 또는 일부를 변경할 수 있습니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제20조(서비스상 정보의 제공)</h4>
				<ol>
					<li><span>①</span> 회사는 서비스를 운영하며 제공하고자 하는 각종 정보를 풀무원녹즙 홈페이지에 게재하거나 우편 및 전자적 전송매체를 이용하여 회원에게 전송할 수 있습니다.</li>
					<li><span>②</span> 제1항에도 불구하고, 회사가 전자적 전송매체를 이용하여 영리목적의 광고성 정보를 전송하고자 하는 경우 회원은 수신거부의사를 표시하거나 사전 동의를 철회할 수 있습니다. 이 경우 회사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률에서 정하는 내용을 준수합니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제21조(회원 작성 자료)</h4>
				<ol>
					<li><span>①</span> ① 회원 작성 자료에 대한 권리와 의무는 해당 회원에게 있습니다. 회사는 관련 법령에서 정한 사유가 아닌 한 회원 작성 자료에 관한 회원과 제3자 사이의 법률관계에 개입하지 않습니다.</li>
					<li><span>②</span>
						② 회사는 마케팅 등을 위하여 필요한 최소한의 범위 내에서 회원 작성 자료에 대하여 복제, 공연, 공중송신, 전시, 배포, 대여하거나 2차적 저작물을 작성할 수 있습니다. 이러한 범위 안에서 회원은 저작권법에 따라 회사 및 그 계열회사에 회원 작성 자료의 이용을 무상으로 허락한 것으로 간주합니다.</li>
					<li><span>③</span>
						③ 회원은 각자의 회원 작성 자료가 제3자의 권리를 침해하지 않도록 하여야 합니다. 회사는 회원 작성 자료의 제3자 권리 침해 여부에 대해서는 어떠한 적극적∙실질적 조사도 수행하지 아니하므로, 회원은 회원 작성 자료가 회사의 승인 절차를 거쳤다거나 일정 기간 동안 회사에 의하여 삭제되지 않았다는 등의 이유로 회사가 제3자에 대한 권리 침해에 기여한 것이라 주장할 수 없습니다.</li>
					<li><span>④</span>
						④ 회사가 회원으로부터 서비스 이용에 대한 대가를 지급받지 않는 한, 회사는 회원 작성 자료를 안전하게 보관할 의무를 부담하지 아니하며, 정책에 따라 회원 작성 자료를 삭제함으로써 발생하는 어떠한 책임도 부담하지 않습니다. 개별 회원은 필요 시 각자의 회원 작성 자료를 복제하여 별도의 장치에 안전하게 보관하여야 합니다.</li>
					<li><span>⑤</span>
						⑤ 회사는 회원 작성 자료가 다음 각 호의 경우에 해당한다고 판단되는 경우 사전 통지 없이 삭제할 수 있습니다.
						<ul>
							<li>1. 타인을 모욕, 비방, 비하하거나 타인의 명예를 훼손하는 게시물</li>
							<li>2. 범죄 및 불법 행위에 악용될 수 있는 정보를 담고 있는 게시물</li>
							<li>3. 타인의 저작권, 상표권 등 권리를 침해하는 게시물</li>
							<li>4. 음란물 또는 일반인의 성적 굴욕감이나 수치심을 유발할 수 있는 내용의 게시물(그러한 내용이 담긴 웹사이트, 앱 등으로 연결될 수 있는 게시물을 포함)</li>
							<li>5. 어린이와 청소년의 정신적, 신체적 건강을 해칠 우려가 있는 선정적인 내용을 담은 게시물</li>
							<li>6. 특정인의 개인정보가 노출된 게시물</li>
							<li>7. 특정 상품 등을 소개하여 판매하거나, 이를 구매, 사용하도록 권하거나 연락을 유도하는 등 직간접적으로 영리추구를 위한 내용을 담고 있는 게시물</li>
							<li>8. 사이버몰의 이용 목적에 부합하지 않거나 해당 서비스의 취지와 무관한 내용의 게시물</li>
							<li>9. 악성코드나 스파이웨어 등이 실행되어 다른 회원, 회사, 판매자 기타 제3자의 시스템 성능 저하, 개인정보 유출 등의 피해를 줄 수 있는 악의적인 코드를 담고 있는 게시물</li>
							<li>10. 정당한 사유 없이 회사의 영업을 방해하는 내용의 게시물</li>
							<li>11. 기타 이 약관 또는 법령에 위배되거나 공서양속에 반하는 내용의 게시물</li>
						</ul>
					</li>
					<li><span>⑥</span> 서비스상 일반에게 공개를 목적으로 제공된 정보로 사생활 침해나 명예훼손 등 회원의 권리가 침해된 경우 그 침해를 받은 회원은 고객센터에 침해사실을 소명하여 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 해당 정보의 삭제 또는 반박내용의 게재를 요청할 수 있습니다.</li>
					<li><span>⑦</span> 회사는 회원 작성 자료에 관한 정책을 별도로 정할 수 있습니다.</li>
					<li><span>⑧</span> 회원이 탈퇴하는 경우, 탈퇴 전에 작성한 게시물(댓글 포함)은 삭제되지 않습니다. 회원 탈퇴 시 회원정보가 삭제되어 작성자 본인을 확인할 수 없게 되므로 게시물에 대한 편집 또는 삭제가 원천적으로 불가하며, 게시물의 삭제를 원하는 회원은 반드시 회원 탈퇴 이전에 해당 게시물을 삭제하여야 합니다.</li>
					<li><span>⑨</span> 회원이 작성한 게시물은 상품 등의 연구개발, 판촉, 홍보 등의 목적으로 회사가 제휴한 타사에 복제, 배포, 전송 또는 전시될 수 있으며, 본질적인 내용에 변경을 가하지 않는 범위 내에서 수정, 편집될 수 있습니다. 이 경우 회사는 해당 게시물로부터 회원의 개인정보가 식별되지 않도록 필요한 조치를 합니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제 22조 (저작권의 귀속 및 이용제한)</h4>
				<ol>
					<li><span>①</span> 회사가 작성한 저작물에 대한 저작권 및 기타 지식재산권은 회사에 귀속합니다.</li>
					<li><span>②</span> 회사는 서비스와 관련하여 회원에게 회사가 정한 이용조건에 따라 계정, 아이디, 콘텐츠 등을 이용할 수 있는 이용권한만을 부여하며, 회원은 서비스를 이용함으로써 얻은 정보 중 회사에게 지식재산권이 귀속된 정보를 회사의 사전 승낙 없이 복제, 송신, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</li>

				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제 23조 (쿠폰)</h4>
				<ol>
					<li><span>①</span> 쿠폰은 회사가 무상으로 발행하는 할인 또는 증정을 위한 쿠폰으로 발행대상, 발행경로, 사용대상 등에 따라 구분될 수 있으며, 쿠폰의 세부구분, 할인금액(할인율), 사용방법, 사용기한 및 제한에 대한 사항은 할인쿠폰 또는 서비스 화면에 표시됩니다. 할인쿠폰의 종류 및 내용과 발급 여부는 회사의 서비스 정책에 따라 변경될 수 있습니다.</li>
					<li><span>②</span> 쿠폰은 현금으로 출금될 수 없으며, 할인쿠폰에 표시된 유효기간이 만료되거나 회원자격이 상실되면 소멸합니다.</li>
					<li><span>③</span> 쿠폰은 회사에서 별도로 명시한 경우를 제외하고는 타인에게 양도할 수 없으며, 부정한 목적이나 용도로 사용할 수 없습니다. 이를 위반한 경우 회사는 할인쿠폰을 소멸시키거나 회원자격을 제한 또는 상실시킬 수 있습니다.</li>
					<li><span>④</span> 회원이 부정한 방법으로 쿠폰을 획득한 사실이 확인될 경우, 회사는 회원의 쿠폰을 회수하고, 회원자격 상실(아이디 삭제) 및 민∙형사 상의 법적 조치 등을 취할 수 있습니다.</li>
				</ol>
			</div>
		</div>
		<!--e:repeat agree cont-->
		<!--s:repeat agree cont-->
		<div class="agree-cont">
			<h3 class="agree-title">제4장 기타사항</h3>
			<div class="agree-inner">
				<h4 class="agree-title">제24조(방어의무)</h4>
				<ol>
					<li><span>①</span> 회원의 행위로 인하여 제3자가 권리 침해를 이유로 회사에 소송이나 이의를 제기하는 경우, 해당 회원은 자신의 비용으로 회사를 방어하고 제3자에게 손해를 배상하여야 합니다.</li>
					<li><span>②</span> 회사의 최고에도 불구하고 해당 회원이 상당한 기간 내에 제1항의 방어의무를 이행하지 않는 경우, 회사는 자신의 비용으로 제3자의 청구를 방어할 수 있으며 이를 방어하기 위하여 지출한 재판상 또는 재판 외의 비용(변호사보수 등 사건 수행과 관련된 제반 비용을 포함합니다)을 해당 회원에게 구상할 수 있습니다. 이 경우 회사는 해당 회원에 대하여 그 비용의 선급을 청구할 수 있습니다.</li>
				</ol>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제25조(면책사항)</h4>
				<p>회사가 제공하는 서비스로 인하여 회원에게 손해가 발생한 경우 그러한 손해가 회사의 고의나 중과실에 기해 발생한 경우에 한하여 회사가 책임을 부담하며, 그 책임의 범위는 통상손해에 한합니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제26조(준거법)</h4>
				<p>이 약관의 준거법은 대한민국법으로 합니다.</p>
			</div>
			<div class="agree-inner">
				<h4 class="agree-title">제27조(관할법원)</h4>
				<ol>
					<li><span>①</span> 서비스 이용과 관련하여 회사와 회원 사이에 분쟁이 발생한 경우, 회사와 회원은 분쟁의 해결을 위해 1개월의 협의기간을 두어 성실히 협의합니다.</li>
					<li><span>②</span> 제1항의 협의에도 불구하고 분쟁이 해결되지 않을 경우, 양 당사자는 제1항의 협의기간이 도과한 후 대한민국 내의 법정 관할법원에 소를 제기할 수 있습니다.</li>
				</ol>
			</div>
		</div>
		<!--e:repeat agree cont-->

		<p>부칙 1. 이 약관은 2020년 3월 10일부터 시행합니다. </p><!-- 20200309 약관 문구 추가 -->
		<p>이전 약관은 공지사항에서 확인할 수 있습니다.</p>
		<!-- e: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
		<!-- e: 20200310 약관 수정 -->


		<!--e:repeat agree cont-->
	</div>
</div>

				</div>
				<div class="dropdown site-link" style="padding-block: 20px;
				    margin-top: 10px;
				    border-top: 1px solid #e5e5e5;
				    margin-inline: 10px;">
					<button class="btn dropdown-toggle" type="button" style="width: 230px" data-toggle="dropdown" aria-expanded="false">
						이용약관 변경이력
					</button>
					<div class="dropdown-menu" style="width: 230px">
						<a class="dropdown-item" data-idx="1" href="javascript:void(0)">2023-01-25 시행</a>
						<a class="dropdown-item" data-idx="2" href="javascript:void(0)">2020-03-10 시행</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<textarea id="noAvailTpl" style="display: none">	&lt;li&gt;
		&lt;div class="thumb"&gt;
			&lt;img src="/file/download{thumbnail}" /&gt;
		&lt;/div&gt;
		&lt;div class="contents" style="flex: 1; overflow: hidden;"&gt;
			&lt;p class="name" style="width: 100%; overflow: hidden; text-overflow: ellipsis;"&gt;{productName}&lt;span&gt;({capacity}{unit})&lt;/span&gt;&lt;/p&gt;
			&lt;div class="info"&gt;
				&lt;span class="price"&gt;&lt;b&gt;{price}&lt;/b&gt; 원&lt;/span&gt;
			&lt;/div&gt;
		&lt;/div&gt;
	&lt;/li&gt;
	</textarea>
<div class="modal fade" id="noAvailModal" tabindex="-1" aria-labelledby="noAvailModalLabel" aria-hidden="true">
	<div class="modal-dialog basic-width modal-dialog-centered">
		
		<div class="modal-content">
			<div class="modal-header" style="border:0; padding-bottom:16px;">
				<h5 class="modal-title" id="noAvailModalLabel"></h5>
				<button style="margin-right:-2px; margin-top:4px;" type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
					<img src="/resources/assets/images/common/btn_close.png">
				</button>
			</div>
			<p style="text-align: center; font-size:16px; font-weight:500; margin-bottom:20px; color:#333; margin-top:10px;">
				다음 상품은 현재 주문이 불가능하여 제외되었습니다.
				<span data-cancelable=""><br>담은 제품을 확인하시겠습니까?</span>
			</p>
			<p data-all-ignore="" style="display: none; text-align: center; font-size:16px; font-weight:500; margin-bottom:20px; color:#333; margin-top:10px;">
				다음 상품은 현재 <br>주문이 불가능합니다.
			</p>
			<ul class="product-content-list" style="margin-bottom:0;">
			</ul>
			<div class="button-set">
				<button class="button-basic black" data-btn="c" data-cancelable="">취소</button>
				<button class="button-basic primary" data-btn="o">확인</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="loading" tabindex="-1" aria-labelledby="loading" aria-hidden="true" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		</div>
	</div>
</div>