<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-content">
	<div class="border-wrapper">
        <h2 class="container-title">
            공지사항
        </h2>
    </div>
	<div class="board-type2">
		<div class="board-title">
			<b class="">${ vo.title }</b>
			<span class="text-day"><fmt:formatDate value="${vo.regdate}" pattern="yyyy.MM.dd" /> </span>
		</div>
	
	<div class="board-cont">
		${vo.content }
	 </div>
		<div class="btn-area-right" style="margin-top: 20px;">
			<u:isLogin>
				<c:if test="${ auth.getName() == 'admin'}">
					<button onclick="noticeModify()" class="btn-default btn-board-button btn-gray" style="color: #666;">수정</button>
					<button onclick="noticeDelete()" class="btn-default btn-board-button btn-gray" style="color: #666;">삭제</button>		
				</c:if>  
			</u:isLogin>
			<button onclick="location.href='/forum/notice/list'" class="btn-default btn-board-button btn-white">목록으로</button>
		</div>
	</div>
</div>


<script>
	function noticeModify() {
		location.href = `/forum/notice/edit.do?seq=${ param.seq }`;		
	}
	
	function noticeDelete()  {
		location.href = `/forum/notice/delete.do?seq=${ param.seq }`;
	}
	
	$(function(){
		
		if( `${result}` == "success" ) {
			$(".modal-body").text("공지사항 게시글이 수정되었습니다.");	
			$("#alertModal").modal();
		}
	})

</script>

</body>
</html>
