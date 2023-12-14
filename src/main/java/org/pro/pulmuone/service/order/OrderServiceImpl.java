package org.pro.pulmuone.service.order;

import java.util.List;

import org.pro.pulmuone.domain.order.OrderAddrBookDTO;
import org.pro.pulmuone.domain.order.daily.DailyItemInfoDTO;
//github.com/dhl1031/pulmuoneSpring.git
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
	
	@Override
	public List<DailyItemInfoDTO> getproductList(String searchKeyword, int pageNo) {
		log.info("> OrderServiceImpl.getproductList...키워드 : " + searchKeyword + ", 페이지 : " + pageNo);
		return this.orderMapper.getproductList(searchKeyword, pageNo);
	}
	
	@Override
	public String getFranchise(double latitude, double longitude,  int fc_type) {
		log.info("> OrderServiceImpl.getFranchise... 위도 : " + latitude + ", 경도 : " + longitude + ", 가맹점 타입 : " + fc_type);
		return this.orderMapper.getFranchise(latitude, longitude, fc_type);
	}

}
