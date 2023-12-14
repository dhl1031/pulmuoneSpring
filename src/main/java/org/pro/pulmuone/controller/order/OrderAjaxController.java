package org.pro.pulmuone.controller.order;

import java.util.List;

import org.pro.pulmuone.domain.order.OrderAddrBookDTO;
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

}
