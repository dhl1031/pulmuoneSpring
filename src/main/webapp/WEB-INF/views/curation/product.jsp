<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<body>


	<div class="wrapper">

		<main class="step1">
			<div id="container-wrapper" class="container-wrapper">
				<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->

				<input type="hidden" name="customerType" /> <input type="hidden"
					name="value" />
				<div class="visual-area curation">
					<div class="container">
						<div class="txt-area">
							<p>나만을 위한</p>
							<h1>맞춤큐레이션</h1>
							<span>당신에게 맞는 녹즙 프로그램을 추천해드립니다.</span>
						</div>
					</div>
					<div class="bg-img"></div>
				</div>
				<div class="texture-depth">
					<div class="breadcrumb-style">
						<div class="container">
							<ul>
								<li><a>홈</a></li>
								<li><a class="active">맞춤큐레이션</a></li>
							</ul>
						</div>
					</div>
					<div class="selection-area">
						<div class="container">
							<div class="selector" style="padding: 95px 0px 120px">
								<div class="curation-depth" style="padding-top: 30px">
									<div class="text-wrapper" style="margin-bottom: 35px">
										<h3>
											<b>건강목표, 식이섭취, 생활습관</b>에 대해서<br /> 간단한 설문에 참여하시면 당신에게 맞는<br />
											녹즙 프로그램을 큐레이션 해드립니다.
										</h3>
									</div>
									<a href="/customer/product/step1" style="font-size: 16px"	class="button-basic primary sessionReset">맞춤큐레이션 시작</a>
								</div>
								<div class="kids-depth" style="padding-top: 30px">
									<div class="text-wrapper" style="margin-bottom: 35px">
										<h3>
											혹시<br /> <b>키즈제품</b>을 원하시나요?
										</h3>
									</div>
									
									<a href="/customer/product/result/kids?singleYn=N"
										class="button-basic border" style="font-size: 16px">키즈제품
										바로가기</a>
										
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</main>
	</div>
</body>
</html>