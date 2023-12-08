package org.pro.pulmuone.controller.faq;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.PageDTO;
import org.pro.pulmuone.domain.faq.FaqDTO;
import org.pro.pulmuone.mapper.faq.FaqMapper;
import org.pro.pulmuone.service.faq.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/forum/faq/*")
@Log4j
public class FaqController {
	/*
	 /forum/faq/list.do=servlets.faq.command.FaqList
	/forum/faq/write.do=servlets.faq.command.FaqWrite
	/forum/faq/upload.do=servlets.faq.command.FaqImageUpload
	/forum/faq/view.do=servlets.faq.command.FaqView
	/forum/faq/edit.do=servlets.faq.command.FaqEdit
	/forum/faq/delete.do=servlets.faq.command.FaqDelete
	 */
	@Autowired
	private FaqService faqService;

	@GetMapping("list")
	public String faqList(
			@RequestParam(value = "category",  required = false, defaultValue = "1" ) int category
			, @RequestParam(value = "pageNo",  required = false, defaultValue = "1" ) int pageNo
			, @RequestParam(value = "searchKeyword",  required = false, defaultValue = "") String searchKeyword
			, Model model) {
		log.info("> FaqList.process..");
		//@RequestParam("category") String category, @RequestParam("pageNo") String pageNo

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
}
