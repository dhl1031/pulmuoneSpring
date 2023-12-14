<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
	<div class="page-content">
		
	       <div style="padding: 0" class="border-wrapper">
	           <h2 style="padding-bottom: 20px" class="container-title">
	               1:1 문의
	           </h2>
	           <a style="margin-bottom: 10px;margin-left: 10px; padding: 0 20px;" href="/forum/faq/list" class="rect-button black">FAQ보러가기</a>
	       </div>
	
	       <div class="page-addiction-wrapper" style="align-items: center; margin-bottom:20px;">
	             <div class="info-copy description">
	                 <p>총 <b>${ totalCount }</b>건</p>
	             </div>
	             <div class="form-input select sm">
	                 <dl>
	                     <dt style="display:flex; align-items: center;">문의유형</dt>
	                     <dd style="width:200px">
	                         <div class="dropdown inquiry-cate-select">
	                             <a class="btn dropdown-toggle" href="javascript:void(0)" role="button" data-toggle="dropdown" aria-expanded="false">
	                                 전체
	                             </a>
	                             <div class="dropdown-menu">
	                                 <a class="dropdown-item" data-value="" href="javascript:void(0)">전체</a>
	                                 <a class="dropdown-item" data-value="주문확인/변경" href="javascript:void(0)">주문확인/변경</a>
	                             
	                                 <a class="dropdown-item" data-value="배송" href="javascript:void(0)">배송</a>
	                             
	                                 <a class="dropdown-item" data-value="상품문의" href="javascript:void(0)">상품문의</a>
	                             
	                                 <a class="dropdown-item" data-value="결제" href="javascript:void(0)">결제</a>
	                             
	                                 <a class="dropdown-item" data-value="반품" href="javascript:void(0)">반품</a>
	                             
	                                 <a class="dropdown-item" data-value="홈페이지이용" href="javascript:void(0)">홈페이지이용</a>
	                             
	                                 <a class="dropdown-item" data-value="기타" href="javascript:void(0)">기타</a>
	                             </div>
	                         </div>
	                     </dd>
	                 </dl>
	             </div>
	             <a style="margin-left:10px;" href="/forum/inquiry/write" class="rect-button black">1:1 문의하기</a>
	         </div>
	
	        <form action="" method="post" id="inquiryForm">
	           <div class="input-group" style="margin-top:19px;">
	           
	           	<c:choose>
	           		<c:when test="${ totalCount < 1 }">
	           			 <div class="inquiry-list">
	                     <div class="caution-unit page">
	                         <span class="mark"></span>
	                         <p>작성한 1:1 문의가 없습니다.</p>
	                     </div>
	                 </div>
	           		</c:when>
	           	<c:otherwise>
	           		<div class="inquiry-list">
                     <table>
                        <colgroup>
                           <col width="120">
                           <col width="*">
                           <col width="120">
                           <col width="120">
                        </colgroup>
                        <thead>
                             <tr>
                                 <tr class="tb-header">
                                 <th class="t-left">문의유형</th>
                                 <th class="t-left">제목</th>
                                 <th>문의일자</th>
                                 <th>상태</th>
                             </tr>
                        </thead>
                        <tbody data-list-object="append" id="post-items">
                        	<c:forEach items="${list }" var="item">
                        		<tr>
                                  <td class="t-left">
                                      <b>${item.inquiry_cate }</b>
                                  </td>
                                  <td class="t-left"><a href="/mypage/inquiry/view?seq=${item.inquiry_no }&category=${ item.inquiry_cate}">${item.title }</a></td>
                                  <td class="number"><fmt:formatDate value="${item.regdate }" pattern="yyyy.MM.dd"/> </td>
                                  <td>
                                      <span class="status">${item.status == 0 ? '답변대기' : '답변완료'  }</span>
                                  </td>
                              </tr>
                        	</c:forEach>
                             
                        </tbody>
                     </table>
                  </div>
                  
					<nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="" style="margin-top:28px;">
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
	           	</c:otherwise>
	        </c:choose>
	                 
	      </div>
	   </form>       
	</div>
</div>
<script>
	$(function(){
		let currentCate = `${param.category}`;
		let deleted = `${param.result}`;
		
		let result = `${result}`;
		
		if( result == "deleted" ) {
			$(".modal-body").text("문의글이 삭제 되었습니다.");	
			$("#alertModal").modal();
		}
		
		if( ${param.category == null || param.category == ""} ) currentCate = "전체";  
		$(".inquiry-cate-select .dropdown-toggle").text(currentCate);
		$(".inquiry-cate-select .dropdown-item").on("click", function(){
			let val = $(this).data("value");
			if( val != "" ) {
				location.href = `/mypage/inquiry/list?category=\${ val }`;		
			}else {
				location.href = "/mypage/inquiry/list";
				
			}
		})
		
		let $pageItem = $(".pagenavi-area .pagination .page-item a");
			
		$pageItem.each(function(i, el) {
			let aparam = $(this).data("param");
			$(this).attr("href", `/mypage/inquiry/list?category=${ param.category }&pageNo=\${aparam}`)
		})
	})
</script>
