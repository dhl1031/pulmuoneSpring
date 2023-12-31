<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="Cart">

	<div id="container-wrapper" class="container-wrapper">
		<script type="text/javascript">

  $(function () {

    sessionStorage.removeItem('req1');
    sessionStorage.removeItem('req2');
    sessionStorage.removeItem('req3');
    
    function getItems(lbl) {
      var items = {};
      $("input[name='itemCode']").each(function (i, item) {
        var el = $(item);
        if (el.is(":checked") || el.is("[type='hidden']")) {
          var itemCode = el.val();
          if (singleYn) {
            items[itemCode] = [1, 1, 1, 1, 1];
          } else {
            var d = items[itemCode] || [0, 0, 0, 0, 0];
            d[i] += 1;
            items[itemCode] = d;
          }
        }
      })

      var orderItems = [];
      for (var key of Object.keys(items)) {
        orderItems.push({
          itemCode: key,
          [lbl]: items[key]
        });
      }
      return orderItems;
    }

    $('#orderBtn').click(function () {
        if (!window.is_signed) {
          alert('로그인이 필요한 서비스입니다.', function () {
            location.href = '/member/login?redirectUrl=' + encodeURIComponent(location.href);
          });
          return;
        }

        var orderItems = getItems('dayQty');
        if (orderItems.length === 0) {
          alert("상품을 선택해주세요.");
          return;
        }
        window.orderProcess({ item: orderItems });
      });

    $("#cartBtn").click(function () {
      var orderItems = getItems('qty');
      if (orderItems.length === 0) {
        alert("상품을 선택해주세요.");
        return;
      }
		var param = [];
		console.log(orderItems.length);
		for (var i = 0; i < orderItems.length; i++) {
	 		param.push(Object.values(orderItems)[i].itemCode);	
		}
	    axios.get('/cart/daily/save?products_no='+ encodeURIComponent(param.join(","))+'&item=1,1,1,1,1' ).then(function ({data}) {      
	    	confirmDesign("제품이 담겼습니다. 담은 제품을 확인하시겠습니까?");
	    }).catch(function (e) {
	      alert("서버와 연결이 올바르지 않습니다.");
	    })   
    });

  })
</script>

		<script>


var singleYn = "N" == 'Y';
var title = "${list[0].program_name }";
var itemCode = "${list[0].products_no}";
var data = {
      mobilehost: "http://localhost",
      webhost: "http://localhost/",
  title,
  result_path: location.pathname + location.search
};
$(document).ready(function () {
  $("[data-item-index]").each(function () {
    var subData = $(this).data();
    var ix = subData.itemIndex + 1;
    data["item_0" + ix + "_img"] = subData.itemImage;
    data["item_0" + ix + "_path"] = subData.itemLink;
    data["item_0" + ix + "_title"] = subData.itemTitle;
    data["item_0" + ix + "_desc"] = String(subData.itemDesc).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";

    console.log("!!!", subData);
  });

  window.kakaoShareData = {
    key: singleYn ? 85888 : 85887,
    data
  };
})

function sendKakao() {
  Kakao.Share.sendCustom({
    templateId: window.kakaoShareData.key,
    templateArgs: window.kakaoShareData.data,
  });
}

</script>
		<script type="text/javascript">
		  var nowArgs = undefined;
		  window.orderProcess = function (args) {
		    if (!window.is_signed) {
		      alertWithRedirect("로그인 후 이용가능합니다.", "/member/login?redirectUrl=" + location.href)
		      return;
		    }
		    nowArgs = args;

		    var codes = [];
		    for (var item of args.item) {
		      if (!item.itemCode) continue;
		      codes.push(item.itemCode);
		    }
		    
		    $("#orderModal ul").html("");
		    $("#orderModal").addClass("loading").modal("show");

		   location.href = "/daily/order/step1?item="+ encodeURIComponent(JSON.stringify(nowArgs));    
		   $("#orderModal").modal("hide").removeClass("loading");
		  }
$(document).on("click", "#orderModal button", function (e) {
  var type = $(this).attr("data-type");
  var p = encodeURIComponent(JSON.stringify(nowArgs));;
  if (type === "new") {
    location.href = "/daily/order/step1?item=" + p
  } else if (type === "continue") {
    var c = $("input[name='custnum']:checked");
    var custNumber = c.val();
    var prtnId = c.attr("data-prtn-id");
    location.href = "/mypage/drink/drink/change/" + custNumber + "/" + prtnId + "?item=" + p;
  }
})


</script>


		<div class="breadcrumb-style">
			<div class="container">
				<ul>
					<li><a>홈</a></li>
					<li><a class="active">맞춤큐레이션</a></li>
				</ul>
			</div>
		</div>

		<div class="container curation">

			<div class="curation-progress-bar">
				<ul>
					<li class="active"><b>01.</b>건강목표</li>
					<li class="active"><b>02.</b>식이섭취</li>
					<li class="active"><b>03.</b>생활습관</li>
				</ul>
			</div>

			<div class="question-part">
				<div class="title">
					<h3>
						당신에게 추천드리는 <b>맞춤 프로그램</b>
					</h3>
				</div>

				<div class="card-item">
					<div class="product-wrapper">
						<p style="margin-bottom: 12px">${list[0].program_name }</p>
						<ul class="product-list" id="order2">
							<c:forEach var="dto" items="${list }">
								<li data-item-index="0" data-item-link="product/daily/${dto.products_tag }" data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/${dto.system_name }" data-item-title="${dto.products_name }" data-item-desc="3500"><input value="${dto.products_no }" name="itemCode" type="hidden"> <a class="item" data-product-preview="${dto.products_tag }"> <label>${dto.dayweek}</label>
										<div class="thumb">
											<img src="/file/download/product/${dto.system_name }" alt="">
										</div>
										<div class="text-wrapper">
											<span>${dto.products_name }</span>
										</div>
								</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="button-set sm" style="margin: 20px 0px">
						<button id="cartBtn" class="button-basic black">장바구니</button>
						<button id="orderBtn" class="button-basic primary">주문하기</button>

					</div>
				</div>
				<div class="result-text">${list[0].program_content}</div>

				<div class="alert-area">
					<h4>생활습관 바꾸기</h4>
					<ul>
						<c:choose>
							<c:when test="${param.bmi lt 18.5 }">
								<li data-type="bmi">${list[0].lifestyle_change01 }</li>
							</c:when>
							<c:when test="${param.bmi le 18.5 or param.bmi lt 23.0 }">
								<li data-type="bmi">${list[0].lifestyle_change02 }</li>
							</c:when>
							<c:when test="${param.bmi le 23.1 or param.bmi lt 25.0 }">
								<li data-type="bmi">정상체중 범위에 들도록 현재의 식생활 행동에서 문제점을 찾고 행동 변화를 시도합니다.</li>
							</c:when>
							<c:when test="${param.bmi gt 25.1 }">
								<li data-type="bmi">${list[0].lifestyle_change03 }</li>
							</c:when>
						</c:choose>
						<li>대표적인 건강 위험 요인인 흡연! 자신과 사랑하는 사람들을 위해 금연을 시작합니다.</li>
					</ul>
				</div>

				<div class="button-set">
					<button class="button-basic border bottle prefix" onclick="location.href='/customer/product/result/${score}?singleYn=Y&bmi=${param.bmi}'">
						<i class="ico"></i> 내게 맞는 상품 추천
					</button>
					<button class="button-basic kakao prefix" onclick="javascript:sendKakao()">
						<i class="ico"></i> 카카오톡으로 공유
					</button>
				</div>


			</div>
		</div>
	</div>

</main>
<%@ include file="/WEB-INF/views/ui/productpreviewmodal.jsp"%>
