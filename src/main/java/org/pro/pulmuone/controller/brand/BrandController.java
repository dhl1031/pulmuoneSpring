package org.pro.pulmuone.controller.brand;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/info/*")
@Log4j
public class BrandController {
	
	@RequestMapping("brand")
	public String brand(Model model) throws Exception {						
		return "brand/brand.tiles";
	}
	
	@RequestMapping("greenStory/rule")
	public String rule(Model model) throws Exception {						
		return "brand/rule.tiles";
	}
	
	@RequestMapping("greenStory/production")
	public String production(Model model) throws Exception {						
		return "brand/production.tiles";
	}
	
	@RequestMapping("greenStory/customer")
	public String customer(Model model) throws Exception {						
		return "brand/customer.tiles";
	}
	
	@RequestMapping("greenStory/slogan")
	public String slogan(Model model) throws Exception {						
		return "brand/slogan.tiles";
	}
	
	@RequestMapping("greenStory/environment")
	public String environment(Model model) throws Exception {						
		return "brand/environment.tiles";
	}

	@RequestMapping("greenStory/{num}")
	public String brandimg(@PathVariable String num, Model model) throws Exception {				
	  log.info(num + "greenStory") ;
	  model.addAttribute("num",num);
		return "brand/brandimg.tiles";
	}
}
