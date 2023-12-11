package org.pro.pulmuone.controller.event;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.pro.pulmuone.domain.event.EventListVO;
import org.pro.pulmuone.service.event.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/event/event/*")
public class EventController {
	@Autowired
	private EventService eventService;

	@GetMapping("list")
	public String list(Model model, HttpServletRequest request) {
	    List<EventListVO> events = eventService.eventList();
	    
	    String contextPath = request.getServletContext().getContextPath();
	    for (EventListVO event : events) {
	        if (event.getThumbnail() != null) {
	            String absoluteImgPath = contextPath + event.getThumbnail().getImg_path();
	            event.getThumbnail().setImg_path(absoluteImgPath);
	            System.out.println(absoluteImgPath);
	        }
	    }
	    
	    model.addAttribute("events", events);

	    request.getSession().setAttribute("activeTab", "�������̺�Ʈ");
	    return "event/list";
	}

	@GetMapping("end/list")
	public String endList(Model model, HttpServletRequest request) {
	    List<EventListVO> events = eventService.endedEventList();
	    
	    String contextPath = request.getServletContext().getContextPath();
	    for (EventListVO event : events) {
	        if (event.getThumbnail() != null) {
	            String absoluteImgPath = contextPath + event.getThumbnail().getImg_path();
	            event.getThumbnail().setImg_path(absoluteImgPath);
	        }
	    }
	    
	    model.addAttribute("events", events);

	    request.getSession().setAttribute("activeTab", "������̺�Ʈ");

	    return "event/end/endList";
	}

	/*
	@GetMapping("winner")
	public String winner(Model model, HttpServletRequest request) {
		// ��÷�� ������ �������� �ڵ带 ���⿡ �ۼ��Ͻʽÿ�.

		request.getSession().setAttribute("activeTab", "��÷�ڹ�ǥ");

		return "winnerList";
	}

	@GetMapping("view")
	public String view(@RequestParam int event_no, Model model, HttpServletRequest request) {
		// event_no�� �ش��ϴ� �̺�Ʈ�� �������� �ڵ带 ���⿡ �ۼ��Ͻʽÿ�.

		if (event_no == 2) {
			request.getSession().setAttribute("activeTab", "ģ���ʴ�");
		} else if (event_no == 25) {
			request.getSession().setAttribute("activeTab", "ȸ������");
		} else {
			request.getSession().setAttribute("activeTab", "�������̺�Ʈ");
		}

		return "eventDetail";
	}
	
	*/
}