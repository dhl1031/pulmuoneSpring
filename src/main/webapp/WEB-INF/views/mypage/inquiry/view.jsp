<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
	<div class="page-content">
				
	      <div class="border-wrapper">
	                       <h2 class="container-title">
	                           1:1 문의
	                       </h2>
	                   </div>
	                   <div class="inquiry-area">
	                       <div class="board-title">
	                           <div class="content">
	                               <label>${vo.inquiry_cate }</label>
	                  <h2>${vo.title }</h2>
	                  <span><fmt:formatDate value="${vo.regdate }" pattern="yyyy.MM.dd"/></span>
	              </div>
	              <div class="status">
	                  <span>${vo.status == 0 ? '답변대기' : '답변완료'  }</span>
	              </div>
	          </div>
	      </div>
	
	      <div class="board-content question">
	          <span class="ellipse">Q.</span>
	          <div class="content">
	              <p>
	                  ${vo.content }
	              </p>
	              <ul class="thumb-list">
	                  
	              </ul>
	              <!-- 반품등록일 경우 상품 이미지 -->
	              <ul class="thumb-list" style="display: none">
						<li>
							<div class="thumb">
								<img src="http://placehold.it/100x100" onerror="this.src='/resources/images/common/no_img.png'">
							</div>
						</li>
					</ul>
                  </div>
              </div>
			
       		  <div class="board-content answer" style="display: none;">
		          <span class="ellipse">A.</span>
		          <div class="content">
		              <p>안녕하세요. 고객님. 하루 한 병 건강한 습관 풀무원녹즙입니다.
		          </div>
		      </div>
			
	      <!-- 만족도 평가가 등록되었습니다. 팝업 메세지-->
	      <div class="survey-form" style="padding:31px 32px 30px 28px; display: none">
	          <h3>
	              풀무원의 답변에 만족하셨나요?<br>
	              어떠셨는지 평가해주세요!
	          </h3>
	          <div class="radio-area radio-type2">
	              <div class="radio">
	                  <input type="radio" id="radio1" name="radio1" value="5">
	                  <label for="radio1">매우만족</label>
	              </div>
	              <div class="radio">
	                  <input type="radio" id="radio2" name="radio1" value="4">
	                  <label for="radio2">만족</label>
	              </div>
	              <div class="radio">
	                  <input type="radio" id="radio3" name="radio1" value="3">
	                  <label for="radio3">보통</label>
	              </div>
	              <div class="radio">
	                  <input type="radio" id="radio4" name="radio1" value="2">
	                  <label for="radio4">불만족</label>
	              </div>
	              <div class="radio">
	                  <input type="radio" id="radio5" name="radio1" value="1">
	                  <label for="radio5">매우불만족</label>
	              </div>
	          </div>
	          <div class="form-input counter none-dt" style="margin-top:26px;">
	              <dl>
	                  <dt><label>내용</label></dt>
	                  <dd>
	                      <div class="counter-wrapper">
	                          <input type="text" placeholder="더 나은 서비스를 위해 코멘트를 남겨주세요" id="evalContent" maxlength="100">
	                          <div class="count">0 / 100</div>
	                      </div>
	                      <button class="btn-square btn-white evalBtn" style="width:100px; font-size:16px; font-weight:400;" data-idx="5517129">확인</button>
	                  </dd>
	              </dl>
	          </div>
	      </div>
	
	      <div class="btn-area-right" style="padding-top:20px;">
	          <button class="btn-default btn-white" style="width:140px; font-size:15px;" onclick="location.href='/mypage/inquiry/list.do'">목록으로</button>
	          <button type="button" class="btn-default btn-black deleteBtn" style="width:140px; font-size:15px;">삭제하기</button>
	      </div>
	      <form id="inquiryDeleteForm">
	      		<input type="hidden" name="seq" value="${vo.inquiry_no }" />
	      		<input type="hidden" name="category" value="${vo.inquiry_cate }" />
	      		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	      </form>
		</div>
</div>



<script>
	$(function(){
		let result = `${result}`;
		
		if( result == "failed" ) {
			$(".modal-body").text("문의글 삭제가 실패되었습니다.");	
			$("#alertModal").modal();
		}
		
		$(".deleteBtn").on("click", function(){
			$("#confirmModal").modal();
		})
		$(".confirm").on("click", function(e){
			let seq = $(":input[name=seq]").val();
			let category = $(":input[name=category]").val();

			$("#inquiryDeleteForm")
			.attr("action", `/mypage/inquiry/delete`)
			.attr("method", "post")
			.submit();
		})
	})
	
</script>


