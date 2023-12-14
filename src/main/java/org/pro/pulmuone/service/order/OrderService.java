package org.pro.pulmuone.service.order;

import java.util.List;

import org.pro.pulmuone.domain.order.OrderAddrBookDTO;

public interface OrderService {
	
	OrderAddrBookDTO getMemberInfo(String username);
	
	List<OrderAddrBookDTO> getAddrInfo(int member_no, int pageNo);

}
