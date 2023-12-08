<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<body>

	<main class="Cart">

		<div id="container-wrapper" class="container-wrapper">
			<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->
			
<script type="text/javascript">
  var singleYn = 'N' == 'Y';
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
      addCarts("daily", orderItems);
    });

  })
</script>
			<script>
  var singleYn = "N" == 'Y';
  var title = "키즈";
  var data = {
    mobilehost: "localhost/",
    webhost: "localhost/",
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



			<script>
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

    axios.post(`/product_available`, { ids: codes }).then(function (r) {
      var o = r.data.RESULT_MSG;
      if (o.fails.length) {
        var itemCodes = o.fails.map(v => v.itemCode);
        var args2 = {
          item: args.item.filter(v => !itemCodes.includes(v.itemCode))
        };
        nowArgs = args2;
        $("#orderModal").modal("hide").removeClass("loading");
        showNotAvailModal(o.fails, function () {
          $("#orderModal ul").html("");
          $("#orderModal").addClass("loading").modal("show");

          if (o.fails.length == codes.length) {
            $("#orderModal").removeClass("loading").modal("hide");
            return;
          }

          get({url: '/order/daily/check/option'}, function (r) {
            if (typeof r.RESULT_MSG == 'object' && r.RESULT_MSG.length > 0) {
              let customerList = r.RESULT_MSG
              if (customerList.length > 5) {
                customerList = customerList.slice(0, 5)
              }

              var latno = 0;
              $.each(customerList, function (i, data) {
                var tpl = $("#orderPosLi").text();
                var nickname = data.nickname;
                if (!nickname) {
                  if (latno == 0) {
                    latno = customerList.filter(v => !!v.nickname).length
                  }
                  nickname = "음용 " + latno;
                  latno++;
                }
                tpl = tpl.replace(/\{nickname\}/g, nickname);
                tpl = tpl.replace(/\{custnumber\}/g, data.custnumber);
                tpl = tpl.replace(/\{prtnId\}/g, data.phiCustomerVo.prtnId);
                $("#orderModal ul").append(tpl);
              })
              $('#orderModal input[name=custnum]:first').click()
              $("#orderModal").removeClass("loading")
            } else {
              location.href = "/order/daily/step1?item=" + encodeURIComponent(JSON.stringify(args2));
            }
          });
        });
      }
      else {
        get({url: '/order/daily/check/option'}, function (r) {
          if (typeof r.RESULT_MSG == 'object' && r.RESULT_MSG.length > 0) {
            let customerList = r.RESULT_MSG
            if (customerList.length > 5) {
              customerList = customerList.slice(0, 5)
            }

            var latno = 0;
            $.each(customerList, function (i, data) {
              var tpl = $("#orderPosLi").text();
              var nickname = data.nickname;
              if (!nickname) {
                if (latno == 0) {
                  latno = customerList.filter(v => !!v.nickname).length
                }
                nickname = "음용 " + latno;
                latno++;
              }
              tpl = tpl.replace(/\{nickname\}/g, nickname);
              tpl = tpl.replace(/\{custnumber\}/g, data.custnumber);
              tpl = tpl.replace(/\{prtnId\}/g, data.phiCustomerVo.prtnId);
              $("#orderModal ul").append(tpl);
            })
            $('#orderModal input[name=custnum]:first').click()
            $("#orderModal").removeClass("loading")
          } else {
            location.href = "/order/daily/step1?item=" + encodeURIComponent(JSON.stringify(args));
          }
        });
      }
    });

  }

  $(document).on("click", "#orderModal button", function (e) {
    var type = $(this).attr("data-type");
    var p = encodeURIComponent(JSON.stringify(nowArgs));;
    if (type === "new") {
      location.href = "/order/daily/step1?item=" + p
    } else if (type === "continue") {
      var c = $("input[name='custnum']:checked");
      var custNumber = c.val();
      var prtnId = c.attr("data-prtn-id");
      location.href = "/mypage/drink/drink/change/" + custNumber + "/" + prtnId + "?item=" + p;
    }
  })
</script>
			<textarea id="orderPosLi" style="display: none">    &lt;li&gt;
        &lt;label class="item-wrapper"&gt;
            &lt;input name="custnum" type="radio" value="{custnumber}" data-prtn-id="{prtnId}" /&gt;
            &lt;div class="item"&gt;
                &lt;div class="contents"&gt;
                    &lt;p class="name"&gt;
                        {nickname} &lt;span style="margin-left: 0;"&gt;{custnumber}&lt;/span&gt;
                    &lt;/p&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/label&gt;
    &lt;/li&gt;
</textarea>

			<div class="modal" id="orderModal" tabindex="-1"
				aria-labelledby="orderModal" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header" style="padding-bottom: 8px;">
							<h5 class="modal-title" id="orderModalLabel">선택하세요</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body select-wrapper">
							<ul class="product-content-list order">

							</ul>
						</div>
						<div class="button-set">
							<button type="button" class="button-basic black"
								data-type="continue">기존 주문에 상품 추가</button>
							<button type="button" class="button-basic primary"
								data-type="new">신규 배송지로 주문</button>
						</div>
					</div>
				</div>
			</div>

			<div class="breadcrumb-style">
				<div class="container">
					<ul>
						<li><a>홈</a></li>
						<li><a class="active">맞춤큐레이션</a></li>
					</ul>
				</div>
			</div>

			<div class="container curation">

				<div class="question-part">
					<div class="title">
						<h3>	당신에게 추천드리는 <b>녹즙 프로그램</b></h3>
					</div>

					<div class="card-item">
						<div class="product-wrapper">

							<p style="margin-bottom: 12px">키즈</p>
							<ul class="product-list" id="order2">

								<li data-item-index="0" data-item-link="product/daily/430"
									data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20210923/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg"
									data-item-title="슈퍼키즈하이" data-item-desc="2000"><input
									value="0072840" name="itemCode" type="hidden"> <a
									class="item" data-product-preview="430"> <label>월</label>
										<div class="thumb">
											<img
												src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg"
												onerror="this.src='/resources/images/common/no_img.png'"
												alt="">
										</div>
										<div class="text-wrapper">
											<span>슈퍼키즈하이</span>
										</div>
								</a></li>

								<li data-item-index="1" data-item-link="product/daily/438"
									data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20220323/7bad52bc-f656-493c-856e-8ed41dc487dc.jpg"
									data-item-title="채소습관 케일" data-item-desc="1600"><input
									value="0072976" name="itemCode" type="hidden"> <a
									class="item" data-product-preview="438"> <label>화</label>
										<div class="thumb">
											<img
												src="/file/download/product/7bad52bc-f656-493c-856e-8ed41dc487dc.jpg"
												onerror="this.src='/resources/images/common/no_img.png'"
												alt="">
										</div>
										<div class="text-wrapper">
											<span>채소습관 케일</span>
										</div>
								</a></li>

								<li data-item-index="2" data-item-link="product/daily/430"
									data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20210923/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg"
									data-item-title="슈퍼키즈하이" data-item-desc="2000"><input
									value="0072840" name="itemCode" type="hidden"> <a
									class="item" data-product-preview="430"> <label>수</label>
										<div class="thumb">
											<img
												src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg"
												onerror="this.src='/resources/images/common/no_img.png'"
												alt="">
										</div>
										<div class="text-wrapper">
											<span>슈퍼키즈하이</span>
										</div>
								</a></li>

								<li data-item-index="3" data-item-link="product/daily/438"
									data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20220323/7bad52bc-f656-493c-856e-8ed41dc487dc.jpg"
									data-item-title="채소습관 케일" data-item-desc="1600"><input
									value="0072976" name="itemCode" type="hidden"> <a
									class="item" data-product-preview="438"> <label>목</label>
										<div class="thumb">
											<img
												src="/file/download/product/7bad52bc-f656-493c-856e-8ed41dc487dc.jpg"
												onerror="this.src='/resources/images/common/no_img.png'"
												alt="">
										</div>
										<div class="text-wrapper">
											<span>채소습관 케일</span>
										</div>
								</a></li>

								<li data-item-index="4" data-item-link="product/daily/430"
									data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20210923/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg"
									data-item-title="슈퍼키즈하이" data-item-desc="2000"><input
									value="0072840" name="itemCode" type="hidden"> <a
									class="item" data-product-preview="430"> <label>금</label>
										<div class="thumb">
											<img
												src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg"
												onerror="this.src='/resources/images/common/no_img.png'"
												alt="">
										</div>
										<div class="text-wrapper">
											<span>슈퍼키즈하이</span>
										</div>
								</a></li>

							</ul>
						</div>
						<div class="button-set sm" style="margin: 20px 0px">

								<form action="/cart/kidcart">
								<button id="cartBtn" class="button-basic black">장바구니</button>
								</form>

								<form action="/daily/order/step1" method="GET">
								<c:forEach var="dto" items="${list }">
									<input type="hidden" name="item"
										value='{"item":[{"itemCode":"${dto.products_no}, ${dto.products_no }","dayQty":[1,1,1,1,1]}]'>
								</c:forEach>
								<button id="orderBtn" class="button-basic primary">주문하기</button>
							</form>
						</div>

					</div>

				</div>
				<div class="result-text">우리 아이를 위한 대표 어린이녹즙 슈퍼키즈하이는 유기농 케일에
					사과, 오렌지 등 과일 농축액으로 맛까지 챙겼어요. 또한 면역력 증진과 함께 피부 건강에 도움을 줄 수 있다고 알려진
					알로에겔이 함유되어 있답니다.</div>

				<div class="button-set">
					<button class="button-basic kakao prefix"
						onclick="javascript:sendKakao()">
						<i class="ico"></i> 카카오톡으로 공유
					</button>
				</div>
			</div>

		</div>

		<div class="modal show" id="productPreviewModal" tabindex="-1"
			style="display: none; padding-left: 17px;" aria-modal="true"
			role="dialog">
			<div class="modal-dialog modal-dialog-centered" style="width: 430px;">
				<div class="modal-content modal-product">


					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close"></button>
						<div class="thumb-normal">
							<c:forEach var="list2" items="${list2 }">
								<img src="/file/download/product/${list2.system_name }">
							</c:forEach>
						</div>
					</div>

					<c:forEach var="list2" items="${list2}">
						<div class="modal-body">
							<div class="info-area">
								<h2>${list2.products_name }</h2>
								<p>${list2.products_sub_name}</p>
								<div class="product-addiction" style="border-bottom: none">
									<div class="price-item">
										<p>${list2.price}<span>원</span>
										</p>
										<span>(${list2.products_size })</span>
									</div>
								</div>
							</div>
							<div class="button-set">
								<a href="/product/daily/${list2.products_tag }"
									class="button-basic primary">상세보기</a>
							</div>
						</div>
					</c:forEach>
					
					
				</div>
			</div>
		</div>
	</main>
</body>
</html>