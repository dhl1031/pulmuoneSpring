<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
	<div class="thumb-normal">
		<img src="/file/download/product/${list[0].system_name }">
	</div>
</div>
<div class="modal-body">
	<div class="info-area">
		<h2>${list[0].products_name }</h2>
		<p>${list[0].products_sub_name}</p>
		<div class="product-addiction" style="border-bottom: none">
			<div class="price-item">
				<p>${list[0].price}<span>원</span>
				</p>
				<span>(${list[0].products_size })</span>
			</div>
		</div>
	</div>
	<div class="button-set">
		<a href="/product/daily/${list[0].products_tag}?eventIdx=" class="button-basic primary">상세보기</a>
	</div>
</div>
