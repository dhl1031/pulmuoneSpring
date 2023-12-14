package org.pro.pulmuone.service.order;

import java.util.List;

import org.pro.pulmuone.domain.order.AddrBookDTO;
import org.pro.pulmuone.domain.order.CouponDTO;
import org.pro.pulmuone.domain.order.HaveCouponDTO;
import org.pro.pulmuone.domain.order.box.BoxItemInfoDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderItemDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderProductsDTO;
import org.pro.pulmuone.domain.order.box.BoxPayDTO;
import org.pro.pulmuone.domain.order.box.BoxShipDTO;


public interface BoxOrderService {
	
	// 	상품 정보 가져오기
	List<BoxItemInfoDTO> selectItems(List<BoxOrderItemDTO> items);
	
	// 쿠폰 정보 가져오기
	List<CouponDTO> getCouponList(int member_no, int total_price);
	
	// 주문 테이블 데이터 추가
	int insertBoxOrder(BoxOrderDTO boxOrderDTO);
	
	// 주문 관련 테이블들 데이터 추가
	int insertBoxOrderTables(List<BoxOrderProductsDTO> boxOrderProductsList, BoxPayDTO boxPayDTO, BoxShipDTO boxShipDTO,int boxOrderNo);
	
	// 주소록 데이터 추가
	int insertAddrBook(AddrBookDTO addrBookDTO);
	
	// 쿠폰 사용 처리
	int updateHaveCoupon(List<HaveCouponDTO> couponList, int member_no, int box_pay_no);

	// 상품 정보 가져오기
	List<BoxItemInfoDTO> getBoxItemInfo(List<BoxOrderProductsDTO> boxOrderProductsList);
	

}
