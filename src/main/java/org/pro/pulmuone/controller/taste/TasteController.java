package org.pro.pulmuone.controller.taste;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/taste/*")
@Log4j
public class TasteController {
	
	@RequestMapping("taste")
	public String taste(Model model) throws ClassNotFoundException, SQLException {
		log.info("taste" );

		return "taste/taste.tiles";
	}


}
