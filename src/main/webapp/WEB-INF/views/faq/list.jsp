<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="page-content">
	<form id="searchForm">
		<input type="hidden" id="category" name="category" value="${param.category == null ? '' : param.category}">
		<div class="border-wrapper">
			<h2 class="container-title">
				FAQ
			</h2>
		</div>
		<div class="list-head" style="margin-bottom: 0; text-align: right;">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
          			<div><a href="/forum/faq/write">FAQ등록</a></div>
          	</sec:authorize>
        </div>
		<div class="coupon-srch" style="border-bottom:0; padding-bottom:0;">
			<div class="form-input none-dt">
				<dl>
					<dd>
						<input title="검색어 입력" type="text" id="searchKeyword" name="searchKeyword" placeholder="궁금하신 내용을 입력해주세요."  maxlength="30" autocomplete="off">
						<button class="btn-square" id="faqSearchBtn">검색</button>
					</dd>
				</dl>
			</div>
		</div>


		<div class="list-area">
			<div class="tab-area faq">
				<ul class="nav nav-tabs" role="tablist">

					<li>
						<a href="/forum/faq/list">TOP 10</a>
					</li>
					
						<li>
							<a href="/forum/faq/list?category=1">회원</a>
						</li>
					
						<li>
							<a href="/forum/faq/list?category=2" class="">혜택</a>
						</li>
					
						<li>
							<a href="/forum/faq/list?category=3" class="">주문/배송</a>
						</li>
					
						<li>
							<a href="/forum/faq/list?category=4" >상품</a>
						</li>
					
						<li>
							<a href="/forum/faq/list?category=5" class="">음용</a>
						</li>
					
						<li>
							<a href="/forum/faq/list?category=6" class="">기타</a>
						</li>
				</ul>
			</div>
			
			<c:if test="${ not empty param.searchKeyword }">
				<div class="search-result-box">
					<p><span>"${ param.searchKeyword }"</span> 검색결과 총 <span>${total }</span>건</p>
				</div>
			</c:if>
			<div class="accordion faq-list" id="pagable-list" data-list-object="replace">
				<c:choose>
					<c:when test="${ param.category == null || param.category == '' && searchKeyword eq '' && searchKeyword eq null }">
						<%@ include file="top10.jsp" %>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ list.size() eq 0 }">
								<div class="empty-area" style="padding: 160px 0">
									<img src="/resources/assets/images/ui/ico-alert.png" alt="empty">
									<b>등록된 목록이 없습니다.</b>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${ list }" var="item">
									<div class="card">
										<div class="card-header">
											<h2 class="mb-0" style="width: 100%">
												<button class="btn btn-link btn-block text-left"
													type="button" style="width: 100%">${ item.question }</button>
											</h2>
										</div>
										<div class="faq-contents-area">
											<div class="card-body">
												<p>
													<span
														style="font-family: Arial; color: rgb(119, 119, 119);"><span
														style="font-size: 13.3333px;">${ item.answer }</span></span>&nbsp;
												</p>
												<sec:authorize access="hasRole('ROLE_ADMIN')">
					                        			<button type="button" class="faqDelete" data-seq="${item.q_no }" style="margin-top: 10px; border: 1px solid #ccc;  padding: 0 20px; border-radius: 10px 0; float: right;">삭제</button>
					                        	</sec:authorize>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				
				
			</div>
			<c:if test="${ param.category != null }">
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
			</c:if>
			
		</div>
	</form>
</div>





<script>
	$(function(){
		$("#searchKeyword").focus();
		$("#searchKeyword").select();
		
		let cate = `${param.category == "" ? 0 : param.category}`;
 		
		$("#searchKeyword").val( `${param.searchKeyword }`);
		
		$(".faq .tab-area ul li a").removeClass("active");
		$(".faq .tab-area ul li").eq(cate).find("a").addClass("active");
		
		let $pageItem = $(".faq .pagenavi-area .pagination .page-item a");
		
		$pageItem.each(function(i, el) {
			let aparam = $(this).data("param");
			$(this).attr("href", `/forum/faq/list?category=${ param.category }&pageNo=\${aparam}`)
		})
		
		// faq delete 
		$(".faqDelete").on("click", function(e){
			e.preventDefault();
			let seq = $(this).data("seq");
			let params = `seq=\${seq}&category=${ param.category }&${_csrf.parameterName}=${_csrf.token}`
			 
			$.ajax({
				url: "/forum/faq/delete",
				dataType: "json",	
				type: "POST",
				data: params,
				cache: false,
			/* 	beforeSend : function(xhr){
					xhr.setRequestHeader(`${_csrf.parameterName}`, `${_csrf.token}`); 
				}, */
				success: function(data, textStatus, jqXHR){
					if( data.result == "success" ) {
						$(".modal-body").text("FAQ 글이 삭제 되었습니다.");	
						$("#alertModal").modal();
						
						$("#alertModal").on("click", function(e){
							location.href = data.url;
						})
					}else if( data.result == "failed"){
						$(".modal-body").text("FAQ 글 삭제가 실패되었습니다.");	
						$("#alertModal").modal();
						
					}
				},
				error: function(){
					console.log("error!");
				}
			});
		})
		
	
	})
</script>

