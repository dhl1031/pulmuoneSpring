<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="page-content">
	<div class="border-wrapper">
           <h2 class="container-title">
               공지사항
           </h2>
       </div>
	
	
	<div class="page-addiction-wrapper" style="align-items: center;">
		<div class="info-copy description" style="margin-top:15px;">
			<p style="padding-left:2px;">관리자 전용 공지사항 글수정</p>
		</div>
	</div>

	<form action="" method="post" id="noticeForm">
		<div class="board-type2">
			<div class="input-group" style="margin-top: 15px">
				<div class="form-input error-wrap" >
					<dl>
						<dt style="padding-left:20px; padding-bottom:3px;"><label>제목</label></dt>
						<dd>
							<input name="title" value="${vo.title }" id="title" placeholder="제목을 입력하세요." type="text">
						</dd>
					</dl>
					<span class="message" id="titleError"><span class="mark-2" >!</span> 제목을 입력해주세요.</span>
				</div>
				<div class="form-input editor">
							
							<textarea maxlength="500" data-max="500" id="content" name="content" placeholder="내용을 입력하세요.">${ vo.content }</textarea>
							<input type="hidden" id="contents" name="contents">
		
					<div class="count" id="word-count" ><span class="current-char">0</span> / <span class="maxtext">500</span></div>
				</div>
				<span class="message" id="contentsError"><span class="mark-2" >!</span> 내용을 입력해주세요.</span>
			</div>

			<div class="button-set b0 inquiry" style="margin-top:39px;">
				<button type="button" id="noticeEditBtn" data-toggle="modal" data-target="#alertModal" class="basic-big-button primary" style="min-width:280px; max-width:280px;">수정하기</button>
				<button type="button" onclick="javascript:history.back()" id="cancelBtn" class="basic-big-button" style="margin-left:20px; min-width:280px; max-width:280px;">취소</button>
			</div>
			
		</div>
	</form>

</div>
		


<script>
	$(function(){
		
	
		if( `${result}` == "failed" ) {
			$(".modal-body").text("공지사항 게시글이 수정되었습니다.");	
			$("#alertModal").modal();
		}
	
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
				uploadUrl : "/forum/notice/upload",
				withCredentials: true
			}	
			}).then(edt => {
					editor = edt;
				})
	       .catch( error => {
	           console.error( error );
	       } );
		
		// title valid check
		$("#title").on("blur", function(){
			if( $(this).val() == "" ) {
				$("#titleError").css("visibility", "visible");
			}else {
				$("#titleError").css("visibility", "hidden");
			}
		})
		
		// valid check
		$("#noticeEditBtn").on("click", function(e){
			e.preventDefault();
			if( $("#title").val() == "" ) {
				$(".modal-body").text("제목을 입력해주세요");
				$("#alertModal").modal();
				$("#title").focus();
				
				return false;
			}else if( currentChar < 1 ) {
				$(".modal-body").text("내용을 입력해주세요");
				$("#alertModal").modal();
				editor.focus();
				
				return false;
			}
			
			$("#noticeForm").submit();
		})
	})
</script>

</body>
</html>
