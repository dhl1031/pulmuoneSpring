function snsLoginCallback() {
  var url = $("input[name=redirectUrl]").val();
  if (url != undefined && url != "") {
    location.href = url;
    return;
  }
  location.href = "/";
}

function niceWindowOpen(name, data) {
  window.open(
      "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb?m=checkplusSerivce&EncodeData="
      + data, "nicePopup",
      'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, scrollbar=no');
}

function more(url, param, callback) {
  if (param === undefined || param === null) {
    param = {};
  }
  if (param.pageNo === undefined) {
    param.pageNo = 1;
  } else {
    param.pageNo = (parseInt(param.pageNo) + 1);
  }

  get({
    "url": url,
    "param": param
  }, function (response) {
    response = response.RESULT_MSG;
    callback(response);
  });
}

function showNotAvailModal(fails, onOk, onCancel) {
  var tpl = $("#noAvailTpl").text();
  $("#noAvailModal .product-content-list").html("");
  if (onCancel) {
    $("#noAvailModal [data-cancelable]").show();
    $("#noAvailModal [data-btn='c']").click(onCancel);
    $("#noAvailModal [data-all-ignore]").hide().prev().show();
  } else {
    $("#noAvailModal [data-cancelable]").hide();
    $("#noAvailModal [data-btn='c']").click(undefined);
    $("#noAvailModal [data-all-ignore]").show().prev().hide();
  }

  $("#noAvailModal [data-btn='o']").click(function () {
    $("#noAvailModal").modal("hide");
    if (onOk) onOk();
  });

  for (var fail of fails) {
    var t = tpl;
    for (var k of Object.keys(fail)) {
      var regex = new RegExp(`\\{${k}\\}`, 'g');
      if (k === "price") {
        t = t.replace(regex, String(fail[k]).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
      }
      else {
        t = t.replace(regex, fail[k]);
      }
    }
    $("#noAvailModal .product-content-list").append(t);
  }
  $("#noAvailModal").modal("show");
}

function addCartToServer(type, data, eventIdx) {
  var codes = [];
  for (var item of data) {
    if (!item.itemCode) continue;
    codes.push(item.itemCode);
  }

  axios.post(`/product_available`, { ids: codes }).then(function (r) {
    var o = r.data.RESULT_MSG;
	
    var lockIds = o.fails.map(x => x.itemCode);
    var target = data.filter(x => lockIds.indexOf(x.itemCode) < 0);         

    axios.post('/cart/save.do', {[type]: target, eventIdx}).then(function ({data}) {
      if (o.fails.length) {
        var nextDisabled = o.fails.length >= codes.length;
        showNotAvailModal(o.fails, nextDisabled ? undefined : function () {
          location.href = '/cart/' + type;
        }, nextDisabled ? undefined : function () {
          $("#noAvailModal").modal("hide");
        });
      } else {
        if (data.RESULT_ST == 'FAIL') {
          alert(data.RESULT_MSG);
        } else {
          $("[data-cart-size]").text(data.RESULT_MSG.cartSize);
          if (data.RESULT_MSG.cartSize > 0) {
            $("[data-cart-size]").removeClass("hide");
          } else {
            $("[data-cart-size]").addClass("hide");
          }
          confirmDesign("", data.RESULT_MSG.message, function () {
            location.href = '/cart/' + type;
          });
        }
      }
    }).catch(function (e) {
      alert("서버와 연결이 올바르지 않습니다.");
    })

  });

}

function addCart(type, itemCode, options) {
  var orderItems = [];
  if (type === 'daily') {
    var item = {itemCode, dayQty: options.dayQty || [1, 1, 1, 1, 1]};
    orderItems.push(item);
  } else {
    var item = {itemCode, qty: options.qty || 1};
    orderItems.push(item);
  }
  addCartToServer(type, orderItems, options.eventIdx);
}


/*
items = [{ code: '111', qty: 3 }] or [{ code: '111', qty: [1,1,1,0,0] }]
 */
function addCarts(type, items, eventIdx) {
  var orderItems = [];
  for (var item of items) {
    if (type === 'daily') {
      var dayQty = [1, 1, 1, 1, 1];
      if (item.qty) {
        if ($.isArray(item.qty)) {
          dayQty = item.qty;
        } else {
          dayQty = [item.qty, item.qty, item.qty, item.qty, item.qty];
        }
      }
      orderItems.push({
        itemCode: item.itemCode,
        dayQty
      });
    } else {
      orderItems.push({
        itemCode: item.itemCode,
        qty: item.qty
      });
    }
  }

  addCartToServer(type, orderItems, eventIdx);
}


function addLike(type, itemCode, options) {

}

(function ($) {

  $.fn.callText = function () {

    $(this).each(function (ix, el) {
      var elem = $(el);
      if (elem.is("input")) {
        if (elem.data("listener")) return;

//        console.log("!!!! ", el);

        var clone = elem.clone();
        clone.attr("name", "_x_" + clone.attr("name"));
        clone.removeAttr("data-call-text");
        clone.removeAttr("id");

        elem.parent().append(clone);
        $(el).attr("type", "hidden").data("listener", clone);

        clone.on("input", function (e) {
          var text = e.target.value;
          text = text.replace(/[^0-9]/g, '');
          if (text.startsWith("02")) {
            text = text.replace(/^(\d{2})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
          } else {
            text = text.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
          }
          elem.val(text.replace(/[^0-9]/g, ''));
          if (e.target.value != text) {
            clone.val(text);
          }
        });
      } else {
        var text = $(el).text().replace(/[^0-9]/g, '');
        if (text.startsWith("02")) {
          text = text.replace(/^(\d{2})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        } else {
          text = text.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }
        $(el).text(text);
      }
    })
  }

  $.fn.creditText = function () {

    $(this).each(function (ix, el) {
      var elem = $(el);
      if (elem.is("input")) {
        if (elem.data("listener")) return;

        console.log("!!!! ", el);

        var clone = elem.clone();
        clone.attr("name", "_x_" + clone.attr("name"));
        clone.removeAttr("data-credit-text");

        elem.parent().append(clone);
        $(el).attr("type", "hidden").data("listener", clone);

        clone.on("input", function (e) {
          var text = e.target.value;
          elem.val(text.replace(/[^0-9]/g, ''));
          text = text.replace(/[^0-9]/g, '').replace(/^(\d{4})(\d{4})(\d{4})(\d{3,4})$/, `$1-$2-$3-$4`);


          if (e.target.value != text) {
            clone.val(text);
          }
        });
      } else {
        $(el).text($(el).text().replace(/[^0-9]/g, '').replace(/^(\d{4})(\d{4})(\d{4})(\d{3,4})$/, `$1-$2-$3-$4`));
      }
    })
  }

  $(document).ready(function () {
    $(this).find("[data-call-text]").callText();
    $(this).find("[data-credit-text]").creditText();
  })

  $.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
      if (o[this.name] !== undefined) {
        if (!o[this.name].push) {
          o[this.name] = [o[this.name]];
        }
        o[this.name].push(this.value || '');
      } else {
        o[this.name] = this.value || '';
      }
    });
    return o;
  };

  $.fn.fddCarousel = function (options = {}) {
    this.index = 0;
    var jt = $(this);
    this.items = jt.find('[data-carousel="items"]>*');
    this.dots = jt.find('[data-carousel="dot"]>*');
    this.current = jt.find('[data-carousel="current"]');

    jt.find('[data-carousel="max"]').html(this.items.length);
    this.current.html(this.index + 1);

    this.applyTimeout = function (ms) {
      if (this.tk) {
        clearTimeout(this.tk);
      }
      this.tk = setTimeout(function () {
        that.move(1);
      }, ms);
    }

    this.onChangeIndex = function (ix) {
      this.index = ix;
      this.current.html(ix + 1);

      this.items.removeClass("left");
      this.items.removeClass("right");
      this.items.removeClass("active");
      this.dots.removeClass("active");

      $(this.items.get(ix)).addClass("active");
      $(this.dots.get(ix)).addClass("active");

      var lix = ix - 1;
      if (lix < 0) {
        lix = this.items.length - 1;
      }
      var rix = ix + 1;
      if (rix >= this.items.length) {
        rix = 0;
      }

      $(this.items.get(lix)).addClass("left");
      $(this.items.get(rix)).addClass("right");

      this.applyTimeout(options.auto);

    }.bind(this);
    this.onChangeIndex(0);

    this.move = function (gap) {
      var ix = this.index + gap;
      if (ix < 0) {
        ix = this.items.length - 1;
      } else if (ix >= this.items.length) {
        ix = 0;
      }
      this.onChangeIndex(ix);
    }.bind(this);

    var that = this;
    jt.find('[data-carousel="prev"]').click(function () {
      that.move(-1)
    });
    jt.find('[data-carousel="next"]').click(function () {
      that.move(1)
    });

    this.dots.on("click", function () {
      var ix = that.dots.index(this);
      if (ix - that.index != 0) {
        that.move(ix - that.index)
      }
    });

    if (options.activeClick) {
      this.items.on("click", function (e) {
        var ix = that.items.index(this);
        if (ix != that.index) {
          e.preventDefault();
          that.move(ix - that.index)
          return false;
        }
      })
    }

    if (options.auto) {
      this.applyTimeout(options.auto);
    }
  }

  $(document).on("click", "[data-toggle-view]", function () {
    var target = $($(this).attr("data-toggle-view"));
    if (target.css("display") === "none") {
      target.css("display", "block")
    } else {
      target.css("display", "none")
    }
  })

  $(document).on("click", "#ftc_link", function (e) {
    var h = $(this).attr("href");
    var p = window.open(h, 'ftc_link', 'width=750,height=700');
    p.focus();

    e.preventDefault();
    return false;
  })


let timer;
  window.alert = function (message, callback, okBtnText) {
    $("#alertModalLabel").html("");
    $("#alertModal .modal-body").html(message);
    $("#alertModal").modal('show');
    if (okBtnText) {
      $("#alertModal").find('.modal-footer').text(okBtnText);
    }
    if (callback && typeof callback == 'function') {
      $("#alertModal .modal-footer").on("click", function () {
        $("#alertModal").find('.modal-footer').text('확인');
        callback();
        $("#alertModal .modal-footer").off("click")

      });
    }
      $("#alertModal").on("hide.bs.modal", function () {
        $('#alertModal .modal-footer').removeClass('disabled')
        $('#alertModal .modal-footer').prop('disabled',false);
        $("#alertModal .modal-footer").off("click")
        $("#alertModal").find('.modal-footer').text('확인');
        clearTimeout(timer)
      });
  }

  window.alertWithRedirect = function (message, uri) {
    window.alert(message, function () {
      location.href = uri;
    })
  };

  window.confirmDesign = function (title, message, callback, option) {	
    const body = {
        title: !message ? '' : title,
      content: !message ? title : message,
    };
    $("#confirmModal .modal-title").html(body.title);
    $("#confirmModal .modal-body").html(body.content);
    $("#confirmModal").modal('show');

    if (callback&& typeof callback =='function') {
      $("#confirmModal .confirm").on("click", function () {
        callback()
        $("#confirmModal .confirm").off("click")
        $("#confirmModal").modal('hide');
      })
    }
  };

  $(document).on("click", "[data-cart-type][data-cart-id]", function (e) {
    var that = $(this);
    var type = that.attr("data-cart-type");
    var id = that.attr("data-cart-id");
    var eventIdx = that.attr("data-cart-event");
    if (id && type) {
      addCart(type, id, { eventIdx });
    }
    e.preventDefault();
    return false;
  });

  $(document).on("click", "[data-buy-type='box'][data-buy-id]", function (e) {

    var that = $(this);
    var itemCode = that.attr("data-buy-id");
    var eventIdx = that.attr("data-buy-event");

    var args = { item: [{itemCode, qty: "1", eventIdx }] };
    location.href = "/order/box/step1?item=" + encodeURIComponent(JSON.stringify(args));

    e.preventDefault();
    return false;
  });

  $(document).on("click", "[data-wish-type][data-wish-id]", function (e) {
    var that = $(this);
    var type = that.attr("data-wish-type");
    var id = that.attr("data-wish-id");

    if (!window.is_signed) {
      alert("로그인 후 찜한상품으로 담을 수 있습니다.", function () {
        location.href = "/member/login.do?redirectUrl=" + encodeURIComponent(location.href);
      });
      return false;
    }
      
    axios.post('/product/' + type + '/interest.do?tag=' + id).then(function ({data}) {
	
//      if (!data.ok) {
//        return;
//      }	

      if (!that.hasClass("active")) {
        $("[data-wish-type][data-wish-id='" + id + "']").addClass('active');
        alert("찜한상품에 담겼습니다.");
      } else {
        $("[data-wish-type][data-wish-id='" + id + "']").removeClass('active');
        alert("찜한상품이 해제되었습니다.");
      }
    }).catch(function (e) {
      alert("서버와 연결이 올바르지 않습니다.");
    })

    // addCarts(type, id, {});

    e.preventDefault();
    return false;
  });


  $(document).on("click", "[data-product-preview]", function (e) {
    var that = $(this);
    var id = parseInt(that.attr("data-product-preview"), 10);
	
    if (id) {
      $("#productPreviewModal .modal-content").html("");
      $("#productPreviewModal").addClass("loading").modal('show');

      $("#productPreviewModal .modal-content").load("/modal/preview/modalview?num=" + id, function () {
        $("#productPreviewModal").removeClass("loading");
      });
    }
    e.preventDefault();
    return false;
  });

  window.shareToKakao = function (title, uri) {	
    if (window.kakaoShareData) {	
		console.log(window.kakaoShareData.key);
	console.log(window.kakaoShareData.data);		
      Kakao.Share.sendCustom({
        templateId: window.kakaoShareData.key,
        templateArgs: window.kakaoShareData.data,
      });
      return;
    }
    var requestUrl = uri || location.href;
    if (requestUrl.substring(0, 1) === "/") {
      requestUrl = location.origin + requestUrl;
    }
    Kakao.Share.sendScrap({
      requestUrl: requestUrl,
      installTalk: true,
    });
  }

  $(document).ready(function () {
    var clipboard = new ClipboardJS('[data-clipboard-target]');
    clipboard.on('success', function(e) {
      e.clearSelection();
      $("#shareModal").modal("hide");
      alert("URL 복사되었습니다");
    });
  });

  $(document).ready(function () {
    if (window.pagableRender) {
      window.pagableRender(this);
    }
  });

  $(document).on("click", "[data-list-more]", function (e) {
    var that = $(this);
    var selector = that.attr("data-list-more");
    var nextPage = that.attr("data-param");
    var listTarget = $(selector);

    var path = location.origin + location.pathname;
    var qs = location.search.substring(1).split("&");
    path += "?pageNo=" + nextPage;

    $.each(qs, function (i, str) {
      if (str == "") return;
      if (str.indexOf("pageNo=") != 0) {
        path += "&";
        path += str;
      }
    });

    listTarget.addClass("page-loading");
    $("#loading").modal("show");
    axios.get(path).then(function (res) {
      var patt = /<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script\s*>/gi;

      var html = res.data;
      html = html.substring(html.indexOf("<body"));
      html = html.substring(0, html.indexOf("</body"));
      html = html.replace(patt, '');
      html = html.trim();

      var result = $(html);
      var items = result.find(selector + " > *");

      var pagination = result.find("[data-pagination]");

      if (pagination.length > 0) {
        // 페이지네이션일때
        that.parents("[data-pagination]").html(pagination.get(0).innerHTML);
      }
      else {
        // 더보기 일때
        var moreNext = result.find("[data-list-more]");
		if (items.length!=12) {          
          that.remove();
        } else {          
			that.attr("data-param", Number(nextPage)+1);
        }
//        if (!moreNext.length) {
		if (nextPage==4) {
          // 다음페이지가 빈거라면
          that.remove();
        } else {
          // 다음페이지 파라미터 가져다 붙이기
//          that.attr("data-param", moreNext.attr("data-param"));
			that.attr("data-param", Number(nextPage)+1);

        }
      }

      if (listTarget.attr("data-list-object") === "append") {
        listTarget.append(items);
      }
      else {
        listTarget.html(items);
        $(document).scrollTop(listTarget.offset().top);
        history.replaceState({}, "", path);
      }
      listTarget.removeClass("page-loading");
      if (window.pagableRender) {
        window.pagableRender(listTarget);
      }
    }).catch(function (e) {
      listTarget.removeClass("page-loading");
      that.remove();
    }).then(function () {
      $("#loading").modal("hide");
    });

  });

  $(document).on("click", ".btn-question:has(.show-body)", function (e) {
    var html = $(".show-body", this).html();
    $("#descModal .modal-title").text($(".show-body", this).attr("title"));
    $("#descModal .modal-body").html(html);
    $("#descModal").modal("show");
  })

  $(document).on('keyup blur','[data-receiver]',function (){
    const regex = /[^ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/;
    $(this).val($(this).val().replace(regex,''))
  })


})(jQuery);

// 세자리 수 마다 (,) 처리
var numberFormat = function(num) {
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
