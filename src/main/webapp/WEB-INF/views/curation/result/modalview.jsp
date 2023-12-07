<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach var="list2" items="${list2 }" begin="0" end="0"> --%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close"></button>
	<div class="thumb-normal">
		<img	src="/file/download/product/${list2.system_name }">
	</div>
</div>
<div class="modal-body">
	<div class="info-area">
		<h2>${list2.products_name }</h2>
		<p>${list2.products_sub_name}</p>
		<div class="product-addiction" style="border-bottom: none">
			<div class="price-item">

				<p>
					${list2.price}<span>원</span>
				</p>
	<span>(${list2.products_size })</span>
			</div>
		</div>
	</div>
	<div class="button-set">
		<a href="/product/daily/view?tag=${list2.products_tag}&eventIdx=" class="button-basic primary">상세보기</a>
	</div>
</div>
</c:forEach>
