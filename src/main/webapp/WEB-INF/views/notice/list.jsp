<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="page-content">
	<div class="border-wrapper">
           <h2 class="container-title">
               공지사항
           </h2>
       </div>
	<div class="list-area" style="padding-top: 14px;">
		<div class="list-head flex" style="margin-bottom: 28px">
        	<em class="count">총 <span>${ totalRows }</span>건</em>
        	<u:isLogin>
        		<c:if test="${ auth.getName() == 'admin'}">
        			<div><a href="/forum/notice/write">글쓰기</a></div>
        		</c:if>  
        	</u:isLogin>
        </div>
					
		<table class="tbl-col event-winner-list">
           	 <tbody id="pagable-list" data-list-object="replace">
	             	<c:forEach items="${ list }" var="item">
	             		<tr>
	                       <td class="al">
	                           <a class="link-ellipsis" href="/forum/notice/view?seq=${ item.notice_no }">
	                                   ${ item.title }
	                               <span><fmt:formatDate value="${item.regdate}" pattern="yyyy.MM.dd" /> </span>
	                           </a>
	                       </td>
	                   </tr>
	             	</c:forEach>
               </tbody>
          </table>
                     
         	<nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
				<input type="hidden" id="pageNo" name="pageNo">
				<ul class="pagination">
					<c:forEach begin="${ paging.start }" end="${ paging.end }" step="1" var="i">
						<c:choose>
							<c:when test="${ i eq paging.currentPage }">
								<li class="page-item active">
									<a class="page-link active" data-param="${i }" >${i }</a>
								</li>	
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" data-list-more="#pagable-list" data-param="${i }">${i }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</nav>
    </div>        
</div>


<script>
	let $pageItem = $(".notice .pagenavi-area .pagination .page-item a");
	
	$pageItem.each(function(i, el) {
		let aparam = $(this).data("param");
		$(this).attr("href", `/forum/notice/list?pageNo=\${ aparam }`);
	})

</script>
