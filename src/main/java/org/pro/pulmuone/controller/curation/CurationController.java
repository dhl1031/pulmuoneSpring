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
@RequestMapping("/customer/*")
public class CurationController {

//	/customer/product/product.do = servlets.curation.command.Cstart
//	/customer/product/step1.do = servlets.curation.command.Step1
//	/customer/product/step2.do = servlets.curation.command.Step2
//	/customer/product/step3.do = servlets.curation.command.Step3	
	
	@Autowired
	private CurationMapper curationMapper;

	// 시작 페이지
	@RequestMapping("product")
	public String start() throws ClassNotFoundException, SQLException {
		log.info("> Curation Start");
		return "curation/product.tiles";
	}
	
	// step 1
	@RequestMapping("/product/step1")
	public String step1() throws ClassNotFoundException, SQLException {
		log.info("> Step1 Start");
		return "curation/step1.tiles";
	}
	
	// step 2
	@RequestMapping("/product/step2")
	public String step2() throws ClassNotFoundException, SQLException {
		log.info("> Step2 Start");
		return "curation/step2.tiles";
	}
	
	// step 3
	@RequestMapping("/product/step3")
	public String step3() throws ClassNotFoundException, SQLException {
		log.info("> Step3 Start");
		return "curation/step3.tiles";
	}
	
}
