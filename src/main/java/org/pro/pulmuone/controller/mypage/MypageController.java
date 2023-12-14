package org.pro.pulmuone.controller.mypage;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.pro.pulmuone.domain.product.ProductsDTO;
import org.pro.pulmuone.mapper.product.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/*")
@Log4j
public class MypageController {

	@Autowired
	private ProductMapper mapper;
	
	@GetMapping("mypage")
	public String login(HttpServletRequest request) {
		log.warn("> MypageController mypage()...");
			
		return "mypage/home/userSummmary.tiles";
	}
	
	@RequestMapping("mypage/product/list")
	public String wishlist(ProductsDTO dto, Model model, Principal principal) throws ClassNotFoundException, SQLException {
		log.info("wishlist" );		
		dto.setMember_id( principal.getName() );
		List<ProductsDTO> wishlist = this.mapper.wishlist(dto);
		model.addAttribute("wishlist",wishlist);
		return "product/list.tiles";
	}
	
	@RequestMapping("/mypage/product/delete")
	public String wishdelete(ProductsDTO dto, Model model, Principal principal
		,@RequestParam(value = "tag", required = false ) String tag) throws ClassNotFoundException, SQLException {
		log.info("wishdelete :::"+ tag);		
		dto.setMember_id( principal.getName() );
		dto.setProducts_tag(tag);
		dto.setClassname(true);

		this.mapper.wishdelete(dto);
		this.mapper.wishupdate(dto);
				
		return "product/list.tiles";
		
	}

}
