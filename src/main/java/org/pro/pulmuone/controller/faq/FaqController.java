package org.pro.pulmuone.controller.faq;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.pro.pulmuone.domain.PageDTO;
import org.pro.pulmuone.domain.faq.FaqDTO;
import org.pro.pulmuone.service.faq.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/forum/faq/*")
@Log4j
public class FaqController {

	@Autowired
	private FaqService faqService;

	@GetMapping("list")
	public String faqList(
			@RequestParam(value = "category",  required = false, defaultValue = "1" ) int category
			, @RequestParam(value = "pageNo",  required = false, defaultValue = "1" ) int pageNo
			, @RequestParam(value = "searchKeyword",  required = false, defaultValue = "") String searchKeyword
			, Model model) {
		log.info("> FaqList.process..");

		int numberPerPage = 5; // 페이지당 글 수
		int totalPages = 0; // 총 페이지수
		int total = 0;
		int numberOfPageBlock = 5;
		
		PageDTO paging = null;
		
		ArrayList<FaqDTO> faqList = null;

		System.out.println(pageNo); 
		System.out.println(category);
		System.out.println(numberPerPage);
		System.out.println(searchKeyword);

		try {
			faqList = this.faqService.getFaqList(pageNo, category, numberPerPage,searchKeyword);
			totalPages = this.faqService.getFaqTotalPage(numberPerPage, category, searchKeyword);
			total = this.faqService.getFaqTotal(category, searchKeyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		paging = new PageDTO(pageNo, numberPerPage, numberOfPageBlock, totalPages);

		model.addAttribute("list", faqList);
		model.addAttribute("total", total);
		model.addAttribute("paging", paging);


		return "forum/faq/list.tiles";
	}
	
	// faq 쓰기
	@GetMapping("write")
	public String faqWriteGet() {
		log.info("> faqWriteGet..");
		return "forum/faq/write.tiles";
	}
	
	@PostMapping(value = "write", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, String> faqWritePost(FaqDTO dto, RedirectAttributes rttr) {
		log.info("> faqWritePost..");
		
		Map<String, String> map = new HashMap<>();
		int insertCount = 0;
		
		dto.setQ_no(0);
		
		try {
			insertCount = faqService.write(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if( insertCount != 1 ) {
			map.put("result", "failed");
			return map;
		}
		map.put("result", "success");
		map.put("url", "/forum/faq/list");
		return map;
	}
	
	// faq 삭제
	@PostMapping(value = "delete", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String,String> faqDelete(
			@RequestParam("seq") int seq
			, @RequestParam("category") int category ) {
		
		Map<String,String> map = new HashMap<>();
		
		int deleteCount = 0;
		try {
			deleteCount = faqService.delete(seq, category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if( deleteCount != 1 ) {
			map.put("result", "failed");
			return map;
		}
		
		map.put("result", "success");
		map.put("url", "/forum/faq/list?category=" + category);
		
		return map;
	}
	
}
