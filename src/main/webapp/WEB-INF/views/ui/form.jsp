<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form action="https://info.sweettracker.co.kr/tracking/5" target="_blank" style="display: none" id="sweet" method="post">
	<div class="form-group">
		<label for="t_key">API key</label> <input type="text" class="form-control" id="t_key" name="t_key" value="eq04nwS5eQul42h6BZig3Q" placeholder="제공받은 APIKEY">
	</div>
	<div class="form-group">
		<label for="t_code">택배사 코드</label> <input type="text" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드">
	</div>
	<div class="form-group">
		<label for="t_invoice">운송장 번호</label> <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
	</div>
	<button type="submit" class="btn btn-default">조회하기</button>
</form>