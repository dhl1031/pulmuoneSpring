package org.pro.pulmuone.service.order;

import java.util.List;

import org.pro.pulmuone.domain.order.OrderAddrBookDTO;
import org.pro.pulmuone.mapper.order.OrderMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class OrderServiceImpl implements OrderService {

	private OrderMapper orderMapper;
	
	@Override
	public OrderAddrBookDTO getMemberInfo(String username) {
		log.info("> OrderServiceImpl.getMemberInfo...");
		return this.orderMapper.getMemberInfo(username);
	}

	@Override
	public List<OrderAddrBookDTO> getAddrInfo(int member_no, int pageNo) {
		log.info("> OrderServiceImpl.getAddrInfo...회원번호 : " + member_no + ", 페이지 : " + pageNo);
		return this.orderMapper.getAddrInfo(member_no, pageNo);
	}

}
