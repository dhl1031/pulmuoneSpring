<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


	<div class="wrapper">

		<div class="contents-area">
			<div class="container">
				<div class="location">
					<a href="/">홈</a> <a href="/event/event/list">이벤트</a>
				</div>
				<div class="cont-event-area">
				
					<%@ include file="/WEB-INF/views/layouts/event/content/title_tab_area.jsp"%>

					<div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-t">
						<!--S:이벤트 상세-->
						<h3 class="hide">이벤트 상세</h3>
						<!--E:이벤트 상세-->
						<div class="board-default">
							<!-- 이벤트 정보 출력 -->
							<div class="board-area">
							    <div class="board-title" style="flex-direction: column; align-items: flex-start; border-bottom: none">
							        <b style="display: block">${event.event_name}</b> 
							        <em class="event">이벤트기간
							            <span class="text-day">${event.event_start} ~ ${event.event_end}</span>
							        </em>
							    </div>
							    <button type="button" class="btn-go-back" onclick="window.shareToKakao()">
							        <i class="ico ico-share"></i> <span class="offscreen">공유하기</span>
							    </button>
							</div>
							
							<!-- 이미지 정보 출력 -->
						    <div class="board-cont event-board" style="position: relative; min-height: 100px;">
						        <div id="content-editor-area" style="line-height: 0;">
						            <c:forEach var="image" items="${event.images}">
						                <c:choose>
						                    <c:when test="${not empty image.img_link}">
						                        <a href="${image.img_link}" target="_blank">
						                            <img src="${image.img_path}" title="${image.origin_name}"
						                                class="${image.system_name}" style="line-height: 0;">
						                        </a>
						                    </c:when>
						                    <c:otherwise>
						                        <img src="${image.img_path}" title="${image.origin_name}"
						                            class="${image.system_name}" style="line-height: 0;">
						                    </c:otherwise>
						                </c:choose>
						                <br style="clear: both;">
						            </c:forEach>
						        </div>
						    </div>

						    <c:if test="${event.event_cmt == 1}">
							    <%@ include file="/WEB-INF/views/layouts/event/content/comment_area.jsp"%>
							</c:if>

						</div>
						<div class="btn-area-right">
							<a href="/event/event/list" class="btn-default btn-white">목록으로</a>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>



<script>
var event_no = ${event.event_no};
$(document).ready(function() {
  if (event_no == 1) {
    var newElement = `
      <div style="background:#454545; text-align:center;">
        <a href="/product/daily/dailylist.do" style="display:inline-block;"><img src="/resources/assets/images/event/view/event_369_button01.png" style="line-height:0;"></a>
        <a href="/member/regist/type.do" style="display:inline-block;"><img src="/resources/assets/images/event/view/event_369_button02.png" style="line-height:0;"></a>
      </div>`;

    // 이미 생성된 button1, button2 이미지 태그를 제거
    $("#content-editor-area img[src*='event_369_button01.png'], #content-editor-area img[src*='event_369_button02.png']").remove();
    
    // 2번째 이미지 뒤에 삽입
    $("#content-editor-area img").eq(1).after(newElement);
  }
});
</script>
<script>
var event_no = ${event.event_no};
$(document).ready(function() {
  if (event_no == 2) {
    var newElement = `
    	<div style="position:absolute; left:50%; width:768px; top:512px; transform:translateX(-50%); ">
    		<a href="#" data-kakao-share="85513" style="width:50%; float:left;"><img src="/resources/assets/images/event/view/event_friend_button01.png" style="line-height:0;"></a>
    		<a href="/member/regist/type" style="width:50%; float:left;"><img src="/resources/assets/images/event/view/event_friend_button02.png" style="line-height:0;"></a>
    	</div>`;

    // 이미 생성된 button1, button2 이미지 태그를 제거
    $("#content-editor-area img[src*='event_friend_button01.png'], #content.editor-area img[src*='event_friend_button02.png']").remove();
    
    $("#content-editor-area").prepend(newElement);
  }
});
</script>


