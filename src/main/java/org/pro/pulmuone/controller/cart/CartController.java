package org.pro.pulmuone.controller.cart;

import java.sql.SQLException;
import java.util.List;

import org.pro.pulmuone.domain.cart.CartVO;
import org.pro.pulmuone.mapper.cart.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
public class CartController {
	
/*
/cart/daily.do = servlets.cart.command.CartDaily
/cart/box.do = servlets.cart.command.CartBox
 */
	
	@Autowired
	private CartMapper cartMapper;
	
	// 매일 장바구니, 키즈

	@RequestMapping("/daily")
	public String daily(CartVO vo, Model model) throws ClassNotFoundException, SQLException {
		
		log.info("> DailyCart Start");
		
		
		List<CartVO> list = this.cartMapper.daily(vo);
	
		model.addAttribute("list",list);
		return "cart/daily.tiles";
	}
	
	// 택배 장바구니	
	@RequestMapping("/box")
	public String box(CartVO vo, Model model ) throws ClassNotFoundException, SQLException {
		
		log.info("> BoxCart Start");
		List<CartVO> list = this.cartMapper.box(vo);
		model.addAttribute("list",list);
		return "cart/box.tiles";
	}

}
