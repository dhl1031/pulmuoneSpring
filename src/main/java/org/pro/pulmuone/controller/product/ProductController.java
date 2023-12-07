package org.pro.pulmuone.controller.product;

import java.sql.SQLException;
import java.util.List;

import org.pro.pulmuone.domain.product.ProductsDTO;
import org.pro.pulmuone.mapper.product.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/product/*")
@Log4j
public class ProductController {
	
	@Autowired
	private ProductMapper mapper;
	
	@RequestMapping("daily")
	public String daliy(ProductsDTO dto, Model model
			, @RequestParam(value = "category",required = false  ) String category_no
			, @RequestParam(value = "tags",required = false  ) String tags
			) throws ClassNotFoundException, SQLException {
		log.info("daily" );
		dto.setCategory_no(category_no);
		dto.setDelivery_type("daily");
		dto.setTags(tags);		
		List<ProductsDTO> searchlist = this.mapper.search(dto);
		List<ProductsDTO> bestlist = this.mapper.best(dto);
		model.addAttribute("searchlist",searchlist);
		model.addAttribute("bestlist",bestlist);				
		return "product/DailyList.tiles";
	}
	@RequestMapping("box")
	public String box(ProductsDTO dto, Model model
			, @RequestParam(value = "category" ,required = false  ) String category_no
			, @RequestParam(value = "tags",required = false  ) String tags
			) throws ClassNotFoundException, SQLException {
		log.info("box");
		dto.setCategory_no(category_no);
		dto.setDelivery_type("box");
		dto.setTags(tags);	
		List<ProductsDTO> searchlist = this.mapper.search(dto);
		List<ProductsDTO> bestlist = this.mapper.best(dto);
		model.addAttribute("searchlist",searchlist);
		model.addAttribute("bestlist",bestlist);				
		return "product/BoxList.tiles";
	}



}
