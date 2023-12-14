package org.pro.pulmuone.controller.inquiry;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.PageDTO;
import org.pro.pulmuone.domain.inquiry.InquiryDTO;
import org.pro.pulmuone.service.inquiry.InquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;

	// 문의하기 목록 
	@GetMapping("/mypage/inquiry/list")
	public String inquiryList(
			@RequestParam(value = "category",  required = false, defaultValue = "all" ) String category
			, @RequestParam(value = "pageNo",  required = false, defaultValue = "1" ) int pageNo
			, Model model
			, Principal principal) {
		
		log.info("> inquiryList..");
		int numberPerPage = 5;
		int totalPages = 0;
		int numberOfPageBlock = 5;
		int totalCount = 0;
		String userId = principal.getName();
		PageDTO pageDTO = null;
		ArrayList<InquiryDTO> list = null;
		
		try {
			list = inquiryService.select(userId, category, pageNo, numberPerPage);
			totalPages = inquiryService.getToatlPages(userId, category, numberPerPage);
			totalCount = inquiryService.selectCount(userId, category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		pageDTO = new PageDTO(pageNo, numberPerPage, numberOfPageBlock, totalPages);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", pageDTO);
		model.addAttribute("totalCount", totalCount);
		
		return "mypage/inquiry/list.tiles";
	}
	
	// 문의 하기
	@GetMapping("/forum/inquiry/write")
	public String inquiryWriteGet() {
		log.info("> inquiryWriteGet..");
		return "forum/inquiry/write.tiles";
	}
	
	@PostMapping("/forum/inquiry/write")
	public String inquiryWritePost(Principal principal, InquiryDTO dto, RedirectAttributes rttr) {
		log.info("> inquiryWritePost..");
		
		dto.setMember_id( principal.getName() );
		dto.setInquiry_no(0);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>");
		System.out.println(dto);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>");
		int insertRow = 0;
		
		try {
			insertRow = inquiryService.write(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if( insertRow != 1 ) {
			rttr.addAttribute("result", "failed");
			return "redirect:/forum/inquiry/write";				
		}
		
		return "redirect:/mypage/inquiry/list";
	}
	
	// 문의하기 상세보기 
	@GetMapping("mypage/inquiry/view")
	public String inquiryView(
			Principal principal
			, @RequestParam("seq") int seq
			, @RequestParam("category") String category
			, Model model) {
		log.info("> inquiryView..");
		
		String userId = principal.getName();
		InquiryDTO inquiryDTO = null;
		
		try {
			inquiryDTO = inquiryService.selectView(userId, category, seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("vo", inquiryDTO);
		
		return "mypage/inquiry/view.tiles";
	}
	
	// 문의글 삭제
	@PostMapping("/mypage/inquiry/delete")
	public String inquiryDelete(Principal principal
			, @RequestParam("seq") int seq
			, @RequestParam("category") String category
			, RedirectAttributes rttr) {
		log.info("> inquiryDelete..");
		int deleteCount = 0;
		try {
			deleteCount = inquiryService.delete(principal.getName(), category, seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if( deleteCount != 1 ) {
			rttr.addFlashAttribute("result","failed");
			return "redirect:/mypage/inquiry/view?seq=" + seq + "&category=" + category;
		}
		rttr.addFlashAttribute("result", "deleted");
		return "redirect:/mypage/inquiry/list";
	}
	
	

}
