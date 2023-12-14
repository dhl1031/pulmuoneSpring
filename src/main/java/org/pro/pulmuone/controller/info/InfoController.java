package org.pro.pulmuone.controller.info;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/info/*")
@Log4j
public class InfoController {

	@RequestMapping("business")
	public String business(Model model) throws ClassNotFoundException, SQLException {
		log.info("business" );
		return "info/business.tiles";
	}
	
	@RequestMapping("foundation")
	public String foundation(Model model) throws ClassNotFoundException, SQLException {
		log.info("foundation" );
		return "info/foundation.tiles";
	}
	


}
