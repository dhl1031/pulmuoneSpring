package org.pro.pulmuone.controller.product;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.pro.pulmuone.domain.product.ProductsDTO;
import org.pro.pulmuone.mapper.product.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
			, @RequestParam(value = "pageNo", defaultValue = "1" ) String num) throws ClassNotFoundException, SQLException {
		log.info("daily" );
		int begin = Integer.parseInt(num);
		if(begin==2) {
			begin = 13;
		}else if(begin==3) {
			begin = 25;
		}else if(begin==4) {
			begin = 37;
		}
		int end = begin+11;		
		dto.setCategory_no(category_no);
		dto.setDelivery_type("daily");
		dto.setTags(tags);
		dto.setPageNo(Integer.toString(begin));
		dto.setPageNo2(Integer.toString(end));
		List<ProductsDTO> searchlist = this.mapper.search(dto);
		List<ProductsDTO> searchcountlist = this.mapper.searchcount(dto);
//		List<ProductsDTO> bestlist = this.mapper.best(dto);
		model.addAttribute("searchlist",searchlist);
		model.addAttribute("searchcountlist",searchcountlist);
//		model.addAttribute("bestlist",bestlist);				
		return "product/DailyList.tiles";
	}
	
	@RequestMapping("daily/{products_tag}")
	public String daliy(@PathVariable String products_tag, ProductsDTO productsDTO, Model model) throws ClassNotFoundException, SQLException {
		log.info("dailyView" );		
		productsDTO.setDelivery_type("daily");			
		List<ProductsDTO> list = this.mapper.view(productsDTO);
		model.addAttribute("list",list);
		return "product/DailyView.tiles";
	}
	
	@RequestMapping("box")
	public String box(ProductsDTO dto, Model model
			, @RequestParam(value = "category" ,required = false  ) String category_no
			, @RequestParam(value = "tags",required = false  ) String tags
			, @RequestParam(value = "pageNo", defaultValue = "1" ) String num) throws ClassNotFoundException, SQLException {
		log.info("box");
		int begin = Integer.parseInt(num);
		if(begin==2) {
			begin = 13;
		}else if(begin==3) {
			begin = 25;
		}else if(begin==4) {
			begin = 37;
		}
		int end = begin+11;		
		dto.setCategory_no(category_no);
		dto.setDelivery_type("box");
		dto.setTags(tags);	
		dto.setPageNo(Integer.toString(begin));
		dto.setPageNo2(Integer.toString(end));
		List<ProductsDTO> searchlist = this.mapper.search(dto);
		List<ProductsDTO> searchcountlist = this.mapper.searchcount(dto);
		List<ProductsDTO> bestlist = this.mapper.best(dto);
		model.addAttribute("searchlist",searchlist);
		model.addAttribute("searchcountlist",searchcountlist);
		model.addAttribute("bestlist",bestlist);				
		return "product/BoxList.tiles";
	}

	@RequestMapping("box/{products_tag}")
	public String box(@PathVariable String products_tag, ProductsDTO productsDTO, Model model) throws ClassNotFoundException, SQLException {
		log.info("boxView" );		
		productsDTO.setDelivery_type("box");			
		List<ProductsDTO> list = this.mapper.view(productsDTO);
		model.addAttribute("list",list);
		return "product/BoxView.tiles";
	}


}