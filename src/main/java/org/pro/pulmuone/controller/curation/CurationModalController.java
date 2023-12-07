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
@RequestMapping("/product/preview/*")
public class CurationModalController {

//	/product/preview/modalview.do = servlets.curation.command.ModalView
	
	@Autowired
	private CurationMapper curationMapper;

	//모달창
	@RequestMapping("modalview")
	public String modals(@RequestParam(value = "products_tag") int products_tag, Model model) throws ClassNotFoundException, SQLException {
		log.info("> Modal Start");
		
		List<KidsVO> list2 = this.curationMapper.select(products_tag);
		model.addAttribute("list2",list2);
		return "curation/result/modalview.tiles";
	}
	

}
