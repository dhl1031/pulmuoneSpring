package org.pro.pulmuone.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.pro.pulmuone.domain.order.OrderAddrBookDTO;

@Mapper
public interface OrderMapper {
	
	public OrderAddrBookDTO getMemberInfo(String username);
	
	public List<OrderAddrBookDTO> getAddrInfo(@Param("member_no") int member_no, @Param("pageNo") int pageNo);
	
}
