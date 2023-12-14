<%@ page trimDirectiveWhitespaces="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<body>

	<div class="wrapper">


		<main class="step1">
			<div id="container-wrapper" class="container-wrapper">
				<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->

				<script>

// BMI 계산
  function getBmi(w, h) {
    return (w / ((h * h) / 10000)).toFixed(2);
  }

  let historyItem = {}
  $(function () {
      if(sessionStorage.getItem('req1')){
          const prevReq1 = JSON.parse(sessionStorage.getItem('req1'))
//           console.log('req1', prevReq1) // {searchKeyword: ''}
          // var score = $(".checkGoal:checked").val();
         //console.log(score) // 숫자
          const prevReqKey = Object.keys(prevReq1)
          $('input[name=tallness]').val(prevReq1.tallness)
          $('input[name=weight]').val(prevReq1.weight)
          $('.filled-radio-group').children().each((i,v)=>{
//               console.log(prevReqKey)
              prevReqKey.forEach((value, index) => {
                  if(value===$(v).children().prop('name')){
                      $(v).children().prop('checked',true)
                  }
              })
             // console.log($(v).children().prop('name'))
          })

      }

    $(document).on('keyup', "input[name=tallness],[name=weight]", function () { // 키 소수점 1자리까지 입력 제한
      var value = $(this).val();

      var nExp = /[^0-9\.]/g;
      if (nExp.test(value)) {
//         console.log("set value", value, value.replace(/[^0-9\.]/g, ""))
        $(this).val(value.replace(nExp, ""));
      }
      var regExp = /^\d{0,10}(\.\d{0,1})?$/;
      if (!regExp.test(this.value)) {
        $(this).val(value.substring(0, value.length - 1));
      }
    });

    $('.bmi-chk').change(function () {
      if ($(this).prop('checked')) {
        $(".bmi-wrapper").addClass('active')
      } else {
        $(".bmi-wrapper").children().each((i, v) => $(v).val(undefined))
        $(".bmi-wrapper").removeClass('active')
      }
    })
  })
  
 
</script>


				<div class="breadcrumb-style">
					<div class="container">
						<div class="container">
							<ul>
								<li><a>홈</a></li>
								<li><a class="active">맞춤큐레이션</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container curation">
					<form action="">
						<div class="curation-progress-bar">
							<ul>
								<li class="active"><b>01.</b>건강목표</li>
								<li><b>02.</b>식이섭취</li>
								<li><b>03.</b>생활습관</li>
							</ul>
						</div>
						<div class="question-part">
							<div class="title">
								<h3>평소 관심있는 건강 목표를 선택하세요.</h3>
								<span>다수 항목 선택 가능</span>
							</div>
							<div class="filled-radio-group" id="health" value="all">



								<label class="item"> <input type="checkbox" name="1" value="1" class="checkGoal">
									<p>활력/피로</p>
								</label> <label class="item"> <input type="checkbox" name="2" value="2" class="checkGoal">
									<p>눈 건강</p>
								</label> <label class="item"> <input type="checkbox" name="3" value="3" class="checkGoal">
									<p>수면</p>
								</label> <label class="item"> <input type="checkbox" name="4" value="4" class="checkGoal">
									<p>장 건강</p>
								</label> <label class="item"> <input type="checkbox" name="5" value="5" class="checkGoal">
									<p>위 건강</p>
								</label> <label class="item"> <input type="checkbox" name="6" value="6" class="checkGoal">
									<p>체중 관리</p>
								</label> <input type="hidden" name="score" />

							</div>
						</div>



						<div class="question-part">
							<div class="title">
								<h3>키와 몸무게를 입력해 주세요.</h3>
							</div>
							<div class="curation-input-row">
								<div class="form-input" style="">
									<dl>
										<dt>
											<label>키</label>
										</dt>
										<dd>
											<input name="tallness" type="number" style="width: 50%; text-align: right" step="0.1" placeholder="예) 172.5 " onkeydown="javascript: return event.keyCode == 69 ? false : true" onblur="this.value=this.value.replace(/[^\d.-]/g,'')" /> <span>cm</span>
										</dd>
									</dl>
								</div>
								<div class="form-input" style="">
									<dl>
										<dt>
											<label>몸무게</label>
										</dt>
										<dd>
											<input name="weight" type="number" style="width: 50%; text-align: right" step="0.1" placeholder="예) 65.9 " onkeydown="javascript: return event.keyCode == 69 ? false : true" onblur="this.value=this.value.replace(/[^\d.-]/g,'')" /> <span>kg</span>
										</dd>
									</dl>
								</div>
							</div>
							<span style="margin-top: 12px; display: block; text-align: center;" class="description">키와 몸무게 정보는 큐레이션에만 활용되며 별도 저장되지 않습니다.</span>
						</div>
					</form>
					<div class="button-set">
						<button class="submit button-basic primary wide" id="nextPage">
							<!--              <a href="/customer/product/step2.do"></a> -->
							다음으로
						</button>
					</div>



					<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" style="display: none;">
						<div class="modal-dialog modal-dialog-centered">
							<div id="modal" class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="alertModalLabel"></h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">1개 이상의 목표를 선택해 주세요</div>
								<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>



				<script type="text/javascript">


//체크박스 선택 없으면 모달창
$("#nextPage").on("click", function() {

   if($("input:checkbox:checked").is(":checked") == true){
      var data = $("input:checkbox:checked").val();
      var score = 0;
       const requestBody = $('form').serializeObject();       
      $(".checkGoal:checked").each(function(){
         score +=   Number($(this).val());            
      });
      $("input[name=score]").val(score);      
      if (data.length > 0) {
         $(this).attr("checked", true);
      }
      $("#alertModal").hide();
       sessionStorage.setItem('req1',JSON.stringify(requestBody));       
      location.href= "/customer/product/step2"
   }else{       
      alert('1개 이상의 목표를 선택해 주세요');
   }   

})

</script>

			</div>


		</main>
	</div>
</body>
</html>