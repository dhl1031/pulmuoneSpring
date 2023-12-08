<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<body>
	<div class="wrapper">		
		<main class="page">
		<div id="container-wrapper" class="container-wrapper">

<script type="text/javascript">
  function searchProduct(keyword) {
    $("input[name=searchKeyword]").val("");
    $("input[name=recommendKeyword]").val("");
    if ( keyword != undefined ) {
      $("input[name=recommendKeyword]").val(keyword);
    }
    $("#searchForm").submit();
  }

  $().ready(function () {
    $("#searchKeyword").focus();
    // 검색
    $(".btn-square").click(function () { movePage(0); });
    $("#searchKeyword").keyup(function (e) {
      if (e.keyCode == 13) {
        movePage(0);
      }
    });
  });
</script>

<form id="searchForm">
    <input type="hidden" name="recommendKeyword" value="">
    <input type="hidden" name="tagRecommendKeyword" value="">
    <input type="hidden" name="tagSearchKeyword" value="">
    <input type="hidden" name="gaRecommendKeyword" value="">
    <input type="hidden" name="gaSearchKeyword" value="">
    <!--S:cbody-->
    <div class="coupon-srch product-srch" style="border-bottom:0; padding-bottom:0;">
        <div class="form-input none-dt">
            <dl>
                <dt><label>검색</label></dt>
                <dd>
                    <input placeholder="검색어를 입력해주세요." title="검색어 입력" id="searchKeyword" name="searchKeyword" value="">
                    <a href="javascript:void(0);" class="btn-square">검색</a>
                </dd>
            </dl>
        </div>
        <div class="tag-place sm">
            
                <a class="item" href="javascript:void(0);" onclick="searchProduct('케일');">케일</a>
            
                <a class="item" href="javascript:void(0);" onclick="searchProduct('양배추');">양배추</a>
            
                <a class="item" href="javascript:void(0);" onclick="searchProduct('어린이');">어린이</a>
            
                <a class="item" href="javascript:void(0);" onclick="searchProduct('유산균');">유산균</a>
            
                <a class="item" href="javascript:void(0);" onclick="searchProduct('이달의제품');">이달의제품</a>
            
        </div>
    </div>
    <div class="container">
        <div class="list-area" style="padding-bottom:60px; padding-top: 30px;">
            <div class="list-head center" style="margin-bottom: 47px">
                <em class="count">
                    <span>‘’</span>
                    관련 검색결과 총
                    <span>90</span>건
                </em>
            </div>
            <!--S : 데이터 있는 경우-->
            
                <!--S: prd-list -->
                <div class="prd-list wrap">
<div class="prd-area">
    <a href="/product/daily/view.do?tag=281&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">            
                <span class="badge">BEST</span>
        </div>
        <div class="thumb">
            <img src="/file/download/product/f1dfce0b-663c-4486-a7a3-188f199ba502.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    위러브플러스
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,900
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="281" data-wish-type="daily" class="btn-round btn-white wishlistBtn active">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0071654" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=278&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">            
                <span class="badge">BEST</span>
        </div>
        <div class="thumb">
            <img src="/file/download/product/517eebaa-b721-4dba-b620-76689d2a25ab.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    러브미 케일&amp;셀러리녹즙
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,100
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="278" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0070680" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=273&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">            
                <span class="badge">BEST</span>
        </div>
        <div class="thumb">
            <img src="/file/download/product/a5e4ffc9-e98f-49a2-9371-2f2b9952dd9c.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    오! 생즙
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,700
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="273" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0072348" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=315&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">
        </div>
        <div class="thumb">
            <img src="/file/download/product/2476a7ea-a06c-4af4-a117-1666a39fe56f.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    식물성유산균 위&amp;캡슐
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,500
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="315" data-wish-type="daily" class="btn-round btn-white wishlistBtn active">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0070776" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=286&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">
        </div>
        <div class="thumb">
            <img src="/file/download/product/beac7448-cc5b-4f6d-b246-0fdc16c7ff2d.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    노니&amp;깔라만시 발효녹즙
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,500
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="286" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0072060" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=280&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">
        </div>
        <div class="thumb">
            <img src="/file/download/product/42f32473-d37b-4ef8-8fe7-7358a4ec4bd5.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    마시는새싹 발효녹즙
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,400
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="280" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0071823" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=316&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges"> 
        </div>
        <div class="thumb">
            <img src="/file/download/product/0512477d-b440-4adf-9cd3-3cc9ca29ab98.png" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    식물성유산균쌀요거트
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,300
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(150ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="316" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0070445" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=270&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">
        </div>
        <div class="thumb">
            <img src="/file/download/product/84556e6b-4304-4462-83ab-9d1bb7fda93d.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    유기케일녹즙
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,600
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="270" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0015701" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=277&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">
        </div>
        <div class="thumb">
            <img src="/file/download/product/83dc1b40-d2da-4fba-9853-0bef12bc65f7.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    돌미나리와민들레
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,800
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="277" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0070604" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=269&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">
        </div>
        <div class="thumb">
            <img src="/file/download/product/22a55137-45b0-4c17-8e75-cd7aabea80c9.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    당근녹즙
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        3,100
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="269" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0070564" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>    
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=312&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">  
        </div>
        <div class="thumb">
            <img src="/file/download/product/f9534e63-ccc8-4dc8-8e07-1d7243c308de.png" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    식물성유산균 오메가&amp;치아씨드
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,500
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="312" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0070800" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>
</div>
<div class="prd-area">
    <a href="/product/daily/view.do?tag=275&eventIdx=" title="제품 상세페이지로 가기">
        <div class="badges">    
        </div>
        <div class="thumb">
            <img src="/file/download/product/c34322b5-98d2-4e91-ac2d-fd094e310d19.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
        </div>
        <div class="prd-info">
            <div class="prd-title-wrapper">
                <b class="prd-title">
                    유기명일엽녹즙
                </b>
            </div>
                <div class="price-info" style="margin-bottom:5px;">
                    <b class="now-price">
                        2,800
                        <span> 원</span>
                    </b>
                </div>
                <span class="volume">(130ml)</span>
        </div>
    </a>
    <div class="btn-area btn-area-center">
        <button type="button" data-wish-id="275" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
            <i class="ico ico-prd-wish"></i>
            <span class="hide">제품 찜하기</span>
        </button>
                <button type="button" data-cart-id="0015601" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
                    <i class="ico ico-prd-cart"></i>
                    <span class="hide">장바구니에 담기</span>
                </button>
    </div>
    
</div>                  
                </div>
                <!--E: prd-list -->            
        </div>

    </div>
    <!--E:cbody-->
</form>
</div>
		</main>
	</div>	
</body>

</html>

