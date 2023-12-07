package org.pro.pulmuone.controller.curation;

import java.sql.SQLException;
import java.util.List;

import org.pro.pulmuone.domain.curation.CurationVO;
import org.pro.pulmuone.domain.curation.KidsVO;
import org.pro.pulmuone.mapper.curation.CurationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customer/product/*")
public class CurationResultController {


//	/customer/product/result/kids.do = servlets.curation.command.Kids
//	/product/preview/modalview.do = servlets.curation.command.ModalView
//	/customer/product/result/programs.do = servlets.curation.command.Program
//	/customer/product/result/products.do = servlets.curation.command.Product
	
	
	@Autowired
	private CurationMapper curationMapper;


	
	// 키즈 프로그램
	@RequestMapping("/result/kids")
	public String kids() throws ClassNotFoundException, SQLException {
		log.info(">Kids Start");
		return "curation/result/kids.tiles";
	}
	
	// 큐레이션 결과- 프로그램
	@RequestMapping("/result/programs")
	public String programs(CurationVO vo,  @RequestParam(value = "num") String num, Model model) throws ClassNotFoundException, SQLException {
		log.info("> Programs Start");
		vo.setProgram_no(Integer.parseInt(num));
		
		List<CurationVO> list = this.curationMapper.selectPG(vo);
		model.addAttribute("list", list);
		return "curation/result/programs.tiles";
	}
	
	// 큐레이션 결과- 상품
	@RequestMapping("/result/products")
	public String products() throws ClassNotFoundException, SQLException {
		log.info("> Products Start");
		return "curation/result/products.tiles";
	}
}
