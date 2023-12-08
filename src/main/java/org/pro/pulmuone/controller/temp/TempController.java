package org.pro.pulmuone.controller.temp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/*")
@Log4j
public class TempController {

	@GetMapping("")
	public String home() {
		return "temp/index.tiles";
	}
	
	@GetMapping("home")
	public String test() {
		return "temp/home.tiles";
	}
	
}
