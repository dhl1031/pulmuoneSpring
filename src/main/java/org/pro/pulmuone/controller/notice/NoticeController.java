package org.pro.pulmuone.controller.notice;

import java.io.File;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.pro.pulmuone.domain.PageDTO;
import org.pro.pulmuone.domain.notice.NoticeDTO;
import org.pro.pulmuone.service.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/forum/notice/*")
@Log4j
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	/*
		/forum/notice/upload.do=servlets.notice.command.NoticeImageUpload
	 */
	// 공지사항 목록 
	@GetMapping("list")
	public String noticeList(Model model, @RequestParam(value = "pageNo", required=false, defaultValue = "1") int pageNo) {
		log.info("> noticeList..");

		
		int numberPerPage = 10; // 페이지당 보여질 개수 
		int numberOfPageBlock = 5; // 페이지번호 갯수 
		int totalRows = 0;
		int totalPages = 1;

		ArrayList<NoticeDTO> list = null;
		
		try {
			list = noticeService.getNoticeList(pageNo, numberPerPage);
			totalRows = noticeService.getTotalRows();
			totalPages = noticeService.getTotalPages(numberPerPage);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
		PageDTO paging = new PageDTO(pageNo, numberPerPage, numberOfPageBlock, totalPages);
		model.addAttribute("list", list);
		model.addAttribute("totalRows", totalRows);
		model.addAttribute("paging", paging);
		
		
		return "forum/notice/list.tiles";
	}
	
	// 공지사항 상세보기 
	@GetMapping("view")
	public String noticeView(Model model, @RequestParam("seq") int seq) {
		
		NoticeDTO vo = null;
		
		try {
			vo = noticeService.getDetailView(seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("vo", vo);
		
		return "forum/notice/view.tiles";
	}
	
	// 공지사항 쓰기 
	@GetMapping("write")
	public String noticeWriteGet() {
		
		return "forum/notice/write.tiles";
	}
	
	@PostMapping("write")
	public String noticeWritePost(NoticeDTO dto) {
		
		int insertCount = 0;
		try {
			insertCount = noticeService.write(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if( insertCount != 1 ) {
			return "redirect:write";
		}
		return "redirect:list"; 
	}

	// 공지사항 수정 
	@GetMapping("edit")
	public String noticeEditGet(Model model, @RequestParam("seq") int seq) {	
		NoticeDTO vo = null;
		try {
			vo = noticeService.getDetailView(seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("vo",vo);
		
		return "forum/notice/edit.tiles";
	}
	
	@PostMapping("edit")
	public String noticeEditPost(@RequestParam("seq") int seq, NoticeDTO dto, RedirectAttributes rttr) {
		System.out.println(dto.getNotice_no());
		
		dto.setNotice_no(seq);
		int updateCount = 0;
		try {
			updateCount = noticeService.edit(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if( updateCount != 1) {
			rttr.addAttribute("result", "failed");
			return "redirect:edit";
		}
		
		rttr.addAttribute("result", "success");
		return "redirect:view?seq=" + dto.getNotice_no();
	}
	
	// 업로드 
	@GetMapping("upload")
	public String NoticeUpload(HttpServletRequest request) {
		String saveDirectory = request.getServletContext().getRealPath("/upload/notice/");
		
		File f = new File(saveDirectory);
	  	if( !f.exists() ) {
	  		f.mkdirs();
	  	}
	  	int maxPostSize = 5 * 1024 * 1024; // 5MB  기본단위 바이트
	  	String encoding = "UTF-8";
	  	return "";
	  	/*
	  	FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 파일 중복 처리 _1, _2, 로 생성해줌
	  	
	  	MultipartRequest multiRequest = new MultipartRequest(
	  				request, saveDirectory, maxPostSize, encoding, policy
	  			);
	  	
	  	File file = multiRequest.getFile("upload");
	  	String realPath = request.getServletContext().getRealPath("/upload/notice");
	  	
	
	  	if( file != null ) {
	  		String fileSystemName = multiRequest.getFilesystemName("upload");
	  		String originName = multiRequest.getOriginalFileName("upload");
	  		String img_size = String.valueOf( file.length() );
	  		String img_type = originName.substring(originName.lastIndexOf(".")+1);
	  		
	  		NoticeImageDTO dto = new NoticeImageDTO(0, 0, fileSystemName, originName, img_size, img_type, saveDirectory);
	  		System.out.println(fileSystemName);
	  		System.out.println(originName);
	  		System.out.println(img_size);
	  		System.out.println(img_type);
	  		
	  		PrintWriter out = response.getWriter();
			
	  		JSONObject outData = new JSONObject();
	  		outData.put("uploaded", true);
	  		outData.put("url", "/upload/notice/" + fileSystemName);
	  		
	  	  	System.out.println(">>>>>>>");
		  	System.out.println(request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + realPath + "/" + originName);
		  	System.out.println(">>>>>>>");
	  		response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			out.print(outData);
	  		//out.println(outData); //response
	  	}
	  	
	  	System.out.println("-------");
	  	System.out.println( file );
		System.out.println("upload..");
		*/
	}
}
