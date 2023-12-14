package org.pro.pulmuone.controller.order;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.pro.pulmuone.domain.order.AddrBookDTO;
import org.pro.pulmuone.domain.order.CouponDTO;
import org.pro.pulmuone.domain.order.HaveCouponDTO;
import org.pro.pulmuone.domain.order.OrderAddrBookDTO;
import org.pro.pulmuone.domain.order.box.BoxItemInfoDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderItemDTO;
import org.pro.pulmuone.domain.order.box.BoxOrderProductsDTO;
import org.pro.pulmuone.domain.order.box.BoxPayDTO;
import org.pro.pulmuone.domain.order.box.BoxShipDTO;
import org.pro.pulmuone.service.order.BoxOrderService;
import org.pro.pulmuone.service.order.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/box/order/*")
@Log4j
public class BoxOrderController {
	
	@Autowired
	private BoxOrderService boxOrderServiceImpl;
	
	@Autowired
	private OrderServiceImpl orderServiceImpl;
	
	
	@GetMapping("step1")
	public String step1(@RequestParam(name = "item") String itemsStr, Model model) {
		log.info("> BoxOrderController.step1 ...");
		
		// 1. 파라미터로 넘어온 상품 정보 출력
		ObjectMapper objectMapper = new ObjectMapper();
		
		// 파라미터로 넘어온 json String 변환
		// {"item":[{"itemCode":"0073561","qty":1}]} -> [{"itemCode":"0073561","qty":1}]
		itemsStr = itemsStr.substring(8, itemsStr.length()-1);
		
		List<BoxOrderItemDTO> items = null;
		List<BoxItemInfoDTO> itemInfos = null;
		int total_price = 0;
		try {
			// 장바구니 정보 json -> 객체로 가져오기
			items = Arrays.asList(objectMapper.readValue(itemsStr, BoxOrderItemDTO[].class));
			
			// 상품 정보 가져오기
			itemInfos = boxOrderServiceImpl.selectItems(items);
			
			// 주문 갯수 담기
			Iterator<BoxOrderItemDTO> ir = items.iterator();
			BoxOrderItemDTO item = null;
			BoxItemInfoDTO itemInfo = null;
			int index = 0;
			int qty = 0;
			while (ir.hasNext()) {
				item = (BoxOrderItemDTO) ir.next();
				qty = item.getQty();
				
				itemInfo = itemInfos.get(index);
				itemInfo.setProducts_cnt(qty);
				index++;
				total_price += itemInfo.getPrice() * qty;
			} // while
			
			// 상품 정보 전달
			model.addAttribute("itemInfos", itemInfos);
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}  
		

		// 2. 사용자 정보 출력
		// 현재 사용자의 인증 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        String username = "";
        // 사용자 id 가져오기
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            username = userDetails.getUsername();
        } // if
        
        // 사용자 정보 전달
        OrderAddrBookDTO member = orderServiceImpl.getMemberInfo(username);
		model.addAttribute("member", member);
		
		
		// 3. 쿠폰 리스트 전달
		List<CouponDTO> couponList = boxOrderServiceImpl.getCouponList(member.getMember_no(), total_price);
		model.addAttribute("couponList", couponList);
        
		return "order/box/step1.tiles";
	}
	
	
	@PostMapping("step2")
 	public String step2(BoxPayDTO boxPayDTO, BoxOrderProductsDTO boxOrderProductsDTO, BoxShipDTO boxShipDTO, String saveAddrChk
 							, HaveCouponDTO haveCouponDTO, Model model) {
		log.info("> BoxOrderController.step2 ...");
		
		// 1. member_no 가져오기
		// 현재 사용자의 인증 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		String username = "";
	    // 사용자 id 가져오기
	    if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
	    	UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	        username = userDetails.getUsername();
	    } // if
	    
        // member_no 저장
        OrderAddrBookDTO member = orderServiceImpl.getMemberInfo(username);
		int member_no = member.getMember_no();
		
		
		// 결제 방식에 따른 주문 상태 설정
		int box_order_status = 1;
		int pay_method = boxPayDTO.getBox_pay_method();
		if (pay_method==2) box_order_status = 0;
		boxPayDTO.setBox_pay_status(box_order_status-1);
		
		
		// 2. box_order 테이블 insert
		Date today = Date.valueOf(LocalDate.now());
		BoxOrderDTO boxOrderDTO = BoxOrderDTO.builder().member_no(member_no).box_order_status(box_order_status).box_order_date(today).build();
		int insertBoxOrderRowCount = boxOrderServiceImpl.insertBoxOrder(boxOrderDTO);
		
		
		// 3. boxOrderNo 가져오기
		int boxOrderNo = boxOrderDTO.getBox_order_no();
		
		// 4. box_order_products 테이블, box_pay 테이블, box_ship 테이블 insert
		List<BoxOrderProductsDTO> boxOrderProductsList = boxOrderProductsDTO.getBoxOrderProductsList();
		int insertBoxOrderTablesRowCount = boxOrderServiceImpl.insertBoxOrderTables(boxOrderProductsList, boxPayDTO, boxShipDTO, boxOrderNo);

		// 5. box_pay_no 가져오기
		int box_pay_no = boxPayDTO.getBox_pay_no();
		
		
		// 6. addr_book 테이블 insert
		if(saveAddrChk!=null && saveAddrChk.equals("on")) {
			AddrBookDTO addr = new AddrBookDTO().builder()
																		.addr(boxShipDTO.getBox_addr())
																		.addr_detail(boxShipDTO.getBox_addr_detail())
																		.addr_name(boxShipDTO.getBox_receiver())
																		.default_addr(0)
																		.dest(1)
																		.member_no(member_no)
																		.memo(boxShipDTO.getBox_memo())
																		.name(boxShipDTO.getBox_receiver())
																		.tel(boxShipDTO.getBox_tel())
																		.zip_code(boxShipDTO.getBox_zip_code())
																	.build();
			boxOrderServiceImpl.insertAddrBook(addr);
		};
		
		// 7. 사용한 쿠폰 정보 update
		if (haveCouponDTO.getHaveCouponList() != null) {
			int updateHaveCoupon = boxOrderServiceImpl.updateHaveCoupon(haveCouponDTO.getHaveCouponList(), member_no, box_pay_no);
		}
		
		// 8. 주문 정보 넘겨주기
		model.addAttribute("boxOrderDTO", boxOrderDTO);
		
		// 9. 주문한 상품 정보 넘겨주기
		List<BoxItemInfoDTO> boxItemInfoList = boxOrderServiceImpl.getBoxItemInfo(boxOrderProductsList);
		System.out.println(boxItemInfoList.get(0).getProducts_no());
		model.addAttribute("boxItemInfoList", boxItemInfoList);
		
		// 10. 배송 정보 넘겨주기
		model.addAttribute("boxShipDTO", boxShipDTO);
		
		// 11. 결제 정보 넘겨주기
		model.addAttribute("boxPayDTO", boxPayDTO);
		
		
		return "order/box/step2.tiles";
	}

}
