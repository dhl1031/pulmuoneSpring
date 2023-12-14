<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="page-content">
	
		<div class="border-wrapper">
			<h2 class="container-title">
				1:1 문의
			</h2>
		</div>
		
		<div class="page-addiction-wrapper" style="align-items: center;">
			<div class="info-copy description" style="margin-top:15px;">
				<p style="padding-left:2px;">음용중단/변경/현금영수증 처리 문의는 담당 가맹점에 연락해주시면 빠른 처리가 가능합니다.</p>
			</div>
		</div>

		<form action="" method="post" id="inquiryForm">
             <div class="input-group" style="margin-top:19px;">
                 <div class="form-input select">
                     <dl>
                         <dt style="padding-left:20px; padding-bottom:3px;"><label>문의유형</label></dt>
                         <dd>
                             <div class="dropdown">
                                 <a class="btn dropdown-toggle category" href="javascript:void(0)" role="button" data-toggle="dropdown" aria-expanded="false">주문확인/변경</a>
                                 <input type="hidden" name="inquiry_cate" id="cate1" value="주문확인/변경">
                                 <div class="dropdown-menu" id="dropdown-menu" style="">
                                     
                                         <a id="dropdown-item" class="dropdown-item dropdown-item-category category CONSULT_001" data-value="주문확인/변경" href="javascript:void(0)">주문확인/변경</a>
                                     
                                         <a id="dropdown-item" class="dropdown-item dropdown-item-category category CONSULT_003" data-value="배송" href="javascript:void(0)">배송</a>
                                     
                                         <a id="dropdown-item" class="dropdown-item dropdown-item-category category CONSULT_004" data-value="상품문의" href="javascript:void(0)">상품문의</a>
                                     
                                         <a id="dropdown-item" class="dropdown-item dropdown-item-category category CONSULT_006" data-value="결제" href="javascript:void(0)">결제</a>
                                     
                                         <a id="dropdown-item" class="dropdown-item dropdown-item-category category CONSULT_002" data-value="홈페이지이용" href="javascript:void(0)">홈페이지이용</a>
                                     
                                         <a id="dropdown-item" class="dropdown-item dropdown-item-category category INQUIRY_999" data-value="반품" href="javascript:void(0)">반품</a>
                                         
                                         <a id="dropdown-item" class="dropdown-item dropdown-item-category category CONSULT_007" data-value="기타" href="javascript:void(0)">기타</a>
                                     
                                 </div>
                             </div>
                         </dd>
                     </dl>
                 </div>
               
                <div class="test">
                    <div class="form-input select returnOrder" style="display: none;">
                        <dl>
                            <dt style="padding-left:20px; padding-bottom:3px;"><label>주문번호 선택</label></dt>
                            <input type="hidden" id="cate5" name="orderNum" />
                            <dd>
                                <div class="dropdown">
                                    <a class="btn dropdown-toggle orderNum" href="#" role="button" data-toggle="dropdown" aria-expanded="false" style="padding:0 19px 4px;">
                                        주문번호를 선택하세요
                                    </a>
                                    <input type="hidden" name="orderNum" id="cate2">
                                    <div class="dropdown-menu" id="orderNumList">
                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <span class="message mark-4" style="display: none">!</span><span class="message"></span>
                    </div>
                    <div class="product-selector returnOrder" style="display: none;">
                        <label>반품상품 선택</label>
                        <div>
                            <label class="check-type">
                                <input type="checkbox" id="select-all" name="productBox">
                                <span style="font-weight:300">전체선택</span>
                            </label>
                            <input type="hidden" name="cate3" id="cate3">
                            <ul class="product-content-list check-style" id="product-content-list" style="margin:0">
                            </ul>

                        </div>
                    </div>
                    <div class="form-input select returnOrder" style="display: none;">
                        <dl>
                            <dt style="padding-left:20px; padding-bottom:0px;"><label>반품 사유</label></dt>
                            <dd>
                                <div class="dropdown">
                                    <a class="btn dropdown-toggle reason" href="#" role="button" data-toggle="dropdown" aria-expanded="false" style="padding:0 19px 4px;">
                                        반품사유를 선택하세요
                                    </a>
                                    <input type="hidden" name="cate4" id="cate4">
                                    <div class="dropdown-menu">
                                        
                                            <a id="dropdown-item" class="dropdown-item dropdown-item-reason reason" data-value="BORR001" href="javascript:void(0)">단순변심</a>
                                        
                                            <a id="dropdown-item" class="dropdown-item dropdown-item-reason reason" data-value="BORR002" href="javascript:void(0)">다른 상품으로 재주문</a>
                                        
                                            <a id="dropdown-item" class="dropdown-item dropdown-item-reason reason" data-value="BORR003" href="javascript:void(0)">상품 훼손</a>
                                        
                                            <a id="dropdown-item" class="dropdown-item dropdown-item-reason reason" data-value="BORR004" href="javascript:void(0)">오배송</a>
                                        
                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <span class="message mark-6" style="display: none">!</span><span class="message"></span>
                    </div>

                    <div class="form-input selectc">
                        <dl>
                            <dt style="padding-left:20px; padding-bottom:3px;">
                                <label for="email">이메일주소</label>
                            </dt>
                            <dd>
                                <input type="hidden" id="emailAddHost" name="email" value="">
                                <input type="text" id="email" value="" name="email_first">
                                @
                                <input type="text" id="host" readonly="" name="host" value="">
                                <div class="dropdown" style="min-width:251px; flex:0;">
                                    <button class="btn dropdown-toggle email" href="#" role="button" data-toggle="dropdown" aria-expanded="false" style="padding:0 19px 4px;width: 100%;text-align: left">
                                        선택해주세요.
                                    </button>
                                    
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item email" data-value="naver.com" href="javascript:void(0)">naver.com</a>
                                        <a class="dropdown-item email" data-value="daum.net" href="javascript:void(0)">daum.net</a>
                                        <a class="dropdown-item email" data-value="hanmail.net" href="javascript:void(0)">hanmail.net</a>
                                        <a class="dropdown-item email" data-value="gmail.com" href="javascript:void(0)">gmail.com</a>
                                        <a class="dropdown-item email" data-value="nate.com" href="javascript:void(0)">nate.com</a>
                                        <a class="dropdown-item email" data-value="1" href="javascript:void(0)">직접 입력</a>
                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <span class="message" id="emailError"><span class="mark-1">!</span> <span class="txt"></span></span>
                    </div>
                </div>

            </div>

		<div class="board-type2">
			<div class="input-group" style="margin-top: 0">
				<div class="form-input error-wrap" >
					<dl>
						<dt style="padding-left:20px; padding-bottom:3px;"><label>제목</label></dt>
						<dd>
							<input name="title" value="" id="title" placeholder="제목을 입력하세요." type="text">
						</dd>
					</dl>
					<span class="message" id="titleError"><span class="mark-2" >!</span> 제목을 입력해주세요.</span>
				</div>
				<div class="form-input editor">
							
							<textarea maxlength="500" data-max="500" id="content" name="content" placeholder="내용을 입력하세요."></textarea>
							<!-- <input type="hidden" id="contents" name="contents"> -->
		
					<div class="count" id="word-count" ><span class="current-char">0</span> / <span class="maxtext">500</span></div>
				</div>
				<span class="message" id="contentsError"><span class="mark-2" >!</span> 내용을 입력해주세요.</span>
			</div>

			<div class="button-set b0 inquiry" style="margin-top:39px;">
				<button type="button" id="inquiryWriteBtn" data-toggle="modal" data-target="#alertModal" class="basic-big-button primary" style="min-width:280px; max-width:280px;">1:1 문의하기</button>
				<button type="button" id="cancelBtn" class="basic-big-button" style="margin-left:20px; min-width:280px; max-width:280px;">등록취소</button>
			</div>
			
		</div>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	</form>
</div>



<script>
	$(function(){
		
	
		// editor 
		const $wc = $("#word-count");
		let maxtext = 2000;
		$(".maxtext").text(maxtext);
		let currentChar = 0;
		let editor;
		ClassicEditor
	       .create( document.querySelector( '#content' ), {
					language: "ko",
	       	wordCount: {
	               onUpdate: stats => {
	                       
	                       const isLimit = maxtext < stats.characters;
	                       
	                       if( isLimit ) {
	                           $wc.find(".current-char").text(`-${stats.characters - maxtext}`);	
	                           $("#noticeWriteBtn").prop("disabled", true);
	                           $wc.find(".current-char").addClass("over");
	                       }else {
	                           $wc.find(".current-char").text( stats.characters );
	                           currentChar = stats.characters;
	                           $("#noticeWriteBtn").prop("disabled", false);
	                           $wc.find(".current-char").removeClass("over");
	                       }
	               },
	       	},
	           ckfinder: {
	                   uploadUrl : "/upload/inquiry",
	                   withCredentials: true
	               }	
	           })
	           .then(edt => {
	               editor = edt;
	           })
	       .catch( error => {
	           console.error( error );
	       } );
		
	
	
	       // inquiry select click
	       $(".dropdown-item-category").on("click", function(e){
	           e.preventDefault();
	           let val = $(this).data("value");
	           $(".dropdown-toggle.category").text(val);
	           $(":input[name=inquiry_cate]").val(val);
	       })
	
	       $(".dropdown-item.email").on("click", function(e){
	           e.preventDefault();
	           let val = $(this).data("value");
	           $("#email").trigger("emailtrg");
	           if( val == 1) {
	               $(":input[name=host]").prop("readonly", false);
	               $(".dropdown-toggle.email").text($(this).text());
	               $(":input[name=host]").val("");
	               $(":input[name=host]").focus();
	               return
	           }
	           $(":input[name=host]").prop("readonly", true);
	           $(".dropdown-toggle.email").text(val);
	           $(":input[name=host]").val(val);
	           
	       })
	       
	
		// title valid check
		$("#title").on("blur", function(){
			if( $(this).val() == "" ) {
				$("#titleError").css("visibility", "visible");
			}else {
				$("#titleError").css("visibility", "hidden");
			}
		})
	
	       $("#email").on("blur input emailtrg", function(){
	           if( emailIdCheck($(this)) == 1 ) {
	               $("#emailError .txt").text("이메일을 입력해 주세요.")
	               $("#emailError").css("visibility", "visible");
	           } else if( emailIdCheck($(this)) == 2 ) {
	               $("#emailError .txt").text("이메일을 정확히 입력해 주세요.")
	               $("#emailError").css("visibility", "visible");
	           } else {
	               $("#emailError").css("visibility", "hidden");
	           } 
		})
	
	       $(":input[name=host]").on("blur input", function(){
	           if( !emailAddrCheck($(this)) ) {
	               $("#emailError .txt").text("이메일을 정확히 입력해 주세요.")
	               $("#emailError").css("visibility", "visible");
	           }else {
	               $("#emailError").css("visibility", "hidden");
	           }
	       })
	       
	
	       function emailIdCheck ($id) {
	           // 1: 공백 체크, 2: 아이디체크
	           // /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	           let val = $($id).val();
	           let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*/i;
	           let emailValid = reg.test(val);
	           if( val == "" ){
	               return 1;
	           }else if( !emailValid ) {
	               return 2
	           }
	       }
	       function emailAddrCheck ($id) {
	           // /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	           let val = $($id).val();
	           let reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	           let emailValid = reg.test(val);
	           if( val == "" || !emailValid ) return false;
	
	           return true;
	       }
			
	       
	       // inquiry write btn
	       let submitOk = false;
	       $("#inquiryWriteBtn").on("click", function(){
	           if( emailIdCheck($("#email")) == 1 ) {
	               
	               $(".modal-body").text("이메일을 입력해 주세요.");
	               $("#alertModal").modal();
	               $("#email").focus();
	               return false;
	           } else if( emailIdCheck($("#email")) == 2 ) {
	               $(".modal-body").text("이메일을 정확히 입력해 주세요.");
	               $("#alertModal").modal();
	               $("#email").focus();
	               return false;
	           } else if( !emailAddrCheck( $("#host") ) ) {
	               $(".modal-body").text("이메일을 확인해 주세요.");
	               $("#alertModal").modal();
	               $("#host").focus();
	               return false;
	           } else if( $("#title").val() == "" ) {
	               console.log("aa")
	               $(".modal-body").text("제목을 입력해주세요.");
	               $("#alertModal").modal();
	               $("#title").focus();
	               
	               return false;
	           }else if( currentChar < 1 ) {
	               console.log("bb")
	               $(".modal-body").text("내용을 입력해주세요.");
	               $("#alertModal").modal();
	               editor.focus();
	               
	               return false;
	           }
				let emailId = $(":input[name=email_first]").val();
				let emailHost = $(":input[name=host]").val();
				$(":input[name=email]").val(emailId +'@' + emailHost);
				
				$(".modal-body").html(`
	        		   1:1상담이 등록되었습니다.<br>
	                   빠른 시일내에 답변 드리겠습니다	   
	           `);
				submitOk = true;
	       })
	       
	       $("#alertModal .modal-footer").on("click", function(){
	    	   if ( submitOk ) {
	    		   $("#inquiryForm").submit();
	    	   }else {
	    		   console.log("요청 실패.");
	    	   }
	       })
	});
</script>

</body>
</html>
