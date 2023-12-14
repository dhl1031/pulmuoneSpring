package org.pro.pulmuone.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.pro.pulmuone.domain.order.OrderAddrBookDTO;
import org.pro.pulmuone.domain.order.daily.DailyItemInfoDTO;

@Mapper
public interface OrderMapper {
	
	public OrderAddrBookDTO getMemberInfo(String username);
	
	public List<OrderAddrBookDTO> getAddrInfo(@Param("member_no") int member_no, @Param("pageNo") int pageNo);
	
	public List<DailyItemInfoDTO> getproductList(@Param("searchKeyword") String searchKeyword, @Param("pageNo") int pageNo);
	
	public String getFranchise(@Param("latitude") double latitude, @Param("longitude") double longitude, @Param("fc_type")  int fc_type);
	
}
