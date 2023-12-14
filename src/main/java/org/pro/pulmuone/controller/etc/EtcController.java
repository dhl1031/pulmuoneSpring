package org.pro.pulmuone.controller.etc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/etc/*")
public class EtcController {
	
	@RequestMapping("alliance/view")
	public String home(Model model) throws Exception {						
		return "etc/alliance.tiles";
	}
}
