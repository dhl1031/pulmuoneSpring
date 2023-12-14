package org.pro.pulmuone.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.pro.pulmuone.domain.order.AddrBookDTO;
import org.pro.pulmuone.domain.order.CouponDTO;
import org.pro.pulmuone.domain.order.HaveCouponDTO;
import org.pro.pulmuone.domain.order.box.BoxItemInfoDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderItemDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderProductsDTO;
import org.pro.pulmuone.domain.order.box.BoxPayDTO;
import org.pro.pulmuone.domain.order.box.BoxShipDTO;

@Mapper
public interface BoxOrderMapper {
	
	// 상품 정보 가져오기
	List<BoxItemInfoDTO> selectItems(@Param("items") List<BoxOrderItemDTO> items);
	
	// 쿠폰 정보 가져오기
	List<CouponDTO> getCouponList(@Param("member_no") int member_no, @Param("total_price") int total_price);
	
	// 주문 테이블 데이터 추가
	int insertBoxOrder(@Param("boxOrderDTO") BoxOrderDTO boxOrderDTO);
	
	// 주문 관련 테이블들 데이터 추가
	int insertBoxOrderProducts(@Param("boxOrderProductsList") List<BoxOrderProductsDTO> boxOrderProductsList, @Param("boxOrderNo") int boxOrderNo);

	int insertBoxPay(@Param("boxPayDTO") BoxPayDTO boxPayDTO);
	
	int insertBoxShip(@Param("boxShipDTO") BoxShipDTO boxShipDTO);
	
	// 주소록 데이터 추가
	int insertAddrBook(@Param("addrBookDTO") AddrBookDTO addrBookDTO);
	
	// 쿠폰 사용 처리
	int updateHaveCoupon(@Param("couponList") List<HaveCouponDTO> couponList, @Param("member_no") int member_no, @Param("box_pay_no") int box_pay_no);

	// 상품 정보 가져오기
	List<BoxItemInfoDTO> getBoxItemInfo(@Param("boxOrderProductsList") List<BoxOrderProductsDTO> boxOrderProductsList);
	
}
