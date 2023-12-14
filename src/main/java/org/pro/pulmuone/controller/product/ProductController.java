package org.pro.pulmuone.controller.product;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.pro.pulmuone.domain.product.ProductsDTO;
import org.pro.pulmuone.mapper.product.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

  @GetMapping("daily")
  public String daliy(ProductsDTO dto, Model model, @RequestParam(value = "category", required = false) String category_no, @RequestParam(value = "tags", required = false) String tags, @RequestParam(value = "pageNo", defaultValue = "1") String num) throws ClassNotFoundException, SQLException {
	log.info("daily" + tags);
	int begin = Integer.parseInt(num);
	if (begin == 2) {
	  begin = 13;
	} else if (begin == 3) {
	  begin = 25;
	} else if (begin == 4) {
	  begin = 37;
	}
	int end = begin + 11;
	dto.setCategory_no(category_no);
	dto.setDelivery_type("daily");
	dto.setTags(tags);
	dto.setPageNo(Integer.toString(begin));
	dto.setPageNo2(Integer.toString(end));
	List<ProductsDTO> searchlist = this.mapper.search(dto);
	List<ProductsDTO> searchcountlist = this.mapper.searchcount(dto);
	List<ProductsDTO> bestlist = this.mapper.best(dto);
	model.addAttribute("searchlist", searchlist);
	model.addAttribute("searchcountlist", searchcountlist);
	model.addAttribute("bestlist", bestlist);
	return "product/DailyList.tiles";
  }

  @GetMapping("daily/{products_tag}")
  public String daliy(@PathVariable String products_tag, ProductsDTO dto, Model model) throws ClassNotFoundException, SQLException {
	log.info("dailyView");
	dto.setDelivery_type("daily");
	List<ProductsDTO> list = this.mapper.view(dto);
	model.addAttribute("list", list);
	return "product/DailyView.tiles";
  }

  @GetMapping("box")
  public String box(ProductsDTO dto, Model model, @RequestParam(value = "category", required = false) String category_no, @RequestParam(value = "tags", required = false) String tags, @RequestParam(value = "pageNo", defaultValue = "1") String num) throws ClassNotFoundException, SQLException {
	log.info("box");
	int begin = Integer.parseInt(num);
	if (begin == 2) {
	  begin = 13;
	} else if (begin == 3) {
	  begin = 25;
	} else if (begin == 4) {
	  begin = 37;
	}
	int end = begin + 11;
	dto.setCategory_no(category_no);
	dto.setDelivery_type("box");
	dto.setTags(tags);
	dto.setPageNo(Integer.toString(begin));
	dto.setPageNo2(Integer.toString(end));
	List<ProductsDTO> searchlist = this.mapper.search(dto);
	List<ProductsDTO> searchcountlist = this.mapper.searchcount(dto);
	List<ProductsDTO> bestlist = this.mapper.best(dto);
	model.addAttribute("searchlist", searchlist);
	model.addAttribute("searchcountlist", searchcountlist);
	model.addAttribute("bestlist", bestlist);
	return "product/BoxList.tiles";
  }

  @GetMapping("box/{products_tag}")
  public String box(@PathVariable String products_tag, ProductsDTO dto, Model model) throws ClassNotFoundException, SQLException {
	log.info("boxView");
	dto.setDelivery_type("box");
	List<ProductsDTO> list = this.mapper.view(dto);
	model.addAttribute("list", list);
	return "product/BoxView.tiles";
  }

  @GetMapping("search")
  public String search(ProductsDTO dto, Model model, @RequestParam(value = "pageNo", defaultValue = "1", required = false) String num) throws ClassNotFoundException, SQLException {
	log.info("search" + num);
	int begin = Integer.parseInt(num);
	if (begin == 2) {
	  begin = 13;
	} else if (begin == 3) {
	  begin = 25;
	} else if (begin == 4) {
	  begin = 37;
	} else if (begin == 5) {
	  begin = 49;
	} else if (begin == 6) {
	  begin = 61;
	} else if (begin == 7) {
	  begin = 73;
	} else if (begin == 8) {
	  begin = 85;
	} else if (begin == 9) {
	  begin = 97;
	}
	int end = begin + 11;
	dto.setPageNo(Integer.toString(begin));
	dto.setPageNo2(Integer.toString(end));
	List<ProductsDTO> list = this.mapper.search(dto);
	List<ProductsDTO> searchcountlist = this.mapper.searchcount(dto);
	model.addAttribute("list", list);
	model.addAttribute("searchcountlist", searchcountlist);
	return "product/search.tiles";
  }

  @RequestMapping("/daily/interest/{products_tag}")
  public String dailyinterest(@PathVariable String products_tag, ProductsDTO dto, Model model, Principal principal, @RequestParam(value = "classname", required = false) boolean name) throws ClassNotFoundException, SQLException {
	log.info("dailyinterest" + name);
	dto.setClassname(name);
	dto.setMember_id(principal.getName());
	dto.setProducts_tag(products_tag);
	int count = 0;
	if (name == true) {
	  count = this.mapper.wishdelete(dto);
	  this.mapper.wishupdate(dto);
	} else {
	  count = this.mapper.wishinsert(dto);
	  this.mapper.wishupdate(dto);
	}
	if (count == 1) {
	  log.info("성공");
	  return "product/DailyList.tiles";
	} else {
	  log.info("실패");
	  return "product/DailyList.tiles";
	}

  }

  @RequestMapping("/box/interest/{products_tag}")
  public String boxinterest(@PathVariable String products_tag, ProductsDTO dto, Model model, Principal principal, @RequestParam(value = "classname", required = false) boolean name) throws ClassNotFoundException, SQLException {
	log.info("boxinterest" + name);
	dto.setClassname(name);
	dto.setMember_id(principal.getName());
	dto.setProducts_tag(products_tag);
	int count = 0;
	if (name == true) {
	  count = this.mapper.wishdelete(dto);
	  this.mapper.wishupdate(dto);
	} else {
	  count = this.mapper.wishinsert(dto);
	  this.mapper.wishupdate(dto);
	}
	if (count == 1) {
	  log.info("성공");
	  return "product/BoxList.tiles";
	} else {
	  log.info("실패");
	  return "product/BoxList.tiles";
	}
  }

}
