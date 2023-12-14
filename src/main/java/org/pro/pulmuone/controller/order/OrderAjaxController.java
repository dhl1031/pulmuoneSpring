package org.pro.pulmuone.controller.order;

import java.util.List;

import org.pro.pulmuone.domain.order.OrderAddrBookDTO;
import org.pro.pulmuone.domain.order.daily.DailyItemInfoDTO;
import org.pro.pulmuone.service.order.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class OrderAjaxController {
	
	@Autowired
	private OrderServiceImpl orderServiceImpl;
	
	@GetMapping("/order/addrBook")
	public List<OrderAddrBookDTO> getAddrInfo(int member_no, int pageNo) {
		log.info("> OrderAjaxController.getAddrInfo ... 회원번호 : " + member_no + ", 페이지 : " + pageNo);
		return orderServiceImpl.getAddrInfo(member_no, pageNo);
	}
	
	@GetMapping("/order/productList")
	public List<DailyItemInfoDTO> getproductList(String searchKeyword, int pageNo) {
		log.info("> OrderAjaxController.getproductList ... 키워드 : " + searchKeyword + ", 페이지 : " + pageNo);
		return orderServiceImpl.getproductList(searchKeyword, pageNo);
	}

	@GetMapping(value="/order/franchise", produces = "application/text; charset=UTF-8")
	public String getFranchise(double latitude, double longitude, int fc_type) {
		log.info("> OrderAjaxController.getfranchise ... 위도 : " + latitude + ", 경도 : " + longitude + ", 가맹점 타입 : " + fc_type);
		return orderServiceImpl.getFranchise(latitude, longitude, fc_type);
	}
	
}
