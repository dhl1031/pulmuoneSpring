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
import org.springframework.web.bind.annotation.PathVariable;
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
//	@RequestMapping("/result/programs")
//	public String programs(CurationVO vo,  @RequestParam(value = "num") String num, Model model) throws ClassNotFoundException, SQLException {
//		log.info("> Programs Start");
//		vo.setProgram_no(Integer.parseInt(num));
//		
//		List<CurationVO> list = this.curationMapper.selectPG(vo);
//		model.addAttribute("list", list);
//		return "curation/result/programs.tiles";
//	}
	
	// 큐레이션 결과
	@RequestMapping("/result/{program_no}")
	public String products(CurationVO vo, Model model
			, @PathVariable String program_no
			, @RequestParam(value = "program_name") String  program_name
			, @RequestParam(value = "singleYn") String  singleYn) throws ClassNotFoundException, SQLException {
		
		log.info("> Curation Result Start");
		
		program_no= "";
		program_name = "";
		int score = 0;	
		
		
		// 점수..
		if(0< score && score <=6 ) {
			program_name = "간편한 하루";
			program_no = "1";
		}else if(7<= score && score <=12 ) {
			program_name = "상쾌한 하루";
			program_no = "2";
		}else if( 13<= score && score <=18 ) {
			program_name = "부드러운 하루";
			program_no = "3";
		}else if( 19<= score && score <=24) {
			program_name = "원활한 하루";
			program_no = "4";
		}else if( 25<= score && score <=30) {
			program_name = "반짝한 하루";
			program_no = "5";
		}else if( 31<= score && score <=36) {
			program_name = "균형있는 하루";
			program_no = "6";
		}else if( 37<= score && score <=41) {
			program_name = "가뿐한 하루";
			program_no = "7";
		}else if( 42<= score && score <=45) {
			program_name = "식사대용";
			program_no = "8";
		}

		vo.setProgram_no(Integer.parseInt(program_no));
		vo.setProgram_name(program_name);
		
		List<CurationVO> list = this.curationMapper.CurationSel(vo);
		model.addAttribute("list", list);

		if (singleYn == "Y") {
			return "curation/result/products.tiles"; 
		}else {
			return "curation/result/programs.tiles"; 
		}
		
	}
}
