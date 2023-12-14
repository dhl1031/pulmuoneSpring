package org.pro.pulmuone.controller.modal;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.pro.pulmuone.domain.product.ProductsDTO;
import org.pro.pulmuone.mapper.modal.ModalMapper;
import org.pro.pulmuone.mapper.product.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/modal/*")
@Log4j
public class ModalController {
	
	@Autowired
	private ModalMapper mapper;
	
	@RequestMapping("preview/modalview")
	public String modalview(ProductsDTO dto, Model model						
			, @RequestParam(value = "num") String num) throws ClassNotFoundException, SQLException {
		log.info("modalview" );
		dto.setProducts_tag(Integer.parseInt(num));
		List<ProductsDTO> list = this.mapper.modalview(dto);
		model.addAttribute("list",list);
				
		return "modal/modalview.modal";
	}



}
