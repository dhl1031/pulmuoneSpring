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
import org.pro.pulmuone.mapper.order.BoxOrderMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoxOrderServiceImpl implements BoxOrderService {

	private BoxOrderMapper boxOrderMapper;
	
	@Override
	public List<BoxItemInfoDTO> selectItems(List<BoxOrderItemDTO> items) {
		log.info("> BoxOrderServiceImpl.selectItems...");
		return this.boxOrderMapper.selectItems(items);
	}

	@Override
	public List<CouponDTO> getCouponList(int member_no, int total_price) {
		log.info("> BoxOrderServiceImpl.getCouponList... 회원번호 : " + member_no);
		return this.boxOrderMapper.getCouponList(member_no, total_price);
	}

	@Override
	public int insertBoxOrder(BoxOrderDTO boxOrderDTO) {
		log.info("> OrderServiceImpl.insertBoxOrder...");
		return this.boxOrderMapper.insertBoxOrder(boxOrderDTO);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int insertBoxOrderTables(List<BoxOrderProductsDTO> boxOrderProductsList, BoxPayDTO boxPayDTO, BoxShipDTO boxShipDTO, int boxOrderNo) {
		log.info("> OrderServiceImpl.insertBoxOrderProducts...");
		boxPayDTO.setBox_order_no(boxOrderNo);
		boxShipDTO.setBox_order_no(boxOrderNo);
		int rowCnt = this.boxOrderMapper.insertBoxOrderProducts(boxOrderProductsList, boxOrderNo);
		rowCnt += this.boxOrderMapper.insertBoxPay(boxPayDTO);
		rowCnt += this.boxOrderMapper.insertBoxShip(boxShipDTO);
		return rowCnt;
	}

	@Override
	public int insertAddrBook(AddrBookDTO addrBookDTO) {
		log.info("> OrderServiceImpl.insertAddrBook...");
		return this.boxOrderMapper.insertAddrBook(addrBookDTO);
	}

	@Override
	public int updateHaveCoupon(List<HaveCouponDTO> couponList, int member_no, int box_pay_no) {
		log.info("> OrderServiceImpl.updateHaveCoupon...");
		return this.boxOrderMapper.updateHaveCoupon(couponList, member_no, box_pay_no);
	}

	@Override
	public List<BoxItemInfoDTO> getBoxItemInfo(List<BoxOrderProductsDTO> boxOrderProductsList) {
		log.info("> BoxOrderServiceImpl.getBoxItemInfo...");
		return this.boxOrderMapper.getBoxItemInfo(boxOrderProductsList);
	}
	

}
