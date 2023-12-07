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
@RequestMapping("/product/*")
public class CurationModalController {

//	/product/preview/modalview.do = servlets.curation.command.ModalView
	
	@Autowired
	private CurationMapper curationMapper;

	//모달창
	@RequestMapping("/preview/modalview")
	public String modals(
			KidsVO vo
			 , @RequestParam(value = "num") String num
//			, @RequestParam(value = "origin_name") String filed
//			, @RequestParam(value = "View") String query
			, Model model) throws ClassNotFoundException, SQLException {
		log.info("> Modal Start " );
		vo.setProducts_tag(Integer.parseInt(num));
		
//		vo.setOrigin_name(filed);
//		vo.setOrigin_name(query);
		List<KidsVO> list2 = this.curationMapper.select(vo);
		model.addAttribute("list2",list2);
		return "result/modalview.modal";
	}
	

}
