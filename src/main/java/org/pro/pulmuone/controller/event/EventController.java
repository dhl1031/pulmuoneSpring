package org.pro.pulmuone.controller.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.pro.pulmuone.domain.PageDTO;
import org.pro.pulmuone.domain.event.EventCommentVO;
import org.pro.pulmuone.domain.event.EventListVO;
import org.pro.pulmuone.domain.event.EventViewVO;
import org.pro.pulmuone.domain.member.MemberDTO;
import org.pro.pulmuone.mapper.member.MemberMapper;
import org.pro.pulmuone.service.event.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/event/event/*")
public class EventController {
	
	@Autowired
	private EventService eventService;

	@GetMapping("list")
	public String list(Model model, HttpServletRequest request, @RequestParam(value = "pageNo", defaultValue = "1") int currentPage) {
	    int numberPerPage = 10; // �������� ������ ���� �����մϴ�.

	    int totalRecords = eventService.getTotalRecords();
	    int totalPages = (totalRecords + numberPerPage - 1) / numberPerPage;
	    int numberOfPageBlock = 10; // ������ ��� ���� �����մϴ�.

	    int start = (currentPage - 1) * numberPerPage + 1;
	    int end = start + numberPerPage - 1;

	    List<EventListVO> events = eventService.eventList(start, end);
	    
	    String contextPath = request.getServletContext().getContextPath();
	    for (EventListVO event : events) {
	        if (event.getThumbnail() != null) {
	            String absoluteImgPath = contextPath + event.getThumbnail().getImg_path();
	            event.getThumbnail().setImg_path(absoluteImgPath);
	            System.out.println(absoluteImgPath);
	        }
	    }
	    
	    PageDTO pageDTO = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
	    model.addAttribute("pageDTO", pageDTO);
	    model.addAttribute("events", events);

	    request.getSession().setAttribute("activeTab", "�������̺�Ʈ");
	    return "event/list.tiles";
	}

	@GetMapping("endList")
	public String endList(Model model, HttpServletRequest request, @RequestParam(value = "pageNo", defaultValue = "1") int currentPage) {
	    int numberPerPage = 10; // �������� ������ ���� �����մϴ�.

	    int totalRecords = eventService.getTotalRecords();
	    int totalPages = (totalRecords + numberPerPage - 1) / numberPerPage;
	    int numberOfPageBlock = 10; // ������ ��� ���� �����մϴ�.

	    int start = (currentPage - 1) * numberPerPage + 1;
	    int end = start + numberPerPage - 1;

	    List<EventListVO> events = eventService.endedEventList(start, end);
	    
	    String contextPath = request.getServletContext().getContextPath();
	    for (EventListVO event : events) {
	        if (event.getThumbnail() != null) {
	            String absoluteImgPath = contextPath + event.getThumbnail().getImg_path();
	            event.getThumbnail().setImg_path(absoluteImgPath);
	        }
	    }
	    
	    PageDTO pageDTO = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
	    model.addAttribute("pageDTO", pageDTO);
	    model.addAttribute("events", events);

	    request.getSession().setAttribute("activeTab", "������̺�Ʈ");
	    return "event/endList.tiles";
	}
	
	@Autowired
	private MemberMapper memberMapper;
	
	@GetMapping("view")
	public String view(@RequestParam int event_no, Model model, HttpServletRequest request) {
		EventViewVO event = eventService.viewEvent(event_no);
		model.addAttribute("event", event);

		/* ����� �̸� ����ŷ ó�� */
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication != null && authentication.getPrincipal() instanceof UserDetails) {
		    String username = ((UserDetails)authentication.getPrincipal()).getUsername();
		    MemberDTO memberDetails = memberMapper.read(username);
		    model.addAttribute("memberDetails", memberDetails);

		    String name = memberDetails != null ? memberDetails.getName() : null;
		    String maskedName = name;
		    if (name != null) {
		        if (name.length() > 2) {
		            maskedName = name.charAt(0) + "*".repeat(name.length() - 2) + name.charAt(name.length() - 1);
		        } else if (name.length() == 2) {
		            maskedName = name.charAt(0) + "*";
		        }
		    }
		    model.addAttribute("name", maskedName);
		}
	    
	    List<EventCommentVO> comments = eventService.getComments(event_no, 1, 10); // ù �������� ��� 10���� ������
	    model.addAttribute("comments", comments);
	    
	    int totalComments = eventService.getCommentCount(event_no); // ����� �� ���� ������
	    int commentsPerPage = 10; // �������� ��� ��
	    int totalPages = (int) Math.ceil((double) totalComments / commentsPerPage); // �� ������ ���� ���

	    model.addAttribute("totalPages", totalPages); // �� ������ ���� Model�� �߰�
	    model.addAttribute("currentPage", 1); // ���� ������ ��ȣ�� Model�� �߰�

	    if (event_no == 2) {
	        request.getSession().setAttribute("activeTab", "ģ���ʴ�");
	    } else if (event_no == 25) {
	        request.getSession().setAttribute("activeTab", "ȸ������");
	    } else {
	        request.getSession().setAttribute("activeTab", "�������̺�Ʈ");
	    }
	    
	    return "event/view.tiles";
	}

		
	@GetMapping("view/EventComment.ajax")
	@ResponseBody
	public Map<String, Object> getComments(@RequestParam("event_no") int event_no,
	                                       @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
	    Map<String, Object> response = new HashMap<>();
	    int numberPerPage = 10;
	    List<EventCommentVO> comments = eventService.getComments(event_no, currentPage, numberPerPage); // ������ �������� ��� 10���� ������
	    int totalComments = eventService.getCommentCount(event_no); // �̺�Ʈ�� �� ��� ���� ������

	    response.put("comments", comments);
	    response.put("totalComments", totalComments);

	    return response;
	}



	@PostMapping("view/EventComment.ajax")
	@ResponseBody
	public Map<String, Object> postComment(@RequestBody EventCommentVO eventCommentVO) {
	    Map<String, Object> response = new HashMap<>();

	    // �α��� ���� Ȯ��
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
	        response.put("result", "notAuthenticated");
	        return response;
	    }

	    try {
	        eventService.saveComment(eventCommentVO);
	        response.put("result", "success");
	    } catch (Exception e) {
	        response.put("result", "fail");
	    }
	    return response;
	}



	/*
	@GetMapping("winner")
	public String winner(Model model, HttpServletRequest request) {
		// ��÷�� ������ �������� �ڵ带 ���⿡ �ۼ��Ͻʽÿ�.

		request.getSession().setAttribute("activeTab", "��÷�ڹ�ǥ");

		return "winnerList";
	}

	
	*/
}
